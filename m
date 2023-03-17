Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7906BDD7F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 01:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483910E241;
	Fri, 17 Mar 2023 00:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4510E241;
 Fri, 17 Mar 2023 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679012517; x=1710548517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xlJyRPp60Nn/BBLFs4mwnXf7KX4JsImlYfyBnFYCKpk=;
 b=lFLfkxrV2c114ou5MqohrEgvHlJQNF1oNAfU6UuIRzzaFZ+/NwyFrbdm
 xrXsV/SurmmVGuT+g0v1arx9THf1h4WUa+86D8hJ9FDtZMobulz98PbG5
 tVRiskamrnDcYseP+kWrrYwXvvw8Ej+k1USDqNJYTmXYaYhLSVMsvSbdW
 U309TVsA35qct8u21AQLrB8JRWwKU1QrrpyKkkdqbMDrvXoPR3q477dES
 oUztlb/7kQ/PO/LqfAPWg0jmrY9aonm2xf3rteGg/H7mZoihsUx7xBOcr
 KvY6AW7sIiNradUdkvqq+7jVmejwkLK/iIw7c/xyh4Q3icGmhcYhjucdr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340514839"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="340514839"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854252134"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="854252134"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2023 17:21:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 17:21:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 17:21:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 17:21:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 17:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngnwH3HZicMoSKuF4LEW5/SM0N/lfxGv9beNyi1HGXKPOxJGwvssxoeST7J1HY46OmgC695dW8jpv7dbK+mH6J/nm2SOj0iSS5PS8p/2fOZEp3z1pjItCG+Mpzvr1De+APXuyToU1G9sOST7WwnN6jr0Y224h0wrmByT8DuRQtSvMGXie6GYNpokUFlw30OB23cIsitN/s4I62dLzIb1jsIGHTXZ83Ra+rHyfIDp1b4o5TTwR2bD9+l1VCYgyoXmy1fDVZgCCIXEO/xms1lauJnoZL9oY6Jtr7pgPRoM4ZXrjV7Fu1Omiuve6KQGgkXN40+3UJNVJB3Q/v8rsVlV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF9OahxOuCJwtf+MeSzgxGAl7/pWd7o3i0HaCHFyfR8=;
 b=Mi9LNuawRFRh9MUvf1vYfrJJWmKkYDENzk+O11ojj1w/GTKXcqySzyuzirGGUul3cuX4j5wOItP6PQNLTpgw66wbjRqKb/Q6R2hanWawkTeaFcnrWSdo36RgDXmsG0YYw+I5wL+ZMxpopoUvnlykM6oeywjU1X+JGku7fWPeJswlTb2cPkN0CNCMUUJZUymJCHVWpUvLmKAKMgWxXHvBfP3C4oZPvq7yj6/5ELRFBNve0ol7/pOcdAz7qyF/4N5lU/KnBRSEc5Xl736aaS/U9TbdpjTu1IsbzFgSU0kY2enSRgcOLmym2pSNXJ+OiCQl0TUKoTmkmuPclUesonzyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 00:21:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 00:21:54 +0000
