Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819A7A07F9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 16:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DB10E575;
	Thu, 14 Sep 2023 14:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CAF10E572;
 Thu, 14 Sep 2023 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694703239; x=1726239239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEN9QdTL5xRKjgNVJi5ZfVmcj0CaZldf6aKMH7uDvl0=;
 b=Mzv87Atgc+jL6rD0L0H6hBo17nme2deYJcI9ERexjStu/RFyvczTfj1A
 SBI/wU+8unJrF5VxmyIipiR/Rbul2u6FyaeNOW7Zd/UcqTLEvN18ppsPX
 lbR/UQR2kREDKlSLRbk7maEws3+IprLipF3TS7grn2B0fQH3sicxtmJT/
 8jF72z5ptIJNPFj0V8J2J27wVz7N+QXDM1ZQVVvY6Lx8WrQ0dcLPA1fEu
 GhmMbUNbwKDBPPvLaZ3iq+jCwPQU0SBcVqugatSIaSmQBMqwyz6uk3Fov
 ZqpLMg5rbs3beWHg+ZaeqjTmDRxMgt8OoPA0nMDYHawZwhtktODXfB4r7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359230835"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="359230835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779640102"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779640102"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 07:53:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 07:53:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 07:53:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 07:53:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 07:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTTmVC53HI77/nccIZwIoWsPFIh4/y7JmJLe0qrIXveTCPvgzOA4JLmVIGZYyoNVcBw4/5NdSs6pjjlu/ynQGVF2GwcWUEjMkr8o4HZpcyn5ErhMhAlg+3TmNGuhpxtj2m/205ktiIQqCmXRZuTW6mTZJd0nH4m+3adq5SQKS/r39IdDqm6GS3D7OkGqrXOPem1Qi3KtDGERmTTErTcnFh58sdDkopJ7O4peIlS2RsWE/onEqxhuNqQDcHHRR56GRxlgulSJg5lupcd4CLm5MJouyDBauDAIIV7hyWN8eh/7B+QFc7Tzk4LvZ0XzbyoDWMdVEqBVkVz1S2suR26K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYeskt0CMYhU3NpeDKqhd3K6mYxefeRYPGMirVtK4JA=;
 b=j3zCAESGHmdCp/h+f1NcYrO07goV/4FFJVLYoMtJx5G4Ir3gXjf9wh31UxATNeIHOrrYIv97CpPvTT03Q/F5RGG+RQoUB3KjfJ0OoU+Vw87D6kV4UU2ftwpyrkFssmoBJ4z15F8kHmZ2ukDG3iuxV82Jx2hjrlPgH45UGdEy0WFciDlri7UfR2x+2WFaFtmeLlFuAxekqRLuQ/88zxikn7mnVeXFi4xL6eKV/qR+oSeq4ae+E/5S9fhwnZwoWUoNVoUslUdjkJLYGFi7A6yfNyxMMN3ZicaGPs2qd4qooJHOk6Z822HAglcN0d2YfxacFQ12oqIANRBfqznia7yfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Thu, 14 Sep
 2023 14:53:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 14:53:54 +0000
