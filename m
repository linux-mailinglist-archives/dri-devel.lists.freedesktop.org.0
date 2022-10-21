Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40827607C5A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A110E523;
	Fri, 21 Oct 2022 16:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224BC10E411;
 Fri, 21 Oct 2022 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666370140; x=1697906140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wuA4/9dBtJCBvyKGF3kh0uMtnsVuoqmz/Q7Ej7n5Zuc=;
 b=G8oUYy8Mr9P3UhXLGzdw0nba1pdGO4AwWMGnBaK9z1AHZmorpjRVFhN+
 Zl+zhQJq6uq9eZGNgF5Jccnpu6f4hBOlAdnylw8H9jyoRjB1PlFk3juHs
 +p+gz0qlz0BSbKReLAc9SXETsAlJFV8orQaE53vqTiuJMAsaBPAODNmsB
 RF22nQ1QOyIlwGLKkGntCdMtlhXU5MYf+x7mcV4LRZwZ1/V6OZ1BNjmKe
 TWRVID8vPtQG5oI+0YL5yGeFmd6la8u3QXisCFuJCrqvFiGHda0ihA+Z8
 338BEGHBiUZ/5AVRjnZ+i9sLgKwU+Yrjk+YxL/1rHAaQMHVJYDmeGMsPp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="305781116"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="305781116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="699415122"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="699415122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2022 09:35:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:35:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 09:35:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 09:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkMQYt9T8lpZ/Z6vdzPgcagB8s1Sw4WXytyRD6d0r9IPIaU04lnoTpEvgH41xw7Cuo38AmkTlG+k6taH4Zhb6hji2sQZrE+PtBG7VH4mNH0U/kBXfpHFSmoPbirosdSie9T3oe5oz0zz0JdyAY37nQlnvWCwe8JdtekWHL3yrv0sOtM6YWPyneitqf8xNuOxr2J+Ftk6K2ECc47g9J8TUDmeHfLPpBys7SI+Ct1IuLI41s0NsXgoGfoMQI7uMbe0miDW8bhHmz2wPiqP87tixhGtcKO+vrfGC7QizGW3wlrs5zhJV1/sW0l8kUNdDS0OuoMICMFIwvSt0iLi+fShmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oiy8k6anQxcjgahZGszY2J6yi8RzYi2FEQgtoa9iG2I=;
 b=P60sP2Sf4oEmKNyvpyPzpHhlTwfGTFprMg5r6fohaQ4AgAxL/ofIwPeXkfVsWNnSZwCWfAk+JwZAXTWfvnjoFfpDm0eyVye98KbfFnM0ko5UxZ2QJwgY+k8GAU+ruTd1M6cttgrBhQDS5aY5FD7tVNUx3D4AhrNa0O1RdYnYwqyzY6/7gE7RNZCS6W7v7tYqB+osbqzBARhOoRFnkjQNwQntpLvG0flejzsTC87N26Kr3vCZfi7DOcPVCtw223rjniloH7j6WcnoSswjJnlUUXho6HEhoShyr8Oqtg0HFAwRS4YYnGpvDJVa0nI03s1HT6o6HdD6kXn99ltKfFK7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 16:35:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 16:35:36 +0000
Date: Fri, 21 Oct 2022 12:35:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/mtl: C6 residency and C state type for MTL
 SAMedia
