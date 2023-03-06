Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206466ACA7D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 18:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6B10E2BC;
	Mon,  6 Mar 2023 17:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9E610E2BC;
 Mon,  6 Mar 2023 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678123856; x=1709659856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D8yFvUeWQrtQ+61c5bkrU/l4Uv9uLxQyBzSGLWyEYPY=;
 b=R1T+JsHOlrvo4UZV2wUXSESjs2AaKf3IKIunvLy9Db3yeQuum2pQ7zp2
 VCGkMcvU4arpd1lYAC87R/Gqq9Iq+L9y32PNZGR3zJfUjLaliApa4ysDz
 1H61Q3Jq9A97ABeWbs2nKy9bF+6UYitNHyocH2ttxN8oD0giIwcr3+qlv
 UqMGu4ztXTv5b9mesb6Sh0Parvjb0hFd0+AoZnzLh0TNR91/+LcZB4qhV
 Jo/ACTzF5snbsz7eCaqvoUsr4L0RIkj4cj6LeF1gLk9GGFCQplUi9ssiG
 SFaQB/XvMsDTUzNLjhqbQv0vRBfP61QPXV9DbGJYqGDixpF5tTYXoGSzW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398202941"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398202941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819381270"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="819381270"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 06 Mar 2023 09:30:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 19:30:52 +0200
Date: Mon, 6 Mar 2023 19:30:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for
 framebuffer
Message-ID: <ZAYjTCgyYbBtbE+N@intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <ZAX20lg5ieMrQIr/@intel.com>
 <c7e9521a-cf7b-fd7d-630b-a6bac4784b2d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7e9521a-cf7b-fd7d-630b-a6bac4784b2d@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Mar 06, 2023 at 05:22:19PM +0100, Das, Nirmoy wrote:
> 
> On 3/6/2023 3:21 PM, Ville Syrjälä wrote:
> > On Mon, Mar 06, 2023 at 11:28:48AM +0100, Nirmoy Das wrote:
> >> Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
> >> flag for it. This also make sure that ttm allocates offset
> >> for lmem objects.
> > I have no idea what that means.
> 
> Sorry for poor explanation.
> 
> Without I915_BO_ALLOC_USER, ttm will assume the obj as kernel buffer and 
> will not allocate fake offset which I needed for fb_mmap callback to work.

So that's the fake vm_pgoff thing? Doesn't that exist just so
mmap() through /dev/dri* can be passed a "gem handle"? 
With fbdev mmap we already know which BO we want to map so
why would any of that stuff even be needed?

> 
> Regards,
> Nirmoy
> 
> >
> >> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
> >>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
> >>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
> >>   3 files changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> >> index ad1a37b515fb..2e6238881860 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> >> @@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
> >>   
> >>   	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
> >>   
> >> -	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
> >> +	dpt_obj = i915_gem_object_create_lmem(i915, size,
> >> +					      I915_BO_ALLOC_CONTIGUOUS |
> >> +					      I915_BO_ALLOC_USER);
> >>   	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
> >>   		dpt_obj = i915_gem_object_create_stolen(i915, size);
> >>   	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
> >> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> >> index 3659350061a7..98ae3a3a986a 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> >> @@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> >>   	obj = ERR_PTR(-ENODEV);
> >>   	if (HAS_LMEM(dev_priv)) {
> >>   		obj = i915_gem_object_create_lmem(dev_priv, size,
> >> -						  I915_BO_ALLOC_CONTIGUOUS);
> >> +						  I915_BO_ALLOC_CONTIGUOUS |
> >> +						  I915_BO_ALLOC_USER);
> >>   	} else {
> >>   		/*
> >>   		 * If the FB is too big, just don't use it since fbdev is not very
> >> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> index bb6ea7de5c61..4a3680f6a3f5 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> @@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
> >>   	    size * 2 > i915->dsm.usable_size)
> >>   		return NULL;
> >>   
> >> -	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
> >> +	obj = i915_gem_object_create_region_at(mem, phys_base, size,
> >> +					       I915_BO_ALLOC_USER);
> >>   	if (IS_ERR(obj))
> >>   		return NULL;
> >>   
> >> -- 
> >> 2.39.0

-- 
Ville Syrjälä
Intel
