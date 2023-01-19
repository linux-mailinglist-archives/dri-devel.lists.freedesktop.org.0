Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98986742EA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0C10E249;
	Thu, 19 Jan 2023 19:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3810E249;
 Thu, 19 Jan 2023 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674156934; x=1705692934;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fdx9q3D3uQAucxL9PjKRNSrCbkrIRCPHGuO4SL0W6B8=;
 b=XpEH4J+W9zdcAIzXEEbF/3Gkrj2UzmugJLAVn3Ye/dWk78+EtitJCjtw
 x8FBhvcfX1kZeBuh3WEKAMsr482A8kfOjrfYYL0RoYG7Uri0Ny2CdsODv
 4rl/pyLB2+iPXcBkRwgdQTlPp9cXJzsDwa2Ix1A4fHR9HAxaAgiMMA5sx
 uuciRZnIDgsO5H19+TgADLDfCRsmGHxpJavSFz5xGXfmDWNY0uW5dQzcs
 D4KhXk42c1kYZAIdU+NrwKHFIbWhXUN9LvVq218iwDP6yomsStQS7KMvL
 hUUEWuMY85mhRFUx7JzHOuhbCBXvnmAPqESxriOepKAqFe7pulFkRzRX9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352654190"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="352654190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834106653"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="834106653"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 11:35:32 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:35:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:35:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:35:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWoDu9woLDMcw+6HLgH3fo2P9lXhS9vRuHUWD4xHReJtSk5XyI8/VT7YYeMX1hJHwk/XAGZkwCwEWdA2Kc2ZTsPj8c37xV5mQ1ypk9ZGJNodj/Phk9HNW0MxfU1ZuLL/M/nBExQRt+wb9276Hb5HJjkfRKZj8u8OAPz0zZn8vXEwloRQ726ppDPw4XWYHTKn1of/yqDPyTIHQaenkL/sGGERYUNEdRVpb7YEKnlo7yPCufh7fDoi/nkHDlivKZuFB8DxoEaIF7oW3x9H1w2onRinWE2CveaHMqU0oPH/rgQxO+eouNtLHH/+rMDfXg74pgjalgn6K+8TY4z4oR2WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSecKDWvm5SXb0GQdUAwGocSVx6Dtr0o9uH6iRsSMAM=;
 b=AJdXO333nrpboPyT2yZAAP31DaD2ejnAbl7OKZgWbU5BvfuvVzXGgRJJis9iczNU2c5b6SeG7muqpOrApnwWKfovrQwRB9XC+uwj0X/6gx8YyLSjDMIDG0ahGmATtx2CCWpnj0FhIi5btwCUWVpckgNzmQP7i1bTWFDGEDsq9cdtSW/ZmDSMX+XJ5ZQNXw7VzIaNo2EucFb9+pEafyqnrbKDFP4C6RkY3Lk9VjtHZlIcfmHxuI8vHLDrzIEGP31lWKHUeLExee/3wughY/FadDOd7PLIMsVvIBcgaorBzxfu4eVoTJVooxba76PiCk2OndZRXThwkNkV/lzaqk8euA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 19:35:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:35:30 +0000
Date: Thu, 19 Jan 2023 14:35:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v5 5/6] drm/i915/pxp: Trigger the global teardown for
 before suspending
