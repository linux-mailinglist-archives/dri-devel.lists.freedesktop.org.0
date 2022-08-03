Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D6588855
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50862112C54;
	Wed,  3 Aug 2022 07:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681411318F;
 Wed,  3 Aug 2022 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659513368; x=1691049368;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=lF34vOv/hDbJGQgrX7FfOZTx6WXPogClLSZste0+y+8=;
 b=n7U198x5NNaLKPH7DQNIYlE3qrX4Wo6o6BAXCE7c7WAQazSTbie3Pm2B
 w2nABvgVEtDAP/D9W0hyCT+Rgi1si7gEbwwvQnNVoQaOl/yIsN/uXQ6o5
 8tTk2niXdRyf8JxQHi/Iyx+Xx/2JDJIww6bqsl7XBXvz5LPdWhKd+NVSj
 4741hs+qyoGoDon83/Nv2am8x/2QUr8EtVCIbWIbTxaT9rJBscGO1xt0a
 N5Pi32Em+0iY/i9fGTdLEELPToSSC2krhxKaZkW8DLiirGWfrTenhJ2kN
 mHcuPfZS2Kwf54gLWScaPEDT1o/1v14BqLVWL+CklAL7tUO2bOXeenG5V g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="276525041"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="276525041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 00:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="635594398"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 03 Aug 2022 00:56:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 3 Aug 2022 00:56:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 3 Aug 2022 00:56:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 3 Aug 2022 00:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnY8g2gbrkooPA3TQHRsHkCFIJpCetd+8MBgFO7V2KMKJEBmm9SNvWrrgVwKZ/FIX+GQ6lk9kk838xpUuRf5vjU/PKTQ7M1Z4/mILpZBscaI5ZT3xe19BcJ2IZ+rFYXYQEy6JJjdUjN4q0GCZHnxQIIZiY7xPzJ/XF+SRy9N2iXompPcUTIK5szJf5fkMMTwuCYyS2RWIRNTh8Hpf9jbV+7t9FF3B5JRfrSKQGLDwnIA2i8EJXaCqjbtKjGJtd5AktO2SkuNTKVGllYnwmiuU1Z8dQjTOXfDky9oo2EBGitgNPwVKI66xKlubBZfUXNcsLBsr5Zi345t3AaoWRSRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKNKKz8cMk/pEpqKimmI/qflUStCCgMbdzllug9qYBY=;
 b=d8yewjrC2hhNDSuusKOPFJnSdCgR7a6W4iZR3GsJRlYggioBy0du7RjsbSVdPkPxRhK7KFZo6RN2dF3r1q4SWdXGxtf+3bgKzlV9bB5mxJmsnukumoQwsBiuBKXErVfmJCrzc7nRLajO3Ndr8S3bkC6D8ql0SvOmunl6lSLaLvPX0exAjznUnXxrYIV5c3LZWDOrJXh+lrpkQXJwlR3dTnS0cL6Ox0qflTN/8oVw027cFr/Elnyv69OXIguZXUQCtUS+fPsh+suoq2lsnft7wkQjRpFHGc4KTKb3caWxD9wxtgigsgzXZkXTApxOoL9bqnvwW5Az3787dSZeE6FyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 BY5PR11MB4228.namprd11.prod.outlook.com (2603:10b6:a03:1bd::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 07:55:59 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:55:58 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] Sanitycheck PCI BARs
