Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A945E8879
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 07:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDFC10EBC2;
	Sat, 24 Sep 2022 05:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4E10EBC2;
 Sat, 24 Sep 2022 05:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663995827; x=1695531827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OALXgNKdPp2gF/OpIzlmAhhRGfNKNkb+a7bylg5KyK0=;
 b=SsH4xLIL7XFKWOyR6bfqo9wHWA0Q7bZYPzUT6zJLNRuE7TBvHQ466fyD
 /0yBwQSLxgYHGdzCPui8m2PU8utTtafLDzKNR3JUNL/q+kVdRiDNl0Dj1
 NdetLahvc9e5FYPsQHW0Gm85MtHSKyadF0PdEtd64cR7CbyD5o0lzLPNX
 Lw8saKQGUIQg6J7x5RgTW8DGPr6U7fqVuGPVDn4TyMzzBURZcrKOYDkff
 jNPKwFgMIc5+IoZDLrYu449iMYFvpDpvEHc/oD/m9j6REHt+lEi8x2iF/
 xKHSx13OKHtuL2Cms/euuNt4V1yFlvABY7QE7dTN//9GxZ7FJCfMnJu86 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="327079286"
X-IronPort-AV: E=Sophos;i="5.93,341,1654585200"; d="scan'208";a="327079286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 22:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,341,1654585200"; d="scan'208";a="571617084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 23 Sep 2022 22:03:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 22:03:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 22:03:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 22:03:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 22:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kah0k+Rge5dI7/wpPdh1oR4IMR+i4nOKO+/O8xBsyLdcFtQQ21mSaCWOcpJdMAFm/QfAwxrFFLVmx0mnGLBZFlK/Dj1JP6z5JfsQzoI5APqqSR1UsI4tgdDcyGRePx6WtYmLE5b1zWrhq25ro04j2mqpt/smZRsPlpMBSkei45zJSj09KeLc9svBOaFRNdLoVAMn1+TWbgRxoGZYY4bQSpwlxlpLFjlswxN5Jd7d/Hm7ySB6QyVYgmRxgXzo2EWVcGpWG6nA7g45xkNrb1YO6oQS5jJZcRozAVnQM+g82+DUN1csRCJWOukNRUSVaw/YWdbvmosg2srL8W8vpsG79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evlfw9r5OhVP9Oo8qXoLe5Wq1I1fT1G9gXb0OLx3pgI=;
 b=BnBrIJRtwl5XodPiYVpraLihxf9jmarjJuwqkEcQpZrBWmPIuthf9UdhQCnTubGs2YQMLIcskR3OkhgFvj3/foAX6KOfflmUHOpJ216WgmfRAKiqDYnnr/ImaAxd9Tdeh22Sqkyrlunrxk1Qy/wNN+2dVHZZPG1jL6wBka0yQMVQ5xNOLbvqwexRqlxbW3e/wCs3OluxMxgQ2IquXtUNOsivLI+WCn9fATHFVORsSbdOzFI+BHXQWgFlSGFhQ2FsnwBnSFkgvm6EUJJq+0qP0ueqgjIea0gHvTvONvT8umof/olkyju+8KQR4gnDp1KxrCbBQYaeHJTrjLFQy7hxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Sat, 24 Sep
 2022 05:03:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5654.020; Sat, 24 Sep 2022
 05:03:37 +0000