Message-ID: <Y1LKVLXFJ46PDFRK@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019233721.3270601-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a36aff-1551-4d4b-7bc4-08dab3824803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZUnC+URHDajimYrNWnzq7T4K0fmSIhZwXRYWLoDBDno98deTKtMdyaDMPTPbKpvOMbbIeLuIOR14DgHlvpdn4OMLKWilyvZRUiOXIg6BrppH/Jy5fWzfrAorfaya9Nv/xuL5kU+qinqrEqHuWmFnrrLE5EAeORNGaolCRi8V7SU22eSh3bVaKxK5oLlsOGlgwvSQ4zKcmECKo8R/uX3C0WGqyWwy9zQtaPAkCcfEeDpKyYU+slzdRFUM431HQbe2jbZB3Qf2uAhEWMq7ZMfSLDbgtNGOHkSojx8k5R9/UqNPMDn7mtfLAjNVlzii/6KmcwNs08idfvRwAH9fxoxvP3wknfWuSCKAXWgCuMHpc3yvcOaxu/vopmw9hJEGPucDcpUF8ONS0RE8BOUBwODnIrS8MT3H8TJWEv0sAiIviIu5bs+3iFF16Mw/GpZUgNX83S4bpuRl0bAQ3zSV+gcJxiijfKNZvb9G1suLjIWIxj5jtv1KE6Q910fbDYvosf7YXqbFeWtzRxU2EAXNUsJueh5R58ydYCOSzRSMLJxdG+hT9YEkwqCSnI/PFvvxGFeTOD3Z0JPfOxFoc2KSHZr+aTUhOr/Ee37M6+8XALx8FQcQ6dmQnJLHHO3AEWpX5tzTG+uTYPSgCj/ytFmR21X1XE//oincmZ+JijmsjC2Rm5Bki8Dhg5WvhX8ezGVTHq3nWRrEvZp2hFRpq35Ign+nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(66946007)(6506007)(5660300002)(4326008)(66476007)(66556008)(8676002)(6666004)(6512007)(6862004)(26005)(8936002)(450100002)(36756003)(41300700001)(37006003)(6636002)(54906003)(316002)(86362001)(83380400001)(33656002)(2906002)(186003)(44832011)(82960400001)(2616005)(38100700002)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lLzE/DkqHF78FNilYHqRnrGYDHZZuBfc8zyhZt//qtknhbq5swhbQ+/XN+Cp?=
 =?us-ascii?Q?CkoVn3T5TM9FvT+zXYPQdii6iqBxJZRhkFtcvhoGp2LRXcTOaC967hbTJ6r5?=
 =?us-ascii?Q?If9nwwY3to4DaUmnwvu/yprOSqKeopS26vtGCyMdTv/Nf85WVDrxppgyYUJI?=
 =?us-ascii?Q?bYfpcXDYVr8qyb/cHHJAGY8lsPk7yGw1eDON1s0cH85Z4UdzPMTdNF3jXM7P?=
 =?us-ascii?Q?UkPsYycF5Uu3FpuK5FZlmVzn41R9quefNkDJIuffGXsHPoHiL29lzADr5hih?=
 =?us-ascii?Q?VrnOks6j2zADVmSV7EBEDTHbRcB0PUpxpkpEcu+S0AMZeo8uf/MKQn9aT3OO?=
 =?us-ascii?Q?uwTQBmI9DWxPwEm/ter4kXeJYyuOmYbIVikWBzKXUgeM+hNqmGvXYmW9Pl7R?=
 =?us-ascii?Q?/TqvBWiQsOhYflHTTdGmypv6cYsjxWXAzCtPm0gtVCMyejfpFxBgWtzxZpEl?=
 =?us-ascii?Q?AafItMPzi87om7Se7vHhVI1x/Vlv7vU7nQEbnwIku2yxW+BBAUWefWbCejgz?=
 =?us-ascii?Q?BzinE0XNNN3KITm0CezTwpe1i6RbnhqObNgMCcrfP0M/qzxLKG8J78KTQuif?=
 =?us-ascii?Q?BBk/GNayinaP/iVe2ydKOBcSFNy9z2IK3+/q2AkxLj2kqfnXV7KZcrXhRWrJ?=
 =?us-ascii?Q?e3ZeF86+laT0zCe5IaOvTE+KLBShg1ipIenPbGHsKDY6AOyyMhx27CzaDn52?=
 =?us-ascii?Q?Rdm6qkWfiM7UOExM9AE0EOPUj3lZzvAGhj5v0wgRdyv8EMclMsLpJHYuRQ/K?=
 =?us-ascii?Q?1yf6zmmJ3kU9RM3F/+6a7g+ROBRmslC9O0uIW42A1jBz/pluo2o4/46Pj7jz?=
 =?us-ascii?Q?AbAiOn4h6k6CQd2YpWMqfAIiLxyJIZsQZdx6ZYJzZv66sh4nl8rFLlbwKxJ1?=
 =?us-ascii?Q?f7n6RMHfV6Ni7pvZ4nL2CMw+yNG/vp0xfYB1ZAXhGZp6TZ169Zou64b/8ZnB?=
 =?us-ascii?Q?blTrhF+7FRpgfjQxRe76MFYGUsqCCtyS6LduhiyONlFM3v5CZv/PIdxhFjvX?=
 =?us-ascii?Q?N30H6Q/wwuhHChCA329EQoNm2TIb55Wv75nhS9hwq/lnFamPLQb66seYIxyC?=
 =?us-ascii?Q?UuPJXa4cu+ZpERvMReVKHgIlyullC1Emcyim7BjzuHrTZo1D1wfU2Eu1u7jG?=
 =?us-ascii?Q?1Wl4idN8k+9cUJ9WWnp8M2aRpU89ASx6AiVmFURqdrFlElRF9de7nba7KL46?=
 =?us-ascii?Q?rsBxKvWgEaqtqxouEjUSBPUiUwVN75jKzBzMFQM21ek+upRhbeMryWhDbpfL?=
 =?us-ascii?Q?H9L2j9amkT32qePsty46WZoB+2hOUksSpwCFyXkabrm5PGxpgoPB7cYqQGcK?=
 =?us-ascii?Q?XZFXEu3uvPFwFoSzETMVxd+hcQvBScTBeMuESmP+INNWhuNY83TVbEin6zqf?=
 =?us-ascii?Q?nuUvb2Fv87rfjoJ1XvNzW6sasJEe1hh1Zdb3MgHJh3dg8LeCrtAtSlewostP?=
 =?us-ascii?Q?gEHVMYQ/g5Ut7IcRG3Sy1SGL6f+iZbYASCO+lA7czElHzFG1z+nEZ4p3OQEB?=
 =?us-ascii?Q?8FQax7Hq+37p5gv3JMfJZsCxuuiBid6BdhbchZrL0Rr/tt1/YAhmFYUKHtEI?=
 =?us-ascii?Q?fx0wF7AzGSXloSBhEXWqdjPyMIp86HyCCUX9Y3pXDUEHB7D1wMjLt+vCudjg?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a36aff-1551-4d4b-7bc4-08dab3824803
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:35:36.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N599qvGgqPqFZ7KCUhx6wBK7l+qlof391/QBrmVk5iinxwjEO9lfMaqQm1j41DfjmqcVtWBgHvaU6Wx8nFqmzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 04:37:21PM -0700, Ashutosh Dixit wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Add support for C6 residency and C state type for MTL SAMedia. Also add
> mtl_drpc.

