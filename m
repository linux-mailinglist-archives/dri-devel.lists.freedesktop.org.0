Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6777CD8B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 15:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3A10E24C;
	Tue, 15 Aug 2023 13:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896E610E182;
 Tue, 15 Aug 2023 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692107510; x=1723643510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j/CePwpu0YUd1Hva9F0DUribYEJawbUk3ZbKMKIZGj0=;
 b=JdhH2d+QscMjmV/FsDMRnb70dLF80tNts3SD6zRirwSwZfS1oHrpbEqw
 QUGkVJ1eWbjDlsFpGQKa6RWyJQBpgDXSLZ0kagFpY/PY8oZdcLwQTzZr7
 n38ud3xX1HNcj76q4avMEbuhNPEvBbYQmNjlWUDodr5KS4J2Z16Xkucf+
 6E5Eq5sFBNPiWI7JHcKPxs2ZUIbDwuzZRvlcMUn542AUWsS3Vg9JJT9UI
 ilSB9h3Zpzv/WZEjPdDHv6pmeCGuWxUE7IgIYgxAUlJAxxletSNtXNzJz
 CBz5/kBCyTKNHhS8/YQu3m5VFj6ExtmM/I/SlVOC/qHbZ/Rr3pEbVGOL4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375049214"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="375049214"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064455612"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="1064455612"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 06:51:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 06:51:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 06:51:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 06:51:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 06:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL4DuKPF7o3JGsFrSeB/1+pI6Bz+RZ+qbbhiEIQYV2pczUqOi6soP2D3OBhmoitrqHru7BXoidASO/6k6JJm8vHduwzH6G8hFe90nc8XWq6gvZ48uVY3c3O/7ejoOH4wdf1fC8wqMU6QyeRZxrlbyAujYUYd0bqutru0lzRyIni78Zg7THMt8m97FafbnsngkUJtJU8VuoU1li0gDGJYxrI4xiAatyMMXUcj8HJHqNrsQ1dGhKE2lc33s9PRoN4PEmezL5U3a5KOkOcoY6Gf2UQtmHcpW/HNyzmP8NTgUAEEAfQ0b9/T6od3WAUf9cb1oxC49yZVXd4GGsh1y/fawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuR0/X5YErCO4sFizmwOhR/1SQOEL544GyAt8T9iQaA=;
 b=gVaysVlJZaHL+Pw8CG7WxQAz+t9Uut7CAUcqBmEcukChdFCmaj+BaIUvj9snrP+RGoOeMYHV5aGgF2w8tJkfIVr2GSweEzMSYkkfNaCjM7mr9YRvV2fmZPF9k/REoy+8+GT4UPKlD68F4VofmOKy7hppyV16qgocEkZvbZIBzRqOE6QjIa39d1hMlOM+waff8SdGe/d94/zPak0LTFaf34zKjz70tWdSrd9VKUDumNkM+6FgbC8jnNY7cGgNbRGBVbGzht+MhC0RFDRXBq2KklqMYEguQ8np0C83B922g2R04lIH8SUq9czFIvOIyKfalOP4j+M6iaMuSD3EEJa3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 13:51:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 13:51:46 +0000