Date: Sat, 24 Sep 2022 01:03:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove unused function parameter
Message-ID: <Yy6PpFf3FSPf/J7a@intel.com>
References: <20220922213916.12112-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220922213916.12112-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: b02c6808-9789-4ad1-ebbd-08da9dea2392
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUv6mqgsOdmCb+rZaHqoySehvTAZhsdGceWpHuHnEht5p6G7bjmAOE3PD/chWXbRdEHeGZ2amUnm5DLJItJeNfcyxJfVRsyRDg4CgrNVwiMtFR6ys2nHcDXMrg9vWFR2bD9lKULgl+AdNhY8HNNtrAFzyZmo0/v/vR1rw+vRwcln+jWxJK+IhW0tN3+i31GBxVnnPUwNdsAilLuaNQLz+D7NOlIlnrr9UZ1qpGgnYUgz3iCuCg4Z0orB5ktzelDzzmtKPwRsK2DZxAINjpxLbydOK/l2xoKmp+oM+ne+UEt/q+bNGL9GniDgc5WdStaYAQO8cGBluvQO+fFBBK+hC/E+fltmCukxHuVI3u4SQr+LyHeE3vZeZuv1r+NN+2QXXPmQUF56NN1WNl04HPZdBF9nI7wO+5IPmYF956TkrN8SgZQpuwrr36YCx90L6o2uqjEB1eA804m2x7IHvoQ0UHlMMfOMpnfEfTQp3XhQtcJ5vCDxWjegz+kSiNJmQIPk3iMZuBvYJhNdgqPFvTT91Xi9PjKyWT/1soWR8n3vrcjxysrUkqRQfjGkd2zMCGjNR4krOnciWIbFmye4doGKcmOHpoLAc/MlhpX92e94oVlOvaiyZccOTLcCnsKM72ZHSHSTePgMSdbEALpc1T33wfewlWkWyTah2iN9ec9AbyT/RcNJyaevFci0BYbVRlB0oTJlWkt/VsM5Tm/lb/k3Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(4326008)(186003)(66476007)(66556008)(38100700002)(82960400001)(37006003)(8676002)(2616005)(41300700001)(66946007)(316002)(44832011)(86362001)(6862004)(5660300002)(8936002)(83380400001)(2906002)(6636002)(26005)(6666004)(478600001)(36756003)(6512007)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8SYAtt9hIp1vsnu4JjIZKkZeKvZma1Kzs5yAmKk/cQn3K70JPnIKBArxzg8m?=
 =?us-ascii?Q?I+Lj5Dw3Y9O5soj1HMpS0FLn9WS/nndayQuovgLAKx9lfH73/oZRmG2GN495?=
 =?us-ascii?Q?PrmKePQg9xx88xEv0fXN1NsBYYkJN/5xjeCl/OAMMeuYNDlpf7mBIYSXhJfJ?=
 =?us-ascii?Q?SGDFLgf+MFSu5kIm+TVcEYoW+BPzerPmvOGVLO6BHyEZNInE/A7e71/fP00E?=
 =?us-ascii?Q?4hn6E6x0oav4lBSCwWntwpVn+eWNSf9qcPrLnABxj6xiFXlmbxC9QVqXsU+A?=
 =?us-ascii?Q?uG/1XgDHM/8zDTIs7gVIsE86C/dfzeThG8/AZcAvh3wckGeSrxPByscw/+Pc?=
 =?us-ascii?Q?HMHWO1CngjYnMOMiYNtNHZekgjUgPLw7rSpWHGCccXSr8mV367pb7NZOnRSH?=
 =?us-ascii?Q?Ak3aVDyElpr6ee3DavJUDTpaO62bBBsBcHX3ONS++OlSwfK4pdfxLjrwGNGD?=
 =?us-ascii?Q?oYHhC9PCtTf+0VfV1p7F91SVJRO6cbSiNHTCJGJIZfxTPyY9gAE9n95toEuv?=
 =?us-ascii?Q?kz2pffXTm736Xtv3RXC6IVoP+wNh8DeoTNspu8R1kDTRzLVKYNh7E636GvUB?=
 =?us-ascii?Q?/JrMKB3s/fMcyXVQo7F+bsLQvfkkifKAArin0zA1qz/Yob99MYk8mWM79c16?=
 =?us-ascii?Q?W0M/J34QD2FnamI+/78jdxBQk6qU+EaQRFUAN16vC3RYiTxYIAHtGsq09UCi?=
 =?us-ascii?Q?uowcVSu1ROj/ptEjW7Led8gqgvrlPliOhoNkm8U5eWvgnev+YMNsl1/6SawE?=
 =?us-ascii?Q?y6HFVdODEvoLyWY9al70PqIGcNsPHMbHL01QjqvcJcyfU0h+DI/CpEJdNU3d?=
 =?us-ascii?Q?aALcx5fkJMct6cLf/bDQInBTvUNquDrO82lL4GKHb6VogoYzzy+9ht0rr+Y7?=
 =?us-ascii?Q?BjaVOH3LUDBB9PkLyyZKTdGmctzCuRod99ujDYu8nnykePHLcz54o1xJFKq4?=
 =?us-ascii?Q?C2Du1rsI/w0NJ/GKMXG0emqKJ5YuNioA3ed8Clb/WQ+/lHGu1Q2neK8rmrLj?=
 =?us-ascii?Q?fLyYtpcvDUJY7pGh7Dbm3f+jAdrfwdAD5prwe7Y1QgWMp3cieX9lwdUIkfru?=
 =?us-ascii?Q?m+TNH1DhZS1eP1pq+IEc+Jel4oF0JN8LT1f75MQUy1kuBQpG/2vONI6dWSvR?=
 =?us-ascii?Q?PDu3klHFUObwdgDNMBKLMMBeYLO+cqT4PhqA4rfkNczGqsfla5E2QbsnteA4?=
 =?us-ascii?Q?BirRcs8q7xYTFvl/PxNaxTnwt3hxKe6Wn2qO7ZR19xiN9vuJSFBPlCRL8Vlt?=
 =?us-ascii?Q?C8L4j+g1H4tyqn9yfsFVHrK9vALGRflWeFMPw9YaW3fWRssuxgcPUnfaULFh?=
 =?us-ascii?Q?HObp0Aygjs28WL2MsBYI7smQWZvkFY6WGd9YcKE5hpTIv4y9ZtfKUF/VuSbX?=
 =?us-ascii?Q?36+tbgLDlrjyvcaPefYKRpdisjshpBBtqvWGLBH1+5XSX1DYyhH2IgjRsxlO?=
 =?us-ascii?Q?06d+vpZsQszl6FQBRgIrIzSX7iYT4vVPn28PKSJDIJ0SrtN5c04VUbI2slN9?=
 =?us-ascii?Q?CPMKADi6Wb7ZZ+SScPartyjVdGu5RPxbOunxq3qPrljIfCeF0nxA37VySkPS?=
 =?us-ascii?Q?8t1/t2RobY3QDN4aEOr0rF0YeSL/aMy5qxmOOe5HiApQX7h4pSYUJn8iubTo?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b02c6808-9789-4ad1-ebbd-08da9dea2392
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2022 05:03:37.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYt3cBjmXnXpXF9HFMCnSIbESsrYiwe0FpvONmfd9FSjJmbX+S5XDMIX80/vzYSraq9QUppTBmIDZc9ooquNng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
Cc: intel-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 02:39:16PM -0700, Niranjana Vishwanathapura wrote:
> The function parameter 'exclude' in funciton
> i915_sw_fence_await_reservation() is not used.
> Remove it.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

