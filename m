Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE7679D35
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32110E6A7;
	Tue, 24 Jan 2023 15:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14110E6A7;
 Tue, 24 Jan 2023 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674573462; x=1706109462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mF/y4P4lEkjpT4G1bgQtiaAxVGUBtwiqDMbr0g6ap0I=;
 b=PGvGyPcHC03ncF7uBS8fSAeY5gLuJq3G9v2LKwdoGsNzoqe6nu2dYMMT
 1zKSq0fGvvdn3D+1mp/G7Eq4AvNJut+s5GpZNL8D4/gxTV20tf0IkvxGx
 /I3EfKaV8AXVT2QeRgdE4ur0RaLozJmHAfgQoD8g5oLLFNRGD0T8nLF3y
 cpDhtTZwF9wWjN72M6jHaAIVycNoe6GYcrtsAuzna0A0lqdPqu2rfIgrf
 uqZasQ6JByDPrcQipNUYy+m66+IJzuC1b8ZPkD1zOp2QoocFisCJiafgw
 j4NFhME6qdQdynX8aiXlyioZ28yfMuzMCwB7Hd5G/wVCna2mMbmpH2KRP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327572214"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="327572214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639609734"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="639609734"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 07:17:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 07:17:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 07:17:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 07:17:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 07:17:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP+//EEZ1qwoUTowGpQsrZBXUgmAqyhoBWo6yrbHQ0s1o9e6nhjbresinwPeSmLcw1jyWLnL5o8ykMi4nVLE2zs4kPC0IZjPbVPDb2T2qa59dr1pSniDXb/g/UPSo1AUspADWyFhfDl220cbfF9gCk8bEqv7cGi3XrcjexKQNlVcJrNOzvScFYvHxLAjGLPhKIEQP/+3DeUJGoRrcMTKetrsPulD2Fuqb8EXKXmO/PAKfeOaIi/8Ebq0mHSs20ct3AfupqY1QVFJbWrasAXUcaxzLeE5fzunfXYZTEb4GQN/RA2FlnH8PhRtk7ErPqipjH5mlk+fxijBHfXYQKzH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAdiDseZMbTWokoXRK1E6PZmmnOuKySunkJWDyFEHeU=;
 b=A+oDlqdnW97H1AoHn8qbHhguxjIQijIajjWE6iAmsteuerCWUqs3LykvK0/LaR219zDWFCbV7vGMRGyOq5qq6+mOhi5ew2+SywGsevuGl1563GVprCE/1kJRXcBrhf+RaBCcR+ey4boep3EpoTtOB2Ln5DI9e26jjoeYN+HhyJyrsG8h0fTWYRDjdFrhnor6MwG2V6OE3gJPvlKsOOItTJatW1UfOFqdgsfhifSxn8/egwDBzw/rpROm6q2Q5pczLIZ3WgqB4Blga5yvRIAYaZ/Qw+wg8pCmzJgGp1dmeqY19X2pPKr8JrPlOl8NggAj3MHV4UH8qz4mauVLnHLPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:17:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:17:35 +0000
Date: Tue, 24 Jan 2023 10:17:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 5/6] drm/i915/pxp: Trigger the global teardown for
 before suspending
