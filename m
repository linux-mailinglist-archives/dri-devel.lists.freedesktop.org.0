Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55B6DAC15
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 13:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C550610E24D;
	Fri,  7 Apr 2023 11:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E747610E24D;
 Fri,  7 Apr 2023 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680865723; x=1712401723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gia5R+s7LusEfFtE26I7PWldXctkGJOXha/mF2QnJBY=;
 b=TMHBvNcAwN3VWrKPZTp7zZqPnu77/PXwj5RUqJ/hqcqXY+VhOEZp+eZS
 pksp2tWaZ0hjxS9PJjDAXZtqkRCW3O9JJQGNjMSwf9xNp0FviEjozYsZ+
 DKNEybYkM1uWd7B3xyiQpLfQXVacggwP0H5r0BngB4m8U3HfoziVOfHEm
 OD1+y5ncWcg0cC1uZ09bCe44KZjkb8uJw7j4k9zk5NQj8RBPGQoE/YaHQ
 x4a2f48OGWRoMxXwIyT1W81R7+zrPui2Q2xBcBP2Dnn1L9/uD8J5ZfWy5
 lKhSKiUcZc1E+ZCUoEOW+uS8DEkz1QSYB9W9G1xaivvUoy6Bj8HfXLjiM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323339022"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="323339022"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687494472"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="687494472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2023 04:08:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:08:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 04:08:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 04:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYWP6OAfJBCU55+bIyj7WkM9+AAHd0W7XcP/ga29vHD1DkKdzRE9beZcZX0euStRHRkkQhLK/4eLxr2beN33YerrSngfou+U3smX6aeFxXqnSnPVGXePF1cGFWaDL6i1gBQKX7Q2XeL7co4xLnfRcT9FOUtO1Xe6HZdNIaT/gLStG1ZKBQkUdgSD7z0ctAafrl8+1IbnEUa2AGTWApDMFCJKippU1FFli59fQ44CJcABErRdKQbTxK4+M1Zz9eJB74T005Z4LnYEfj1PBm4wy1szkleYzLAG6k13kZZ1NGpBtNZvJ/la0SLw4aA113FQbbauFFOp0sn0eLR4jESnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL1d8fQWPc9zFuoqD29q7SaZsnCQ6XBIzNs4TfpSnv4=;
 b=WV+laDWgVHbL+HS/k1OUuFS05jslRcq9TfqUiIr58uVJUt02Mi2HdswvTfdgHi4kgyboO3ArF0qv2dJ9o9BW0+UFKFxvhKAQtE2FZz7LJMgfeHOThUfrjAg1kBW97uop9SuJly1fD7AQ9ycPrFvrvCSSRh77kviKFBBrSI0hPAtqmNTNvNIlGFcSt7u8UjV2PU1UZAG5J9Fl/eOTjZUUTwO4TRlNvSfvRGFQ37YsWsgKBcForF3kXEBcKq73r/Z0k0gjegwc+6jjNXIE0N1R+qPkYhR3AeTrRPA49/8XlgyyksTW7BA3aWqv/r+3h4zVU0V2vodYlpOmGCdNXP5bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 11:08:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 11:08:35 +0000
Date: Fri, 7 Apr 2023 07:08:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Disable PL1 power limit
 when loading GuC firmware
