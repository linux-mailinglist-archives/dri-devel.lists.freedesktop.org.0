Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EA58B0B3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 22:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476AD12B429;
	Fri,  5 Aug 2022 20:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0090C76
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 20:03:45 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 17so2640145qky.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=NAnKu5wii8Iv3lONcbPFvo+vfMnQlxSplmbyMfWkQ20=;
 b=NZ1b0aG63wAXn5kPR1CN9VjltzTU8Aq5MmB9VopgAUxJoUBoHy7u9Z+Sp1uTntkSVY
 +9yUn5QYX5WynknZYusCUHRYmS1PjtZ2QqtP2ZMxVWHp6g/R3bIBk9HJlEt0tUFZEoaK
 DKFEV9YCdxoNoxCpAz//k9lvJjwIE7mh7gvkhNF+7kOgexnvFNC7fEAAuSvN/ZrYLtZL
 g0DAhZYynwT3xFh/nQ3sqZWqCtzf5P7l68J5v7DUY3hVmYD6xnmnHKZKc/FhZzXvNcdh
 xwwlN5hWPYbKn4ZLs2/ljaeIqm6qki1uk5YwCp+GC4DxejFKigGjibH1sVlNUE5K/yto
 I7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=NAnKu5wii8Iv3lONcbPFvo+vfMnQlxSplmbyMfWkQ20=;
 b=KwDdL2n/eBzr8p6gTOaTzncSY9GBoiRGBlQ0d7NpLpenqT9FUAUfa7yMx0sxQNux25
 Xg6XKEOkix9pHx2rnWx9C3SiZw7DZ1itrXjZHC+rBT3hal8TNHWeej0z+s6w/iiWofUP
 2R7yEnSSKymG8nhXwscSXDgokcp2GbX12a4ljsvGlqT5hQQdDtKXo4KmPhNLQtmW+T88
 kEXWSuYu1X9ol/D5fkBsYePoeGdeGzADvV3MIuOnsPNIzuyxUZf6Kgc21pVyaPd928Lm
 Xwmlh0wyQ6372PaJDCVjQ2RLjAOdbPKVYd2iTeYVnKpWn4CENRRNf6hW0ZR6wYmIciGh
 Ir+Q==
X-Gm-Message-State: ACgBeo3woBYXfepNjdubOsIPkeyhfvHlEmuxT7E2d9KKRdGLU5axq8CC
 fK798r4eXxg10iCmJ1Bb4QjHgQ==
X-Google-Smtp-Source: AA6agR4RDQBtNbtm98aq/XUA7kUX/mDfMQSmtzLjLLbKTgOZk2QSZ9ylorUjOCQ/mZgz9MQm+0jYLQ==
X-Received: by 2002:a05:620a:46ac:b0:6b6:74c:6b53 with SMTP id
 bq44-20020a05620a46ac00b006b6074c6b53mr6399236qkb.620.1659729824665; 
 Fri, 05 Aug 2022 13:03:44 -0700 (PDT)
Received: from localhost (48.230.85.34.bc.googleusercontent.com.
 [34.85.230.48]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05620a241300b006a6ab259261sm3994066qkn.29.2022.08.05.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 13:03:44 -0700 (PDT)
Date: Fri, 5 Aug 2022 20:03:44 +0000
From: Sean Paul <sean@poorly.run>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH 3/5] drm/vkms: Support multiple objects (crtcs, etc.) per
 card
Message-ID: <Yu13oGOd9niPccew@art_vandelay>
References: <20220722213214.1377835-1-jshargo@chromium.org>
 <20220722213214.1377835-4-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722213214.1377835-4-jshargo@chromium.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 jshargo@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:32:11PM -0400, Jim Shargo wrote:
> This change supports multiple CRTCs, encoders, connectors instead of one
> of each per card.
> 
> Since ConfigFS-based devices will support multiple crtcs, it's useful to
> move all of the writeback/composition data from being a per-output thing
> to being a per-CRTC thing.
> 
> Since there's still only ever one CRTC, this should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---

Actual PATCH 3/5 review below :-)