Message-ID: <Y8mbfA+u+xcR6dwS@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230113011850.1463965-6-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1e94fb-857f-4c7d-b7e5-08dafa545275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FdlRJ7ZD8jTiuwLq2sfzPQjUHIsChBu+U6xfsoyJIp4qRK8g2xXteAadRDsiDL20z7aFz21/uLoVAt+MfNDDJK7C3+tLo0e84kAiSiUyywSdj9sRuZCLZKEm2041Q3oCBnhaVDOOL5sOl+TMkejUFilGiYXrnA0AOWxAodsC3FCRZ7/0DisyAlEbdkiNf11xa9jea/s1AOLGujGT8jv9PbKdM131TcL3xa34/yZyrKPWW7nj3wr2yWPPjBy1fj5DeZMhA5Ggv75NtxLlS/CuYPMV4GpBf07DpbYwum+eT9cjfLuraw676HXBk2rQ9WeHabD5K6aEod3hNmfuBUm0yAZm4iy3TJaQGWi9Ic+19F+dacZ9AUDjoe7hgCc8hRJS7eMDf+G3abQfHlgMDs6X8Ffir8mgQ6TgbjhV7Oa+Ii+1wTo52BARWfV6QPgzl7zNSH+xSqBprKDb/JhydA6RPUsydtSBLs+tWbP9rHfAamnOdnyFiJoQ97vMVxL2kjrc+EUHsrFz//6vvMfKeTWs0HFKPlbhV0LWbdhwWY4WhhnxDPTVxWy5EQQra//gSsqsstKkyrxmwo34ET8UctqQ+jZLIng8Lt70WG7t+Y7dTNko+Algr+Lg9I5ms8IwIBuGBuYvt9oRnsRQszQHSQrR3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(107886003)(6666004)(6486002)(478600001)(6506007)(86362001)(2906002)(54906003)(37006003)(316002)(5660300002)(4326008)(2616005)(82960400001)(8936002)(6636002)(15650500001)(6862004)(66556008)(66476007)(66946007)(83380400001)(44832011)(38100700002)(41300700001)(186003)(6512007)(8676002)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJ2gVVAlc57ImNVJK6auVsXRU8gBPEUpI1vAgYyHTjzNKTgjgC9yOMFyVfGx?=
 =?us-ascii?Q?ywsVbGGdBxttsMf5HZbSbP2MEd9BSpItNvcsYgErvGQlOq+8Hn+5gxrVxL9w?=
 =?us-ascii?Q?OHod0YCiZxXsj/pvEig6FQJN9ecgkFaP2KFEWftdiY952mgA/R1iWH5UPkXk?=
 =?us-ascii?Q?g+LlZY0iYHTWCCRlob1DG7n/LAcsVRUWlCG3GS1oAuFyDbNA97EikSDvuzim?=
 =?us-ascii?Q?ilQaatqb1cHa6EeSbOgB+YaxdrkHqajPtAQbHtVbLeurSBKU/oNFe8i4Cbdw?=
 =?us-ascii?Q?fp4H9iBVEx+gmQUhPxaiakLqpP/SaY80HKivWNlfpe5O93+zbY+ZcT7Vy93I?=
 =?us-ascii?Q?3kLwsIk+XejqHWoqAUKZRYWSF0+LLLgL4gkqtcsrBvw/ZS9n2JU0yoF5eX0Z?=
 =?us-ascii?Q?1Tg5xutL/lidS/FXjAKSg2R0RddmS9PnkuSREovFcaZsgX62SvwVHakRj+1X?=
 =?us-ascii?Q?fkqRpZP6+nGapaVv6ngVpCD4oZJhJck9Lq5uBtOhmNdQIr0RqADvrsnTL6sz?=
 =?us-ascii?Q?3Baa9qpN6idra6dzcOBw5VvfSQP3Lx+IHQcPNZEmgC61Iaa9/UBqDHLMlGgU?=
 =?us-ascii?Q?W2W5RQH+Ncuyj4+1LLjFWXubIAbWQIP67IENe6aCyopMYDpwQW+vW1PdYIqU?=
 =?us-ascii?Q?HleLG13sb+gnnHKJjxPfN4hA4ERHxIYEbLyeoxNHhp194l6TKm8sBcAmHRSU?=
 =?us-ascii?Q?7Y46G71n/cjdAF7pL5uanRMlg9lK/pcbaHEulSNX4hzDigU+OkiSMCznRCqc?=
 =?us-ascii?Q?30n9e0ya3+1OhNblLHqatQZxIra+6Se04AzW5G4WbEGiqSZ5TtLz0AvmC35r?=
 =?us-ascii?Q?GlPiQN2zW0+Rj7u3qKancoaWrT/jMQNvn7M9iSuiujt59ltMRPjoZ+udmlAO?=
 =?us-ascii?Q?6t5DNwzE+8W5WHrTorgRxoNODt1dAmBLUKPbd0JgJMMKloV3GDUxRtjH2Csa?=
 =?us-ascii?Q?xs1cYsuqkr0o6H6RBLPepsYkoj3pnKh3712BmwU3YFeGXk9c7kGyjO4pMiQh?=
 =?us-ascii?Q?o8E+4RdUhHMGUeZMwdwiOWYePY56ltPxBMRF0BvuVM05ZgzuGeci19cpdf9h?=
 =?us-ascii?Q?bvlsnGn/KIfiCaELKAhka4H6dnj/IJ55AslgLr5Eu7ezH+XREg4FYY5PqgcQ?=
 =?us-ascii?Q?i/cYwDLvaTmUzgDgDRvD6RHsoZnRh/tnbKYSAAco3STtXkOILLjoTQHyDZFr?=
 =?us-ascii?Q?AN5nsJrJ08MHaIP5qhrQvDu8NHRTvPRhlTLZvW02nZ3/QOp3EcAikuk05xiG?=
 =?us-ascii?Q?oCKF3hEyqWNlgByrPlVkku/xL5ssVkLlCTYZL1shrh0yBN09zFEG46XTJb0R?=
 =?us-ascii?Q?tuNZfbmwNj8RFZQ1CR5+kI7oL9MZ6UATBV2KMgeUj45SX6QE2Flt1q8W+L6z?=
 =?us-ascii?Q?X5bKt2wzx/OOT4oxMhV1zkSCrcBdpO6M4VQ6xdHJGZNnysI+Ax2S63po3Pyu?=
 =?us-ascii?Q?SMspGaAfzGLr7dU/A+8svYrZ+L5FcNrN0rq6+ObdIVqnx2Dcp66CoNtNOqnt?=
 =?us-ascii?Q?ZpT2JEKgPfx9emFbjThYwA+NMwVk3VIi/qxlimhA39uUl0jwFwcaD5Vp/+0W?=
 =?us-ascii?Q?9UX71HwVqhCaHGNXTaNU4vtLvmFXQFvJ1lav5lRg1z1weCHO6VmPWuGKP4Hs?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1e94fb-857f-4c7d-b7e5-08dafa545275
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:35:30.3363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BU0gXtPKipEPDqIM6mlGtk+fFUVyzJY1Sy/jv/oBw+0NTZfhCTIZaI32+BF3cIvCv5ysFAT4sHQJPDUAKnYxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
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