Date: Wed, 3 Aug 2022 09:55:47 +0200
Message-ID: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ce26c45-3e45-44c3-97c6-08da752599f5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4228:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOSMvtj76TMeF+nw69Xs6kaSfFSn51jYNvjgQgZ++lXd1EGQzQfiQ7V3ug1JlMd32YMHY8Vywn7rzE4dNQrvbqnIUCV47xBpbqhHzDF+eRLdUAFiVDzJMD+TreACQ70BYbpfS+kyjBzXQmoe8ZJa9/1rSeugmY1uUM3b4LNkOvRLAMTuonvLOyGJbrIejQhcAGGa1WwNRGqjOQZVqftXnOw7UEEDuDUUeO/MWV7HNKPitWxzk5idK6Kjll1ho7Qqa+xM/wiSqzbGlJRqIN9TpVQwxLXFdD7gOAHUtEbO/x6o/jg8LT98GXcRAEjJ+ISLX/+/ahQ2LAA212xwv0JHrXhpPSuXvoIq+LjN/RMaE1yHm4gVCbcifUgHZWyOsgCWRhSD3K1aRx5rRMJ2mG8CI1rnqec2loHQjBZfh0+LKYPnQbGBZ/BqEVNXsJ7O2pP1ljrgmhw79J6hXH3Px+bdbnqaY92oFhI3Ks+7GWbzgpXcMIx80noeU8mm2XAcsH/bnlAxH2pUys+vndxfjQhw6PJQ0QsdjnY4LHPnKluBH1ULMibWoTzsUPf3jjE/FuSTJT04LIRjzW1VcJvgYN0RZnQyerwU890kxWriWBihMlpocyLJPtp+NnmjhOpYDB4Bs6VvBndefrrXQJJv85xDS4hI8p7su91WMgOA2ME7RrQJtWKchd2NPfo5fHE+cmye
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(186003)(66574015)(6666004)(2906002)(41300700001)(26005)(6512007)(1076003)(6506007)(38100700002)(86362001)(2616005)(82960400001)(83380400001)(5660300002)(36756003)(966005)(6486002)(478600001)(4326008)(8676002)(66476007)(8936002)(66946007)(66556008)(316002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9NOXUvMVRrM2RrZm5GZTg3aUM5SEw2SThaT0lRWHM1MERqL0xKczZHTUVj?=
 =?utf-8?B?VnEwaGNHM2FMNi8zRWVUQUdnTXZEVGVKc1JWV2NtaGQyR1BRUVJ2WFBsQUxR?=
 =?utf-8?B?Y1dHK01ha2JXL1ROYVU0RXJsS09pTnRhQVdGOStsMXh5WmpzWUlvYjY4OHNp?=
 =?utf-8?B?RkRJS09yVjNJYVBxeHhybkx0cmxPaG5SUktwNDJHbzU1QkY3VGs5NU5rYkwr?=
 =?utf-8?B?akM2M1VneThENXNPU0l1VTRLRzlhbnhyQWQwNXR2NkhoOU96c0wxU3JkOS8r?=
 =?utf-8?B?NkU4VkFSa3F6b1hVNDVkYzZpUk1ac0U3Z2c0TVVoZWIwMGU1MW44eHZqOHhX?=
 =?utf-8?B?eDdiaGNkaGJBVC9WRzNHaURpZ01uRU9ZZUVOeGRiZndSSHNYZUdDejRKZlRM?=
 =?utf-8?B?SDVYZ25FMlgrR3FydUR5S041YmJSamZOeGtwczgzK0g2cE9VYmp2VVdNQmdj?=
 =?utf-8?B?OGRzbVdicVdONHpyVkF5NDBlNWxQaGVlejN2UFpSMktDNWR4cmhkaEhkTjAw?=
 =?utf-8?B?RHhFUFBjUmJNLzh4K1pjMGJ1Y3k1dFhtcTJ0RVprQTNpRkR0V21ZZjR0YXk5?=
 =?utf-8?B?TUJQaHJ4THFSRFdYRkNTQ2dxRkZkcmZ4Q1hNbzlzMlExbnhOQkcrbURnQnow?=
 =?utf-8?B?L2NDdFovMTQyZ3RjWG9YT0FFNHZBN3RvTzBZRDFtQ2djbkZQKytWYllOV3Nt?=
 =?utf-8?B?bmN1dzZpeUZ0aEhvNXMwem9qVjBOMy9yTysvRDRiUDVWTkY3N2wwUDA2bmp6?=
 =?utf-8?B?VnYxL21IL2t5dEp5SXV4Ry9MVjVWaEo4eWx3VmVDb3ZKdW44dW51cFUzWDVU?=
 =?utf-8?B?YlVIMlcwTXBtblVWS0YwWC9vbWZkVEF2V25ka2NDYTMwd01yandxK043Z1hC?=
 =?utf-8?B?eUhwUXI2SDkzY2hENy9aMTYrYm9qNENsZTcxTW14VWhrV2FrSmxzSlNsbjZK?=
 =?utf-8?B?OWtIYWpSZm41L2VZS2ZqcWRpWXQ2VTVlV3p1UTdwaDRncXQyeEtiZENZTEVL?=
 =?utf-8?B?SUlsampRYmV2cE1zbUVuSm1XcFpvYmdNcDdDRWd2bkY0aCtqaUdWM0tIRFhG?=
 =?utf-8?B?SFk1bWlWZEpwN2wwMytPWnNMTHRQdXVUdHphejd4bmNldmlzcEpRS2lzK2Jx?=
 =?utf-8?B?NW85VTIrRUI4bzh0WHEvdzhZTWEzcktNSC9YNGpvbXZnMVJLaHdLZmxqWmZX?=
 =?utf-8?B?WUYxQk1MVUFHZ0xqSnN0R0VUTjVVSnVQbWljNkNqU0xTVCs4Sm9JVUYvWEI3?=
 =?utf-8?B?TFp1NUNlUFBZbXk1U1VPMTBNTDRoSC9OVlQvaVN6VzgzL2o4a3h1cHpic2lp?=
 =?utf-8?B?cStKU09qTDFsVW03TElOOUl5RnhxWFBFMTQ1UW9hYmpySjRyVC9vM3BQOHVW?=
 =?utf-8?B?UTcyWFVGWTYzcmF6ZzdhSUFSRXJyTUxtUDYwTmViWnhhaC9oN3NQQ0VlL09C?=
 =?utf-8?B?QlI2YmIwQTlnQTdwMXFLRVBtL0xTMmt5NFBSdGY4c0lzZ0lTYnlyeFJFS3hk?=
 =?utf-8?B?QktGQ0x3R3V5K2ZPeEhXTHk3eDdLUG5zWU81UEZHYXNJdU5CY3Z0U0FtK1Ax?=
 =?utf-8?B?WnNKeTBGVS9FZG9PdjhLQTh6ajBLWHlkbE10aTJiN0s5eWY2cUlqWWQvWVBG?=
 =?utf-8?B?V29UZDNKeklqUlBJZGd3Tms2Q3BwNG1OQ0JqQVRiSG1CWDVuamE4dUlzckox?=
 =?utf-8?B?VWFodHVpWUJ6c0piQ2ZqVmNmWHpENHJwUHdzRGpWd21vRU40SGpORVZ4MER0?=
 =?utf-8?B?dnFSOVhFeVpkeHVJSlRkdENEZjJTOG9KblBQWE5nWktCMExoUm5zbDBQbWhH?=
 =?utf-8?B?aEZpQlZKa2JtdGl1SVBGOEJ1S0RHUkV6MFNjc1RxY25HUDVyVlJncll3Z1ZC?=
 =?utf-8?B?SFhKR3gyeWZJUSsyRUhSZHVkNEVlN1VORE5RQzVMWG9oZE9TbnBobHljSEFm?=
 =?utf-8?B?SjhXVTZxQVl0UDFPY2VYalRFVytkYUFtM3lTSTJVeFRxQnViSTBCc3N5eXVF?=
 =?utf-8?B?WkZaVnZLT0RRY3QyQTRwYSthYWFvUHEwMkFMSWtIVUZUdHM0SVIwVHJmZFVw?=
 =?utf-8?B?YmFUWStUY3J0dUUwVlhiUDlBT0s1R1FIZnBQMWRudXZBd3oyRmthcmlvclNr?=
 =?utf-8?B?V0JuWWNKNVg3WEZnL0lJYlp2Y1hYUEhWU2NmT0w0VU43VmlTYzRGRjlSSkZG?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce26c45-3e45-44c3-97c6-08da752599f5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:55:58.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R19qC59emBRSJJUeeGGQG+G4cA0Xr5btMQMs2qCbmk+0PczZBvUZhxe7nV9DBsDlletra9mclo7PvDvtLA5PwqJ8T3jFxj9gr+ph99/E4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4228
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
 drivers/gpu/drm/i915/i915_pci.h               |  4 +++
 drivers/gpu/drm/i915/intel_pci_config.h       |  7 ++++++
 9 files changed, 74 insertions(+), 19 deletions(-)

-- 
2.25.1