>  drivers/gpu/drm/vkms/vkms_composer.c  |  28 +++----
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  91 +++++++++++----------
>  drivers/gpu/drm/vkms/vkms_drv.c       |   3 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  66 ++++++++++------
>  drivers/gpu/drm/vkms/vkms_output.c    | 110 ++++++++++++++++++--------
>  drivers/gpu/drm/vkms/vkms_plane.c     |  39 ++++++---
>  drivers/gpu/drm/vkms/vkms_writeback.c |  25 +++---
>  7 files changed, 225 insertions(+), 137 deletions(-)
> 

/snip
  
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index c1b632952532..d93678d984ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -11,35 +11,34 @@
>  
>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  {
> -	struct vkms_output *output = container_of(timer, struct vkms_output,
> -						  vblank_hrtimer);
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_crtc *vkms_crtc = timer_to_vkms_crtc(timer);
> +	struct drm_crtc *crtc = &vkms_crtc->base;
>  	struct vkms_crtc_state *state;
>  	u64 ret_overrun;
>  	bool ret, fence_cookie;
>  
>  	fence_cookie = dma_fence_begin_signalling();
>  
> -	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> +	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
> +					  vkms_crtc->period_ns);
>  	if (ret_overrun != 1)
>  		pr_warn("%s: vblank timer overrun\n", __func__);
>  
> -	spin_lock(&output->lock);
> +	spin_lock(&vkms_crtc->lock);
>  	ret = drm_crtc_handle_vblank(crtc);
>  	if (!ret)
>  		DRM_ERROR("vkms failure on handling vblank");
>  
> -	state = output->composer_state;
> -	spin_unlock(&output->lock);
> +	state = vkms_crtc->composer_state;
> +	spin_unlock(&vkms_crtc->lock);
>  
> -	if (state && output->composer_enabled) {
> +	if (state && vkms_crtc->composer_enabled) {
>  		u64 frame = drm_crtc_accurate_vblank_count(crtc);
>  
>  		/* update frame_start only if a queued vkms_composer_worker()
>  		 * has read the data
>  		 */
> -		spin_lock(&output->composer_lock);
> +		spin_lock(&vkms_crtc->composer_lock);
>  		if (!state->crc_pending)
>  			state->frame_start = frame;
>  		else
> @@ -47,9 +46,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  					 state->frame_start, frame);
>  		state->frame_end = frame;
>  		state->crc_pending = true;
> -		spin_unlock(&output->composer_lock);
> +		spin_unlock(&vkms_crtc->composer_lock);
>  
> -		ret = queue_work(output->composer_workq, &state->composer_work);
> +		ret = queue_work(vkms_crtc->composer_workq, &state->composer_work);
>  		if (!ret)
>  			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>  	}
> @@ -62,28 +61,24 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  static int vkms_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct vkms_card *card = drm_device_to_vkms_card(dev);
> -	struct vkms_output *out = &card->output;
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
>  	drm_calc_timestamping_constants(crtc, &crtc->mode);
>  
> -	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> -	out->period_ns = ktime_set(0, vblank->framedur_ns);
> -	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
> +	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
> +	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
> +	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns, HRTIMER_MODE_REL);
>  
>  	return 0;
>  }
>  
>  static void vkms_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct drm_device *dev = crtc->dev;
> -	struct vkms_card *card = drm_device_to_vkms_card(dev);
> -	struct vkms_output *out = &card->output;
> -
> -	hrtimer_cancel(&out->vblank_hrtimer);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);

Nit: blank line here