On Thu, Jan 12, 2023 at 05:18:49PM -0800, Alan Previn wrote:
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
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp.c         | 60 +++++++++++++++++---
>  drivers/gpu/drm/i915/pxp/intel_pxp.h         |  1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      |  2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  9 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 ++
>  5 files changed, 64 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index cfc9af8b3d21..f3d9e7989eb7 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -270,6 +270,55 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
>  	return bound;
>  }
>  
> +static int __pxp_global_teardown_locked(struct intel_pxp *pxp, bool terminate_for_cleanup)
> +{
> +	if (terminate_for_cleanup) {
> +		if (!pxp->arb_is_valid)
> +			return 0;
> +		/*
> +		 * To ensure synchronous and coherent session teardown completion
> +		 * in response to suspend or shutdown triggers, don't use a worker.
> +		 */
> +		intel_pxp_mark_termination_in_progress(pxp);
> +		intel_pxp_terminate(pxp, false);
> +	} else {
> +		if (pxp->arb_is_valid)
> +			return 0;
> +		/*
> +		 * If we are not in final termination, and the arb-session is currently
> +		 * inactive, we are doing a reset and restart due to some runtime event.
> +		 * Use the worker that was designed for this.
> +		 */
> +		pxp_queue_termination(pxp);
> +	}

I really don't see why you need 1 function for totally 2 different cases.
Why not 2 functions then?

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
> +	if (__pxp_global_teardown_locked(pxp, true))
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
> @@ -286,16 +335,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
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
> +	ret = __pxp_global_teardown_locked(pxp, false);
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
> index 74ed7e16e481..d8278c4002e3 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -115,11 +115,14 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>  	return ret;
>  }
>  
> -static void pxp_terminate(struct intel_pxp *pxp)
> +void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb)
>  {
>  	int ret;
>  
> -	pxp->hw_state_invalidated = true;
> +	if (restart_arb)
> +		pxp->hw_state_invalidated = true;
> +	else
> +		pxp->hw_state_invalidated = false;

o.O

pxp->hw_state_invalidate = restart_arb;

?

or even a better name for the restart_arb to already indicate that is
the hw_state_invalidate ?

>  
>  	/*
>  	 * if we fail to submit the termination there is no point in waiting for
> @@ -167,7 +170,7 @@ static void pxp_session_work(struct work_struct *work)
>  
>  	if (events & PXP_TERMINATION_REQUEST) {
>  		events &= ~PXP_TERMINATION_COMPLETE;
> -		pxp_terminate(pxp);
> +		intel_pxp_terminate(pxp, true);
>  	}
>  
>  	if (events & PXP_TERMINATION_COMPLETE)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> index 903ac52cffa1..4f944b63b5b6 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> @@ -12,9 +12,14 @@ struct intel_pxp;
>  
>  #ifdef CONFIG_DRM_I915_PXP
>  void intel_pxp_session_management_init(struct intel_pxp *pxp);
> +void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb);
>  #else
>  static inline void intel_pxp_session_management_init(struct intel_pxp *pxp)
>  {
>  }
> +
> +static inline void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb)
> +{
> +}
>  #endif
>  #endif /* __INTEL_PXP_SESSION_H__ */
> -- 
> 2.39.0
> 
