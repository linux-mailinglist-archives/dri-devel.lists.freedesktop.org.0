Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010866ACDAD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 20:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07A310E0DF;
	Mon,  6 Mar 2023 19:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F8A10E0DF;
 Mon,  6 Mar 2023 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678130163; x=1709666163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M4ylfQaksHsCwAwzhDanUkeUOsYxBUF/KONUTOXkH6A=;
 b=VYPlHf25IkkSumt6XQyxtaNYoD7C3PxDfOA02fk0CSSSymy9GfPi1Dcm
 j3zT3/7KjBna60+SIAodB8MzzGw0Ga7NktWOf7KazerDiYmp43h1ocn+1
 Tasy+3aUrBw+iqOlGEltgtl0XFPDsmKRp/zDhFksbGuP4TxQG2E6ZFG5U
 aFKqZfUy4Syn1H6HU4s4yNGPtALYTir4g7TLyMscp3XJCPMFXJ0405lB+
 lJAM07qJBNt2AxCWXTlPW0zNgUEJGy+MM4C6pvaSlYt2P206WaqiX9PgH
 qvVoj54W/LM+Dka+2h8Vf6t3i0B3u88zEEz3annwtJSAPNsTyMuzwyQAh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337169401"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337169401"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740448765"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="740448765"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 11:15:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 11:15:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 11:15:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 11:15:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 11:15:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GExchNS/MUYRraxD496yS2k1wbgMvbw/ibidx2IfGYCRnqrP7cIcA2bLCwuc2T3kw3ch5GKlE5fn6Qda0g8Xp0LrCZyJrONN3gXLHLnzrm8h2D88gmAPkdb5vLamgMYqwFlbNEOYN0WxqSDZF9AsfAq4kiCh75NZS/tw7O7CHjAlxoX1UtDN79IJPAP0/mqFPB7zXbl7eo+n2XyETDB5KSwWLQ4g+cCfDLPeGcysxYepr3Lo/MaC7OMHhwvnHjQ5YdvqiCgqMTpfOJj3ixSkTRt6xehPZEh8v99KqgqWnTNbh8YQsR+TJji6WnI09ER7V5gtN46bAPNtoN0bEb/smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xorHjDDXq/Q3DtJ07pdv8rfjyblhmpxbguzCsbxJhL8=;
 b=aczTSuZVPz9FgqVdZV/yLFW4HAoyJ7KBHmQsklf87G9w5Ozv1u+HI8Gb7A4Jew9oKtWxn061621sm+PYNv5k92ZmNDEbc9l2vtjRLtoDa0aqg+r3lsAEa/9DcqHgN1dCMl0LLJ5JFg1EK3/dqxuIb3Bn0sowjoc2r5deK6Z1jqqWIODt284IPnaetDVjXF3pG2WrHYDL+InjMUp3Y1G2UxNO6s96tzJCuG7OrQOQSEKNiZeNj3GlAu6fLIeiXNyxW98WkUwwuGyR5hRu9MxGVnl9LgCclxSdER6cuwFgwJTGQJNuoKO73yJCdS++BzX8JlUsv+8DlJ1wLPollf6ZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:15:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:15:46 +0000
Date: Mon, 6 Mar 2023 14:15:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Do not use i915 frontbuffer
 tracking implementation
