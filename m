Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9E62E7F9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F107810E69A;
	Thu, 17 Nov 2022 22:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEE110E69A;
 Thu, 17 Nov 2022 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668723296; x=1700259296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IEj5j3Uzedc8r19kOW7Cb3BjaYhvUsesfKdjGTPYT4M=;
 b=H25Ez2WjeOKRMZEtgo3i2Zx5IlvsDW5Nqf3HwfTwjAeK9ZcBE/opSp4A
 zbv+/ZuDyHdMhKwvQJKpGxX0NypPQN64dWgyj6fqlQVmz/k9PN6X5Q/1Q
 0096bq+Yzdi9uJa/wKwgejh7myB/Q3U+G1UrHOsFhc6vIHFsvk8w13Hqj
 ZHSPD9TKT6ymdXybgONGFd3N3efAeyR8srpGqx1lvc6hMKv8rJCKPKE20
 TPofddDXvAAHohJvkCfYXRsopJLkkJkpf/f54QZr8rkrlGFToeXZBBM1r
 bPyb91WhWNDbXhjNcCPAaBWRMXoWdorHfMBataEqNaXr2cmu0oo2a6dsp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296351182"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296351182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 14:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="764932100"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="764932100"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 17 Nov 2022 14:14:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:14:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 14:14:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 14:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwZ1A/skwLEYyd90W1AWHKpiktGOrCW/G9rcyw3UBbdToDpLz58ZDfGkPqSWdxbrW4X67g/m5qXdWiz3UXMQqrtgrlaQvVKgrSZErjVbNCI2xOBfMvSC+s70qXAfa7PwJYpTg8uV2pMYGV6XFT33JwOo/7PECu3Yi0eztkqsNfhilThOXGY8xZzR+78d0om+tz3BFV6gQqgAhyJn8Xk4EIVbGlsUhdDfb0xUzqhXiHXpCte6GBfaz0XE0YyJh5gehlCr3TS4zpCFSpJXycbZ06EMS2xusWmmzhBB9mkM1Mf1RpDfWHjjAjNWTH2jcfqacFrLW+F2lfhGmLCz0eYUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmMm15yV0ukJCvv8Z9lWfqHE4Gxv6ILBBrkpD5zmlww=;
 b=liCQ2TNnl66HOzvj1lVJeV3aXGnpfru/gvuHuGHDDU5oi/0mPrmEJqu0OX9PsNlcTlrZEQ+0Cb103NEMFUpKxIHraMQSNqmXSF/E+6HeDS8q8siYcQFRzqcPcbZehEKwwIVCFD4tDT2Y2kJYNeMW74dItkqGvxaY82BksgDwRcsjWP3WWb3Nsrszm/m74oEHTbhA8sa4vY4/ZUmqvA045AlmcAySxw6wIvwVmGLSNxFn4Zehk8kpeZmUA9k3w0dL5EGrWvTdmv8lIq55t+fpOYJfyEXuqhSg0ZfEqCJWFqEm3jxK/XT6BhOcFwhkrzVyoaFTr0HEYR6JcKO1UK1obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 22:14:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 22:14:53 +0000