Message-ID: <Y8/2iTQ1t3siFHKx@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230124053150.3543928-6-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: f33cf640-e8a7-45b8-d883-08dafe1e1ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpn8GdTyzpp6+8grW6TDFnUuGeF8exkbXEFqBk+QuaXz09bTZH+fbQVgjuZqFQjZLwTynkZTzpX8Z8w3ff9MZlWCzrrpwWkL+yY3lCNoX0llOJbQSK2WGQn6/db0j2RKwGXRL2t25MvRUcyi6gHA7LnY0ppCrGx2soW5DoUGh66OEP7YBrST3kpVS8ud9B7NjD9JxYF/Fv+gGKdpFbejjYn6ucpDN1jA1W7+sOJPVkWZolGfGH87HxFV4ml1LjQwJKhVH9/FgSQgy1qfMiuQjBlvoekA9LhsheKRR5JiEoQxNPXCaGMZS39/qVCU/8FiNe4h94qgGHSFEGTuPlDkFJvMX/iohxXPxqtB34uV/3W3LpUeCllCOjTiiXPZ12dkgqQJg/uuedehvbkbMrDKbxDBC2ZdxXi8jnBoZJdYKemFMgZzjg1UOJ7sUUUKdaKGNmk3JRTh4bHwuDg9WgJHLQm3329QHNqURkAU+ZEH28QCquBtTPXnMMOivys41UJP9dwB7rVFnsEWT6aXoXisWGoLQIeor1wFanwnu63GY9NywPEFfxj15I+sOCOnnFjFA7FM9riCv3T1/Cj6BGlw8p4oVbgC/1taArHrHGepM6NrAl6pD52kV6qyJE7kV3Rad6KEOyyyR+Cg/qtyJf0qmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(82960400001)(38100700002)(36756003)(54906003)(6636002)(37006003)(6666004)(86362001)(107886003)(186003)(26005)(316002)(4326008)(8676002)(66556008)(2616005)(66946007)(6486002)(66476007)(6506007)(6512007)(478600001)(2906002)(44832011)(15650500001)(5660300002)(83380400001)(41300700001)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?niUr8w8TYF2xw3OvB/RWgAWG548qal0uOj4P9ujTxYlHMphTczNiRrhKuX7z?=
 =?us-ascii?Q?MBTWAjV57cVqwVjxVssKLIHMuVJ3OoRuvaVjI87oKD0ghgSspsUHlU5+CKNk?=
 =?us-ascii?Q?cSb/kJgkwb37RVSC2ewAyBUPc40oahem9YHn8UE0y0P68Ylg4dYG90XwIvPO?=
 =?us-ascii?Q?YnreV8wh0jmJWVR4Juc0sESViCuexMioIfF804fdrHRIpu+QDeInta7BATDA?=
 =?us-ascii?Q?1xAFw7IKEvwfhQlteMuPohS/NteSYbPAf69DnYyFF8QMTbtQbaHmmnfrHAj4?=
 =?us-ascii?Q?nqrI61PvgZhd2YHb04MoBIRWcN359FRfqmeai1WS7sGXVpU5GUE/yNK7noTk?=
 =?us-ascii?Q?s7SkwG5T3O6+AguJJhwZ+0hOKHo1FMjFRqiWNnopqITYOtFEOUMcOrKuSbdD?=
 =?us-ascii?Q?YkGY/Avw2CWjPi5rt5WwrGqEdMZWpg8bijpk2ILljBNYEYPuqxaBZsfvsASw?=
 =?us-ascii?Q?R9NJfCHkElI/mvtq4YLqjxdlvXqAgDZGUICGPvMaDuDW7rmMUMF9XQM+34kI?=
 =?us-ascii?Q?7tnBEvwxk1npgojlN+zNaXLbAM+l+rpbjb+xVFrBCBBxlIm6wo0DRpAAL7Vy?=
 =?us-ascii?Q?PHwXEGVLnUYB3u8rmrf4v6ffF1eAJ/VA4/sCeA5Eg8BEjOIJV+2l19lu/g2e?=
 =?us-ascii?Q?WcEXVJS+5Rn9i38q++eSdncL2Mj+rh27jXZEWp8QRAApnuxkuLisH1IF8Kg8?=
 =?us-ascii?Q?bfbPZohT6uSV4GiyPBr1UkXtFZ/k+kEun72gnSNQfdnNiF2erZ9kOlvAhCI6?=
 =?us-ascii?Q?WUHsxS/y+R28i3J/jtuv6Lmu4Xy8jnNnf8OTXN+MZ+if5Shd6nIrR2bFGyca?=
 =?us-ascii?Q?Wq1PYJfb4DnUQaJIhCE2mPp1hSrQwm6JKwW8LWRPZB0QsMUUAnSmWL4/yO3x?=
 =?us-ascii?Q?4i3ZDzQf2IAJPVrjZKUZf4+Eew5COiJJUhKgpbooVJIdmlbPn4La1xv3Rg9W?=
 =?us-ascii?Q?cbHtpqNIDhk278yS0PuMVMsKQl0OOMd48sN1WbiFbHoYNhKx3A66Zazzz72j?=
 =?us-ascii?Q?Dq+Otp6sYBtkP59iCyH/zZDOC4wIOsq/CpSFZrUFQHEZru2EuUCeC8ekGn48?=
 =?us-ascii?Q?5yKyzlqIuv1/GFC+e3wyRP16QuyQQjwWIVM4DudpTTSA5DZthc/5mJUBkHoY?=
 =?us-ascii?Q?wR6weU0QV/rVZlEShjP9igk4qh/eGNgP25L3EwVv7uKaobojqYZPUpdoYTb4?=
 =?us-ascii?Q?08szM7pZR/ZAbFk5qbOaJTCLRtgughRZr3CKhVPi1iDURPOgRvizcn26/5GG?=
 =?us-ascii?Q?KQGdjTp7z1hHxwlA9kCtzALwv28NxUPtgyQi6W0zr9BmmnNWAULIxmSBwzIZ?=
 =?us-ascii?Q?lqgzDZO6pwlu4+9XSYCI16K4L8+nYB4n0ZFVY0Z0grf77XJ751rf/i3gR+ib?=
 =?us-ascii?Q?9ZnIFg2t0zifUDrUspaSsKsN2Msjzztd5vpktJ7/ONMXTjwJqAjOZU24FOFL?=
 =?us-ascii?Q?luID8Ir6+YXUHbjwzopn9n2cSObvi2WGR8UMFe0K7YbWmoJ2KM45Gn0anRBx?=
 =?us-ascii?Q?NReOmFzQZHzMxJV8S+MiUPkRU8tb10Qr1yL0RR/Tvi6ErZ0QPDtk4vTf6xuJ?=
 =?us-ascii?Q?dJJNPeUvpeAtXy1SSPkphsNlH0y6QUbRV00GYG94dPi2i6sE/PqoaFheWyxF?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f33cf640-e8a7-45b8-d883-08dafe1e1ecc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:17:34.8529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0YfmOWnpXtkrkSvyzPbo3ZDQ1OCT8od5el5UujgX5ZxMoqqE7HcKDPgY6ZhwKbztLPZMz28CfuS+DcuUtwtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
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
Cc: Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <justonli@chromium.org>, Vivi@freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 09:31:49PM -0800, Alan Previn wrote:
> A driver bug was recently discovered where the security firmware was
> receiving internal HW signals indicating that session key expirations
> had occurred. Architecturally, the firmware was expecting a response
> from the GuC to acknowledge the event with the firmware side.
> However the OS was in a suspended state and GuC had been reset.
> 
> Internal specifications actually required the driver to ensure
> that all active sessions be properly cleaned up in such cases where
> the system is suspended and the GuC potentially unable to respond.
> 
> This patch adds the global teardown code in i915's suspend_prepare
> code path.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Juston Li <justonli@chromium.org>