Date: Thu, 14 Sep 2023 10:53:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/19] drm/i915: prepare for xe driver display integration
Message-ID: <ZQMefDTkBf35yRly@intel.com>
References: <cover.1694514689.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1694514689.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 473c4d3e-06f9-4891-ef16-08dbb5326a81
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5vKnpXNRlSeENvJ8cxuGO4+7+QP6u3RwALGdZrxUkmdQE9VBYonYHFSGRt5gjCStaDMrBRmA+7EMicak7A9IiZacFrdD0NDeV5h62SoIzPnt9/ggrCL6MjK8J3FelrEBkERq0JZ5g/hWKwzguBiZx939YBt50H1MZpU7WWl7i5Iiz4Rk9Z0p/fi+Al4oTqfkuVuR8Qf+X20mJOLQPpgcX8Q6GHXNMT1+mb1AxHrONq5GSeRbnbx1CR2j8kmlOT1TLLJQ4k0c6B5f3z0VqO/6lCnmwNUULioZ1w9XxmHzP9YgCd1WO1/Rz6r5xlM09+hUZ/4bfKcJlJvyOOjHkfQot4tnXICAUcgz7+AVhcCuh6qXsZzb0/hE5FjDsfICCo/2G4TiszFuUkvKA/McUj6t4zWbk+4ONHggA2hbyym+7RMvgG35wS6IUkkD4EnBYNbGrFYpbbO5+lnHD1rFOjiSdwzylHP3RMeyFwKBFYjK8QzDdnuWS4zcfzYjO3/g2X9DtC1rd+kXGYMkZezaYMQwE1NpPwsks/3MfqQp1MIFyS78i5xs2DDvA7TmiHF78Ha7YtQSzfyEhc5FWogpGnNgTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(186009)(451199024)(1800799009)(6506007)(6666004)(6486002)(83380400001)(54906003)(66556008)(37006003)(26005)(2616005)(6512007)(2906002)(5660300002)(66946007)(966005)(8676002)(316002)(66476007)(6636002)(44832011)(4326008)(6862004)(8936002)(478600001)(86362001)(38100700002)(36756003)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNiTCcZnGNqSHSf7qOCO40UCm8m7ibok76OBuG8UINXSpwYnNC4hzynfFa6x?=
 =?us-ascii?Q?3tVe6lVnC5ZMEtasYjSmXzxGeEBJWiVaUaFFKVkxSOJLf2EelMZj1VFsymbU?=
 =?us-ascii?Q?LAHD7YKl7BKb4+KPxFm555s8iWYe8LGyGbTD+LFgcAXdS60E4U3g2uj7UNjw?=
 =?us-ascii?Q?wQcCWisyDm+W+cqy/AkYxgPAdsUjUWfPzoy9y0ZNorOGGVGqb+h78hF+9Y0q?=
 =?us-ascii?Q?PQkr0Wqsn88gTZUYZ0dTNaJht56uP/WhpHys0vKQEIpcxNU607x6nXt5d+Uo?=
 =?us-ascii?Q?eaIPkl7s73bF1l6+21VfuqgRs9obf8WyBeQ+ErWLZZZswvzTFyfDVgFEgDDM?=
 =?us-ascii?Q?pxBe8+50qtd4h771lkNcM2mnF2qcc0X3tgPMNfU2IyUTVw10qkXf+4xWYofM?=
 =?us-ascii?Q?gooBSReRwbYTaVFSZiPICwB2BT4NwslR9dwdbeBOWLdlJl6MGMFC6ur68n6B?=
 =?us-ascii?Q?FpQIzdS5dO1zHl6DvTCHPdprf3V94Qdm4l8U5/6QlwQt8SlEKj4L5wLc0eWU?=
 =?us-ascii?Q?ugfx89AZxA1f+ADW7TGC8DdKxJ1vK4HT3sQAqChtJiDYXu4S7Q4jzXuLeqjZ?=
 =?us-ascii?Q?pnkisjKHwWJrk/aW+VU1NRq9PmTZjp3kRBcdujuY9jCmAMAWCuUsl1woTNOU?=
 =?us-ascii?Q?5bJCamf6IzwjngnMo7ZEYv8ITwlsYpRsI/4E4L7headiFhGHM0mL4YkP2UET?=
 =?us-ascii?Q?K0sTmWXlKHKegYnFdRxkwd4eihgLSrDE4C36H2jryEfB8oo746mSnHx/S097?=
 =?us-ascii?Q?Vjde+LVjJJRzWXaqN38/QGWEJJ+qtPhKgn1WSxnIjcUmdnChHHhWzvS2M6cY?=
 =?us-ascii?Q?Rh4DGwHArYiWRFiiqh0rfh/pyV2H4jGjaXVCzly7GU89ZDmli+LrFYmfMm1d?=
 =?us-ascii?Q?bHu0r9EdK5YaJ2R4eqppcv2pfSwHzU3fQN6ddjpZK6fZp1+gKB9VH+xKxYzL?=
 =?us-ascii?Q?o9nRC29D9vJGTKmgZ2BdnbVVgTfVfnLp/qfT+9XqllXgrFA0zyeZ+h0NoacB?=
 =?us-ascii?Q?ZNuIq2MBBH9RVRyA+wCXKEjhn1wymkDAY/6gBQnZQ5tUwfhNBGGdfLpVIbQV?=
 =?us-ascii?Q?lg9Mqti8uelP+7iBeGADK7J26jbDw9KKCiURAw/zE0nzy/nsG/VAm/0AzGUS?=
 =?us-ascii?Q?STRANLlH/bo0IM9b9VKtsxP3jE9SSev4KQofURk38PvzCcRE60o2J0vSMaR1?=
 =?us-ascii?Q?Qkgz095umpp6AbV351FelkAOBYO+8SrRV3UaxhZvqCcASiyu/oyYCEgUJh3/?=
 =?us-ascii?Q?FXel8/vF1pdmPoxVe7oR8490ryhxNYuIEMAu9LoPnfWvaB0khS6wqsdryhjg?=
 =?us-ascii?Q?UkpksXbTbBM9tv6RyKMTiukF8coiRnq2zpMJmbIn+Xt9AzlWYmxjdvouL4SZ?=
 =?us-ascii?Q?SOYxYbB/qI2xjOCL7DxnM0KTkLmLzkPAcVLFDwR0kDpTOp6u882IzEE5ruj0?=
 =?us-ascii?Q?0+dHc6mBhDOQ1mJ01uAV/rBdTakzXEfqlEA4g3OmVTeAuT8hGa9OI31uU3lX?=
 =?us-ascii?Q?43+x1PdwrUCvSZ394Dxpdv3NNfOMBw/RCnFcaKQZOdNNSN8n90CvS2hGsatU?=
 =?us-ascii?Q?OBRjV5A0JgSUZOQiRGhiQhvXu2jlCcXlpRYOX8pvJgPRDdaX/4Wsm9nOkecw?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 473c4d3e-06f9-4891-ef16-08dbb5326a81
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:53:54.6382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ApwjlJeSR0ZkQtia9Re1TkS+apkLxuLJGOAW8rvUsxTHYSvAX/FZkLaZNgvNeotb/ibPO0eOc1LcrNhX/mLVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
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
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 02:06:27PM +0300, Jani Nikula wrote:
> The upcoming drm/xe driver [1][2] will reuse the drm/i915 display code,
> initially by compiling the relevant compilation units separately as part
> of the xe driver. This series prepares for that in i915 side.
> 
> The first patch defines I915 during the i915 driver build, to allow
> conditional compilation based on the driver the code is being built for.
> 
> The rest of the patches add stubs for functions in files that aren't
> used in xe. The idea is that this is the least intrusive way of skipping
> that code in xe, and is quite similar to the common kconfig stubs.
> 
> While this is arguably unused code for the time being, or only used in
> an out-of-tree driver yet to be upstreamed, the upstreaming has to start
> somewhere.

