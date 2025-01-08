Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FAA063E4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2185710EC48;
	Wed,  8 Jan 2025 18:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NnjkKOcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D50B10EC49
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:00:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso41525f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736359159; x=1736963959; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmdWrs2jHDEmmEMkasPJyPoJ7fSCFbpJIamlNm9Sk5M=;
 b=NnjkKOcm3vszhj1cXvCxYi5JD9/unGDUgcpsKQBVZ6ejtNNABlsLV37T3gk4I15i/f
 2oaaJSmCxzSVnqlqTUx5q/YcgVFth0I+6VMCuFQuDCjb5zBAQxUTIwEcuX4C1WuVDvRX
 NExLUSROnl+Jx+Nf2qtcUtKGWEb661qGKz/+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736359159; x=1736963959;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmdWrs2jHDEmmEMkasPJyPoJ7fSCFbpJIamlNm9Sk5M=;
 b=qw5X4RnaLPuyQvawSJKVLRe8vaJJ3NCw1cvh02cMwGiwxWn9ycoqn9xGRE8924kHjk
 qLPLfGO6hMB+oxQE/4LLfRoiPm8vpfZbDLX9MO4Sy0VdK8poF6qeiIIFERIaUng9GXbk
 2MBcVgqavxmBKxZHcQzEm91Z/xtbPClFN8nccgQFjSRPhJCvogv9iDDZkH3oJ9MT6Xxo
 ujTQuOSYRyxSrYM+2L+Zl7ZccH+0bpoRgGRYGrVLPR4INVq5G8ghZbU+WXdNpp6cPwFj
 gBm0RwdgX737yutgj06ESe0VZtQn20GrYZIYhBzrDlQ1tIkxQy5zC+VPW0h2awHA/hOf
 mjuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmWuG5fCVFDB5A39Py1Ur92Ci46UVue13ggEyUbUuJbplZydDug6RrlFXLbSDhAaQA42nWESgg7CA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvJJwRwaGy2rK1shbdC0sL83bhTvfJfcKDhaEwzA31ZBMJYTyq
 J3V6bkqKYgKmICr26Kvivcpb7glp9AwFP0q4sRNbt47d90sFR4vWmFoPa0s5tLBKidrce8zqlmo
 /
X-Gm-Gg: ASbGncs1M8fINrsnAnZMbNtkSBCAB0VkA7TGlwBjqNY4a6boFQePX7SI/cbOtt7ZD2j
 A5xJsk+HgPdxnA6WRq1eQBL+UZd6h363jNf/UaCqP3r7B6jHnnTythdNkg7llKEBF3hrpcNqvr+
 noNrnKSEvCiezaClmEdvvOGs2mM0gZ435v5bqas6jYs587EX5Eq60ApHpszOxPGVahmUVejy0u5
 Ke3J+/rBauhoJCM0CqKzZayLNBDX953QqVeQZvtPsn70mhF8b5Been5wRkIc3OjxnGh
X-Google-Smtp-Source: AGHT+IESGumvopPHwdo16lhCKZSlZSATyddXlTtzfFDd2Vbs39HCO1l7Kd+MplsNzinHv34TBxZd3w==
X-Received: by 2002:a05:6000:4b04:b0:386:4a24:1916 with SMTP id
 ffacd0b85a97d-38a87317c6dmr2835622f8f.55.1736358833954; 
 Wed, 08 Jan 2025 09:53:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84705esm53745644f8f.44.2025.01.08.09.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:53:53 -0800 (PST)
Date: Wed, 8 Jan 2025 18:53:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
Message-ID: <Z367rzpzt00F0sK9@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 22, 2024 at 07:00:42AM +0200, Dmitry Baryshkov wrote:
> Some drivers might fail to follow the restrictions documented for
> drm_atomic_helper_check_modesets(). In order to catch such an issues,
> add the drm_atomic_state->dirty_needs_modeset field and check it in
> drm_atomic_check_only(). Make sure that neither of atomic_check()
> callbacks can set that field without calling
> drm_atomic_helper_check_modesets() again.
> 
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot of creating this patch. But looking at it I'm not so sure I
actually had a good idea, since there's still lots of ways for drivers to
change drm_atomic_crtc_needs_modeset() that we miss. And trying to use an
inverted bitfield of all crtc that we've run through in check_modeset, and
then in atomic_check_only compare it against all crtc that need a modeset
also has corner cases it gets wrong I think, like just not using the
helpers in specific case, I think something like i915's fastset would trip
that.

