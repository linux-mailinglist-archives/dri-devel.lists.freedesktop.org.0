Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1E5A9962
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 15:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834310E713;
	Thu,  1 Sep 2022 13:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064B810E713;
 Thu,  1 Sep 2022 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662040166; x=1693576166;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=9eoVvMGvTsF5dOXf/QKAvhel3XM5xhmq2I1nZ2/QDN8=;
 b=WJdxJ7LPHPTZNpUDC85RguJPcGXYydw8AqCgZeE+DPG5jYT4QGnwj9r0
 kY6VGjsmEg6QrYMFZYhHF321P1GXv4lCq48zZWwSDx/Sn6m6BUFAO0URU
 mqnK3ygf9CKG8Yu6m4bFaiRR3iXI46b1xpue/6ys7A9u8gzA1Ie4rMEVA
 bFcWwQ0GUMe6EYSb++KRl3Q8CSyjhS3HQDWayxyK5axWNT5lI3rlpaEjG
 TteMo36TDvXkGvbCXCBw0WRyqzLSCRloxjiugbEf0Qfx3WeZmi1kAzTvV
 MAhCGaAU+nGa0N5e1xoRj2o+OdOQe3QKR1SukjpXsuJL1StG3k1+ml8cf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="294457804"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="294457804"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 06:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="645659751"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 01 Sep 2022 06:49:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 06:49:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 06:49:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 06:49:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 06:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAosLF8YRV7rfbZdZtY2G8OmHI062x9nevc7ODkF9dtNWHDT+SH5py8gq0JcMrBHd+CZ+oNnilBz+i24XE4q6stJsJVWrS51QKTrE2QcU2ebGbSvMIafw+fj7PzcY2XR8tuiIII5OlgaaBnQui0gAaSzBT6ZXvcqj+LPo3UOfiNd6f1W+EGQDxdvhGcGbczAQy/xDwT2m/wm92T4XUsddAwyP2kJ9ifuXZ2uDis+OuRNlBQWH6QlZR8oxcgKvMQacO9EGMxEfyDVDexjS0FA2bThiiLMYgfTymiNFu3qz0u5kTrSSmQ4Q2eB4wI6c5Rf2N2mQQcJ6UhkErY9tdzh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYYTHFXryxnwcyq3iyqIxIxDXWh0b435XKSPz5yWZEo=;
 b=e8+nIl5/tRC2MpNj5n681uTx3Z+2jejZ6sqiby9WvjlqHGeLTJ6N/+T/igPb+gkuU04bg+Rj5o8AZfzbSRWM2NQ2FQrVX0390KSiEbWKZ7vacfTxRU4t14HhofNI9zwVv8MT1DEbXyW2C5szV/yjlDFGNw4s23nFL/uygX8VhLpwlGA5luYAxMLDLun681J/Vb6WACWqakCFCx9ZvOGD2mWAebfqiUm1oZAeICYWsql6f7Ix3tn1LsZjTAIr3YkNzXk8uPgcpbYKGs5Tvt7wBkRqsHPSIy2ZrtLc7lIzbn9j81CBDbraIxMuUNtBigFeSF6kBXEPlyqjxuOSmXQ3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR11MB1597.namprd11.prod.outlook.com (2603:10b6:301:d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 13:49:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 13:49:21 +0000
Date: Thu, 1 Sep 2022 09:49:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YxC3GmSOpDiZTdIJ@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fafcd8ef-ca61-4c62-64e7-08da8c20c557
X-MS-TrafficTypeDiagnostic: MWHPR11MB1597:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylMxzronCL4bClL91EfYdv1s1viaSaojwvblLn6wtz48xeE3DtpZ9Q+d6yFL+AZamC+7z0gCZKj46P2GY2p3Omn40yIhvhvWKViF4TB8Rb4CFjLj5GZNlLKLjQxcTGstjtFHrNGRC8RR60W8/8YbpekfAv9JKkBao3jTaS1vEOqCCUomk/i+8Q0ENlErW4MmmAjwuNDnk3t9uxRCyoHuCT9jz8OXXSXdrRLgeck5Sp64MEd4xZb9sftgB9phWxg9+/LaeZ9rSBGirdVR18DH5wdmq5XDQ0yR/ASjl6Glvu/GLIhehdOCK7QVRyPkXEQJuIF5emCtsgoRVSptln+gEgOegBoZEAWdrIlp2tbNV8IuErmRDcGGvFZFoAF1PTQdN+rIHbo0jGErZEE8+wWU2d7ZzgHv+kJjd2mXmad8myeOWK/Vorl7tNjmB1bYwEtM3q/dY7JQrwkKKekkDvccKSfeQ10zn6Oex0nTKuZduDssmwwk/HffJpEKFo1mT83PTyXdyIcJofj53P9pdi1CtKz8nDTOwoes8PR8pL5PRsde61Krs2GJLN8sxgKB1tvEljTl0JvAJCC/xO0GAUr3KJiqthswa6VwsA8BGGhL5tF2DVmnN+GKKv4Wz1PXm33bN+jY4ETvo7hs+UiziNGwkx41k2wog/Q3MS0rwY1zmCk6GwsvFRqmvVjQEbP80quB0wIEBOoWvze5oFLD52XDyJNnXECi+IhvhYngZaM6YCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(366004)(396003)(136003)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(36756003)(82960400001)(86362001)(66574015)(478600001)(6506007)(6512007)(26005)(966005)(83380400001)(6666004)(41300700001)(6486002)(316002)(110136005)(54906003)(2906002)(2616005)(186003)(44832011)(7416002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2MrYjQ4dmFXc3pucHc4TWRmVGxnNHIrSW5tVzhwc2c3TEU4blNrRUlZeXRD?=
 =?utf-8?B?MkN5aXJGMWhONU1FODRDVjlJQnJGdDdzcDVyQVN0Skc1dHMyZHFNbzhrRE9r?=
 =?utf-8?B?VlB5ZytYanhSQTVoajMwYTI2Z1JPRzFGV0tCcHNwSXBDbWJtRzdPU29VSVhU?=
 =?utf-8?B?eUlyY1NQNnUyN0tscEg4SlpwZ1htYlAwdHlPTkNxQnJDTGxFWWR0dG9jVS85?=
 =?utf-8?B?WkorZ0xCN3Z3VE1zaUpycklGcTd3ejRHSHpVWVBnNmdheFAxbFUxRk5uZ1cr?=
 =?utf-8?B?Z1BvVlNnK3QyU1NlNWltTTVyY1R4eXlJbjBJUm0ybjI2VWRPZmxqOWV4MmJi?=
 =?utf-8?B?M21reFVtc2pmR2F1dG9LUTFiYmxURXFSMGpzQzdkQTNpbEVNeUlKRDdGYzEw?=
 =?utf-8?B?RDQrMXg0M3FGNU40MVFVYmVGNnNNM25nb251WWlVdjBjMFRKTlNjeW1DYktC?=
 =?utf-8?B?L1hzSDZSL0NuUkczUEFObGI4QWFKWlpsTmhmdTFEL1hPZnR1SlNpNUx2Qld1?=
 =?utf-8?B?ajB2VHZ4dHJzVkM0RmlCZE93Y2Nvais3WktNa2dvTE5KSERkcGZVOE1MU3JK?=
 =?utf-8?B?cEpDU1FtWi9hWnhJTnpSeVpidHY1cnh6S3dzK1BuLyszcHVQQnh1VnE5aUFO?=
 =?utf-8?B?NlFoakpzdkFtWXVUR2RLVlN3cjJGenZHUGtqYmRzb0ZkdDE5ZW5KeFJZbUht?=
 =?utf-8?B?M0NXTkhISXNkTUxoM2xXYnd0TGZvbERqUFNrQnVFeHpsT1JBcFptWllTTmNP?=
 =?utf-8?B?cU5nQnpnRnNrZmZLRW9jcjVjV29taGpZQ2tLZEZRNkVCWGdndytCV2RZQjFq?=
 =?utf-8?B?S0RoTTlBNWQzL2lkcXZVN0s4TkEyenZQUWNoUHJ5K25pNnNCb2RCWWpGMkx4?=
 =?utf-8?B?b05xSEVXRlkyTDNucXRFZjFUcG1HQnk5dEQrUjRBT3pLSkdiczRVeGhmM1Ev?=
 =?utf-8?B?TXQycDh6aEpQYnFNYkhYcER1TGI1VHZoQTh2b3dQVnhYUXFkRXpZODB5Q0h5?=
 =?utf-8?B?ZXhrNnh1aXBjaXVSMXF1dzZ5N1dWcHc1MjdCWmM4SkMyYlFmZ1UyRCtZWjd2?=
 =?utf-8?B?VUVkM0hjVXBBL2xuTGJGS08rd1Q1WUgyOEJFYjhwMWtMWDdpOGJqeXJxWGlW?=
 =?utf-8?B?MndtQytVT2Vsb2FucVpOZUp6TUNuTUk0TldkWW9sQW1XVVlnVnIveitjRnU2?=
 =?utf-8?B?TE5ia0hVTVlUNDY2NmxVb1Raa0hiMU5BUnZPR0NNZ3J5WkIwQ0RaM05SYXlC?=
 =?utf-8?B?QW5heVQ5b2xpayt4VkRFRkY1Sll0Ym1KUkp5aXkzdUtIY2ovN0tzUjdIeFZO?=
 =?utf-8?B?ZVJkN1dUd3M2YjAvNU85ZTk0OExwVG5GQU1yTlEzaVVlMmhtVko1YkNwN0NM?=
 =?utf-8?B?dmtKcmhXbGR2QWdkdUFjbldndVFIUTdsOUZyVkx4ZjVCZzBwK1lSend1T2dK?=
 =?utf-8?B?UkdpakljNnp6Z1RMa2NmbzdxUjhVNnJzSFdDS1Zsb05MNERBSHNHY0xTbklY?=
 =?utf-8?B?elR0TWhEYS9MZjk5cmtIcWVtalJXWTVacnNRd1BvT3MxNGoxMGl3V2NYRTFv?=
 =?utf-8?B?QnR4bnJ4cm5zOSszRXdJYTI3MFZ6WWM3UHAveWpkUEJ6dk5WUDE0WlJtYjR2?=
 =?utf-8?B?VHFDUElwME0zYzg4Y202RWdsTXBWb2ZSTmkwVDBIK0pVWXBaZ0JUUDV0UnQ5?=
 =?utf-8?B?ak16SUNtUXVpYThxMDA4amxSeE5ocGNSdmdHaVZvdDArS0g0WWNkaWNtejNo?=
 =?utf-8?B?bnJiejZjNGk1bWtaaitMcU9jL3MxTlY2Wm45SmVTYy8rQzNoMUdCTDV2T2Er?=
 =?utf-8?B?ZkNXKzk5bFhTd013Z1lXR2tXZ2VqTDczTVpGbTdESzAzVUtnR1JmQjUwSGp0?=
 =?utf-8?B?ZHF1SUlDeUJCTitqeUxGM2k0cnQxNnQ2SXdSVzZvZDFKU3o5NVJLOTZXOGJG?=
 =?utf-8?B?bHpSeStzRnoxbVV4RlI0M1RlWHFGT1orVFlrMTdUalc3cmVaT2JGdU1nQzhj?=
 =?utf-8?B?b1liaWxUM2pmNjZWUXVlNjJ2NHB1c1dNNGRmTDhNb3NPL3FZZWJDK0JocHlH?=
 =?utf-8?B?d0F4TEQ3cUFTSmlIN0pUYWRIb3R1RFg3b3ROd3cwdDRkdXJ2WTREVkF5cUE2?=
 =?utf-8?Q?q7LN8ekp8XH02c3G/UiFWXsgj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fafcd8ef-ca61-4c62-64e7-08da8c20c557
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:49:21.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmgbA2/xofuijqF6DHOfIE0BZRpi1VM7ReX9lyqYq4nNnGh96HMXgBxYKFhTkziEglnZl8Tfe6YsObwNWfn3iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1597
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2022-09-01:

- GVT fixes including fix for a CommetLake regression in mmio table
  and misc doc and typo fixes (Julia, Jiapeng, Colin, Alex)
- Fix CCS handling (Matt)
- Fix for guc requests after reset (Daniele)
- Display DSI related fixes (Jani)
- Display backlight related fixes (Arun, Jouni)
- Fix for a null pointer dereference (Lukasz)
- HDMI related quirk for ECS Liva Q2 with GLK graphics (Diego)
- Skip wm/ddb readout for disabled pipes (Ville)

Thanks,
Rodrigo.

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-09-01

for you to fetch changes up to 0211c2a0ea600e25db3044daaeff4fe41c3ed6d9:

  drm/i915: Skip wm/ddb readout for disabled pipes (2022-08-29 10:00:54 -0400)

----------------------------------------------------------------
- GVT fixes including fix for a CommetLake regression in mmio table
  and misc doc and typo fixes (Julia, Jiapeng, Colin, Alex)
- Fix CCS handling (Matt)
- Fix for guc requests after reset (Daniele)
- Display DSI related fixes (Jani)
- Display backlight related fixes (Arun, Jouni)
- Fix for a null pointer dereference (Lukasz)
- HDMI related quirk for ECS Liva Q2 with GLK graphics (Diego)
- Skip wm/ddb readout for disabled pipes (Ville)

----------------------------------------------------------------
Alex Williamson (1):
      drm/i915/gvt: Fix Comet Lake

Arun R Murthy (1):
      drm/i915/display: avoid warnings when registering dual panel backlight

Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Daniele Ceraolo Spurio (1):
      drm/i915/guc: clear stalled request after a reset

Diego Santa Cruz (1):
      drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk

Jani Nikula (2):
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display 11+

Jiapeng Chong (3):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc

Jouni Högander (1):
      drm/i915/backlight: Disable pps power hook for aux based backlight

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Matthew Auld (1):
      drm/i915/ttm: fix CCS handling

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2022-08-22' of https://github.com/intel/gvt-linux into drm-intel-fixes

Ville Syrjälä (1):
      drm/i915: Skip wm/ddb readout for disabled pipes

Łukasz Bartosik (1):
      drm/i915: fix null pointer dereference

 drivers/gpu/drm/i915/display/icl_dsi.c            |  7 ++++
 drivers/gpu/drm/i915/display/intel_backlight.c    | 37 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_bios.c         | 10 +++---
 drivers/gpu/drm/i915/display/intel_bw.c           | 16 +++++----
 drivers/gpu/drm/i915/display/intel_dp.c           |  2 --
 drivers/gpu/drm/i915/display/intel_quirks.c       |  3 ++
 drivers/gpu/drm/i915/display/vlv_dsi.c            |  7 ++++
 drivers/gpu/drm/i915/gt/intel_migrate.c           | 44 +++++++++++------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++
 drivers/gpu/drm/i915/gvt/aperture_gm.c            |  4 +--
 drivers/gpu/drm/i915/gvt/gtt.c                    |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c               |  4 +--
 drivers/gpu/drm/i915/gvt/mmio_context.c           |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c       |  3 +-
 drivers/gpu/drm/i915/intel_pm.c                   |  8 ++++-
 15 files changed, 95 insertions(+), 61 deletions(-)
