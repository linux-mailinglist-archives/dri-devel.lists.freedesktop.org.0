Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DA4F7BA8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B0510E73A;
	Thu,  7 Apr 2022 09:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C95210E73A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:31:01 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dr20so9532530ejc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b3VpGUJf+CTx2/fndTRhuQmUKqyZM9vGfKCaSs487Gs=;
 b=B4PTkbn+xydV9LFHMGaq3gCiro1/UHgjLudhQmxEpg0LveHgcl3YhsoxbOxcWbNO7k
 ojqRvgGVF3gXECxt4f/lLuv5boUiZOHKVjflLYQCSXyQo4vLSFGMypNGrc0Ranbc3IEI
 7cXU17RUzb/ndTCSROojPybM0cBYw8YgGEM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b3VpGUJf+CTx2/fndTRhuQmUKqyZM9vGfKCaSs487Gs=;
 b=eJipbr26TJnIrlowjjBQK4DN01/wqsiULdPNzeTSpCZHuJXbIkJ7bmkbB6XGyobfEh
 Of8KWkQR+mYayrqdHsJxgf5og38iHchZ6rlLxeHbN84rLiQch/c6Lq95T1o1It+9x3PB
 ErqSUfB83mD+a2gdUR+jegDGmFqZe7B71C/l22v731YyxaVtJJmgt9Gb4i7+DHUBu+0t
 T2KxPhHgmjMiibK3+PLcPxOAxQTve1GauP+iQ2GY0WOn+5sZutLDU6p6MN9u+O7H2o6j
 0kur3E6I1TLJOevxNcNo6d42Z3vMV1gxKGxxGw5aKcxOZawNUX10dcm9wMJ1ycOWBomj
 u+UA==
X-Gm-Message-State: AOAM531oURiWu9+5jPnzzGObsxHxdmLyRKYSgJDVF7B/P7FMSX/nNeuZ
 0eZyIweVikP1sBV/XNQmTFerrQ==
X-Google-Smtp-Source: ABdhPJwrIHmEVAbVffY/C4/loTK5aiYcszmtOJOEfdwOIl8RO+2UVjH2SF306iiOtRRVGFjVht70Zg==
X-Received: by 2002:a17:906:c091:b0:6db:62b6:f4cc with SMTP id
 f17-20020a170906c09100b006db62b6f4ccmr12456829ejz.607.1649323858688; 
 Thu, 07 Apr 2022 02:30:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056402231100b0041d0718a3e3sm580150eda.23.2022.04.07.02.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:30:58 -0700 (PDT)
Date: Thu, 7 Apr 2022 11:30:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <Yk6vUJYcSP3AnUX4@phenom.ffwll.local>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <d5657091-0b57-9492-1e81-df34053306f5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5657091-0b57-9492-1e81-df34053306f5@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 09:49:49AM +0200, Thomas Zimmermann wrote:
> Hi Daniel
> 
> Am 31.03.22 um 17:20 schrieb Daniel Vetter:
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
> 
> A while ago, I received a patch for a bug in ast. Cursor movement interfered
> with modesetting. [1] I didn't really knew what to make of it. Could this be
> related to the problem you're describing here?

Maybe.

> I guess the correct fix would be to implement async operations for cursor
> planes? ast doesn't do this yet.

Yeah the async ops are the new attempt (since a few years) to make this
work and suck less.
-Daniel

> 
> Best regards
> Thomas
> 
> [1] https://lore.kernel.org/dri-devel/20210917072226.17357-1-kuohsiang_chou@aspeedtech.com/
> 
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
> >      drm/amd/display: Add fast path for cursor plane updates
> > 
> > we don't have any driver anymore where we have userspace expecting
> > solid legacy cursor support _and_ they are using the atomic helpers in
> > their fully glory. So we can retire this.
> > 
> > v3: Paper over msm and i915 regression. The complete_all is the only
> > thing missing afaict.
> > 
> > v4: Fixup i915 fixup ...
> > 
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > Cc: mikita.lipski@amd.com
> > Cc: Michel Dänzer <michel@daenzer.net>
> > Cc: harry.wentland@amd.com
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> >   drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> >   3 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 9603193d2fa1..a2899af82b4a 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
> >   	int i, ret;
> >   	unsigned int crtc_mask = 0;
> > -	 /*
> > -	  * Legacy cursor ioctls are completely unsynced, and userspace
> > -	  * relies on that (by doing tons of cursor updates).
> > -	  */
> > -	if (old_state->legacy_cursor_update)
> > -		return;
> > -
> >   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> >   		if (!new_crtc_state->active)
> >   			continue;
> > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
> >   			continue;
> >   		}
> > -		/* Legacy cursor updates are fully unsynced. */
> > -		if (state->legacy_cursor_update) {
> > -			complete_all(&commit->flip_done);
> > -			continue;
> > -		}
> > -
> >   		if (!new_crtc_state->event) {
> >   			commit->event = kzalloc(sizeof(*commit->event),
> >   						GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index d2abe0e430bf..6ca5a6e7703b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct drm_device *dev,
> >   		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
> >   		return ret;
> >   	}
> > +
> > +	/*
> > +	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
> > +	 * everything.
> > +	 */
> > +	if (state->base.legacy_cursor_update) {
> > +		struct intel_crtc_state *new_crtc_state;
> > +		struct intel_crtc *crtc;
> > +		int i;
> > +
> > +		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
> > +			complete_all(&new_crtc_state->uapi.commit->flip_done);
> > +	}
> > +
> >   	intel_shared_dpll_swap_state(state);
> >   	intel_atomic_track_fbs(state);
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index 1686fbb611fd..b3cfabebe5d6 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >   		/* async updates are limited to single-crtc updates: */
> >   		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
> > +		complete_all(&async_crtc->state->commit->flip_done);
> > +
> >   		/*
> >   		 * Start timer if we don't already have an update pending
> >   		 * on this crtc:
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
