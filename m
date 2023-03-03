Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E334D6A8FD9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 04:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBFC10E56C;
	Fri,  3 Mar 2023 03:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38AE10E10A;
 Fri,  3 Mar 2023 03:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677813685; x=1709349685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yGAVmQFLftsBVjoGRZ731DoB6VglmhE2iMIWUwlXq/c=;
 b=QahtiDqSUMhJqhLzk90LJLWfPJ9Z8Ff4kQIGqIYYg/Mw2HACbHhaERLQ
 bBU0GeU6ME+jhREM79bvXtghnKUOgHYFZFC/XGKJmVFbx1bpwFhV0yBiq
 SSRHgIhaeFXnZyZPAp1Tbxf08X1t2spCCu/a2Z1NP4tO/oO2KwmYIy36E
 YBHpyomdIwwpbjGyz88EpGLB6xOGhTMqHjh4D/QpPNEPoFn8BAn+rEULx
 QQ9wnL7J2GF5U2xARk8Z1Waed2kMo0m+e85ymlJL2/yHG2eZQhfmszAF8
 YkL5HSZCzhdp2RT/CE+ZU2rNJZSvGQbfinRMQCxHoEOHwPzC6o8BLHm1X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323236511"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="323236511"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 19:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799087956"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="799087956"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 19:21:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 19:21:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 19:21:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 19:21:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3obz2uAwlz3ylIxFBZvuwBnm4Q2F8E6mQfme5EWdsr8iSlLAZLModyNiqH2hVoT7x4nYrlB/EpRCTjPfjrFWwo4PJZ/ujguiH+vEPS8DbkoWN2k37UldJirh1GSZDsoqlG3WaRQ/WwUWzOJls+mtER5eu1PVKr0U878otUuGSfB01F3Ve7cespCMxkG4TK3rQpzmz31ORMNlKjtWQRf3DwdaGLTmgdQ9dB6HH2MVmvJFD++/lSLJDyJ1+vr/OOMkhu6c7TK1cN3qrVbQjRcVpHy6VonCOi6Ix+zbCBhjzjrf5Hx74qI6Cnj5AOiQaML+/QwJWBadB9nWTASvv+vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjva57Z52G3dXE6ON8HxfeZ2zS+FJb3IV8p00AbgBz4=;
 b=i3060JZNCG90he/42tEG4ZnS80/9nf4k2/lNCI9fM3b5q4BcPIw9kiHPlgXJw7B+I98XAsAvRaKZkslLbT9lzCPE0MBZMtKarsaTrLz41Ab8sjaQVG3cy+GU7EfMTOgGToQQMSSJB8SBLN3FieGAVLEFKimk5Y8mgcnantn9TlbAMDerPzPvHi9qNAo11XDXyBVQL/pYj6A7n1kN8JSmWF4CmMYJmWCLamFRIWTvQIUXfIfUR1zQeXpzpZJNAVwdv4wSxj2GThi6ztX59uspdoAVCxWltcOnKPt0hq6r72wFKsXzckf4Iphm4Ic86FTylO2yw4xTwn4U5cA7rE4iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 03:21:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%8]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 03:21:20 +0000