pushed to drm-intel-next.
Thanks for the patch and review.

> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 ++---
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c       | 2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c              | 1 -
>  drivers/gpu/drm/i915/i915_sw_fence.h              | 1 -
>  4 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index aaa6708256d5..ecb8d71d36c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1005,7 +1005,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>  		 */
>  		if (intel_crtc_needs_modeset(crtc_state)) {
>  			ret = i915_sw_fence_await_reservation(&state->commit_ready,
> -							      old_obj->base.resv, NULL,
> +							      old_obj->base.resv,
>  							      false, 0,
>  							      GFP_KERNEL);
>  			if (ret < 0)
> @@ -1039,8 +1039,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>  		struct dma_fence *fence;
>  
>  		ret = i915_sw_fence_await_reservation(&state->commit_ready,
> -						      obj->base.resv, NULL,
> -						      false,
> +						      obj->base.resv, false,
>  						      i915_fence_timeout(dev_priv),
>  						      GFP_KERNEL);
>  		if (ret < 0)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index 0512afdd20d8..b3b398fe689c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -113,7 +113,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
>  		clflush = clflush_work_create(obj);
>  	if (clflush) {
>  		i915_sw_fence_await_reservation(&clflush->base.chain,
> -						obj->base.resv, NULL, true,
> +						obj->base.resv, true,
>  						i915_fence_timeout(i915),
>  						I915_FENCE_GFP);
>  		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 6fc0d1b89690..cc2a8821d22a 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -571,7 +571,6 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  
>  int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  				    struct dma_resv *resv,
> -				    const struct dma_fence_ops *exclude,
>  				    bool write,
>  				    unsigned long timeout,
>  				    gfp_t gfp)
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 619fc5a22f0c..f752bfc7c6e1 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -91,7 +91,6 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  
>  int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  				    struct dma_resv *resv,
> -				    const struct dma_fence_ops *exclude,
>  				    bool write,
>  				    unsigned long timeout,
>  				    gfp_t gfp);
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