> +	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
>  }
>  
>  static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> @@ -91,8 +86,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  				      bool in_vblank_irq)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct vkms_card *card = drm_device_to_vkms_card(dev);
> -	struct vkms_output *output = &card->output;
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>  	unsigned int pipe = crtc->index;
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
> @@ -101,7 +95,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  		return true;
>  	}
>  
> -	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
> +	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
>  
>  	if (WARN_ON(*vblank_time == vblank->time))
>  		return true;
> @@ -113,7 +107,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  	 * the vblank core expects. Therefore we need to always correct the
>  	 * timestampe by one frame.
>  	 */
> -	*vblank_time -= output->period_ns;
> +	*vblank_time -= vkms_crtc->period_ns;
>  
>  	return true;
>  }
> @@ -240,18 +234,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>  
>  	/* This lock is held across the atomic commit to block vblank timer
>  	 * from scheduling vkms_composer_worker until the composer is updated
>  	 */
> -	spin_lock_irq(&vkms_output->lock);
> +	spin_lock_irq(&vkms_crtc->lock);
>  }
>  
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
>  
>  	if (crtc->state->event) {
>  		spin_lock(&crtc->dev->event_lock);
> @@ -266,9 +260,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  		crtc->state->event = NULL;
>  	}
>  
> -	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> +	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
>  
> -	spin_unlock_irq(&vkms_output->lock);
> +	spin_unlock_irq(&vkms_crtc->lock);
>  }
>  
>  static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> @@ -279,27 +273,38 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  	.atomic_disable	= vkms_crtc_atomic_disable,
>  };
>  
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> +struct vkms_crtc *vkms_crtc_init(struct vkms_card *card,
>  		   struct drm_plane *primary, struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct drm_device *dev = &card->drm;
> +	struct vkms_crtc *vkms_crtc;
>  	int ret;
>  
> -	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +	if (card->output.num_crtcs >= VKMS_MAX_OUTPUT_OBJECTS) {
> +		return ERR_PTR(ENOMEM);
> +	}

Nit: Remove braces

> +	vkms_crtc = &card->output.crtcs[card->output.num_crtcs++];

Instead of incrementing here and decrementing in the error handling code, just
increment right before the return when we're in the clear.

While I'm here, do you need any locking around the output members?

> +
> +	ret = drm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
>  					&vkms_crtc_funcs, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +		goto out_error;
>  	}
>  
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
>  
> -	spin_lock_init(&vkms_out->lock);
> -	spin_lock_init(&vkms_out->composer_lock);
> +	spin_lock_init(&vkms_crtc->lock);
> +	spin_lock_init(&vkms_crtc->composer_lock);
>  
> -	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> -	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> +	if (!vkms_crtc->composer_workq)
> +		goto out_error;
> +
> +	return vkms_crtc;
>  
> -	return ret;
> +out_error:
> +	memset(vkms_crtc, 0, sizeof(*vkms_crtc));
> +	card->output.num_crtcs -= 1;
> +	return ERR_PTR(ret);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 92fbade2199b..266c9f643f70 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -57,7 +57,8 @@ static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_card *card = drm_device_to_vkms_card(dev);
>  
> -	destroy_workqueue(card->output.composer_workq);
> +	for (int i = 0; i < card->output.num_crtcs; i++)
> +		destroy_workqueue(card->output.crtcs[i].composer_workq);
>  }
>  
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 1a98b81d6f22..30ae06d7af71 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,8 @@
>  
>  #define NUM_OVERLAY_PLANES 8
>  
> +#define VKMS_MAX_OUTPUT_OBJECTS 16
> +
>  struct vkms_writeback_job {
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> @@ -51,6 +53,27 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
>  
> +struct vkms_output;
> +
> +struct vkms_crtc {
> +	struct drm_crtc base;
> +
> +	struct drm_writeback_connector wb_connector;
> +	struct hrtimer vblank_hrtimer;
> +	ktime_t period_ns;
> +	struct drm_pending_vblank_event *event;
> +	/* ordered wq for composer_work */
> +	struct workqueue_struct *composer_workq;
> +	/* protects concurrent access to composer */
> +	spinlock_t lock;
> +
> +	/* protected by @lock */
> +	bool composer_enabled;
> +	struct vkms_crtc_state *composer_state;
> +
> +	spinlock_t composer_lock;
> +};
> +
>  /**
>   * vkms_crtc_state - Driver specific CRTC state
>   * @base: base CRTC state
> @@ -75,23 +98,14 @@ struct vkms_crtc_state {
>  };
>  
>  struct vkms_output {
> -	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
> -	struct drm_connector connector;
> -	struct drm_writeback_connector wb_connector;
> -	struct hrtimer vblank_hrtimer;
> -	ktime_t period_ns;
> -	struct drm_pending_vblank_event *event;
> -	/* ordered wq for composer_work */
> -	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
> -	spinlock_t lock;
> -
> -	/* protected by @lock */
> -	bool composer_enabled;
> -	struct vkms_crtc_state *composer_state;
> -
> -	spinlock_t composer_lock;
> +	int num_crtcs;
> +	struct vkms_crtc crtcs[VKMS_MAX_OUTPUT_OBJECTS];
> +	int num_encoders;
> +	struct drm_encoder encoders[VKMS_MAX_OUTPUT_OBJECTS];
> +	int num_connectors;
> +	struct drm_connector connectors[VKMS_MAX_OUTPUT_OBJECTS];	

Nit: Trailing whitespace

> +	int num_planes;
> +	struct vkms_plane planes[VKMS_MAX_OUTPUT_OBJECTS];

We probably want some number more planes than CRTCs, so perhaps make
VKMS_MAX_PLANES a multiple of VKMS_MAX_OUTPUT_OBJECTS?

>  };
>  
>  struct vkms_device;
> @@ -120,12 +134,15 @@ struct vkms_device {
>  	struct vkms_config config;
>  };
>  
> -#define drm_crtc_to_vkms_output(target) \
> -	container_of(target, struct vkms_output, crtc)
> +#define drm_crtc_to_vkms_crtc(crtc)\
> +	container_of(crtc, struct vkms_crtc, base)
>  
> -#define drm_device_to_vkms_card(target)                                        \
> +#define drm_device_to_vkms_card(target) \
>  	container_of(target, struct vkms_card, drm)
>  
> +#define timer_to_vkms_crtc(timer)\
> +	container_of(timer, struct vkms_crtc, vblank_hrtimer)
> +
>  #define to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
>  
> @@ -137,14 +154,13 @@ struct vkms_card *vkms_card_init(const char *name, bool is_default);
>  void vkms_card_destroy(struct vkms_card *card);
>  
>  /* CRTC */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_crtc *vkms_crtc_init(struct vkms_card *card, struct drm_plane *primary, struct drm_plane *cursor);