I believe this patch deserves a slip between the actual support and
the debugfs, but I'm late to the review, so feel free to ignore this
comment...
but I do have more dummy doubts below:

> 
> v2: Fixed review comments (Ashutosh)
> v3: Sort registers and fix whitespace errors in intel_gt_regs.h (Matt R)
>     Remove MTL_CC_SHIFT (Ashutosh)
>     Adapt to RC6 residency register code refactor (Jani N)
> v4: Move MTL branch to top in drpc_show
> v5: Use FORCEWAKE_MT identical to gen6_drpc (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 58 ++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  5 ++
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 17 ++++--
>  3 files changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 5d6b346831393..f15a7486a9866 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -256,6 +256,60 @@ static int ilk_drpc(struct seq_file *m)
>  	return 0;
>  }
>  
> +static int mtl_drpc(struct seq_file *m)
> +{
> +	struct intel_gt *gt = m->private;
> +	struct intel_uncore *uncore = gt->uncore;
> +	u32 gt_core_status, rcctl1, mt_fwake_req;
> +	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
> +
> +	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
> +	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> +
> +	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
> +	mtl_powergate_enable = intel_uncore_read(uncore, GEN9_PG_ENABLE);
> +	mtl_powergate_status = intel_uncore_read(uncore,
> +						 GEN9_PWRGT_DOMAIN_STATUS);
> +
> +	seq_printf(m, "RC6 Enabled: %s\n",
> +		   str_yes_no(rcctl1 & GEN6_RC_CTL_RC6_ENABLE));
> +	if (gt->type == GT_MEDIA) {
> +		seq_printf(m, "Media Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_MEDIA_PG_ENABLE));
> +	} else {
> +		seq_printf(m, "Render Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_RENDER_PG_ENABLE));
> +	}
> +
> +	seq_puts(m, "Current RC state: ");

(Just a "loud" thought here in this chunck, but no actual action requested)

should we really use "R" (Render) for this Media C state?

But well, MC6 seems to be a totally different thing and CC6 is
really strange because the C stands for Core and this can get
very confusing with the SoC or CPU C states...  :(

At least with the Render we know which level of the IP we
are looking at when looking at media...

> +	switch (REG_FIELD_GET(MTL_CC_MASK, gt_core_status)) {
> +	case MTL_CC0:
> +		seq_puts(m, "on\n");

maybe "*C0" instead of "on"?

> +		break;
> +	case MTL_CC6:
> +		seq_puts(m, "RC6\n");
> +		break;
> +	default:
> +		seq_puts(m, "Unknown\n");

maybe use a MISSING_CASE() here?
or raise a WARN?

> +		break;
> +	}
> +
> +	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
> +	if (gt->type == GT_MEDIA)
> +		seq_printf(m, "Media Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");

gate is up and power is down or gate is down and power is up?

> +	else
> +		seq_printf(m, "Render Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
> +
> +	/* Works for both render and media gt's */
> +	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
> +
> +	return fw_domains_show(m, NULL);
> +}
> +
>  static int drpc_show(struct seq_file *m, void *unused)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -264,7 +318,9 @@ static int drpc_show(struct seq_file *m, void *unused)
>  	int err = -ENODEV;
>  
>  	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
> -		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +			err = mtl_drpc(m);
> +		else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  			err = vlv_drpc(m);
>  		else if (GRAPHICS_VER(i915) >= 6)
>  			err = gen6_drpc(m);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index d8dbd0ac3b064..a0ddaf243593c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -24,6 +24,9 @@
>  /* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
>  #define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
>  #define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
> +#define   MTL_CC0				0x0
> +#define   MTL_CC6				0x3
> +#define   MTL_CC_MASK				REG_GENMASK(12, 9)
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> @@ -1512,6 +1515,8 @@
>  #define FORCEWAKE_MEDIA_VLV			_MMIO(0x1300b8)
>  #define FORCEWAKE_ACK_MEDIA_VLV			_MMIO(0x1300bc)
>  
> +#define MTL_MEDIA_MC6				_MMIO(0x138048)
> +
>  #define GEN6_GT_THREAD_STATUS_REG		_MMIO(0x13805c)
>  #define   GEN6_GT_THREAD_STATUS_CORE_MASK	0x7
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 6db4e60d5fba5..2ee4051e4d961 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -553,10 +553,19 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  
>  static void rc6_res_reg_init(struct intel_rc6 *rc6)
>  {
> -	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> -	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> -	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> -	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
> +
> +	switch (rc6_to_gt(rc6)->type) {
> +	case GT_MEDIA:
> +		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
> +		break;
> +	default:
> +		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> +		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> +		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> +		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +		break;
> +	}
>  }
>  
>  void intel_rc6_init(struct intel_rc6 *rc6)
> -- 
> 2.38.0
> 
