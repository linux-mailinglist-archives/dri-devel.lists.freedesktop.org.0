Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DA6BEE8C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 17:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552F10E3C2;
	Fri, 17 Mar 2023 16:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E8089226;
 Fri, 17 Mar 2023 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679071120; x=1710607120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kOZpMOj+BL7IlmM8IkA140+55RvnYMXDe4ovTdLxRls=;
 b=e3rPXE/MW35hsKl23YQZ6k0E7yIbHu57wnEK8PpHFUybN6jLEPBRFI7H
 Vr6dlnXyJJD8l3DKeDI6/jiBOgv2NM5dnLmXMwp+LM7tu5MRUDTO2id35
 yzGjgaxwaIXWYEu/mVfJkGbf12CKp0tar+WIj+l0W/cI/fYo45DhLC01S
 0oZW//kCAsYsBejhn2kBOiIBfVISSjdaAx3JgZVgs4XjqCm5yr9VfPKmV
 Ajx1TQ8u4q9rV5Jxd1+pNlZWJurhMQC1Eg8SIP+CdK0cNv9IHiwbQ9/pW
 6XhFRtgZiifXk06/pEUv9lYT4sjyDyepahmVGTF2QDXbRyQ2f0h5SkF8Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400885365"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="400885365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712807334"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="712807334"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 09:38:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:38:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:38:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 09:38:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 09:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S85FjZVaG4vgcaK1rjXGbxwp2MkKx5Rb41qLJkPpFe3Q+xwapL5m0kpoWwHLPPVgM/Q+HcgjIfW/06EYorugQguSXrQ+6tnuVQTyFPCNLVyfF+EBtSbSh5im3Pbcyn0svAXz3fMiiqNBZX4mNbA8gfoeGIqh+uzdrIuXRfyx5f13XSRjFZ0MwSpO7QYWk8bSXsrSMt5LRHJAkHfch88Ko+YDq6ewM6EhCFlSJ7XNf4lqxnNVRLo/a26Bn/m2YHR2S1W+LQPPeqnMF3wcZh8iEpSpdaf96teBIYuYZVvVxzhk+MiopFGPVpSqSJg84WiSsVp8/sK6PcX/HY0YPw0fHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N73qqilF7htK6GBdVB9V53dHfGr6pXcbtstTKiQBdiI=;
 b=RTxpRVh+uaolxx8if8DuTFac4y6Yj3KFMYNkEiogPPBlebjzAQDMs6USe+m+aMioyEhQprEFjAbnDDtJSEOJwftyJv9m+E3AvNas+kU+vwCY38ecs88T191FLJvIqQ+PYASpq25+jBq/FEKB69wVURsNMj1wb0J3+OqM6K3RCoFzBJwUd3LN3T3l7KypWeb10IrJ9xTmSvtT9ZgcuJMpdXXUy+u3AQSA4Cxs5pQCoCDwZxcrvvrVQfKpIRT90Hz2zqVapEL24Gg0NXPnu0fih49n/qR8KYiLNsZVB852ZNVmzqbhU3QJQBICB/OJKH0NDioNrQ7wfOr21khULrApnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.35; Fri, 17 Mar 2023 16:38:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 16:38:37 +0000