Date: Thu, 16 Mar 2023 17:21:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Message-ID: <20230317002151.GF4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230315180800.2632766-1-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230315180800.2632766-1-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: de43c5b6-f176-43de-b8e7-08db267d9c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dU34eiT0ermTXkHNpFbvZ3xnI6pibFq4oDtOKBvRgmaZL4MGVY18nd3quMxRjPT2Nfa1i3isgpaxk1TH8CF0iqSbFcVtcuIpgA8kw9lLLO8a6zk+Jzys8O+UdIjwRlRLuGBdmru0aXASO5W2x9hTM8u/JP3stnvTLo8l8EaY9hb6070Sc+sacv6QHVzx5eVGwmoibAmTTnM5td2bdsmqN3dFThmgFNbZUEEXGrsfYNStf+xaqQKiqonRYcTtQsPDVAP9/2qKrV7r50jvZK5+yUNGof4xBvpU5pVCR+AZ8zbs0cHYod2ZDCIjRixab/H46uk3trydU4IAcqZklOyuw3hK7s5FHuvzqEjOcFwPUncf4FVT4nu8t461/7xoqBQKaZpaNKmSBPK2V5QswyMbzOFi5zA32IS5CUby4b5dMrwzSIGvdxMZjOsDdBMyQKoq1CbdQkq+nkGvtKOPRulZhNYUctE/k1Tf1hrfETpUJ4PHiMEEZVs58v4aZDCJqoLQ22gISsxDUjAPVZUI3YnzSNtj7sEwwEmUmnCWN5B4d7ZXpecihsy4HTJ3r589aXAOfi5avVGSgm1ge+ZkZO5u3nNIsWnpLq3GzsgepXD/oQTWuG+/K5Vr28xG5+WD0XlQ9L4TQ1a1ThdG10voJ/XBgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199018)(86362001)(33656002)(82960400001)(38100700002)(8676002)(66946007)(66476007)(34206002)(66556008)(4326008)(41300700001)(478600001)(8936002)(6636002)(5660300002)(2906002)(83380400001)(26005)(6506007)(6486002)(6666004)(186003)(1076003)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19XuSFn3WcSMoYr3WCzVLjzIVhaZ1lbCB7Uep8z1bNXMQxczAS7HNAZpFCBa?=
 =?us-ascii?Q?ZfGuS+Xzi6OMw3UMOksw+Rk1g9mdR67YCekI7nO1wfQ+GQ8rGdU2AqUW39ZX?=
 =?us-ascii?Q?T1jErCiyimZ05Gu1vSx0/5oLyZRwcZyEwbc5bwj0sHp38PRZLcPY3cR+jPoQ?=
 =?us-ascii?Q?RF3eCrrop3O917Wiq2sBD2avLA9Vo5AVnJW7QkFhn6Nf86Wl7DH+xK1ZwzYr?=
 =?us-ascii?Q?lhg78W6TUiZGCexZD3NRbOVXMv8EZ92N9fsCoDI2hFnBk97pxb6LCFx2YeFq?=
 =?us-ascii?Q?ZXyuE7hfqmpT+UIwihdNna9R8JtKBYdtONTan8d3hEW8VwjtDcpiLkGI1E97?=
 =?us-ascii?Q?1FXozLb1xA6whYGO4XXZ29MemvtKEYLB4YufOKSnzMi3LTi9xsRnIiBltN2S?=
 =?us-ascii?Q?83sHyAFAZ8Y9YO2XniYXXXRPSTbJ1jQHTivr8XphUAMofaPvKhmxSvJy1I5n?=
 =?us-ascii?Q?c80sMP5wKd10M9YvMgrRzXmY2Ts5FcBnXoknfBLMRxPFReAaaKIVOeONYbXw?=
 =?us-ascii?Q?61HBxshGNfBCqE7cL/DQPbV7J9H7a6ebwxVPsgnMQJqOaICl62ws/ni6yT5F?=
 =?us-ascii?Q?4S7gadLJwOPDaIg8N73jbpU1l8YXDLwzjT6iNxYEVRFRKiHCYXBbFx3tm8Sk?=
 =?us-ascii?Q?/SoMV37I/3E47lX/mxtiKwC5ZYfDBgV4dQVtWeiGvdV+j0erbLq8U8NumxeU?=
 =?us-ascii?Q?VhXuX1EH3WCfYyP5oSgfXNVF7nUrxM3WvTFz4qFDI5crsvMqKaWqfAxGRKgb?=
 =?us-ascii?Q?4gAIrR+gjqaI6o7kWIxdjHEdFLGNDSkFhjbGrcIMabUaukFkHUUK09M3iVKw?=
 =?us-ascii?Q?JN6mvxQeHo4ZmQ9jyX8o545q7eFmyEwFC9196fiKd2kkYTYkgLji1Bh0KnoH?=
 =?us-ascii?Q?j/vF+5gOT4gICeLeJnjwzmxYqS+o6CBj3g6XMJHmmyycA5BE17Wgp0FzUYKu?=
 =?us-ascii?Q?yJWPS5siffhHMQnAoTb7S79YIZ33Gl+kJOJ5FD6KJB16qMf6aVcdN24V2pv9?=
 =?us-ascii?Q?CJyQ0GiRjqz/pEyHPVa2gsv6THu5iOMPHuNIOpeSnos7U6idEM5trGkPX2xZ?=
 =?us-ascii?Q?iyO0q+fxbs0HSpzaIxQX9HUQqDVpvZeravClPUv1GHmjwEzslsBdo/PamgdM?=
 =?us-ascii?Q?+NrYKPG4bvho8yP6y3L6wihpObB2LMA5jT45jf7Z4R975aSlsn7RjrJmzv8B?=
 =?us-ascii?Q?XcqjQTwE40HbPmjfYmYiwLVkBM7cqOzdVqD41316PIDpMWLepRicl3CQD7qN?=
 =?us-ascii?Q?R4GhNY0VmUUJYQYWwMqCqjUwf9WuMRGb93a25IXQUG74BUpAo9sqLCCb92RG?=
 =?us-ascii?Q?a7tG7iwCFnlvGGwRDN0ban4BhpCyzaT+ISGSdciEIjshGSQxiqaToH0wBNMY?=
 =?us-ascii?Q?7ZDgrLmWr725rs0eu/SXagrKJQqVY0amFrgI1t60WDb27pPrA52aS5utuFVR?=
 =?us-ascii?Q?6oTwaTIFGLIAJzhLAUPC2261QJUHrR7M9Et3nhDWG43LpezMXctu/lA6al2/?=
 =?us-ascii?Q?aGd1Ibrk1zxH0NKfdBSgo3DYZ4PT5N/bZTei0M4HDra4l6OHiA4hqtkGmLNr?=
 =?us-ascii?Q?5RgtfR74tb3PevG5oZWDkMsh3pA+J69SHCYQzMhBh12zoqsbVZ0zMtV5EnAQ?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de43c5b6-f176-43de-b8e7-08db267d9c74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 00:21:54.1813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IN9BgkNSKlWZ1X2nMkEHx6aMy7t7damz+sfnxBSm2qSvcO0JptBgrpztJhWWVo1L00kWUx7/cx9wOjADFupYeNLBIUCuNANEm7eufO13Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 11:08:00AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> On MTL, objects allocated through i915_gem_object_create_internal() are
