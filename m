Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A144EDC76
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01FA10F15C;
	Thu, 31 Mar 2022 15:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865310E2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:14:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u16so243067wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JgkV0BtWrNgLI27qMubUhmUe741SvzWdJDkxvEvbfnY=;
 b=EgHVYa58l3U8ys0Pp7A13btet27LjHqwjjG2M9/9coYXT0XXNnHTiKSQFm8l8VIFsD
 D7oHN9ZtyVi4umx+rL4C4dIDvOpwcYsThIcanT6lPCj+5C0DqdIGk1/sDIji9Rfh/ASx
 0WXvzlhQiB4XTBSfhaoRpNMnNdUsZ+q8AorRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JgkV0BtWrNgLI27qMubUhmUe741SvzWdJDkxvEvbfnY=;
 b=RNFz/OVXl1S6jCauVKYuftkQopHtBDLG3Z6khNyMWOB2xDmbx9gVhD/9FfN785CX0s
 rvaV3zgTxBVdKFeqk8enb0BgSDs0x1rX77UhP79jZqbeUjjaysrGEh9KrpV2YJ0v0boq
 mj6FVHkm6oqijDXxWhudrDaAxF6qTkCQ5lLryknXqsjUCzRCy7q0BZPRTgA34AMk4jy2
 00IpzGz6rpUuMpPaUp71aZlzDiNdJD/qX1OnqoCMniyVCgb7MvyRmh7Fll+J/ZTjzP5h
 TkT+5pTB9UbPxJ6/FhISZzMvV9atYY1M5rXLC/0NrLS8zYPrgS+dxYB0Iwg7HOPxjvY+
 hrGw==
X-Gm-Message-State: AOAM533dp7bgLuAUv4UeVXJaKYf3dZb45X9dYZrZmaAF1h6E64LH35Zo
 d9FwyeA7iSC/zUbmqU0mXyMLsQ==
X-Google-Smtp-Source: ABdhPJyjF3l4mEsTe627druUNoO9zzUbk9j+6OVZ/F+FKvQfTkj308xTHIaBWtf8uBjFom74cFY+iw==
X-Received: by 2002:a05:6000:1acb:b0:204:1ce4:7c2a with SMTP id
 i11-20020a0560001acb00b002041ce47c2amr4369608wry.234.1648739671412; 
 Thu, 31 Mar 2022 08:14:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm24559134wri.111.2022.03.31.08.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:14:30 -0700 (PDT)
Date: Thu, 31 Mar 2022 17:14:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <YkXFVdjlPQKZumLp@phenom.ffwll.local>
References: <20220331130545.625721-1-maxime@cerno.tech>
 <YkWruSRsrKv+cQIB@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkWruSRsrKv+cQIB@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 04:25:13PM +0300, Ville Syrjälä wrote:
> On Thu, Mar 31, 2022 at 03:05:45PM +0200, Maxime Ripard wrote:
> > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > The stuff never really worked, and leads to lots of fun because it
> > out-of-order frees atomic states. Which upsets KASAN, among other
> > things.
> > 
> > For async updates we now have a more solid solution with the
> > ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> > for msm and vc4 landed. nouveau and i915 have their own commit
> > routines, doing something similar.
> > 
> > For everyone else it's probably better to remove the use-after-free
> > bug, and encourage folks to use the async support instead. The
> > affected drivers which register a legacy cursor plane and don't either
> > use the new async stuff or their own commit routine are: amdgpu,
> > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> > 
> > Inspired by an amdgpu bug report.
> > 
> > v2: Drop RFC, I think with amdgpu converted over to use
> > atomic_async_check/commit done in
> > 
> > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Date:   Wed Dec 5 14:59:07 2018 -0500
> > 
> >     drm/amd/display: Add fast path for cursor plane updates
> > 
> > we don't have any driver anymore where we have userspace expecting
> > solid legacy cursor support _and_ they are using the atomic helpers in
> > their fully glory. So we can retire this.
> > 
> > v3: Paper over msm and i915 regression. The complete_all is the only
> > thing missing afaict.
> > 
> > v4: Rebased on recent kernel, added extra link for vc4 bug.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > Link: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> > Cc: mikita.lipski@amd.com
> > Cc: Michel Dänzer <michel@daenzer.net>
> > Cc: harry.wentland@amd.com
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> >  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
> >  drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> >  3 files changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 9603193d2fa1..a2899af82b4a 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
> >  	int i, ret;
> >  	unsigned int crtc_mask = 0;
> >  
> > -	 /*
> > -	  * Legacy cursor ioctls are completely unsynced, and userspace
> > -	  * relies on that (by doing tons of cursor updates).
> > -	  */
> > -	if (old_state->legacy_cursor_update)
> > -		return;
> > -
> >  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> >  		if (!new_crtc_state->active)
> >  			continue;
> > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
> >  			continue;
> >  		}
> >  
> > -		/* Legacy cursor updates are fully unsynced. */
> > -		if (state->legacy_cursor_update) {
> > -			complete_all(&commit->flip_done);
> > -			continue;
> > -		}
> > -
> >  		if (!new_crtc_state->event) {
> >  			commit->event = kzalloc(sizeof(*commit->event),
> >  						GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index bf7ce684dd8e..bde32f5a33cb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -8855,6 +8855,19 @@ static int intel_atomic_commit(struct drm_device *dev,
> >  				state->base.legacy_cursor_update = false;
> >  	}
> >  
> > +	/*
> > +	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
> > +	 * everything.
> > +	 */
> 
> Intel cursors can't even do async updates so this is rather
> nonsensical. What we need is some kind of reasonable mailbox
> support.

This is not the async plane update you're thinking of. i915 really should
switch over more to atomic helpers.

> > +	if (state->base.legacy_cursor_update) {
> > +		struct intel_crtc_state *new_crtc_state;
> > +		struct intel_crtc *crtc;
> > +		int i;
> > +
> > +		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
> > +			complete_all(&new_crtc_state->uapi.commit->flip_done);
> > +	}
> 
> You can complete what doesn't yet exist. Missing cc: intel-gfx for fireworks.

Yeah that's a rebase error, my patch has it at the right place further
down.
-Daniel

> 
> > +
> >  	ret = intel_atomic_prepare_commit(state);
> >  	if (ret) {
> >  		drm_dbg_atomic(&dev_priv->drm,
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index 27c9ae563f2f..6ed14fafa40c 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -237,6 +237,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >  		/* async updates are limited to single-crtc updates: */
> >  		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
> >  
> > +		complete_all(&async_crtc->state->commit->flip_done);
> > +
> >  		/*
> >  		 * Start timer if we don't already have an update pending
> >  		 * on this crtc:
> > -- 
> > 2.35.1
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