Message-ID: <ZAY73d5CjbYDZRrE@intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c3924b-2c7f-45b3-a3d4-08db1e773001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf5YxvqQVaRfy3vNkHVEgT3E5IghcCeto/8eQG59B6Tn52KxpBJrEe1eEhUmrnwhiuiWdiwMFqukilMNjuBB7BPO9s+EMbFUfUWM0iTThO0xDq3dO0pXVAQFuM49Xgntqu62UErq5tGUvnfSJCq0IwqVorZC4CvwRy5TseijBQumypEPdYvAPCfU5WzC+LOsm6RnNOmMGFApvQ1g7DYqRkbBkAG+UIzIvqUkgG37ay44hNF1bq4wKWZBFq4vma0HN1rbZDWe5ow2lILJGxyVq+KWJYIq1s7NtV6dds97X3XUihRfhp16vWgUEtkM10GSDuOK84eJCL/xk/qp68UBbbEkQCngW6gA/Kyu8RooG/JZseGgKyx6bMo4XSAld+nVjfpMFhJX5UTeaMS6vVOo4MOpA9ydMg0gUh6I7lTe4Sl4XlJqjs8ra1fmGetmnfnCdHv+i9k0ARN5RAxwhYccueW7LxfzeOzNcNCbGRx0jUjVJAYEKFluQtIDA6l51FoIRW6bh2IU/sGkztoSCe08vzaBETcS9VFp7ltLyeOoJeqHkq++wccNgwiDWx4z4/fbtAvGpQg3tJvKOjdUyA5kt4PfXpTekAu7j5xqr4CfB1ZZhh5D9AQ+Z0nGb2L75zSuh7VH08IydZXxZ2H9e8X1dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(316002)(54906003)(6636002)(478600001)(37006003)(83380400001)(30864003)(44832011)(6862004)(5660300002)(8936002)(38100700002)(36756003)(82960400001)(2906002)(4326008)(66556008)(8676002)(66476007)(66946007)(6666004)(6486002)(6512007)(6506007)(186003)(26005)(2616005)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsMYow6nV875VfW5knsQACpH7OBTR+tLA6q6ck1gcep++ZJE1tG6jTkJxf1T?=
 =?us-ascii?Q?hAB3vZ7SRQXDanBUI7nIlI70JwLZDljhw9vAs07s0KIPMaYUGlK2JCJu/ctw?=
 =?us-ascii?Q?5zjyZxt66ObB12Sv6tjveOnlfFUHJUAPkg8PrjTWghxOXJXzzfwJhnrxe5Mj?=
 =?us-ascii?Q?p0XuR1GC7nZ24AbCyukqlHPClc009hcwrlmk3A0yzCoGqhV5O3ALkKZz38SG?=
 =?us-ascii?Q?KLT5PVvqZatDl/nCuURt5pDk+ROJfGTrnpDoOabMFBATZzh7vADYgSFBL2gL?=
 =?us-ascii?Q?qcdfLHkoeQkdeacR27n1DybHBer1r9rntqE5H+e72EAPFGcta53C0K6BDyxo?=
 =?us-ascii?Q?NCineeG26uJ6JPYnucgpm2aymplA/dbcpZt6617+0G8UzZREfNTWr3BDMHyH?=
 =?us-ascii?Q?fO/ICAllyI/2qe1arIsQxAaTbw35qlCrPyBqKb73JDdBpWMRN8jKOVksQ7D0?=
 =?us-ascii?Q?LUMrUxz+B68AtiOshrC+WKvu7vMiN+lz1E+1ZKupd+/p4HLiIunYf8S09KIB?=
 =?us-ascii?Q?SbjwgygdmEKUaRbCFVAJBtBK8wqJh5VVvEFI0HgQ3Fn/nRZeJUAAfJA3drHg?=
 =?us-ascii?Q?07VzFBcWAlc3BCIjD5BBecQVOAGjk/1vtKcsHL/lMPXokWvZBF/1WJRIei/M?=
 =?us-ascii?Q?0bx93e8n6NLh46xiqF5xzY8oKi/eAgcPxcZqnPWElDCwl+vs/in0vQW9fUxT?=
 =?us-ascii?Q?ECXDAgnRWCsqUA7SGAH80O5LuCsJo9WSvzlOIRnxO4SEwmHPPoryUTbjwSyM?=
 =?us-ascii?Q?l0bTtNMoqwg71koh8sG0oYqrIIwqj4y5Vs4Xf8vEc8UqS6ziUV75KyDPJp9B?=
 =?us-ascii?Q?5kI7FTSGeDU9ws+OVxfhhiD3FgS8jhXC3cJXCRhMiDKqwGFSSWBP9AXU/LIC?=
 =?us-ascii?Q?5krK98uZXY1alixxhmCnCNsu5XIn0VoBnKNPJvKZy1XRi0rf0EKqooOJlUw/?=
 =?us-ascii?Q?fzhdCQen8Nv2/dlVrqj2gV26rP28HYd53XYXnmp/xjN1MPU40uK5bu4thcwL?=
 =?us-ascii?Q?nE1yxehnq6H9qJcuZggJ/XJokhNqF6HIsEBKglFpnztASaJc47g04k22uaTG?=
 =?us-ascii?Q?8PSlm5IULYIDBdT5jdq1N4gihI1uhgxQFq4OasOddnMjIVdszLkTNZg7Gu1k?=
 =?us-ascii?Q?5UsCXI96MlwRIH3COCZgnTpEk6CdZ87tGLRIKKce+yjqc2Q0tgkmom1iAJnm?=
 =?us-ascii?Q?qsnTrgntJ5ZN7GH7hZgD6ngA3TwTRSblyFMhP+kSXcFMlGEsWlEc+0k2brl6?=
 =?us-ascii?Q?bEs8y0aIa1EqV4TdNabIgQmIIcwk+WBKustmCVn9hxjk0ULef9nKj3GAPRUw?=
 =?us-ascii?Q?z/g9Asish0uOTIDVQnVnKFTnFlMaLenJ+qAmmrBRr55/k9Oz2JyiDV3Y20gY?=
 =?us-ascii?Q?tm/JmAfx6ypGiFmy5QjP93CQ+GxpYYTGo0zpZXeVie5fwKOYhokOqSLZKjCM?=
 =?us-ascii?Q?X3qPj5snL/Pd4kbrAZvFfiKe97C9J919HLHeNHoOppEgUIT/mCFrmdxr2Lys?=
 =?us-ascii?Q?+mCeoO3jWMMPYF/eOaRrJbYCmfquOByjA3yq/AKMrRapPvB1jYdvqqOSSYdr?=
 =?us-ascii?Q?yCMUnw75A2qeOcsY0Smw59hHVCtXBFiJIq5Ep11OydmBZ9KAo3yIOFOs5Lbz?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c3924b-2c7f-45b3-a3d4-08db1e773001
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:15:46.4505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5K7tAijbZ9issGbbW098st8UA6E0Z75+5yJXnoJTCxtcGQoTSIdd0on8zIyWN93+cTVIN1FeM8wk1yOAAorug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 03:23:08PM +0000, Souza, Jose wrote:
> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
> > As a fallback if we decide not to merge the frontbuffer tracking, allow
> > i915 to keep its own implementation, and do the right thing in Xe.
> > 
> > The frontbuffer tracking for Xe is still done per-fb, while i915 can
> > keep doing the weird intel_frontbuffer + i915_active thing without
> > blocking Xe.
> 
> Please also disable PSR and FBC with this or at least add a way for users to disable those features.
> Without frontbuffer tracker those two features will break in some cases.