> mapped as uncached in GPU by default because HAS_LLC is false. However
> in the live_hwsp_read selftest these watcher objects are mapped as WB
> on CPU side. The conseqence is that the updates done by the GPU are not
> immediately visible to CPU, thus the selftest is randomly failing due to
> the stale data in CPU cache. Solution can be either setting WC for CPU +
> UC for GPU, or WB for CPU + 1-way coherent WB for GPU.
> To keep the consistency, let's simply inherit the same cache settings
> from the timeline, which is WB for CPU + 1-way coherent WB for GPU,
> because this test is supposed to emulate the behavior of the timeline
> anyway.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

It looks like there might be an indentation mistake on the second line
of the i915_gem_object_pin_map_unlocked() call, but we can fix that up
while applying; no need to re-send.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Is there an FDO issue # for the random failures thar were being seen?
If so, we should add a Closes: or References: tag here.


Matt

> ---
>  drivers/gpu/drm/i915/gt/selftest_timeline.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> index 522d0190509c..631aaed9bc3d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> @@ -825,7 +825,8 @@ static bool cmp_gte(u32 a, u32 b)
>  	return a >= b;
>  }
>  
> -static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
> +static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
> +			 struct intel_timeline *tl)
>  {
>  	struct drm_i915_gem_object *obj;
>  	struct i915_vma *vma;
> @@ -834,7 +835,10 @@ static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> -	w->map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	/* keep the same cache settings as timeline */
> +	i915_gem_object_set_cache_coherency(obj, tl->hwsp_ggtt->obj->cache_level);
> +	w->map = i915_gem_object_pin_map_unlocked(obj,
> +			page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
>  	if (IS_ERR(w->map)) {
>  		i915_gem_object_put(obj);
>  		return PTR_ERR(w->map);
> @@ -1004,8 +1008,10 @@ static int live_hwsp_read(void *arg)
>  	if (!tl->has_initial_breadcrumb)
>  		goto out_free;
>  
> +	selftest_tl_pin(tl);
> +
>  	for (i = 0; i < ARRAY_SIZE(watcher); i++) {
> -		err = setup_watcher(&watcher[i], gt);
> +		err = setup_watcher(&watcher[i], gt, tl);
>  		if (err)
>  			goto out;
>  	}
> @@ -1160,6 +1166,8 @@ static int live_hwsp_read(void *arg)
>  	for (i = 0; i < ARRAY_SIZE(watcher); i++)
>  		cleanup_watcher(&watcher[i]);
>  
> +	intel_timeline_unpin(tl);
> +
>  	if (igt_flush_test(gt->i915))
>  		err = -EIO;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