Date: Thu, 17 Nov 2022 17:14:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
Message-ID: <Y3ayWbqIZGIX8b5R@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221115134440.3669021-2-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 667fb405-e574-4564-9877-08dac8e926ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JG7bt9cqfaqNiR6GlNc34Kup1h/E5FzaMisuJ6pa8YUHuMN9qrFYe/rHKoBav9Xf5UwFmQdLEsviAmy+rw6EHibAuSPunNwq2ahHlk1Slhb1qDntXOCgGQM11moHbeaCtHzHqrATm/9UUBFUaI7HgPUJMD59YbyXVNyZb79Agc+FxXsn/CI3qcvpx+dU2cO4F+vteoitdq0KaWyZ/4ugYlVI7y5tFHeIfET9xqsiVKa4W6Qk+WMMgeoPQJyb9wAFF8rqxz08XQs7fAMTSnoUyr3edBbua9fhjiiTqC/rpCT6vN143pP08oeh5WNyAujvLbfwZCNYExbhmDjZ+dD6Iyi/gYbRLzsWbT+cDw+kWBO6Sqs50LH+QSjuBvppZXoGgqlCvyB7Hu4lELUNzZjVCZ88hPbnGOkLH0CSaasFxf33wwEBjo6idqvTh9mc0HFPPbaoTEwdmxQ0ToMslbX95B5l6S5gesvtPwHWO9dJ3W/+HgB0h4bMyzD43W9VuO3ChTu/wx9pKEtYajjpCjyipm/18zgFS80gShOlBcATYnWjm6oim9kYMLhCBbWzYsUODPbX1eKRj51K2EnmWVtqGSfZnQz/SZlxIb6kb4b8FjUIxg1N+Xeh9RxPyvdGaGfisByrDRQoZL2TpgChuSKsfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(38100700002)(2906002)(8936002)(82960400001)(8676002)(66946007)(44832011)(6862004)(5660300002)(86362001)(66556008)(83380400001)(4326008)(6636002)(450100002)(478600001)(37006003)(316002)(2616005)(66476007)(6486002)(41300700001)(6506007)(186003)(6666004)(26005)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8UNQaV20Rv6XiAIM/YVWKvJLg4d14Gq6f2nK0PNnkUIZ4Cf+AJhcuMo532x5?=
 =?us-ascii?Q?gJlIZwW6NFAQXD1LKG2MP/Mkrct2pj5GyI9+rI4JTosPd3HreEU8YC5KM4sH?=
 =?us-ascii?Q?f1fcGfvLBYRHzKML+e2If8mhzwnk0Suqys06ltUeybD4eJ5eHWW5Bw2GaW6X?=
 =?us-ascii?Q?KN4pisHzyb+8j7uupJuCBKBYp0pljOQstpKFOr11Y5AsfqAwIwPpgWidHz0B?=
 =?us-ascii?Q?LYUg8I6NxSswJEf3rXzx7Lw9c7+/Nr7eRIHK87kLgmRB5RuGr4fhJt+0iYNd?=
 =?us-ascii?Q?9aDGESuJBDS2gl1aa6/hkEti/N80Nh8ogowxsEh8VRGet9YP/DTBeUmCdayS?=
 =?us-ascii?Q?X/3P0hDDym6Hht+iQy0xhaIh1TK72anvkL2R7QwwPJQULSOOtAhBoItY61qE?=
 =?us-ascii?Q?sll1Xlpv/1Uyk81/jNUMor1x8pAAjVPXMbDeA8EWN4RtMzpAY5ZbAS4sIOH4?=
 =?us-ascii?Q?8oZ2CNxz9A7+qKvZWyodfslFB1zTT0TWRhssMYIslb86MaEofqlOJ8vQnegJ?=
 =?us-ascii?Q?QRT8ddb7tRknCzysuu1oWwbQMrgikGDPzbHuwjvarx2Hsqpp6B60kSjWdTX8?=
 =?us-ascii?Q?umB/tS0rk5ScMllBYsvfQ3p4KFQ5OrfgFln6mKYCdH52JrBFg7G3iGeEN3R1?=
 =?us-ascii?Q?WAQtx7j1MTHRya0XM7YCajeVWgpK81VZGbWn7RDxlzXUDevzMt75iZW1xoBM?=
 =?us-ascii?Q?QfHo9Q2xh4HidLv+H0usCwW1qurfhPH49A/dQWg6zw66drAn5vT+/HxeZyOZ?=
 =?us-ascii?Q?9/y9WRL8M8JKYsJrTyb+bksSG7KkqjywR3qhhuXTdGwr9RkD0cpoYXlXdwdf?=
 =?us-ascii?Q?xMPXmBI4mSBdGdn+MQ+xwgv03asis8K6VxCz8ggisP3+hcPjNbdH/IOZATpZ?=
 =?us-ascii?Q?ypnHDA2Uhans2amLsvo6hEXF2QFratCumYWlma/9rZdF3kO9OSrKY3NRCce4?=
 =?us-ascii?Q?Z6jOMf2E4ve02uQKExPMIgEhh2GtnxcllQN8ypFsmbag/2UM2YRwOQkC+qGx?=
 =?us-ascii?Q?6IUDmlQvwkmR682zHUo4EXyL8n65R6NXaxU+ULxm9KVyFd5DIKo7j5+6jqcc?=
 =?us-ascii?Q?7HvKOXqleuDBNxL/EJna4xEAvmuAeyL5L8nJp+j1/op9FBoLbPpBcS6baAFZ?=
 =?us-ascii?Q?qcJq/wAa1CQU3qTldjYv9vNgytA2h4wsIbLURRa/25qudR10xIUN6v1KKp1N?=
 =?us-ascii?Q?E9g3PiT6lPYiQx8Kn5gg3wszbMyDabvQdw6I8ueiW2MdW5NWTjDcQnxt3Mgr?=
 =?us-ascii?Q?TXd+PJrNAUa2OIcgAqh4yjrNCHsmxbeG8W8sy7awtZdtV1SevfB4GmU6Gg39?=
 =?us-ascii?Q?pZNQIC2OYzGxzhDWFARo64e2RYPweXMlUPZqgnHJAu1y9aOlmWtQ8L4frzOz?=
 =?us-ascii?Q?XZN7eoO/vongK9kCPLZYdwahIdA58fXV7x+bZ5ceJr6Yq7UQXjkfLzVUb65j?=
 =?us-ascii?Q?2UktZ01ZfPPNwj+sLvbpIhfnAmm6IuEKnDmSISlq1CYA4Ujlg797oFQBIqTE?=
 =?us-ascii?Q?m3ouUUYZzbV5jZq35GaOWTfD9R65mLV8VDInpK3lfiWwgZwTD1rlunQUKjRu?=
 =?us-ascii?Q?nMymr5jDxG9kO3FN/ZaNG0SOAKuGpFPwONB0qJ6c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 667fb405-e574-4564-9877-08dac8e926ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 22:14:53.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kkVhhWyqkzdMBBCHJKLHHMyZr9SBEMPwBzgRPe7nYQXWv+4PgydreEtlo+4bhshr3riL6N0LyGhB2hY2+O0Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> entry on media tile idle messaging need to be enabled.