it should probably contain some revision history above so the
reviewer can know what changed from the time he reviewed and now.

it looks we have another function that I don't remember...
Juston, could you please confirm your review stands in this version?
if so feel free to add my ack with that.

> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp.c         | 65 +++++++++++++++++---
>  drivers/gpu/drm/i915/pxp/intel_pxp.h         |  1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      |  2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 ++
>  5 files changed, 66 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index cfc9af8b3d21..9d4c7724e98e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -270,6 +270,60 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
>  	return bound;
>  }
>  
> +static int __pxp_global_teardown_final(struct intel_pxp *pxp)
> +{
> +	if (!pxp->arb_is_valid)
> +		return 0;
> +	/*
> +	 * To ensure synchronous and coherent session teardown completion
> +	 * in response to suspend or shutdown triggers, don't use a worker.
> +	 */
> +	intel_pxp_mark_termination_in_progress(pxp);
> +	intel_pxp_terminate(pxp, false);
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
> +{
> +	if (pxp->arb_is_valid)
> +		return 0;
> +	/*
> +	 * The arb-session is currently inactive and we are doing a reset and restart
> +	 * due to a runtime event. Use the worker that was designed for this.
> +	 */
> +	pxp_queue_termination(pxp);
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +void intel_pxp_end(struct intel_pxp *pxp)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	intel_wakeref_t wakeref;
> +
> +	if (!intel_pxp_is_enabled(pxp))
> +		return;
> +
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	mutex_lock(&pxp->arb_mutex);
> +
> +	if (__pxp_global_teardown_final(pxp))
> +		drm_dbg(&i915->drm, "PXP end timed out\n");
> +
> +	mutex_unlock(&pxp->arb_mutex);
> +
> +	intel_pxp_fini_hw(pxp);
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +}
> +
>  /*
>   * the arb session is restarted from the irq work when we receive the
>   * termination completion interrupt
> @@ -286,16 +340,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
>  
>  	mutex_lock(&pxp->arb_mutex);
>  
> -	if (pxp->arb_is_valid)
> -		goto unlock;
> -
> -	pxp_queue_termination(pxp);
> -
> -	if (!wait_for_completion_timeout(&pxp->termination,
> -					msecs_to_jiffies(250))) {
> -		ret = -ETIMEDOUT;
> +	ret = __pxp_global_teardown_restart(pxp);
> +	if (ret)
>  		goto unlock;
> -	}
>  
>  	/* make sure the compiler doesn't optimize the double access */
>  	barrier();
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 9658d3005222..3ded0890cd27 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -27,6 +27,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>  void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>  
>  int intel_pxp_start(struct intel_pxp *pxp);
> +void intel_pxp_end(struct intel_pxp *pxp);
>  
>  int intel_pxp_key_check(struct intel_pxp *pxp,
>  			struct drm_i915_gem_object *obj,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 892d39cc61c1..e427464aa131 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -16,7 +16,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
>  	if (!intel_pxp_is_enabled(pxp))
>  		return;
>  
> -	pxp->arb_is_valid = false;
> +	intel_pxp_end(pxp);
>  
>  	intel_pxp_invalidate(pxp);
>  }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 74ed7e16e481..448cacb0465d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -115,11 +115,11 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>  	return ret;
>  }
>  
> -static void pxp_terminate(struct intel_pxp *pxp)
> +void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_restart)
>  {
>  	int ret;
>  
> -	pxp->hw_state_invalidated = true;
> +	pxp->hw_state_invalidated = post_invalidation_needs_restart;
>  
>  	/*
>  	 * if we fail to submit the termination there is no point in waiting for
> @@ -167,7 +167,7 @@ static void pxp_session_work(struct work_struct *work)
>  
>  	if (events & PXP_TERMINATION_REQUEST) {
>  		events &= ~PXP_TERMINATION_COMPLETE;
> -		pxp_terminate(pxp);
> +		intel_pxp_terminate(pxp, true);
>  	}
>  
>  	if (events & PXP_TERMINATION_COMPLETE)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> index 903ac52cffa1..ba5788127109 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> @@ -12,9 +12,14 @@ struct intel_pxp;
>  
>  #ifdef CONFIG_DRM_I915_PXP
>  void intel_pxp_session_management_init(struct intel_pxp *pxp);
> +void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_restart);
>  #else
>  static inline void intel_pxp_session_management_init(struct intel_pxp *pxp)
>  {
>  }
> +
> +static inline void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_restart)
> +{
> +}
>  #endif
>  #endif /* __INTEL_PXP_SESSION_H__ */
> -- 
> 2.39.0
> 