I'm afraid we cannot have this solution then. We will need FBC and PSR.
Should we then add a new IOCTL where userspace can request the PSR/FBC,
and then commit to always use the drity_fb calls on any frontbuffer update?

> 
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_display_types.h  | 12 ++++++++++++
> >  drivers/gpu/drm/i915/display/intel_drrs.c       |  1 +
> >  drivers/gpu/drm/i915/display/intel_fb.c         |  8 +++++---
> >  drivers/gpu/drm/i915/display/intel_fbdev.c      |  2 +-
> >  .../gpu/drm/i915/display/intel_frontbuffer.c    | 17 +++++++++++++----
> >  .../gpu/drm/i915/display/intel_frontbuffer.h    | 12 ++++++++++--
> >  drivers/gpu/drm/i915/display/intel_psr.c        |  1 +
> >  .../gpu/drm/i915/display/skl_universal_plane.c  |  2 ++
> >  8 files changed, 45 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index f2918bb07107..a4a57aa24422 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -133,7 +133,11 @@ struct intel_fb_view {
> >  
> >  struct intel_framebuffer {
> >  	struct drm_framebuffer base;
> > +#ifdef I915
> >  	struct intel_frontbuffer *frontbuffer;
> > +#else
> > +	atomic_t bits;
> > +#endif
> >  
> >  	/* Params to remap the FB pages and program the plane registers in each view. */
> >  	struct intel_fb_view normal_view;
> > @@ -2074,10 +2078,18 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_
> >  #endif
> >  }
> >  
> > +#ifdef I915
> >  static inline struct intel_frontbuffer *
> >  to_intel_frontbuffer(struct drm_framebuffer *fb)
> >  {
> >  	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
> >  }
> > +#else
> > +static inline struct intel_framebuffer *
> > +to_intel_frontbuffer(struct drm_framebuffer *fb)
> > +{
> > +	return fb ? to_intel_framebuffer(fb) : NULL;
> > +}
> > +#endif
> >  
> >  #endif /*  __INTEL_DISPLAY_TYPES_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
> > index 5b9e44443814..3503d112387d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> > @@ -9,6 +9,7 @@
> >  #include "intel_de.h"
> >  #include "intel_display_types.h"
> >  #include "intel_drrs.h"
> > +#include "intel_frontbuffer.h"
> >  #include "intel_panel.h"
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > index 8c357a4098f6..e67c71f9b29d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > @@ -1846,6 +1846,8 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
> >  #ifdef I915
> >  	if (intel_fb_uses_dpt(fb))
> >  		intel_dpt_destroy(intel_fb->dpt_vm);
> > +
> > +	intel_frontbuffer_put(intel_fb->frontbuffer);
> >  #else
> >  	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
> >  		struct xe_bo *bo = intel_fb_obj(fb);
> > @@ -1857,8 +1859,6 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
> >  	}
> >  #endif
> >  
> > -	intel_frontbuffer_put(intel_fb->frontbuffer);
> > -
> >  	kfree(intel_fb);
> >  }
> >  
> > @@ -1966,9 +1966,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
> >  		obj->flags |= XE_BO_SCANOUT_BIT;
> >  	}
> >  	ttm_bo_unreserve(&obj->ttm);
> > -#endif
> >  
> >  	atomic_set(&intel_fb->bits, 0);
> > +#endif
> >  
> >  	if (!drm_any_plane_has_format(&dev_priv->drm,
> >  				      mode_cmd->pixel_format,
> > @@ -2085,7 +2085,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
> >  	return 0;
> >  
> >  err:
> > +#ifdef I915
> >  	intel_frontbuffer_put(intel_fb->frontbuffer);
> > +#endif
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > index 75d8029185f0..2682b26b511f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > @@ -82,7 +82,7 @@ struct intel_fbdev {
> >  
> >  static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
> >  {
> > -	return ifbdev->fb->frontbuffer;
> > +	return to_intel_frontbuffer(&ifbdev->fb->base);
> >  }
> >  
> >  static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
> > diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> > index 17a7aa8b28c2..64fe73d2ac4d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> > +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> > @@ -163,11 +163,17 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
> >  	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
> >  }
> >  
> > +#ifdef I915
> > +#define intel_front_obj(front) ((front)->obj)
> > +#else
> > +#define intel_front_obj(front) (front)
> > +#endif
> > +
> >  void __intel_fb_invalidate(struct intel_frontbuffer *front,
> >  			   enum fb_op_origin origin,
> >  			   unsigned int frontbuffer_bits)
> >  {
> > -	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
> > +	struct drm_i915_private *i915 = to_i915(intel_front_obj(front)->base.dev);
> >  
> >  	if (origin == ORIGIN_CS) {
> >  		spin_lock(&i915->display.fb_tracking.lock);
> > @@ -188,7 +194,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
> >  		      enum fb_op_origin origin,
> >  		      unsigned int frontbuffer_bits)
> >  {
> > -	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
> > +	struct drm_i915_private *i915 = to_i915(intel_front_obj(front)->base.dev);
> >  
> >  	if (origin == ORIGIN_CS) {
> >  		spin_lock(&i915->display.fb_tracking.lock);
> > @@ -202,6 +208,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
> >  		frontbuffer_flush(i915, frontbuffer_bits, origin);
> >  }
> >  
> > +#ifdef I915
> >  static int frontbuffer_active(struct i915_active *ref)
> >  {
> >  	struct intel_frontbuffer *front =
> > @@ -289,6 +296,8 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
> >  		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
> >  }
> >  
> > +#endif
> > +
> >  /**
> >   * intel_frontbuffer_track - update frontbuffer tracking
> >   * @old: current buffer for the frontbuffer slots
> > @@ -315,13 +324,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
> >  	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
> >  
> >  	if (old) {
> > -		drm_WARN_ON(old->obj->base.dev,
> > +		drm_WARN_ON(intel_front_obj(old)->base.dev,
> >  			    !(atomic_read(&old->bits) & frontbuffer_bits));
> >  		atomic_andnot(frontbuffer_bits, &old->bits);
> >  	}
> >  
> >  	if (new) {
> > -		drm_WARN_ON(new->obj->base.dev,
> > +		drm_WARN_ON(intel_front_obj(new)->base.dev,
> >  			    atomic_read(&new->bits) & frontbuffer_bits);
> >  		atomic_or(frontbuffer_bits, &new->bits);
> >  	}
> > diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
> > index 3c474ed937fb..a79e5ca419ec 100644
> > --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
> > +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
> > @@ -28,8 +28,6 @@
> >  #include <linux/bits.h>
> >  #include <linux/kref.h>
> >  
> > -#include "gem/i915_gem_object_types.h"
> > -#include "i915_active_types.h"
> >  
> >  struct drm_i915_private;
> >  
> > @@ -41,6 +39,10 @@ enum fb_op_origin {
> >  	ORIGIN_CURSOR_UPDATE,
> >  };
> >  
> > +#ifdef I915
> > +#include "gem/i915_gem_object_types.h"
> > +#include "i915_active_types.h"
> > +
> >  struct intel_frontbuffer {
> >  	struct kref ref;
> >  	atomic_t bits;
> > @@ -48,6 +50,9 @@ struct intel_frontbuffer {
> >  	struct drm_i915_gem_object *obj;
> >  	struct rcu_head rcu;
> >  };
> > +#else
> > +#define intel_frontbuffer intel_framebuffer
> > +#endif
> >  
> >  /*
> >   * Frontbuffer tracking bits. Set in obj->frontbuffer_bits while a gem bo is
> > @@ -73,6 +78,7 @@ void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
> >  void intel_frontbuffer_flip(struct drm_i915_private *i915,
> >  			    unsigned frontbuffer_bits);
> >  
> > +#ifdef I915
> >  void intel_frontbuffer_put(struct intel_frontbuffer *front);
> >  
> >  static inline struct intel_frontbuffer *
> > @@ -105,6 +111,8 @@ __intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
> >  struct intel_frontbuffer *
> >  intel_frontbuffer_get(struct drm_i915_gem_object *obj);
> >  
> > +#endif
> > +
> >  void __intel_fb_invalidate(struct intel_frontbuffer *front,
> >  			   enum fb_op_origin origin,
> >  			   unsigned int frontbuffer_bits);
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> > index 9820e5fdd087..bc998b526d88 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -33,6 +33,7 @@
> >  #include "intel_de.h"
> >  #include "intel_display_types.h"
> >  #include "intel_dp_aux.h"
> > +#include "intel_frontbuffer.h"
> >  #include "intel_hdmi.h"
> >  #include "intel_psr.h"
> >  #include "intel_snps_phy.h"
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 38f70f27ff1b..86d022e195c7 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -16,11 +16,13 @@
> >  #include "intel_display_types.h"
> >  #include "intel_fb.h"
> >  #include "intel_fbc.h"
> > +#include "intel_frontbuffer.h"
> >  #include "intel_psr.h"
> >  #include "intel_sprite.h"
> >  #include "skl_scaler.h"
> >  #include "skl_universal_plane.h"
> >  #include "skl_watermark.h"
> > +
> >  #ifdef I915
> >  #include "pxp/intel_pxp.h"
> >  #else
> 