Date: Fri, 17 Mar 2023 09:38:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Message-ID: <20230317163833.GH4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230315180800.2632766-1-fei.yang@intel.com>
 <20230317002151.GF4085390@mdroper-desk1.amr.corp.intel.com>
 <SN6PR11MB2574A0A41A0DB74E1DD38F4B9ABD9@SN6PR11MB2574.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SN6PR11MB2574A0A41A0DB74E1DD38F4B9ABD9@SN6PR11MB2574.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f7499f-a705-4c46-2e40-08db27060e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0uaBICe4vgnONfIIRl3sHO2Mdc8yyiLXaxCGFBvb5feYAywUJw1yyKIH8kA33EOixYoPZQSV8fuJKSPIHqDbS25NVcUrqQ3iI0gMp753hGk3wTLZhGSRXdelVxYFbO0BT9Bzt1oEdyCO1kpv1vSBlGzbV9fE3pHbiOk/XEqkssE24kzY+9ch9jgE4oMRSUcBziJUlXnsHm/tdnYF13jwpbmljj5o74q/5+QvnxlEDc8fYHpnk2PptvkKjN5lcfiOmf+OdmoXT8VFc/WWSyqPnHI8jpzNe1grx255uWN9Y/nuqy5+WMvkeRVrtltN9rw38iRCZmdmE9hWOgjCJyAnTJsnovY8ynyiHowQRCodQsTHkbNKxTEJH/bosThWwAg5P2NXpnvmmxDV7BjZfQzC4aSMDGrwOADytsu/TOR/jjamDbRb9SeICVzDPujxS1JiwhB9ANJZo+3S3gQIbpS2S0VgZv4pycCKbbmy9/Qs7q/Q4o7Rhmqi4xEbjQQo9tpCXLTnrpkwonUvc3RHgqIihlC3xkimc+Fza6Ah5NA0ETGGB/2ezEx3kXGqAnjKPez20ORd8AD3imhkCCrwD4iwGLB+TkPIoBGURKd6uIJV1kUFEOLk3bw7jp2DGjNhnDADJm59MekwrDiKr5BUWLZqEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199018)(6636002)(186003)(6486002)(83380400001)(478600001)(6666004)(54906003)(316002)(8676002)(6512007)(6506007)(1076003)(66476007)(66946007)(26005)(4326008)(41300700001)(66556008)(8936002)(6862004)(5660300002)(38100700002)(2906002)(82960400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIMJ06hy1Wz+NT8jO/+XM6FtNqwL+YeYmcq+Yf8BQL9QtADbQheeAxsjOfOi?=
 =?us-ascii?Q?7gOPRf2qaN3VJoc7yvGvK2ICAhTTfGo9CP+fbofAaZqy8wuy1nyVKgoK1b//?=
 =?us-ascii?Q?OYS1Lolzwa76QJDJ1Y9lcpva28rN3H8qjrp3ClIAxqKKkbxSKOy4gzlw+fJR?=
 =?us-ascii?Q?I+RpB32WfPzygSJNlzwAv0V5NYvheBgN7wmrVLR2aqWjlnvnCHsFAPVgiaT6?=
 =?us-ascii?Q?A08ZoMfzdEhExSwyaeGz8gEqBvK3B6LgIQrbIIJSdooxtJUHF0o9Po4ce0B6?=
 =?us-ascii?Q?uMubsUVZXku+DUZ28WzdIYfT3wbc9De0ga/iOEP9yNZhiAGFeHtq8mWFXSUP?=
 =?us-ascii?Q?xeNA2D6kTOQcf1cCbG7iDhDDG6wyd5L9bwS+mND6q+H6+P1XnIUQ74cI4kHs?=
 =?us-ascii?Q?Y+Zsy4IDChGPSxuckGa1SIP8pEViALl3VEHmtNm8jj50csHbbX0YIt/ZfPrQ?=
 =?us-ascii?Q?jZ4vOa54heGHcEYSSAcbnqj6Icr8qQnTPtE8Vk1i3UeDlkSpzDsO8kMlTQh1?=
 =?us-ascii?Q?WzRTB2R2whJKyNnffMQzx4ZYAwDoJ5bl+5ny6ynnynnq2MzRasCpf5efsCSD?=
 =?us-ascii?Q?KjJyf2huNSuHHr+DChcxOrlLpKNOhIAptMGy3tS3LCLIqYr2BBIkOZBMZE/H?=
 =?us-ascii?Q?QqDty1J8+XaYDUoTBAQTHuBr4gnjH8Kwg8FH7J4g8GtD+C4OtZ2zPYZHde7u?=
 =?us-ascii?Q?ivHHhLt+gIIDF4olbMpl0AYNlOF005rQ+YhiTILKjYIp/998OXUNcsWQYloc?=
 =?us-ascii?Q?iAnU+ZrLNFjMx8Oh4x79Wn8BqKNdX8PnMkCVN9Zb977Zgbi+ALkI3L0r200N?=
 =?us-ascii?Q?d4gWB8X+FvYQICpWUFofywVzejLEo5RYYEdBVlxOrltUHVX5t79WrQ5IdHHt?=
 =?us-ascii?Q?2JHESt3fZEptai2AUFIDu+Y2cDEOnOR02gXLBIB7DLi3c+OrlE7ocLAJ1eu9?=
 =?us-ascii?Q?9K5wHwLlI7F57BNj/ceIVZhH3YFri5X+zPfiDoUNdiME00OLt/UO+OTUsXdC?=
 =?us-ascii?Q?gwd/wVlVrAetlNu135g/7oq4FQbmFP+S8dARv9rZuia0p+PKDM/zz4nniVS/?=
 =?us-ascii?Q?+XaETMCci8/a46IgSzn0EVhYfK72E3vSkk9RI89ApJphwrzV55geTeCycjuk?=
 =?us-ascii?Q?fCUDWY//C/73YulWsqFjh7ervKjrvgwGr5BvjOPeDmhL9Z6y9M2oWzVu7Ymk?=
 =?us-ascii?Q?07Na26EtpZSeaMl7B27rKAWqzhDOO684/Y0Qpny9g4eD6mzCHvaMLp5Zh0aw?=
 =?us-ascii?Q?OHzuZdQv6S6mu86cRFWnlQT8J7tUN7OJmDSUe9is/X97kF3JVyK8iw9AVSgJ?=
 =?us-ascii?Q?w7ET8HkbWAsf7sKxP55r+uQcNwdeWMtbwQpVIEiRLZZ6qUpZY/9TwzAh6211?=
 =?us-ascii?Q?tZkOqUkP1UyXY0M3kpc3l85/p4QDXRhnBfFwFQ8e0Y8dnBWA5PBddEAQbF0T?=
 =?us-ascii?Q?i1tQRdc76+vV8PZBr7+aWIsYNwSTPL9BJSeJOqwdEOeRFk6PAhs1MX9UQ/1U?=
 =?us-ascii?Q?UzNsW+MUvGAlt0zem3+tpx3LFbgmMN+3czhQJdwAkzRoFgyH0Vl/Pq2kSTF6?=
 =?us-ascii?Q?19KEqkFAY4EIsq8AcD7r8CIdUFL45/FG6p/tB+m7JzGI3+P8fhU/4Qf0eaHS?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f7499f-a705-4c46-2e40-08db27060e6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:38:37.0046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNwndNV5ltq3f5qWx1LNBFhBh/2X4MoB+ei/hbfh6kyMCQ3gueQZqrSaQGorEI4L+uZqUkfjXGK0gj8wKRrDv5vWqSS89ZzNiTOdVbmRWSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Chris
 Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 08:43:46PM -0700, Yang, Fei wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> On MTL, objects allocated through i915_gem_object_create_internal() are
> >> mapped as uncached in GPU by default because HAS_LLC is false. However
> >> in the live_hwsp_read selftest these watcher objects are mapped as WB
> >> on CPU side. The conseqence is that the updates done by the GPU are not
> >> immediately visible to CPU, thus the selftest is randomly failing due to
> >> the stale data in CPU cache. Solution can be either setting WC for CPU +
> >> UC for GPU, or WB for CPU + 1-way coherent WB for GPU.
> >> To keep the consistency, let's simply inherit the same cache settings
> >> from the timeline, which is WB for CPU + 1-way coherent WB for GPU,
> >> because this test is supposed to emulate the behavior of the timeline
> >> anyway.
> >>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >
> > It looks like there might be an indentation mistake on the second line
> > of the i915_gem_object_pin_map_unlocked() call, but we can fix that up
> > while applying; no need to re-send.
> >
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Thanks for reviewing.
> 
> > Is there an FDO issue # for the random failures thar were being seen?
> > If so, we should add a Closes: or References: tag here.
> 
> I'm not aware of a FDO filed for this failure. That might be because the
> issue is reproduced on MTL which might not be widely available to the
> community yet.

Yeah, I was thinking CI would have filed some, but I just remembered we
don't have public CI setup yet for MTL, so no automated bugs are coming
in yet.

Applied to drm-intel-gt-next.  Thanks for the patch.


Matt

> 
> > Matt
> >> ---
> >>  drivers/gpu/drm/i915/gt/selftest_timeline.c | 14 +++++++++++---
> >>  1 file changed, 11 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> >> index 522d0190509c..631aaed9bc3d 100644
> >> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
> >> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> >> @@ -825,7 +825,8 @@ static bool cmp_gte(u32 a, u32 b)
> >>        return a >= b;
> >>  }
> >>
> >> -static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
> >> +static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
> >> +                      struct intel_timeline *tl)
> >>  {
> >>        struct drm_i915_gem_object *obj;
> >>        struct i915_vma *vma;
> >> @@ -834,7 +835,10 @@ static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
> >>        if (IS_ERR(obj))
> >>                return PTR_ERR(obj);
> >>
> >> -     w->map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> >> +     /* keep the same cache settings as timeline */
> >> +     i915_gem_object_set_cache_coherency(obj, tl->hwsp_ggtt->obj->cache_level);
> >> +     w->map = i915_gem_object_pin_map_unlocked(obj,
> >> +                     page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
> >>        if (IS_ERR(w->map)) {
> >>                i915_gem_object_put(obj);
> >>                return PTR_ERR(w->map);
> >> @@ -1004,8 +1008,10 @@ static int live_hwsp_read(void *arg)
> >>        if (!tl->has_initial_breadcrumb)
> >>                goto out_free;
> >>
> >> +     selftest_tl_pin(tl);
> >> +
> >>        for (i = 0; i < ARRAY_SIZE(watcher); i++) {
> >> -             err = setup_watcher(&watcher[i], gt);
> >> +             err = setup_watcher(&watcher[i], gt, tl);
> >>                if (err)
> >>                        goto out;
> >>        }
> >> @@ -1160,6 +1166,8 @@ static int live_hwsp_read(void *arg)
> >>        for (i = 0; i < ARRAY_SIZE(watcher); i++)
> >>                cleanup_watcher(&watcher[i]);
> >>
> >> +     intel_timeline_unpin(tl);
> >> +
> >>        if (igt_flush_test(gt->i915))
> >>                err = -EIO;
> >>
> >> --
> >> 2.25.1

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