Date: Tue, 15 Aug 2023 09:51:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Message-ID: <ZNuC63EL/i+jiVU7@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230815011210.1188379-4-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 486d151c-4984-46fd-8751-08db9d96c370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbpUx3KrO6QzGqjLydirodB/AdBs5a1751Lb6eJ/oLadY+C2SrQ5TiR7mDRBZju0lgcSo7gXIMIST//Od8nCA+hOAT8WHfFjJsd4dok8OPrI/02yG4v6m2MOvLMw7vjUkECarLQrRVp51k4AC5lzg4ukk3Yi68pqmC4ofJe++CjdNLHZoxw2SoO2jyQ7qigw1lXFu5ZAEt25gTuOYNSwCKuvtaX9hTiAmWXHX4dYVzhbD+FfVpuzCaqvdvfJtKefyDNMoEt1iTTqdEaEBFH1KONrYpMDzhWIaS4PtrBkUC7gT+/rPaCCVAUIgTsMrFGjlLw28LSm8HdRzfMzSD7+zhG5P+JoKYg2d2a41yrkyW1nYFtDWKyqt3+dq7qa5R2fdnq3PrzJZlNiaac7ZypNwaPifZnnlNHR0BFIhDAu5/JALsDSQ6H7U5Up7W4I6iLlSsYWMgTP+nMacRNFO3J2f8840yAjKkWzniZVtsTfjExh1fjdq2mScxt3G+UE7eHBv5PukBzKlUa6sH/qxO7Kh28dW2f6YQBswMsmjm4MeOwiLoWtjL9hJbPnO5KUqSaL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(478600001)(6486002)(38100700002)(82960400001)(86362001)(36756003)(2616005)(6506007)(66476007)(66556008)(6636002)(66946007)(316002)(15650500001)(5660300002)(41300700001)(26005)(6666004)(83380400001)(107886003)(450100002)(37006003)(54906003)(6512007)(4326008)(6862004)(2906002)(8676002)(44832011)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ockjTtgqhuP7UhaNTKQ6Efh0JCulpIxyANzqBLgQDuq9sUdeY7bQLBZe+18V?=
 =?us-ascii?Q?KW1Q2AUHsannw9WNY2GkjkD6dgeNn7QWCJrGV7xc7RKX8t5g2mGGo7bdX5Ck?=
 =?us-ascii?Q?1/tt69+wektJpo5bRSHy6nJb/urLXs34bUUYyoxhVqZXo3UBntbG1t1C8Swk?=
 =?us-ascii?Q?fVIcYRi08n2rnL/Ynv5XlcAN86yCC74ONzzD21M2sOa4KlIFA++rgNP8mAla?=
 =?us-ascii?Q?eW1dpboOsEWQzPCCibgES3MBTCd/xOwlWfDppMaQJwr80VGC2Qp2RLnqNUiY?=
 =?us-ascii?Q?uzKBfVyMzr05E46b7B+skJZA47RPAswBVte1Um0WYyOE7VpLabWbihmy9tXj?=
 =?us-ascii?Q?DlVrwCNKSbXNFNDf0UvUuh6vGCO7oc9HeMXAaw2UDpUn/2jiunfPf39ox9s3?=
 =?us-ascii?Q?eh4GrqaVWY0YkbKT9plv8TZWmyOEY5OiMTPKAlJnzZKv/+iFqt60AdmySTYp?=
 =?us-ascii?Q?jeirrB+tHjGuIQjecBmOIzpGzn9a7F8ACvWlEnnBcX2gibh+95Z3uPCS85BA?=
 =?us-ascii?Q?xpRyni16USSaXwuYwWp0BUc8i/KvbGzeZcwqz1x7Tf+qU8cv9oluo6VU3iI9?=
 =?us-ascii?Q?+J62miowdq9eB8OJS93rutzlM0hAv3FSBM3dA8x+kxdXcijl8+guifEAckMh?=
 =?us-ascii?Q?iapSTzUmr2ENlraO5RYUYdZ7ZYUmFDAZMTbB3RPCqusybVoD7rAKBT73nu+j?=
 =?us-ascii?Q?xCMv5KpTXSN33JjOFSk7wlouxHsmHgvIHH3P9pYbgkcHVWQso8fAhr0CQsV/?=
 =?us-ascii?Q?gc8rRIkXWvV5CddeDO6jhVG60xyqc/rGmS7M8MGMpmqqvasg7fMuz5gAdjRt?=
 =?us-ascii?Q?Djs2OCwTewPOx/BV8t3ZKHNuTFXbjWqeSS1vhoyMlTFIy5K4SZH16d9j2tHE?=
 =?us-ascii?Q?aW0ONOQ8DX/8AtUTllaKL8yCZ2KvyU30dzBJOL7iLAWcPiwj4JuJ0Dj9KQLy?=
 =?us-ascii?Q?Jv5kpbYthihDO7uwlusNrhEYJkecPyTQGE9fhXIX7Imx/zGRLp3IexpXRglU?=
 =?us-ascii?Q?AVWNEJAR7kU6xuTZzggGwN2+lk4vusQG8dzhob0iIIawpgzsbbDv6b09S5P3?=
 =?us-ascii?Q?/sfBdP9JSINqeIB6AWzmdiaFOSsrc8XMt5oRG2DMtR5pAmqkzSs+KZfrDpLB?=
 =?us-ascii?Q?lIpeD9Nu6TYb2XZbT0g1oBcgKGLIYdth58vwERVE3u6EFH3fQEKy7BQPsIsn?=
 =?us-ascii?Q?sFaoawBKfNllKuCJbkbsrvkYQNR/AxD8M+HVs3MoTdBhwIuvH5znOilakPnW?=
 =?us-ascii?Q?2urSwCDmTkFSmE0hy3+LZwSPATRtT9TXfG+VymGIzFHzdR66YjNn4oPYJCeQ?=
 =?us-ascii?Q?dXcbKkCEeUgRrU2HUEvHnOwUyJm1jNxIn8eTT5LggGoVvGTxr0KSgjEqOZnQ?=
 =?us-ascii?Q?iggqw5twLQWi8xzoXTgGk53jIrikZzkFIYWvU4w5JyYifuF/ZcvXJxaCFhHB?=
 =?us-ascii?Q?I3f7J2ohNFAUlrqRDI2Ht33LRaR6X9Wce33Kttp9ACingc7UFj6wYPjvot9/?=
 =?us-ascii?Q?QuY5QeRpSzH2btSz3+wW5nFKP4nOdASqonKBxkuOHJpVoxn0RIJxUDFjcR0j?=
 =?us-ascii?Q?IT1MQEo7xd0HD055F0kVPuxm6fGKDElQupsmG5j4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 486d151c-4984-46fd-8751-08db9d96c370
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 13:51:46.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnZqNz21qGgOvMyLVB3GzCK51nLm5fRv/Y4IY3AeYkZB9yGh11Gq4caHcA6AijVwdVMSdGfp3kVovhFD4Iy3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 06:12:10PM -0700, Alan Previn wrote:
> When suspending, add a timeout when calling
> intel_gt_pm_wait_for_idle else if we have a lost
> G2H event that holds a wakeref (which would be
> indicative of a bug elsewhere in the driver),
> driver will at least complete the suspend-resume
> cycle, (albeit not hitting all the targets for
> low power hw counters), instead of hanging in the kernel.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  7 ++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
>  drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
>  drivers/gpu/drm/i915/intel_wakeref.h      |  5 +++--
>  5 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index ee15486fed0d..090438eb8682 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -688,7 +688,7 @@ void intel_engines_release(struct intel_gt *gt)
>  		if (!engine->release)
>  			continue;
>  
> -		intel_wakeref_wait_for_idle(&engine->wakeref);
> +		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
>  		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
>  
>  		engine->release(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 5a942af0a14e..e8b006c3ef29 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -289,6 +289,8 @@ int intel_gt_resume(struct intel_gt *gt)
>  
>  static void wait_for_suspend(struct intel_gt *gt)
>  {
> +	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;
> +
>  	if (!intel_gt_pm_is_awake(gt))
>  		return;
>  
> @@ -301,7 +303,10 @@ static void wait_for_suspend(struct intel_gt *gt)
>  		intel_gt_retire_requests(gt);
>  	}
>  
> -	intel_gt_pm_wait_for_idle(gt);
> +	/* we are suspending, so we shouldn't be waiting forever */
> +	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIME)