Date: Thu, 2 Mar 2023 22:21:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
Message-ID: <ZAFnqbycMleLmRe9@intel.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230302235356.3148279-16-robdclark@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d18d276-ab59-4eb0-4525-08db1b965be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksXDrIENKngoyq1F5LykBTiuq7wxil5AQiC5UQb+/nsISOlGSKnZmCgOfeIJmGnfF2E/I30PXEAHlfjEoEwWIXJPDvTuRTpfYaYyjASCASKa7/8JqrzYtbTWQPgej2SDzBDgTzjJe/28PI2sGKNXBsEpMq6C9BNrmcqQqvS8N+NGhHcDBtKUTY9FHSFRsrDqqYz6ecwlMUgrV272rQLqNUZgEKoQaDdnealNqth6hv5is77/9fhRpMgZluqQFfkpgUNflvIiWFsHzV6ZFVKsCbAgce0sdQ9NpasgiOwulRfJ1JBYx+y4IIlpI54ntAiLyYUo0U+kkjsgqzxPgfNTpLsxLDKcqiB76zjDbnQcogAFrC4wI0XwuPxjUDscNEZV6c08B1o0sSfMlCtfnYDBi9ExKBJXsYroksQtieC8/jnfnjw0pbjZGL87aOqw/jBsOgKGwHctHYszmmxHl609udu2FUT/ene0cJEi/hxiKMMDMHUHhC2EOlX/lPTj7JEyF2JY/z7mUS48ICQgmZSwgTMdroJixV4L0I4DXnZdsOrqR3piq2wUXG3xbfw9JvSwOFZjSgGYlNKjBhYz5fwZZKeZx4gy99Mjo6EGRVEuspFKJuA0l2owfQp1UAuVVX8eivOVAziDRw4S461bOgoojA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(36756003)(41300700001)(8936002)(6512007)(2616005)(54906003)(4326008)(6916009)(66556008)(8676002)(66476007)(186003)(66946007)(86362001)(2906002)(7416002)(44832011)(83380400001)(26005)(5660300002)(6506007)(478600001)(6666004)(6486002)(316002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EeryyZM4FOeVrO02bMW0NPubwNDrNWW8c8o5mTuhpYG25HQ0wEOb8POi/Fy/?=
 =?us-ascii?Q?zc3ayeBTOpTw6oH2CloAVu8QclTf/QfXtFlcntWw4oIEjE3LOQjOPY4OM/Qp?=
 =?us-ascii?Q?b8U8Cvhs2wd2lS+pWQeIdjlihQf5PMf4/1TvxmWUVkEprmxFvQw7T2T8lCJB?=
 =?us-ascii?Q?8KlrEj5OJjH2yUgEj551V524zjcIyFcuodTpg3zWwHkzc2Ye1RtP27jbVvuT?=
 =?us-ascii?Q?PRNi4Vr+KsI1qsZkxA/2K3+Bq0AiJvGfuB6bdq6R1wCch3bKBDY8EaK3We3J?=
 =?us-ascii?Q?o1mLsVuengPbyF4hG/gM6O6fl+Zm1tkEAKO+a5ZAsOLoddhK8OAlDvP5QPs3?=
 =?us-ascii?Q?Jnugvf/XMrzYdA/5K6X7/mJfJF4bRPtHP0FF8YEvr70PbvCvl0Rjfl762JCm?=
 =?us-ascii?Q?13bcZSgIw7uisbBGk2RB8HvgAVXv6Wl1LJ6GEkH6CPFfvRL5i0ZF6LonFbmU?=
 =?us-ascii?Q?x4dsssDlOQruzwVMpCc9Dn46PjOlOgtd/408Wey5osXHgx1nY3O54Ny0xiN1?=
 =?us-ascii?Q?++e5ls1ooMrlNYvSy/UGNVlnx/xbayAh8kIUZ0fePrNDLRBL1gWwTxeJ7L0X?=
 =?us-ascii?Q?aiQOLjh9jfNuApnAxELJP/Uk1qF/fMcE2of1kG+NDLvrxSQJaBY9HdCH8Lay?=
 =?us-ascii?Q?+ldsKB8Mzb+5D9rkl1+GA9Ou5bWLxUNNoS/SHPyLz74Qi4rrC/MH4OotaJRq?=
 =?us-ascii?Q?1Q8n+1QIzgoZlj6pA46IBEMimhxqdZBmdfOIx8AKz9AOsy2WA43Sft9if1iy?=
 =?us-ascii?Q?Ms4457kyuCEDtaWe4aYc4CWFgCjEvigR0VdN8gamnGMVhjHWqd0tX/8UMc1+?=
 =?us-ascii?Q?zECZoqA8VmfSq9ME5a6ioVCn8uJe4bp2z89P5km8/qIZw9YPMmyfMGNQWzFD?=
 =?us-ascii?Q?RGnV1XAr2/AdZ90y0/rYCzMfPBsZivNpRlYIP0UnVNjH/uxNTkSsJ5J2uUtK?=
 =?us-ascii?Q?lhvJ70i+6ecJTv3LOmkzGvYeQdXHiTwisjnNKQiqhy6i31Vg29cnjBNF++jG?=
 =?us-ascii?Q?eWvZxkHP+TxscRZQw4y7efNJbMzOx6p2yougbmNTO3cgHqfr8xaseBV0jIUC?=
 =?us-ascii?Q?3zU+dISOQKIhDuQrXgodhFyE6JDZ+7Bu8Y/Ppb+3XpXC54r5sTHltobi8CkT?=
 =?us-ascii?Q?jR76FaY/S1TETowYiwVX33jrJuS6fiwtSJhOxYY5CNUlTTE6HFI5MqUzjRqK?=
 =?us-ascii?Q?nsV66P2B3cUF3+c+dZ+Yr96bCQuJ3RaIJOz9CLuuU/LJ10WTMOgruWfr+3Pa?=
 =?us-ascii?Q?VaYB4OKfNakP27t8Xy7kmvYtCjN8mVAjHQmoZ6LLictXYct5DC6xZBtpOG89?=
 =?us-ascii?Q?qGaPqoA609mXSdX5jeds66z7GosbR6kp9MHwQeyyLv7BppPLDwo/DAUK+6Xy?=
 =?us-ascii?Q?slCDkJZlsigqtmZJNag4PHg9pHzVbZ2yhQaTjNC2w6pOmv2yWxNWmnlLvafO?=
 =?us-ascii?Q?4ACYva4PjjTzWntIQp8hTOORaYB86fyuLksAVrnLW+GVivuE+mm7PS7GOtYz?=
 =?us-ascii?Q?wVOI9Aclvj2iGCjO5JKALV+KLubXeaoak6epVLZYLB6hDb4A1ZzGyXV556Is?=
 =?us-ascii?Q?xMRMWZobK8/KrARdvNQDN1t40t8XawamvSE72oTQHaxBMXZtfp/IfAtVADW0?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d18d276-ab59-4eb0-4525-08db1b965be8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 03:21:20.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFqqQh0/V5ALCslhNRKGS4PDn2sNzMRGwumB/0ag778fatcMPMDmdOn9crqN/oDa4NpW7Rn6sYMPdDu4JoenYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>

missing some wording here...

> v2: rebase
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 7503dcb9043b..44491e7e214c 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
>  	return i915_request_enable_breadcrumb(to_request(fence));
>  }
>  
> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct i915_request *rq = to_request(fence);
> +
> +	if (i915_request_completed(rq))
> +		return;
> +
> +	if (i915_request_started(rq))
> +		return;

why do we skip the boost if already started?
don't we want to boost the freq anyway?

> +
> +	/*
> +	 * TODO something more clever for deadlines that are in the
> +	 * future.  I think probably track the nearest deadline in
> +	 * rq->timeline and set timer to trigger boost accordingly?
> +	 */

I'm afraid it will be very hard to find some heuristics of what's
late enough for the boost no?
I mean, how early to boost the freq on an upcoming deadline for the
timer?

> +
> +	intel_rps_boost(rq);
> +}
> +
>  static signed long i915_fence_wait(struct dma_fence *fence,
>  				   bool interruptible,
>  				   signed long timeout)
> @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
>  	.signaled = i915_fence_signaled,
>  	.wait = i915_fence_wait,
>  	.release = i915_fence_release,
> +	.set_deadline = i915_fence_set_deadline,
>  };
>  
>  static void irq_execute_cb(struct irq_work *wrk)
> -- 
> 2.39.1
> 