Plus there's lots more corners that drivers have gotten creatively wrong,
so I feel like really clear docs is the best we can do.

So unless you think it was really useful to fix msm I feel like best to
skip this. Apologies for making you put work in here :-/
-Sima

> ---
>  drivers/gpu/drm/drm_atomic.c        |  3 ++
>  drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
>  include/drm/drm_atomic.h            | 10 +++++
>  3 files changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		}
>  	}
>  
> +	WARN_RATELIMIT(state->dirty_needs_modeset,
> +		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
> +
>  	if (!state->allow_modeset) {
>  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
>  
>  	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
>  		const struct drm_encoder_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  		struct drm_encoder *encoder;
>  		struct drm_bridge *bridge;
>  
> @@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
>  		encoder = new_conn_state->best_encoder;
>  		funcs = encoder->helper_private;
>  
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
>  		ret = drm_atomic_bridge_chain_check(bridge,
>  						    new_crtc_state,
> @@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
>  				return -EINVAL;
>  			}
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> @@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
>  	return 0;
>  }
>  
> +static int
> +connector_atomic_check(struct drm_atomic_state *state,
> +		       struct drm_connector *connector,
> +		       struct drm_connector_state *old_connector_state,
> +		       struct drm_connector_state *new_connector_state)
> +{
> +	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> +	struct drm_crtc_state *new_crtc_state;
> +	bool old_needs_modeset = false;
> +	int ret;
> +
> +	if (new_connector_state->crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
> +	if (new_crtc_state)
> +		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +	if (funcs->atomic_check)
> +		ret = funcs->atomic_check(connector, state);
> +	else
> +		ret = 0;
> +
> +	if (new_crtc_state) {
> +		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_atomic_helper_check_modeset - validate state object for modeset changes
>   * @dev: DRM device
> @@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  	int i, ret;
>  	unsigned int connectors_mask = 0, user_connectors_mask = 0;
>  
> +	state->dirty_needs_modeset = false;
> +
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
>  		user_connectors_mask |= BIT(i);
>  
> @@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		return ret;
>  
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> -
>  		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>  
>  		/*
> @@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				new_crtc_state->connectors_changed = true;
>  		}
>  
> -		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, state);
> +		ret = connector_atomic_check(state, connector,
> +					     old_connector_state, new_connector_state);
>  		if (ret) {
>  			drm_dbg_atomic(dev,
>  				       "[CONNECTOR:%d:%s] driver check failed\n",
> @@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  	 * has been called on them when a modeset is forced.
>  	 */
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> -
>  		if (connectors_mask & BIT(i))
>  			continue;
>  
> -		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, state);
> +		ret = connector_atomic_check(state, connector,
> +					     old_connector_state, new_connector_state);
>  		if (ret) {
>  			drm_dbg_atomic(dev,
>  				       "[CONNECTOR:%d:%s] driver check failed\n",
> @@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		const struct drm_plane_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  
>  		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
>  
> @@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  		if (!funcs || !funcs->atomic_check)
>  			continue;
>  
> +		if (new_plane_state->crtc)
> +			new_crtc_state = drm_atomic_get_new_crtc_state(state,
> +								       new_plane_state->crtc);
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		ret = funcs->atomic_check(plane, state);
>  		if (ret) {
>  			drm_dbg_atomic(plane->dev,
> @@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  				       plane->base.id, plane->name);
>  			return ret;
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  
>  		funcs = crtc->helper_private;
>  
>  		if (!funcs || !funcs->atomic_check)
>  			continue;
>  
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		ret = funcs->atomic_check(crtc, state);
>  		if (ret) {
>  			drm_dbg_atomic(crtc->dev,
> @@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  				       crtc->base.id, crtc->name);
>  			return ret;
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	return ret;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -408,6 +408,16 @@ struct drm_atomic_state {
>  	 */
>  	bool duplicated : 1;
>  
> +	/**
> +	 * @dirty_needs_modeset:
> +	 *
> +	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
> +	 * unexpected way. Usually this means that driver implements atomic
> +	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
> +	 * toggled by one of its atomic_check() callbacks.
> +	 */
> +	bool dirty_needs_modeset : 1;
> +
>  	/**
>  	 * @planes:
>  	 *
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
