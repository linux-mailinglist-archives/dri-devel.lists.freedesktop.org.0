Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F458ADD1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 18:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699758FB39;
	Fri,  5 Aug 2022 16:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3B91FA2;
 Fri,  5 Aug 2022 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659715288; x=1691251288;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ba3jsv7TZvr0Tl4lIg1X2+ZHTnRCgRk5vgIxTLK36Bw=;
 b=fu7ceJZ9EGsbtOoWJlnz3W0zKd7nS1AkiP+e52KRgXtQKW5n8JkffXXC
 tBTvY6BSUR5Co9znEJ+H/qIud+moI9+9S1HsPhO7ST8hk/AVWyNREGFtb
 VV2ftfumketp29u0cjI0o+2+dTSm1Ztn7H8n+bu3QFiKaI5C2Nd116Dwo
 n50B/K6kJzUbY1wwpvBrEaEsGZG+2PGd7ro4ZPE4790pxyC5YSrysFhRn
 COPEdtG0VjpQ1++NU2l3kmXPMh/Geg+HEK67ePUDWVRmjeg+OregUUBj8
 vMnExWMWcvZ0XxLymBJ9rkyCfat4SX1GaT7Bwx6Bja/GWBJTgvGpwejJR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="270611208"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="270611208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 09:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="849370362"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2022 09:01:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 09:01:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGXg5L/9X/Gx9rvIGyZv1FFZOYbSUj5Wu7nL52CRzx+CmjWS1SDa9fjMMJdpjRTeh9khWb+rcIR6JO4r6IgpGtdHL370Gu3G+LsurD+KEon7DjhP4VqZIepu8pdUlr+u7yPliT6hjrKTCIoogOfbYEJ5i2e6N6siprkiurxJnvYpSC8VfAjrR2nG38l32SDj9z8S55I/xC7xtlDfCEBSSItngKvX6Yuuje2igfFoFcQzKiDCfCcA3r/iteHKNnGHsdjvayb872AnOwg3Rfo6DWqZVjPxVV4D6PSnIdF0l+qVcutvIbeJSwiGxiFDpA+3UkItEvrx15mTJyKqiHhMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJaEqwVxhxyO7VlrAX20JqEHqaCDfJ1P4oIJbDWX+HA=;
 b=WGu2YHns0tSJbSXS6oY/Is4zSHsS6Mt2qn5tqLyJEFA63yBemBMmXvhDeLMKHPCSjSUwLmVF/Iv0k+2jYN1l/Z0YCaSop2wMvLliFGQ9DT3Z2DsfaEkuSK83g4ehtFI8/rP/TA3LOXMbvsuKsePX2WUvKBnD298Xb+RYKi1zzcDss6N148Cm1YmKYdyumQQSfNwr0/4C7Efu/7zT/D5kaIAgPt07n1R7zFccTkzdOs/PzTipz9pflKHbR31ERXjm6Fg06ohTHf1zOKQ/re078SPF5YgS/kL6oIOtyoyO5h83eFseAjbP25p6PybRZ2H0xzqbxCvc7jGOnYyNL2PQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.16; Fri, 5 Aug 2022 16:00:12 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 16:00:12 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/2] Sanitycheck PCI BARs