> 
> v2:
>  - Fix review comments (Vinay)
>  - Set GSC idle hysterisis to 5 us (Badal)
> 
> Bspec: 71496
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b0a4a2dbe3ee..5522885b2db0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -15,6 +15,22 @@
>  #include "intel_rc6.h"
>  #include "intel_ring.h"
>  #include "shmem_utils.h"
> +#include "intel_gt_regs.h"
> +
> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
> +{
> +	struct drm_i915_private *i915 = engine->i915;
> +
> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> +		intel_uncore_write(engine->gt->uncore,
> +				   RC_PSMI_CTRL_GSCCS,
> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));

disable the disable? shouldn't be enable the disable?
1 = disable, no?

> +		/* 5 us hysterisis */

could you please mention here in the comment that 0xA = 5 us per spec?
I got confused again even though you had explained already...

BTW, how reliable that spec is? Because according to that same line
we should be setting the bit 16, not the bit 0 in the previous reg!

> +		intel_uncore_write(engine->gt->uncore,
> +				   PWRCTX_MAXCNT_GSCCS,
> +				   0xA);
> +	}
> +}
>  
>  static void dbg_poison_ce(struct intel_context *ce)
>  {
> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>  
>  	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>  	intel_engine_init_heartbeat(engine);
> +
> +	intel_gsc_idle_msg_enable(engine);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 07031e03f80c..20472eb15364 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -913,6 +913,10 @@
>  #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>  #define  MSG_IDLE_FW_SHIFT	9
>  
> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
> +#define	  IDLE_MSG_DISABLE	BIT(0)
> +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
> +
>  #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>  #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>  
> -- 
> 2.25.1
> 
