Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0538245F100
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 16:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287D6F8F5;
	Fri, 26 Nov 2021 15:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F46F8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 15:45:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so11055339wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qlBUqx1D/VMjihD/rUzjvBd9+vK8nAmwirqOtHLKhoc=;
 b=DlouZFaO3vsNZ11aLQ0EZ/q+IattsBiXyGMN/IotHpeaC4SHmtOfI8f095ahyWyuHn
 qs8ABOHIcGoSUJmMudEie+et+BuM0n69UEFyk7dI1N+JThvijnsiNZB2UMpZTBR16dqo
 Ukq5zXZuGosQMHH72w4CQAN7J0h54QogzpU9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qlBUqx1D/VMjihD/rUzjvBd9+vK8nAmwirqOtHLKhoc=;
 b=H981Rz7P1aVHOobSgeP2DJ2c28yXujbhAUrJObvz+hXjb4q08MIBPhs24QugDdBVk8
 VlUrimIc/67OiKNZVJEA65vVV7HfU1tyFU4Q8kfpx22x/4eyhjXEnBA9T8K6jNZ5rJ0Y
 bDfWC56QC7QNO4wFO8z6u/DYkmpSJMYl/45PTEEhHuOSk6wE6sHtAOOv/sOYCm5jqRsh
 He4keP1Mo7JGTarbq/S9QKXIrk/QqEKO1Hk+u+7IsnOKOBIkWZxO/pWBaRg25ge+DwkR
 U3mxnrOGAvFOptEWdYplH1RvWKoVrYehyjCS3FmPyAuMhHIKpRF4zTHrQHCY85Y+zAGS
 K1bg==
X-Gm-Message-State: AOAM5312YoW6lLfLe1XMnQc3ibIWHXSMEQvS2CCrF8WbSni8KLTFZtxO
 lhHJ6EqcpHBrKn/s3+0jAm7wvQ==
X-Google-Smtp-Source: ABdhPJywopjotc8O5Xm/LqjkgqAUrVV+P3fJpPh7ru9Vdtnv5ttTVQ4JwYOx15OYVJeGC7YkPkuabw==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr8230260wmk.66.1637941549064; 
 Fri, 26 Nov 2021 07:45:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e8sm5811653wrr.26.2021.11.26.07.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 07:45:48 -0800 (PST)
Date: Fri, 26 Nov 2021 16:45:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Claudio Suarez <cssk@net-c.es>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core, files
 drm_a*.c
Message-ID: <YaEBKuGKI1Zcd1Pr@phenom.ffwll.local>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaC7zXW119tlzfVh@gineta.localdomain>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 11:49:49AM +0100, Claudio Suarez wrote:
> DRM_DEBUG_* and DRM_* log calls are deprecated.
> Change them to drm_dbg_* / drm_{err,info,...} calls in drm core
> files.
> 
> To avoid making a very big patch, this change is split in
> smaller patches. This one includes drm_a*.c
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>