you forgot to change the error code here..........................^

but maybe we don't even need this here and a simple
if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms)) should be enough
since the error from the killable one is unlikely and the only place
I error I could check on that path would be a catastrophic -ERESTARTSYS.

but up to you.

> +		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
> +			__func__, timeout_ms);
>  }
>  
>  void intel_gt_suspend_prepare(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..5358acc2b5b1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -68,7 +68,12 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>  
>  static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>  {
> -	return intel_wakeref_wait_for_idle(&gt->wakeref);
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, 0);
> +}
> +
> +static inline int intel_gt_pm_wait_timeout_for_idle(struct intel_gt *gt, int timeout_ms)
> +{
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, timeout_ms);
>  }

I was going to ask why you created a single use function here, but then I
noticed the above one. So it makes sense.
Then I was going to ask why in here you didn't use the same change of
timeout = 0 in the existent function like you used below, but then I
noticed that the above function is called in multiple places and the
patch with this change is much cleaner and the function is static inline
so your approach was good here.

>  
>  void intel_gt_pm_init_early(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> index 718f2f1b6174..383a37521415 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -111,14 +111,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>  			 "wakeref.work", &key->work, 0);
>  }
>  

Please add a documentation for this function making sure you have the following
mentions:

/**
[snip]
* @timeout_ms: Timeout in ums, 0 means never timeout.
*
* Returns 0 on success, -ETIMEDOUT upon a timeout, or the unlikely
* error propagation from wait_var_event_killable if timeout_ms is 0.
*/

with the return error fixed above and the documentation in place:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf)
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms)
>  {
> -	int err;
> +	int err = 0;
>  
>  	might_sleep();
>  
> -	err = wait_var_event_killable(&wf->wakeref,
> -				      !intel_wakeref_is_active(wf));
> +	if (!timeout_ms)
> +		err = wait_var_event_killable(&wf->wakeref,
> +					      !intel_wakeref_is_active(wf));
> +	else if (wait_var_event_timeout(&wf->wakeref,
> +					!intel_wakeref_is_active(wf),
> +					msecs_to_jiffies(timeout_ms)) < 1)
> +		err = -ETIMEDOUT;
> +
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index ec881b097368..6fbb7a2fb6ea 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -251,15 +251,16 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
>  /**
>   * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
>   * @wf: the wakeref
> + * @timeout_ms: timeout to wait in milisecs, zero means forever
>   *
>   * Wait for the earlier asynchronous release of the wakeref. Note
>   * this will wait for any third party as well, so make sure you only wait
>   * when you have control over the wakeref and trust no one else is acquiring
>   * it.
>   *
> - * Return: 0 on success, error code if killed.
> + * Return: 0 on success, error code if killed, -ETIME if timed-out.
>   */
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
>  
>  struct intel_wakeref_auto {
>  	struct drm_i915_private *i915;
> -- 
> 2.39.0
> 