I see other benefits on adding this right now through drm-intel-next:

1. Separate the good&ready patches from the other patches that are in
   drm-xe-next, that would require more work.
2. Minimize the non-xe patches in the xe pull-request. Cleaner and with
   reduced risk of conflicts.

> 
> 
> BR,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next
> [2] https://patchwork.freedesktop.org/series/112188/
> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Yeap, let's for sure get input from other maintainers, but meanwhile I'd
like to state that I have once more reviewed these patches and that
you can put my rv-b tag in all of them when we get the proper acks.

> 
> Jani Nikula (19):
>   drm/i915: define I915 during i915 driver build
>   drm/i915/display: add I915 conditional build to intel_lvds.h
>   drm/i915/display: add I915 conditional build to hsw_ips.h
>   drm/i915/display: add I915 conditional build to i9xx_plane.h
>   drm/i915/display: add I915 conditional build to intel_lpe_audio.h
>   drm/i915/display: add I915 conditional build to intel_pch_refclk.h
>   drm/i915/display: add I915 conditional build to intel_pch_display.h
>   drm/i915/display: add I915 conditional build to intel_sprite.h
>   drm/i915/display: add I915 conditional build to intel_overlay.h
>   drm/i915/display: add I915 conditional build to g4x_dp.h
>   drm/i915/display: add I915 conditional build to intel_dpio_phy.h
>   drm/i915/display: add I915 conditional build to intel_crt.h
>   drm/i915/display: add I915 conditional build to vlv_dsi.h
>   drm/i915/display: add I915 conditional build to i9xx_wm.h
>   drm/i915/display: add I915 conditional build to g4x_hdmi.h
>   drm/i915/display: add I915 conditional build to intel_dvo.h
>   drm/i915/display: add I915 conditional build to intel_sdvo.h
>   drm/i915/display: add I915 conditional build to intel_tv.h
>   drm/i915/display: add I915 conditional build to vlv_dsi_pll.h
> 
>  drivers/gpu/drm/i915/Makefile                 |  4 +
>  drivers/gpu/drm/i915/display/g4x_dp.h         | 26 +++++
>  drivers/gpu/drm/i915/display/g4x_hdmi.h       | 12 +++
>  drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++
>  drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++
>  drivers/gpu/drm/i915/display/i9xx_wm.h        | 17 ++++
>  drivers/gpu/drm/i915/display/intel_crt.h      | 14 +++
>  drivers/gpu/drm/i915/display/intel_dpio_phy.h | 96 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dvo.h      |  6 ++
>  .../gpu/drm/i915/display/intel_lpe_audio.h    | 18 ++++
>  drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++
>  drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++
>  .../gpu/drm/i915/display/intel_pch_display.h  | 53 ++++++++++
>  .../gpu/drm/i915/display/intel_pch_refclk.h   | 23 +++++
>  drivers/gpu/drm/i915/display/intel_sdvo.h     | 13 +++
>  drivers/gpu/drm/i915/display/intel_sprite.h   |  8 ++
>  drivers/gpu/drm/i915/display/intel_tv.h       |  6 ++
>  drivers/gpu/drm/i915/display/vlv_dsi.h        | 13 +++
>  drivers/gpu/drm/i915/display/vlv_dsi_pll.h    |  9 ++
>  19 files changed, 430 insertions(+)
> 
> -- 
> 2.39.2
> 