lgtm, merged into drm-misc-next, thanks for the patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c        | 180 +++++++++++----------
>  drivers/gpu/drm/drm_atomic_helper.c | 243 +++++++++++++++-------------
>  drivers/gpu/drm/drm_atomic_uapi.c   |   2 +-
>  drivers/gpu/drm/drm_auth.c          |  12 +-
>  4 files changed, 242 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ff1416cd609a..21174efd91be 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -74,7 +74,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
>  
>  	ret = wait_for_completion_timeout(&commit->hw_done, timeout);
>  	if (!ret) {
> -		DRM_ERROR("hw_done timed out\n");
> +		drm_err(commit->crtc->dev, "hw_done timed out\n");
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -84,7 +84,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
>  	 */
>  	ret = wait_for_completion_timeout(&commit->flip_done, timeout);
>  	if (!ret) {
> -		DRM_ERROR("flip_done timed out\n");
> +		drm_err(commit->crtc->dev, "flip_done timed out\n");
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -140,7 +140,7 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
>  
>  	state->dev = dev;
>  
> -	DRM_DEBUG_ATOMIC("Allocated atomic state %p\n", state);
> +	drm_dbg_atomic(dev, "Allocated atomic state %p\n", state);
>  
>  	return 0;
>  fail:
> @@ -191,7 +191,7 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int i;
>  
> -	DRM_DEBUG_ATOMIC("Clearing atomic state %p\n", state);
> +	drm_dbg_atomic(dev, "Clearing atomic state %p\n", state);
>  
>  	for (i = 0; i < state->num_connector; i++) {
>  		struct drm_connector *connector = state->connectors[i].ptr;
> @@ -301,7 +301,7 @@ void __drm_atomic_state_free(struct kref *ref)
>  
>  	drm_atomic_state_clear(state);
>  
> -	DRM_DEBUG_ATOMIC("Freeing atomic state %p\n", state);
> +	drm_dbg_atomic(state->dev, "Freeing atomic state %p\n", state);
>  
>  	if (config->funcs->atomic_state_free) {
>  		config->funcs->atomic_state_free(state);
> @@ -358,8 +358,8 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>  	state->crtcs[index].ptr = crtc;
>  	crtc_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [CRTC:%d:%s] %p state to %p\n",
> -			 crtc->base.id, crtc->name, crtc_state, state);
> +	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
> +		       crtc->base.id, crtc->name, crtc_state, state);
>  
>  	return crtc_state;
>  }
> @@ -379,8 +379,9 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  	 */
>  
>  	if (new_crtc_state->active && !new_crtc_state->enable) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] active without enabled\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] active without enabled\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> @@ -390,15 +391,17 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  	 */
>  	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
>  	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enabled without mode blob\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] enabled without mode blob\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
>  	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
>  	    WARN_ON(!new_crtc_state->enable && new_crtc_state->mode_blob)) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] disabled with mode blob\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] disabled with mode blob\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> @@ -414,8 +417,9 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  	 */
>  	if (new_crtc_state->event &&
>  	    !new_crtc_state->active && !old_crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requesting event but off\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] requesting event but off\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> @@ -460,8 +464,9 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>  		return 0;
>  
>  	if (writeback_job->fb && !state->crtc) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] framebuffer without CRTC\n",
> -				 connector->base.id, connector->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] framebuffer without CRTC\n",
> +			       connector->base.id, connector->name);
>  		return -EINVAL;
>  	}
>  
> @@ -470,16 +475,18 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>  								state->crtc);
>  
>  	if (writeback_job->fb && !crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
> -				 connector->base.id, connector->name,
> -				 state->crtc->base.id);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
> +			       connector->base.id, connector->name,
> +			       state->crtc->base.id);
>  		return -EINVAL;
>  	}
>  
>  	if (!writeback_job->fb) {
>  		if (writeback_job->out_fence) {
> -			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> -					 connector->base.id, connector->name);
> +			drm_dbg_atomic(connector->dev,
> +				       "[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> +				       connector->base.id, connector->name);
>  			return -EINVAL;
>  		}
>  
> @@ -537,8 +544,8 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  	state->planes[index].new_state = plane_state;
>  	plane_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [PLANE:%d:%s] %p state to %p\n",
> -			 plane->base.id, plane->name, plane_state, state);
> +	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",
> +		       plane->base.id, plane->name, plane_state, state);
>  
>  	if (plane_state->crtc) {
>  		struct drm_crtc_state *crtc_state;
> @@ -594,12 +601,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  
>  	/* either *both* CRTC and FB must be set, or neither */
>  	if (crtc && !fb) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] CRTC set but no FB\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	} else if (fb && !crtc) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] FB set but no CRTC\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -609,9 +616,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  
>  	/* Check whether this plane is usable on this CRTC */
>  	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
> -		DRM_DEBUG_ATOMIC("Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
> -				 crtc->base.id, crtc->name,
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
> +			       crtc->base.id, crtc->name,
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -619,9 +627,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	ret = drm_plane_check_pixel_format(plane, fb->format->format,
>  					   fb->modifier);
>  	if (ret) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> -				 plane->base.id, plane->name,
> -				 &fb->format->format, fb->modifier);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> +			       plane->base.id, plane->name,
> +			       &fb->format->format, fb->modifier);
>  		return ret;
>  	}
>  
> @@ -630,10 +639,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
>  	    new_plane_state->crtc_h > INT_MAX ||
>  	    new_plane_state->crtc_y > INT_MAX - (int32_t) new_plane_state->crtc_h) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
> -				 plane->base.id, plane->name,
> -				 new_plane_state->crtc_w, new_plane_state->crtc_h,
> -				 new_plane_state->crtc_x, new_plane_state->crtc_y);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
> +			       plane->base.id, plane->name,
> +			       new_plane_state->crtc_w, new_plane_state->crtc_h,
> +			       new_plane_state->crtc_x, new_plane_state->crtc_y);
>  		return -ERANGE;
>  	}
>  
> @@ -645,18 +655,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
>  	    new_plane_state->src_h > fb_height ||
>  	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid source coordinates "
> -				 "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> -				 plane->base.id, plane->name,
> -				 new_plane_state->src_w >> 16,
> -				 ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_h >> 16,
> -				 ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_x >> 16,
> -				 ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_y >> 16,
> -				 ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> -				 fb->width, fb->height);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid source coordinates "
> +			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> +			       plane->base.id, plane->name,
> +			       new_plane_state->src_w >> 16,
> +			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_h >> 16,
> +			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_x >> 16,
> +			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_y >> 16,
> +			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> +			       fb->width, fb->height);
>  		return -ENOSPC;
>  	}
>  
> @@ -671,9 +682,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  		    clips->y1 < 0 ||
>  		    clips->x2 > fb_width ||
>  		    clips->y2 > fb_height) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> -					 plane->base.id, plane->name, clips->x1,
> -					 clips->y1, clips->x2, clips->y2);
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> +				       plane->base.id, plane->name, clips->x1,
> +				       clips->y1, clips->x2, clips->y2);
>  			return -EINVAL;
>  		}
>  		clips++;
> @@ -681,8 +693,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	}
>  
>  	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] switching CRTC directly\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] switching CRTC directly\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -846,8 +859,9 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
>  
>  	state->num_private_objs = num_objs;
>  
> -	DRM_DEBUG_ATOMIC("Added new private object %p state %p to %p\n",
> -			 obj, obj_state, state);
> +	drm_dbg_atomic(state->dev,
> +		       "Added new private object %p state %p to %p\n",
> +		       obj, obj_state, state);
>  
>  	return obj_state;
>  }
> @@ -1027,7 +1041,7 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	state->connectors[index].ptr = connector;
>  	connector_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [CONNECTOR:%d:%s] %p state to %p\n",
> +	drm_dbg_atomic(connector->dev, "Added [CONNECTOR:%d:%s] %p state to %p\n",
>  			 connector->base.id, connector->name,
>  			 connector_state, state);
>  
> @@ -1160,8 +1174,9 @@ drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
>  	if (!encoder)
>  		return 0;
>  
> -	DRM_DEBUG_ATOMIC("Adding all bridges for [encoder:%d:%s] to %p\n",
> -			 encoder->base.id, encoder->name, state);
> +	drm_dbg_atomic(encoder->dev,
> +		       "Adding all bridges for [encoder:%d:%s] to %p\n",
> +		       encoder->base.id, encoder->name, state);
>  
>  	drm_for_each_bridge_in_chain(encoder, bridge) {
>  		/* Skip bridges that don't implement the atomic state hooks. */
> @@ -1213,8 +1228,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("Adding all current connectors for [CRTC:%d:%s] to %p\n",
> -			 crtc->base.id, crtc->name, state);
> +	drm_dbg_atomic(crtc->dev,
> +		       "Adding all current connectors for [CRTC:%d:%s] to %p\n",
> +		       crtc->base.id, crtc->name, state);
>  
>  	/*
>  	 * Changed connectors are already in @state, so only need to look
> @@ -1267,8 +1283,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
>  
>  	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
>  
> -	DRM_DEBUG_ATOMIC("Adding all current planes for [CRTC:%d:%s] to %p\n",
> -			 crtc->base.id, crtc->name, state);
> +	drm_dbg_atomic(crtc->dev,
> +		       "Adding all current planes for [CRTC:%d:%s] to %p\n",
> +		       crtc->base.id, crtc->name, state);
>  
>  	drm_for_each_plane_mask(plane, state->dev, old_crtc_state->plane_mask) {
>  		struct drm_plane_state *plane_state =
> @@ -1308,7 +1325,7 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	unsigned int affected_crtc = 0;
>  	int i, ret = 0;
>  
> -	DRM_DEBUG_ATOMIC("checking %p\n", state);
> +	drm_dbg_atomic(dev, "checking %p\n", state);
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>  		requested_crtc |= drm_crtc_mask(crtc);
> @@ -1316,8 +1333,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic core check failed\n",
> -					 plane->base.id, plane->name);
> +			drm_dbg_atomic(dev, "[PLANE:%d:%s] atomic core check failed\n",
> +				       plane->base.id, plane->name);
>  			return ret;
>  		}
>  	}
> @@ -1325,8 +1342,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		ret = drm_atomic_crtc_check(old_crtc_state, new_crtc_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic core check failed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] atomic core check failed\n",
> +				       crtc->base.id, crtc->name);
>  			return ret;
>  		}
>  	}
> @@ -1334,8 +1351,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	for_each_new_connector_in_state(state, conn, conn_state, i) {
>  		ret = drm_atomic_connector_check(conn, conn_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] atomic core check failed\n",
> -					 conn->base.id, conn->name);
> +			drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] atomic core check failed\n",
> +				       conn->base.id, conn->name);
>  			return ret;
>  		}
>  	}
> @@ -1344,8 +1361,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		ret = config->funcs->atomic_check(state->dev, state);
>  
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("atomic driver check for %p failed: %d\n",
> -					 state, ret);
> +			drm_dbg_atomic(dev, "atomic driver check for %p failed: %d\n",
> +				       state, ret);
>  			return ret;
>  		}
>  	}
> @@ -1353,8 +1370,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	if (!state->allow_modeset) {
>  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> -				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requires full modeset\n",
> -						 crtc->base.id, crtc->name);
> +				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
> +					       crtc->base.id, crtc->name);
>  				return -EINVAL;
>  			}
>  		}
> @@ -1374,8 +1391,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	 * so compositors know what's going on.
>  	 */
>  	if (affected_crtc != requested_crtc) {
> -		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> -				 requested_crtc, affected_crtc);
> +		drm_dbg_atomic(dev,
> +			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> +			       requested_crtc, affected_crtc);
>  		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
>  		     requested_crtc, affected_crtc);
>  	}
> @@ -1407,7 +1425,7 @@ int drm_atomic_commit(struct drm_atomic_state *state)
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("committing %p\n", state);
> +	drm_dbg_atomic(state->dev, "committing %p\n", state);
>  
>  	return config->funcs->atomic_commit(state->dev, state, false);
>  }
> @@ -1436,7 +1454,7 @@ int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("committing %p nonblocking\n", state);
> +	drm_dbg_atomic(state->dev, "committing %p nonblocking\n", state);
>  
>  	return config->funcs->atomic_commit(state->dev, state, true);
>  }
> @@ -1633,11 +1651,11 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>  	int i;
>  
>  	if (!p) {
> -		DRM_ERROR("invalid drm printer\n");
> +		drm_err(state->dev, "invalid drm printer\n");
>  		return;
>  	}
>  
> -	DRM_DEBUG_ATOMIC("checking %p\n", state);
> +	drm_dbg_atomic(state->dev, "checking %p\n", state);
>  
>  	for_each_new_plane_in_state(state, plane, plane_state, i)
>  		drm_atomic_plane_print_state(p, plane_state);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 2c0c6ec92820..aef2fbd676e5 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -132,9 +132,10 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
>  
>  		if (new_encoder) {
>  			if (encoder_mask & drm_encoder_mask(new_encoder)) {
> -				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] on [CONNECTOR:%d:%s] already assigned\n",
> -					new_encoder->base.id, new_encoder->name,
> -					connector->base.id, connector->name);
> +				drm_dbg_atomic(connector->dev,
> +					       "[ENCODER:%d:%s] on [CONNECTOR:%d:%s] already assigned\n",
> +					       new_encoder->base.id, new_encoder->name,
> +					       connector->base.id, connector->name);
>  
>  				return -EINVAL;
>  			}
> @@ -169,11 +170,12 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
>  			continue;
>  
>  		if (!disable_conflicting_encoders) {
> -			DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] in use on [CRTC:%d:%s] by [CONNECTOR:%d:%s]\n",
> -					 encoder->base.id, encoder->name,
> -					 connector->state->crtc->base.id,
> -					 connector->state->crtc->name,
> -					 connector->base.id, connector->name);
> +			drm_dbg_atomic(connector->dev,
> +				       "[ENCODER:%d:%s] in use on [CRTC:%d:%s] by [CONNECTOR:%d:%s]\n",
> +				       encoder->base.id, encoder->name,
> +				       connector->state->crtc->base.id,
> +				       connector->state->crtc->name,
> +				       connector->base.id, connector->name);
>  			ret = -EINVAL;
>  			goto out;
>  		}
> @@ -184,10 +186,11 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
>  			goto out;
>  		}
>  
> -		DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] in use on [CRTC:%d:%s], disabling [CONNECTOR:%d:%s]\n",
> -				 encoder->base.id, encoder->name,
> -				 new_conn_state->crtc->base.id, new_conn_state->crtc->name,
> -				 connector->base.id, connector->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[ENCODER:%d:%s] in use on [CRTC:%d:%s], disabling [CONNECTOR:%d:%s]\n",
> +			       encoder->base.id, encoder->name,
> +			       new_conn_state->crtc->base.id, new_conn_state->crtc->name,
> +			       connector->base.id, connector->name);
>  
>  		crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
>  
> @@ -268,9 +271,10 @@ steal_encoder(struct drm_atomic_state *state,
>  
>  		encoder_crtc = old_connector_state->crtc;
>  
> -		DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] in use on [CRTC:%d:%s], stealing it\n",
> -				 encoder->base.id, encoder->name,
> -				 encoder_crtc->base.id, encoder_crtc->name);
> +		drm_dbg_atomic(encoder->dev,
> +			       "[ENCODER:%d:%s] in use on [CRTC:%d:%s], stealing it\n",
> +			       encoder->base.id, encoder->name,
> +			       encoder_crtc->base.id, encoder_crtc->name);
>  
>  		set_best_encoder(state, new_connector_state, NULL);
>  
> @@ -291,9 +295,8 @@ update_connector_routing(struct drm_atomic_state *state,
>  	struct drm_encoder *new_encoder;
>  	struct drm_crtc_state *crtc_state;
>  
> -	DRM_DEBUG_ATOMIC("Updating routing for [CONNECTOR:%d:%s]\n",
> -			 connector->base.id,
> -			 connector->name);
> +	drm_dbg_atomic(connector->dev, "Updating routing for [CONNECTOR:%d:%s]\n",
> +		       connector->base.id, connector->name);
>  
>  	if (old_connector_state->crtc != new_connector_state->crtc) {
>  		if (old_connector_state->crtc) {
> @@ -308,9 +311,8 @@ update_connector_routing(struct drm_atomic_state *state,
>  	}
>  
>  	if (!new_connector_state->crtc) {
> -		DRM_DEBUG_ATOMIC("Disabling [CONNECTOR:%d:%s]\n",
> -				connector->base.id,
> -				connector->name);
> +		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
> +				connector->base.id, connector->name);
>  
>  		set_best_encoder(state, new_connector_state, NULL);
>  
> @@ -339,8 +341,9 @@ update_connector_routing(struct drm_atomic_state *state,
>  	 */
>  	if (!state->duplicated && drm_connector_is_unregistered(connector) &&
>  	    crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] is not registered\n",
> -				 connector->base.id, connector->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] is not registered\n",
> +			       connector->base.id, connector->name);
>  		return -EINVAL;
>  	}
>  
> @@ -354,31 +357,33 @@ update_connector_routing(struct drm_atomic_state *state,
>  		new_encoder = drm_connector_get_single_encoder(connector);
>  
>  	if (!new_encoder) {
> -		DRM_DEBUG_ATOMIC("No suitable encoder found for [CONNECTOR:%d:%s]\n",
> -				 connector->base.id,
> -				 connector->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "No suitable encoder found for [CONNECTOR:%d:%s]\n",
> +			       connector->base.id, connector->name);
>  		return -EINVAL;
>  	}
>  
>  	if (!drm_encoder_crtc_ok(new_encoder, new_connector_state->crtc)) {
> -		DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] incompatible with [CRTC:%d:%s]\n",
> -				 new_encoder->base.id,
> -				 new_encoder->name,
> -				 new_connector_state->crtc->base.id,
> -				 new_connector_state->crtc->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[ENCODER:%d:%s] incompatible with [CRTC:%d:%s]\n",
> +			       new_encoder->base.id,
> +			       new_encoder->name,
> +			       new_connector_state->crtc->base.id,
> +			       new_connector_state->crtc->name);
>  		return -EINVAL;
>  	}
>  
>  	if (new_encoder == new_connector_state->best_encoder) {
>  		set_best_encoder(state, new_connector_state, new_encoder);
>  
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] keeps [ENCODER:%d:%s], now on [CRTC:%d:%s]\n",
> -				 connector->base.id,
> -				 connector->name,
> -				 new_encoder->base.id,
> -				 new_encoder->name,
> -				 new_connector_state->crtc->base.id,
> -				 new_connector_state->crtc->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] keeps [ENCODER:%d:%s], now on [CRTC:%d:%s]\n",
> +			       connector->base.id,
> +			       connector->name,
> +			       new_encoder->base.id,
> +			       new_encoder->name,
> +			       new_connector_state->crtc->base.id,
> +			       new_connector_state->crtc->name);
>  
>  		return 0;
>  	}
> @@ -389,13 +394,14 @@ update_connector_routing(struct drm_atomic_state *state,
>  
>  	crtc_state->connectors_changed = true;
>  
> -	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] using [ENCODER:%d:%s] on [CRTC:%d:%s]\n",
> -			 connector->base.id,
> -			 connector->name,
> -			 new_encoder->base.id,
> -			 new_encoder->name,
> -			 new_connector_state->crtc->base.id,
> -			 new_connector_state->crtc->name);
> +	drm_dbg_atomic(connector->dev,
> +		       "[CONNECTOR:%d:%s] using [ENCODER:%d:%s] on [CRTC:%d:%s]\n",
> +		       connector->base.id,
> +		       connector->name,
> +		       new_encoder->base.id,
> +		       new_encoder->name,
> +		       new_connector_state->crtc->base.id,
> +		       new_connector_state->crtc->name);
>  
>  	return 0;
>  }
> @@ -443,7 +449,7 @@ mode_fixup(struct drm_atomic_state *state)
>  						    new_crtc_state,
>  						    new_conn_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("Bridge atomic check failed\n");
> +			drm_dbg_atomic(encoder->dev, "Bridge atomic check failed\n");
>  			return ret;
>  		}
>  
> @@ -451,16 +457,18 @@ mode_fixup(struct drm_atomic_state *state)
>  			ret = funcs->atomic_check(encoder, new_crtc_state,
>  						  new_conn_state);
>  			if (ret) {
> -				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] check failed\n",
> -						 encoder->base.id, encoder->name);
> +				drm_dbg_atomic(encoder->dev,
> +					       "[ENCODER:%d:%s] check failed\n",
> +					       encoder->base.id, encoder->name);
>  				return ret;
>  			}
>  		} else if (funcs && funcs->mode_fixup) {
>  			ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
>  						&new_crtc_state->adjusted_mode);
>  			if (!ret) {
> -				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
> -						 encoder->base.id, encoder->name);
> +				drm_dbg_atomic(encoder->dev,
> +					       "[ENCODER:%d:%s] fixup failed\n",
> +					       encoder->base.id, encoder->name);
>  				return -EINVAL;
>  			}
>  		}
> @@ -483,8 +491,8 @@ mode_fixup(struct drm_atomic_state *state)
>  		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
>  					&new_crtc_state->adjusted_mode);
>  		if (!ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(crtc->dev, "[CRTC:%d:%s] fixup failed\n",
> +				       crtc->base.id, crtc->name);
>  			return -EINVAL;
>  		}
>  	}
> @@ -502,8 +510,9 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  
>  	ret = drm_encoder_mode_valid(encoder, mode);
>  	if (ret != MODE_OK) {
> -		DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] mode_valid() failed\n",
> -				encoder->base.id, encoder->name);
> +		drm_dbg_atomic(encoder->dev,
> +			       "[ENCODER:%d:%s] mode_valid() failed\n",
> +			       encoder->base.id, encoder->name);
>  		return ret;
>  	}
>  
> @@ -511,14 +520,14 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  	ret = drm_bridge_chain_mode_valid(bridge, &connector->display_info,
>  					  mode);
>  	if (ret != MODE_OK) {
> -		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
> +		drm_dbg_atomic(encoder->dev, "[BRIDGE] mode_valid() failed\n");
>  		return ret;
>  	}
>  
>  	ret = drm_crtc_mode_valid(crtc, mode);
>  	if (ret != MODE_OK) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] mode_valid() failed\n",
> -				crtc->base.id, crtc->name);
> +		drm_dbg_atomic(encoder->dev, "[CRTC:%d:%s] mode_valid() failed\n",
> +			       crtc->base.id, crtc->name);
>  		return ret;
>  	}
>  
> @@ -619,14 +628,14 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
>  
>  		if (!drm_mode_equal(&old_crtc_state->mode, &new_crtc_state->mode)) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] mode changed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] mode changed\n",
> +				       crtc->base.id, crtc->name);
>  			new_crtc_state->mode_changed = true;
>  		}
>  
>  		if (old_crtc_state->enable != new_crtc_state->enable) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enable changed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] enable changed\n",
> +				       crtc->base.id, crtc->name);
>  
>  			/*
>  			 * For clarity this assignment is done here, but
> @@ -641,14 +650,14 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		}
>  
>  		if (old_crtc_state->active != new_crtc_state->active) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] active changed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] active changed\n",
> +				       crtc->base.id, crtc->name);
>  			new_crtc_state->active_changed = true;
>  		}
>  
>  		if (new_crtc_state->enable != has_connectors) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enabled/connectors mismatch\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch\n",
> +				       crtc->base.id, crtc->name);
>  
>  			return -EINVAL;
>  		}
> @@ -708,10 +717,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
>  			continue;
>  
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] needs all connectors, enable: %c, active: %c\n",
> -				 crtc->base.id, crtc->name,
> -				 new_crtc_state->enable ? 'y' : 'n',
> -				 new_crtc_state->active ? 'y' : 'n');
> +		drm_dbg_atomic(dev,
> +			       "[CRTC:%d:%s] needs all connectors, enable: %c, active: %c\n",
> +			       crtc->base.id, crtc->name,
> +			       new_crtc_state->enable ? 'y' : 'n',
> +			       new_crtc_state->active ? 'y' : 'n');
>  
>  		ret = drm_atomic_add_affected_connectors(state, crtc);
>  		if (ret != 0)
> @@ -818,7 +828,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	}
>  
>  	if (!crtc_state->enable && !can_update_disabled) {
> -		DRM_DEBUG_KMS("Cannot update plane of a disabled CRTC.\n");
> +		drm_dbg_kms(plane_state->crtc->dev,
> +			       "Cannot update plane of a disabled CRTC.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -828,7 +839,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>  	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>  	if (hscale < 0 || vscale < 0) {
> -		DRM_DEBUG_KMS("Invalid scaling of plane\n");
> +		drm_dbg_kms(plane_state->crtc->dev,
> +			       "Invalid scaling of plane\n");
>  		drm_rect_debug_print("src: ", &plane_state->src, true);
>  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
>  		return -ERANGE;
> @@ -852,7 +864,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  		return 0;
>  
>  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> -		DRM_DEBUG_KMS("Plane must cover entire CRTC\n");
> +		drm_dbg_kms(plane_state->crtc->dev,
> +			       "Plane must cover entire CRTC\n");
>  		drm_rect_debug_print("dst: ", dst, false);
>  		drm_rect_debug_print("clip: ", &clip, false);
>  		return -EINVAL;
> @@ -904,8 +917,9 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  
>  		ret = funcs->atomic_check(plane, state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic driver check failed\n",
> -					 plane->base.id, plane->name);
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] atomic driver check failed\n",
> +				       plane->base.id, plane->name);
>  			return ret;
>  		}
>  	}
> @@ -920,8 +934,9 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  
>  		ret = funcs->atomic_check(crtc, state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic driver check failed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] atomic driver check failed\n",
> +				       crtc->base.id, crtc->name);
>  			return ret;
>  		}
>  	}
> @@ -1049,8 +1064,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  
>  		funcs = encoder->helper_private;
>  
> -		DRM_DEBUG_ATOMIC("disabling [ENCODER:%d:%s]\n",
> -				 encoder->base.id, encoder->name);
> +		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
>  
>  		/*
>  		 * Each encoder has at most one connector (since we always steal
> @@ -1087,8 +1102,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  
>  		funcs = crtc->helper_private;
>  
> -		DRM_DEBUG_ATOMIC("disabling [CRTC:%d:%s]\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(dev, "disabling [CRTC:%d:%s]\n",
> +			       crtc->base.id, crtc->name);
>  
>  
>  		/* Right function depends upon target state. */
> @@ -1229,8 +1244,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		funcs = crtc->helper_private;
>  
>  		if (new_crtc_state->enable && funcs->mode_set_nofb) {
> -			DRM_DEBUG_ATOMIC("modeset on [CRTC:%d:%s]\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "modeset on [CRTC:%d:%s]\n",
> +				       crtc->base.id, crtc->name);
>  
>  			funcs->mode_set_nofb(crtc);
>  		}
> @@ -1254,8 +1269,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		if (!new_crtc_state->mode_changed)
>  			continue;
>  
> -		DRM_DEBUG_ATOMIC("modeset on [ENCODER:%d:%s]\n",
> -				 encoder->base.id, encoder->name);
> +		drm_dbg_atomic(dev, "modeset on [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
>  
>  		/*
>  		 * Each encoder has at most one connector (since we always steal
> @@ -1357,8 +1372,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		funcs = crtc->helper_private;
>  
>  		if (new_crtc_state->enable) {
> -			DRM_DEBUG_ATOMIC("enabling [CRTC:%d:%s]\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "enabling [CRTC:%d:%s]\n",
> +				       crtc->base.id, crtc->name);
>  			if (funcs->atomic_enable)
>  				funcs->atomic_enable(crtc, old_state);
>  			else if (funcs->commit)
> @@ -1381,8 +1396,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		encoder = new_conn_state->best_encoder;
>  		funcs = encoder->helper_private;
>  
> -		DRM_DEBUG_ATOMIC("enabling [ENCODER:%d:%s]\n",
> -				 encoder->base.id, encoder->name);
> +		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
>  
>  		/*
>  		 * Each encoder has at most one connector (since we always steal
> @@ -1551,8 +1566,8 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>  
>  		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
>  		if (ret == 0)
> -			DRM_ERROR("[CRTC:%d:%s] flip_done timed out\n",
> -				  crtc->base.id, crtc->name);
> +			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> +				crtc->base.id, crtc->name);
>  	}
>  
>  	if (old_state->fake_commit)
> @@ -1739,8 +1754,9 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
>  	 */
>  	if (old_plane_state->commit &&
>  	    !try_wait_for_completion(&old_plane_state->commit->hw_done)) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] inflight previous commit preventing async commit\n",
> -			plane->base.id, plane->name);
> +		drm_dbg_atomic(dev,
> +			       "[PLANE:%d:%s] inflight previous commit preventing async commit\n",
> +			       plane->base.id, plane->name);
>  		return -EBUSY;
>  	}
>  
> @@ -1962,8 +1978,9 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
>  			 */
>  			if (!completed && nonblock) {
>  				spin_unlock(&crtc->commit_lock);
> -				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] busy with a previous commit\n",
> -					crtc->base.id, crtc->name);
> +				drm_dbg_atomic(crtc->dev,
> +					       "[CRTC:%d:%s] busy with a previous commit\n",
> +					       crtc->base.id, crtc->name);
>  
>  				return -EBUSY;
>  			}
> @@ -1985,8 +2002,8 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
>  	ret = wait_for_completion_interruptible_timeout(&stall_commit->cleanup_done,
>  							10*HZ);
>  	if (ret == 0)
> -		DRM_ERROR("[CRTC:%d:%s] cleanup_done timed out\n",
> -			  crtc->base.id, crtc->name);
> +		drm_err(crtc->dev, "[CRTC:%d:%s] cleanup_done timed out\n",
> +			crtc->base.id, crtc->name);
>  
>  	drm_crtc_commit_put(stall_commit);
>  
> @@ -2150,8 +2167,9 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>  		 */
>  		if (nonblock && old_conn_state->commit &&
>  		    !try_wait_for_completion(&old_conn_state->commit->flip_done)) {
> -			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] busy with a previous commit\n",
> -				conn->base.id, conn->name);
> +			drm_dbg_atomic(conn->dev,
> +				       "[CONNECTOR:%d:%s] busy with a previous commit\n",
> +				       conn->base.id, conn->name);
>  
>  			return -EBUSY;
>  		}
> @@ -2171,8 +2189,9 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>  		 */
>  		if (nonblock && old_plane_state->commit &&
>  		    !try_wait_for_completion(&old_plane_state->commit->flip_done)) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] busy with a previous commit\n",
> -				plane->base.id, plane->name);
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] busy with a previous commit\n",
> +				       plane->base.id, plane->name);
>  
>  			return -EBUSY;
>  		}
> @@ -2218,22 +2237,25 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
>  	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
>  		ret = drm_crtc_commit_wait(old_crtc_state->commit);
>  		if (ret)
> -			DRM_ERROR("[CRTC:%d:%s] commit wait timed out\n",
> -				  crtc->base.id, crtc->name);
> +			drm_err(crtc->dev,
> +				"[CRTC:%d:%s] commit wait timed out\n",
> +				crtc->base.id, crtc->name);
>  	}
>  
>  	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
>  		ret = drm_crtc_commit_wait(old_conn_state->commit);
>  		if (ret)
> -			DRM_ERROR("[CONNECTOR:%d:%s] commit wait timed out\n",
> -				  conn->base.id, conn->name);
> +			drm_err(conn->dev,
> +				"[CONNECTOR:%d:%s] commit wait timed out\n",
> +				conn->base.id, conn->name);
>  	}
>  
>  	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
>  		ret = drm_crtc_commit_wait(old_plane_state->commit);
>  		if (ret)
> -			DRM_ERROR("[PLANE:%d:%s] commit wait timed out\n",
> -				  plane->base.id, plane->name);
> +			drm_err(plane->dev,
> +				"[PLANE:%d:%s] commit wait timed out\n",
> +				plane->base.id, plane->name);
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
> @@ -3120,7 +3142,9 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
>  
>  	ret = drm_atomic_helper_disable_all(dev, &ctx);
>  	if (ret)
> -		DRM_ERROR("Disabling all crtc's during unload failed with %i\n", ret);
> +		drm_err(dev,
> +			"Disabling all crtc's during unload failed with %i\n",
> +			ret);
>  
>  	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
> @@ -3380,8 +3404,9 @@ static int page_flip_common(struct drm_atomic_state *state,
>  	/* Make sure we don't accidentally do a full modeset. */
>  	state->allow_modeset = false;
>  	if (!crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] disabled, rejecting legacy flip\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] disabled, rejecting legacy flip\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 909f31833181..3a6aec5870ad 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -773,7 +773,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->scaling_mode = val;
>  	} else if (property == config->content_protection_property) {
>  		if (val == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -			DRM_DEBUG_KMS("only drivers can set CP Enabled\n");
> +			drm_dbg_kms(dev, "only drivers can set CP Enabled\n");
>  			return -EINVAL;
>  		}
>  		state->content_protection = val;
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 60a6b21474b1..6e433d465f41 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -106,7 +106,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  	auth->magic = file_priv->magic;
>  	mutex_unlock(&dev->master_mutex);
>  
> -	DRM_DEBUG("%u\n", auth->magic);
> +	drm_dbg_core(dev, "%u\n", auth->magic);
>  
>  	return ret < 0 ? ret : 0;
>  }
> @@ -117,7 +117,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
>  	struct drm_auth *auth = data;
>  	struct drm_file *file;
>  
> -	DRM_DEBUG("%u\n", auth->magic);
> +	drm_dbg_core(dev, "%u\n", auth->magic);
>  
>  	mutex_lock(&dev->master_mutex);
>  	file = idr_find(&file_priv->master->magic_map, auth->magic);
> @@ -274,7 +274,9 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	if (file_priv->master->lessor != NULL) {
> -		DRM_DEBUG_LEASE("Attempt to set lessee %d as master\n", file_priv->master->lessee_id);
> +		drm_dbg_lease(dev,
> +			      "Attempt to set lessee %d as master\n",
> +			      file_priv->master->lessee_id);
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> @@ -315,7 +317,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	if (file_priv->master->lessor != NULL) {
> -		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> +		drm_dbg_lease(dev,
> +			      "Attempt to drop lessee %d as master\n",
> +			      file_priv->master->lessee_id);
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> -- 
> 2.33.0
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