Nit: Please split this line

>  
>  int vkms_output_init_default(struct vkms_card *card, int index);
>  int vkms_output_init(struct vkms_card *card, int index);
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_card *card,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> @@ -155,9 +171,9 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
> -void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_card *card);
> +int vkms_enable_writeback_connector(struct vkms_card *card, struct vkms_crtc *vkms_crtc);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index dafd47c0a54d..2b72d8e763a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,19 +32,44 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> -static int vkms_add_overlay_plane(struct vkms_card *card, int index,
> -				  struct drm_crtc *crtc)
> +static struct drm_connector *vkms_connector_init(struct vkms_card *card)
>  {
> -	struct vkms_plane *overlay;
> +	struct drm_connector *connector;
> +	int ret;
>  
> -	overlay = vkms_plane_init(card, DRM_PLANE_TYPE_OVERLAY, index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> +	if (card->output.num_connectors >= VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(ENOMEM);
>  
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +	connector = &card->output.connectors[card->output.num_connectors++];
> +	ret = drm_connector_init(&card->drm, connector, &vkms_connector_funcs,
> +			   DRM_MODE_CONNECTOR_VIRTUAL);
> +	if (ret) {
> +		memset(connector, 0, sizeof(*connector));
> +		card->output.num_connectors -= 1;
> +		return ERR_PTR(ret);
> +	}
>  
> -	return 0;
> +	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> +
> +	return connector;
> +}
> +
> +static struct drm_encoder *vkms_encoder_init(struct vkms_card *card)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	if (card->output.num_encoders >= VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(ENOMEM);
> +
> +	encoder = &card->output.encoders[card->output.num_encoders++];
> +	ret = drm_simple_encoder_init(&card->drm, encoder, DRM_MODE_ENCODER_VIRTUAL);
> +	if (ret) {
> +		memset(encoder, 0, sizeof(*encoder));
> +		card->output.num_encoders -= 1;
> +		return ERR_PTR(ret);
> +	}
> +	return encoder;
>  }
>  
>  int vkms_output_init_default(struct vkms_card *card, int index)
> @@ -52,51 +77,65 @@ int vkms_output_init_default(struct vkms_card *card, int index)
>  	const struct vkms_config *config = &card->vkms_device->config;
>  	struct vkms_output *output = &card->output;
>  	struct drm_device *dev = &card->drm;
> -	struct drm_connector *connector = &output->connector;
> -	struct drm_encoder *encoder = &output->encoder;
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
> +	struct vkms_crtc *vkms_crtc;
>  	struct vkms_plane *primary, *cursor = NULL;
>  	int ret;
>  	int writeback;
>  	unsigned int n;
>  
> -	primary = vkms_plane_init(card, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(card, DRM_PLANE_TYPE_PRIMARY);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
>  	if (config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(card, index, crtc);
> -			if (ret)
> -				return ret;
> +			struct vkms_plane *overlay =
> +				vkms_plane_init(card, DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(overlay)) {
> +				ret = PTR_ERR(overlay);
> +				goto err_planes;
> +			}
>  		}
>  	}
>  
>  	if (config->cursor) {
> -		cursor = vkms_plane_init(card, DRM_PLANE_TYPE_CURSOR, index);
> -		if (IS_ERR(cursor))
> -			return PTR_ERR(cursor);
> +		cursor = vkms_plane_init(card, DRM_PLANE_TYPE_CURSOR);
> +		if (IS_ERR(cursor)) {
> +			ret = PTR_ERR(cursor);
> +			goto err_planes;
> +		}
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> +	vkms_crtc = vkms_crtc_init(card, &primary->base,
> +				   cursor ? &cursor->base : NULL);

Looks like we had a NULL deref previously if there was no cursor.. Whoops!

> +	if (IS_ERR(vkms_crtc)) {
> +		DRM_ERROR("Failed to init crtc\n");
> +		ret = PTR_ERR(vkms_crtc);
> +		goto err_planes;
> +	}
>  
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> -	if (ret) {
> +	for (int i = 0; i < card->output.num_planes; i++) {
> +		card->output.planes[i].base.possible_crtcs |=
> +			drm_crtc_mask(&vkms_crtc->base);
> +	}
> +
> +	connector = vkms_connector_init(card);
> +	if (IS_ERR(connector)) {
>  		DRM_ERROR("Failed to init connector\n");
> +		ret = PTR_ERR(connector);
>  		goto err_connector;
>  	}
>  
> -	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> -
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
> -	if (ret) {
> +	encoder = vkms_encoder_init(card);
> +	if (IS_ERR(encoder)) {
>  		DRM_ERROR("Failed to init encoder\n");
> +		ret = PTR_ERR(encoder);
>  		goto err_encoder;
>  	}
> -	encoder->possible_crtcs = 1;
> +	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
> +
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
> @@ -105,7 +144,7 @@ int vkms_output_init_default(struct vkms_card *card, int index)
>  	}
>  
>  	if (config->writeback) {
> -		writeback = vkms_enable_writeback_connector(card);
> +		writeback = vkms_enable_writeback_connector(card, vkms_crtc);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
>  	}
> @@ -121,7 +160,14 @@ int vkms_output_init_default(struct vkms_card *card, int index)
>  	drm_connector_cleanup(connector);
>  
>  err_connector:
> -	drm_crtc_cleanup(crtc);
> +	drm_crtc_cleanup(&vkms_crtc->base);
> +
> +err_planes:
> +	for (int i = 0; i < output->num_planes; i++) {
> +		drm_plane_cleanup(&output->planes[i].base);
> +	}

Nit: Remove braces

> +
> +	memset(output, 0, sizeof(struct vkms_output));

Is this strictly necessary? I tend to worry about blanket clears like this in
error handling since they could cause future issues if people extend
functionality and forget to update the memset.

IMO it would be better to define vkms_output_destroy() which just does all of
the above, clears out the num_* members explicitly and doesn't worry about the
array contents.

>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 28abd61a0bb9..5f49257fe16e 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "vkms_drv.h"
> @@ -65,6 +66,19 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>  	kfree(vkms_state);
>  }
>  
> +static void vkms_plane_destroy(struct drm_plane *plane)

I think this could be replaced by drm_plane_helper_destroy() instead of rolling
your own destroy function.

> +{
> +	struct vkms_plane *vkms_plane =
> +		container_of(plane, struct vkms_plane, base);
> +
> +	if (plane->state) {
> +		vkms_plane_destroy_state(plane, plane->state);
> +		plane->state = NULL;
> +	}
> +
> +	memset(vkms_plane, 0, sizeof(struct vkms_plane));
> +}
> +
>  static void vkms_plane_reset(struct drm_plane *plane)
>  {
>  	struct vkms_plane_state *vkms_state;
> @@ -86,8 +100,9 @@ static void vkms_plane_reset(struct drm_plane *plane)
>  static const struct drm_plane_funcs vkms_plane_funcs = {
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.reset			= vkms_plane_reset,
> -	.atomic_duplicate_state = vkms_plane_duplicate_state,
> +	.destroy 			= vkms_plane_destroy,
> +	.reset 				= vkms_plane_reset,

Nit: Remove space before tab after .destroy and .reset. I think they're also not
properly aligned.

> +	.atomic_duplicate_state	= vkms_plane_duplicate_state,
>  	.atomic_destroy_state	= vkms_plane_destroy_state,
>  };
>  
> @@ -159,13 +174,20 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_card *card,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>  {
>  	struct drm_device *dev = &card->drm;
> +	struct vkms_output *output = &card->output;
>  	const struct drm_plane_helper_funcs *funcs;
>  	struct vkms_plane *plane;
>  	const u32 *formats;
>  	int nformats;
> +	int ret;
> +
> +	if (output->num_planes >= VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(ENOMEM);
> +
> +	plane = &output->planes[output->num_planes++];

Hmm, I'm guessing this is why the destroy() hook is being hand rolled? Perhaps
changing the output arrays to arrays of pointers would allow you to leverage the
helpers and drmm_*

>  
>  	switch (type) {
>  	case DRM_PLANE_TYPE_PRIMARY:
> @@ -186,12 +208,11 @@ struct vkms_plane *vkms_plane_init(struct vkms_card *card,
>  		break;
>  	}
>  
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> -					   &vkms_plane_funcs,
> -					   formats, nformats,
> -					   NULL, type, NULL);
> -	if (IS_ERR(plane))
> -		return plane;
> +	ret = drm_universal_plane_init(dev, &plane->base, 0,
> +				       &vkms_plane_funcs, formats, nformats,
> +				       NULL, type, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
>  
>  	drm_plane_helper_add(&plane->base, funcs);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 681e7267d688..68c7a77ab93f 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/iosys-map.h>
> +#include <linux/kernel.h>

Same kernel.h nit as before.

>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_fourcc.h>
> @@ -94,15 +95,14 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_card *card;
> +	struct vkms_crtc *vkms_crtc = container_of(connector, struct vkms_crtc, wb_connector);
>  
>  	if (!job->fb)
>  		return;
>  
>  	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>  
> -	card = drm_device_to_vkms_card(job->fb->dev);
> -	vkms_set_composer(&card->output, false);
> +	vkms_set_composer(vkms_crtc, false);
>  	kfree(vkmsjob);
>  }
>  
> @@ -111,21 +111,20 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  {
>  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>  											 conn);
> -	struct vkms_card *card = drm_device_to_vkms_card(conn->dev);
> -	struct vkms_output *output = &card->output;
> -	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> +	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(connector_state->crtc);
> +	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
> -	struct vkms_crtc_state *crtc_state = output->composer_state;
> +	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
>  
>  	if (!conn_state)
>  		return;
>  
> -	vkms_set_composer(&card->output, true);
> +	vkms_set_composer(vkms_crtc, true);
>  
> -	spin_lock_irq(&output->composer_lock);
> +	spin_lock_irq(&vkms_crtc->composer_lock);
>  	crtc_state->active_writeback = conn_state->writeback_job->priv;
>  	crtc_state->wb_pending = true;
> -	spin_unlock_irq(&output->composer_lock);
> +	spin_unlock_irq(&vkms_crtc->composer_lock);
>  	drm_writeback_queue_job(wb_conn, connector_state);
>  }
>  
> @@ -136,11 +135,11 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_commit = vkms_wb_atomic_commit,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_card *card)
> +int vkms_enable_writeback_connector(struct vkms_card *card, struct vkms_crtc *vkms_crtc)
>  {
> -	struct drm_writeback_connector *wb = &card->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
>  
> -	card->output.wb_connector.encoder.possible_crtcs = 1;
> +	vkms_crtc->wb_connector.encoder.possible_crtcs = 1;
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
>  	return drm_writeback_connector_init(&card->drm, wb,
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