Message-ID: <ZC/5r96UYIZCKjW9@intel.com>
References: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
 <20230406044522.3108359-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406044522.3108359-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 263453d3-6017-45eb-7a78-08db37586e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpcyGmCw/ODltFGhk/leIqVEDDfoLUYYMES0QyUF6gVho8/ohSas2cB96SWkAmw7hvstQm+g1BKu6GOwcpGkDEEES+0jYvolkDIM25rBS4e0K6cRjmYFy5BaaRuSZKWqQmIQyPiwbr/5+i9bXOLhlj7s4mmm8QjjNfdPnGyG0oKMXXNmq1rb3QYA2RldgqMKG5bKCd1FAtG87ps9g/9o9bAzjV/prvsddDPfyh9TsiR7oYAW+ri9Pt67rlttgmRSXhH2YHdqGlRhGIxxxcf7pUFHCYqah3eh1vr7us7LTejAyC2ewOm8MUB16OOf1RX8miP2EBlDAVjNXv87fHAh2zwVtiI+vE1tSAUYI6jBTFXUFw/6EAriJE2sEqpLfrgRhVXzh21QJyPYgePUp0wXFx4LLnaAJ23bQ7pgEP61ASEzmN/zHnlGNlODlzdV/ebygPFzZcdDDmib3rPLU1Gx6fIKmrOl5MWeM1wdUbby3mDC+3mQ61xOH6ZgXvRG42/fGhr5m16dL2Ra9OrwaHtiPoT3jyWpVtiCASIy3BgpYHhcnRQWxSj4KyYeda+iFTl8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199021)(83380400001)(186003)(2616005)(6512007)(4326008)(26005)(8676002)(6636002)(6506007)(66556008)(6666004)(66476007)(41300700001)(66946007)(37006003)(316002)(5660300002)(478600001)(450100002)(8936002)(44832011)(6486002)(966005)(2906002)(6862004)(38100700002)(82960400001)(36756003)(86362001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SJ9WCA5k88C2Ljdez3aZ+mtAGvTW6mKhhVBCXlpOH1VeUvLXpeiyFKwSW/49?=
 =?us-ascii?Q?KEl72E6xyfuDfSyBs0JoBXNp69Rqb8UeucirtNYBorfUT54IM0mj45vWIK8+?=
 =?us-ascii?Q?3g0nqjbEPf3jHhxKkzpT0ifl6YLQuvVxLD0l/n2UKCV8/f7w8MjwRjsmIdRT?=
 =?us-ascii?Q?f8ZO3vRJL3BCQDxWyik0qz0WjYqrAMcBmFKtY6I9igBK3n0CWeNWlnrSRHpC?=
 =?us-ascii?Q?HGtt4W59JAA7ukhJVWfOOqLh9MLCey7y3OwtlcnFHEyynBAC+viA5Hbe2wrq?=
 =?us-ascii?Q?GhvFLaJGeKDnRR/em2M7rWza2Rxz7YzuNHfXq9q3DYhhFtmuaLBF6LPLCPQ7?=
 =?us-ascii?Q?MnvgaCbfjB081OUWPKziouUAsPdw7LI3YZlbqBHXqzVwmAAMMhkHg2/5MKSX?=
 =?us-ascii?Q?ShQHmSbumhbw678GK4gFgEa6p+W+AQTItzK+9V0BmQYpBNjX7GLL0nffXxLF?=
 =?us-ascii?Q?PJW4NyHZt8VCfSxdiOUOMV7gfgqw2goVx5ka0bigLwnvXEsdMX8v+5EstiCo?=
 =?us-ascii?Q?yFPg6jWMLels8i3gTRA8D6EkPOJ0Vko09lUH+OTZMc9ywnMBDc1JiboSQWo4?=
 =?us-ascii?Q?5pv0UA8eHGr1F6QxBTm8JJmCgzblN99N29AqJGt9uHGW9O1Xy9cONwzDNhHV?=
 =?us-ascii?Q?3QcIc5lGG7TBY1CEbjr++pXqak4ay1LS6Xm9yBGeNB8lvRmyLKAZmo8oIbWT?=
 =?us-ascii?Q?J5Zj3vO5MncWiw/ypiHbl7os3TnEDBqn85NVdSxihdozr4f5v3O1LAANjsqE?=
 =?us-ascii?Q?QGEJ56ftfT1JJ3v+LXYx+JEzMd6vYX2RT5mNVFmvOsJJxAScWGYhyiCcPv14?=
 =?us-ascii?Q?0T91eCpgmma4TW3oU03DLClTU2cMQI3jeJMe2khEmq9zEPq5v/Gcsx1Y2C31?=
 =?us-ascii?Q?iY0NOU9dgTB2Eixgh4lXf7HMNTWBtY/gGYLp6CYmctaLeVeglxsQSk9PHpMj?=
 =?us-ascii?Q?J9WjKdDo9AIoPQW+QDTQ+eEYk8M1qe5w4aWiQ20P5bCQMHFdrjklyViGJwRA?=
 =?us-ascii?Q?o1oc7yNGeSdgK22NOaXK8o+E5n/jCM18rlfqm0AdDjPlKtqc6Dwxf1gtCblz?=
 =?us-ascii?Q?Fa9lxusfZNjkLJj8XdNeicYN8QdJ1L3DoKnXXNKv0AgJ7pltTyfckyFd1v0f?=
 =?us-ascii?Q?DT6XBDy5JVXzwDsTBe3kIAvb0MS5uVCheWUU1/0JO2iTSsE9R5u5fo2vIEcB?=
 =?us-ascii?Q?a+opcO24cZlzSzjjLrOGA6TKWVxUg0kbub7EaTU6lYC0npy/d0LA0gyTHp/z?=
 =?us-ascii?Q?tBzkfBeiq8dsjEfJgj7J0l6hRW/PMf23JiTtLb4aJcQt2Zw9i2zMLzzJKke8?=
 =?us-ascii?Q?A6RWzLf874qhSzEDIilZXDnDa/2CQFT7qY8ZIkJU3E4WfavG3os0MiLfkBvx?=
 =?us-ascii?Q?34b+amDN8EDDqgd0635TA2KtPk1Hf6f93jpYm1nkg4ZaIYThwA4pq8GwQZK1?=
 =?us-ascii?Q?sCrt3SBxxd3euEAeb3eyGkagB/d0kqpqkWnB3a62E0u7vewA83CoSzf560C0?=
 =?us-ascii?Q?t6slw55zBwc3vZEFRQobOHeZPKi9164k92tznP9fUvhMkFgT16sycvEVM0c7?=
 =?us-ascii?Q?Ajrt5Wgaqi2buqqyI3PTLl77iDmyLlVR/4n6uzSLnK/Glf8CINWaTesA3S0I?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 263453d3-6017-45eb-7a78-08db37586e5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 11:08:35.5317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDEhFCVvoRUwedEJHvt/2+3doU4boWYvMhNbEfP5t9qp2e9wBMyaU8Cgpu4nTYXemk4OOqI2Y/JJeBjl2qMvcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Wed, Apr 05, 2023 at 09:45:21PM -0700, Ashutosh Dixit wrote:
> On dGfx, the PL1 power limit being enabled and set to a low value results
> in a low GPU operating freq. It also negates the freq raise operation which
> is done before GuC firmware load. As a result GuC firmware load can time
> out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
> limit was enabled and set to a low value). Therefore disable the PL1 power
> limit when allowed by HW when loading GuC firmware.
> 
> v2:
>  - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
>  - Add hwm_power_max_restore to error return code path
> 
> v3 (Jani N):
>  - Add/remove explanatory comments
>  - Function renames
>  - Type corrections
>  - Locking annotation
> 
> v4:
>  - Don't hold the lock across GuC reset (Rodrigo)
>  - New locking scheme (suggested by Rodrigo)
>  - Eliminate rpm_get in power_max_disable/restore, not needed (Tvrtko)
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++++
>  drivers/gpu/drm/i915/i915_hwmon.c     | 40 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4ccb4be4c9cba..aa8e35a5636a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -18,6 +18,7 @@
>  #include "intel_uc.h"
>  
>  #include "i915_drv.h"
> +#include "i915_hwmon.h"
>  
>  static const struct intel_uc_ops uc_ops_off;
>  static const struct intel_uc_ops uc_ops_on;
> @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	struct intel_guc *guc = &uc->guc;
>  	struct intel_huc *huc = &uc->huc;
>  	int ret, attempts;
> +	bool pl1en;