Date: Fri, 5 Aug 2022 17:59:57 +0200
Message-ID: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e840c2-2fad-4f20-c485-08da76fb9430
X-MS-TrafficTypeDiagnostic: CY4PR11MB0056:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxDjwPu9LFGk1ftPH4/Vl7wJWPf+kMy1iCGo4N91/4GohGbEWYzXpZlBuqnDtzzYdYieC7WsBZvSyNFnyfbF6adM0MuuBkUI82mH2/ZGVq2FahypFfz5axWY4ge+JARnRsKzN2EwObnXAUOrGqgRyp5IEdu0AxC/PxvdzXOlK7w097uqq8Lemo7QPURO0KwiMwup3/UaOle+89WMW1Y+ye4MaIS1FsNx0fYyLmruHOd5NA4C/bORt8mkom+p51BUh/b2aC5VtrzWdcPQhkGnoaqrYd+2RgPKx0+1vG31sWq01bIKO/qgbGafBFwFNvFhy+v8KvrdfwsXRdyxdRpSurIkBucGr9o7QJB6Ok7Tx2Qv8Ecl6P4C55I039asOZElBw4/1dRYiz63eTXnNXRLHQYwB6FYPQo8SzhB4nc7j6wiMeLbFi/gJ8RvRRUsW2gtvGsGGCNBo38d26QE8/OYXl5q9H4qCozcP4ilg/GUAtn7fihzD/Yxe0WL/1Qb1m9yODugvpjfqszHoY7xoFwaRstijRFbhfQl9yHXfogKC6l8IY44ssgZvhFRemGEKPHXi8bs4dhkTTPWzjWOhdhPa3eojhY9ce6Oll7A1o4+yf0SpoLyMQlvCre2gcQZ/lOr+UUOhPAgTiMs5ecHcWpwgBUucd9We/qkG/WAqpJFcf7HWR4xJzxJ72VJlemgPYQR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39860400002)(136003)(346002)(366004)(38100700002)(41300700001)(6486002)(36756003)(2616005)(8936002)(26005)(2906002)(966005)(6512007)(478600001)(86362001)(5660300002)(4326008)(66556008)(8676002)(316002)(83380400001)(54906003)(6666004)(66574015)(66946007)(82960400001)(66476007)(6506007)(1076003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtMS01ZZ0Z4eTRHVXJXUTdsUDVFNko4RlJUSkJDRExWallQODJxR3NTL25r?=
 =?utf-8?B?dUhlTEg5ZnF3SWZlL29SRXRaQXBFd0dUTVQvamhWTUVTRmNJVDh3VlZiNXNs?=
 =?utf-8?B?VVNLaEI4L0JRV1NmZFRncThzUlJHNWRiNlI3QTlFZXNVeVNWVHl3WVdnUm0r?=
 =?utf-8?B?eUhFZ095WmpKWndWWW44eGpYcFNFbER4NzdBcFlBbk9VKzNPYUNub20yV2Nw?=
 =?utf-8?B?cGdPZTRYcDBubmlESVg3Tkt0SE9wYkFleVFtZTg3SnJyQTNaRTBxOFZlMy9i?=
 =?utf-8?B?VkZtS05ZMjd3RnM3bk50R3dxcnNDZGF0Z1o0Qk5QZXF6bWFKODl5Sm5yK1Js?=
 =?utf-8?B?c0tWSnRBZWZObUFUS1BvL1RwcEYzOVRsaVZsZWE2ZmRvOEtESklKdUdGM040?=
 =?utf-8?B?NzhlMjF1NWNsM1llRUloVExuMHlPczFvZjJaMStFWmo4NjlPblRXdHV2eENW?=
 =?utf-8?B?RVlab3Ztc3FPeDc3TnRzZ2w2eFNvYWdqZURlaHhOb0pNSDNuQVdyV0JkRTZq?=
 =?utf-8?B?amo1Y2gxWGEwQUJBbFE4cTlXNEwrV3RMQ3YvaFB2ZzVuM1dwQVBvRXRNVk9N?=
 =?utf-8?B?R2xkOElrYlE1TFFET1FMSmtFZmlpbzMrOHF4QjVoS3dqQjdxRTgrQmllblhU?=
 =?utf-8?B?TE5RaGJVL2czSUplZDN1ZVBHelkyTVN2MURQZ2Z6b2NNaWd2NzdtZHJKdTJK?=
 =?utf-8?B?bHlsZEVwVVhXNFdqZjB2SWU1YXhMczVoSHdXV3d6MlRyOGVWRDhObU5QTEcv?=
 =?utf-8?B?Tm9tOGhadkFXUThXYVh4YXZUZDhqNU5QMXRlMGNOT2R3TzVZTEVVNS9vZUp1?=
 =?utf-8?B?Sm9SRVQ5NW51SytTYjY3QS82MUQ4bnZ1bXFsSGRINGVEckYwdWlod2N0cEgy?=
 =?utf-8?B?WE0xTy80KzBKcnplLzlhZW4rTHBma0tVUXN5VzJzMUpkczBGTWhOS2VPSG1h?=
 =?utf-8?B?ZmR4YWpWNkJDUjBkb2xlejN1bDRDZXJ6eGZZQWp4MEE1TDh4RjBmMUphVngz?=
 =?utf-8?B?WS9zUEJnbkxkQTV2c0Z2UTAwbVhBMXBUcHEvOVR4emFNek12ZWpDa2RyY0dn?=
 =?utf-8?B?b2J2aG9EMitwR1FoZXFKSkptVXNCZUJ0aFJERGk2alArMitjSDN5RVJBS3dB?=
 =?utf-8?B?OGdrbFdpSHJtZDNVT1NBMDc2WlByVFpqQTFvVW5XYU5wazZ6L1hzMlEydTBl?=
 =?utf-8?B?SkMxUkpVazhmdm1RbTZqM1BvWTVva1NzVHczNDNjeHNhVDAvN3R6Z0NGNEkw?=
 =?utf-8?B?NlF5S1U1NjhENjBOaDZkK0tiOXE2UzJqR1BkVXp3OWcwdXJVWGI3amZLbGgx?=
 =?utf-8?B?YnhLYmhTQ0srZm4vbUdub3c2SUlyaWMyaFlSVXJFTllnK21VaGluckN2cE5M?=
 =?utf-8?B?c0FEVVo5L0RTbmpsRHJ3Q0JMZ0YrWlA2Y084aXZvQ2NMVDRiQUNWM0d2TXBn?=
 =?utf-8?B?MzJYaFpENTczOFZUK0plemFRKzY5eENPRktobyt5Z2xDdmY0dEdDZmZkaWJJ?=
 =?utf-8?B?NGtXQWN0WTVVNmY5YWhRU2t0K1k0MVU5UzJrdkhveTRYcE1IOFl3aDZmSXNx?=
 =?utf-8?B?V3NvMjBQdENVa0c0M0dnNzdjRG5PWXNtYXljUStHc0VXZnNHNjRqeXpzczF6?=
 =?utf-8?B?WGJFV3BzaUlWQkhNNEY5T3pRTExaUUh3ZkdVcGVvN0FTdmx5WkQ3cXNZRWs3?=
 =?utf-8?B?S3k0aEF3KzNMcVdFanppNks1ak5MTlZUSkN3MElyRloyYi9paW5pV1VYNnp5?=
 =?utf-8?B?dWFicElKZTdicUJzM2JRS2J4UjJUdlZZbkZlSUhMTkIyK2lPVENKN1k4UXBz?=
 =?utf-8?B?VDY4N25OM2lTYytZOGtLN2VRelpraFFpQnVEMWhOTmp2VnlsVDNOUld3ZENk?=
 =?utf-8?B?emlITmQrZzQrcnV0U0E5YldrNm5abjRldmttVmxTYXdWNjIzL1h6VDFkdHhE?=
 =?utf-8?B?YnBYcUpMK0pHV3RONmZ3N0NFb3FBQ2dORTdwQmV2VWFYTDc2M0JWMHlOY2d6?=
 =?utf-8?B?VTlFZW84WFMxckxyeGxmK0VvS2t6bytxMGhheE1uSlZpQ2NVWnl2VVlkVWtW?=
 =?utf-8?B?S1pIMGRHT0FCL2s5bm05ZjdiQ01DSEl5NCsreHVtYmczZHl6WURGV0gxbk5l?=
 =?utf-8?B?VlV0MnlZaFovcXhCNWYyeEZZQitMeE9OTEp2NTRaQmdnRXgxc1cxQjM2M0tT?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e840c2-2fad-4f20-c485-08da76fb9430
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 16:00:12.4251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJmmIzrcywkv5Tr+m/St5xXpR13QkUPBKh6feXLoNJkJwg603URCSHdevWZrHUM2692T9PTko3Mb6CHNizoAwQVpZKQbJy2TjbSgoSYg64E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0056
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

When initializing the i915, we want to be sure that the PCI
BARs have been properly initialized.
As part of this series, I have prepared two patches,
one that introduces BARs names to use in code instead of numbers,
and another that adds function to validate BARs before use.
This is an evolution of the concept I presented in the patch:
https://patchwork.freedesktop.org/patch/470184/?series=99094
The main difference between the original patch and what I have
prepared here is that previously I checked all BARs at the beginning
of i915 initialization, and now I only check BAR 0 at beginning.
This is due to the fact that I have noticed that it can happen that only
BAR 0 is available (I have observed this in the case of virtualization,
on some platforms).
Therefore, at the beginning, let's verify only BAR 0, and the others only
before the first use.

v2: Fix build
v3: replace header linux/pci.h to forward declaration for struct pci_dev

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>


Piotr Piórkowski (2):
  drm/i915: Use of BARs names instead of numbers
  drm/i915: Sanitycheck PCI BARs

 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 ++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 11 +++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 16 +++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   | 17 +++++++------
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 ++--
 drivers/gpu/drm/i915/i915_pci.c               | 25 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.h               |  6 +++++
 drivers/gpu/drm/i915/intel_pci_config.h       |  7 ++++++
 9 files changed, 76 insertions(+), 19 deletions(-)

-- 
2.25.1