we need to initialize this to make warn free builds happy...
what's our default btw? false? true? we need to read it back?

>  
>  	GEM_BUG_ON(!intel_uc_supports_guc(uc));
>  	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	else
>  		attempts = 1;
>  
> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
> +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
> +
>  	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>  
>  	while (attempts--) {
> @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>  		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>  	}
>  
> +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> +
>  	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
>  	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>  
> @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	/* Return GT back to RPn */
>  	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>  
> +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> +
>  	__uc_sanitize(uc);
>  
>  	if (!ret) {
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 7f44e809ca155..9ab8971679fe3 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -50,6 +50,7 @@ struct hwm_drvdata {
>  	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
>  	char name[12];
>  	int gt_n;
> +	bool reset_in_progress;
>  };
>  
>  struct i915_hwmon {
> @@ -400,6 +401,10 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  	u32 nval;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
> +	if (hwmon->ddat.reset_in_progress) {
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
>  	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
>  
>  	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> @@ -421,6 +426,7 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>  exit:
>  	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> +unlock:
>  	mutex_unlock(&hwmon->hwmon_lock);
>  	return ret;
>  }
> @@ -472,6 +478,40 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>  	}
>  }
>  
> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	u32 r;
> +
> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	hwmon->ddat.reset_in_progress = true;
> +	r = intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
> +			     PKG_PWR_LIM_1_EN, 0);
> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +
> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
> +			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> +	hwmon->ddat.reset_in_progress = false;
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}

you could have combined both functions in a
i915_hwmon_power_max_set(struct drm_i915_private *i915, bool val, bool *old)

then pass NULL to old on the restoration times
and have
    if (old)
       	*old = !!(r & PKG_PWR_LIM_1_EN);

But really up to you here, the current code is clear to follow imho
so, with the pl1en initialization fixed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  static umode_t
>  hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 7ca9cf2c34c96..0fcb7de844061 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -7,14 +7,21 @@
>  #ifndef __I915_HWMON_H__
>  #define __I915_HWMON_H__
>  
> +#include <linux/types.h>
> +
>  struct drm_i915_private;
> +struct intel_gt;
>  
>  #if IS_REACHABLE(CONFIG_HWMON)
>  void i915_hwmon_register(struct drm_i915_private *i915);
>  void i915_hwmon_unregister(struct drm_i915_private *i915);
> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
>  #else
>  static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>  static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
> +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
>  #endif
>  
>  #endif /* __I915_HWMON_H__ */
> -- 
> 2.38.0
> 
