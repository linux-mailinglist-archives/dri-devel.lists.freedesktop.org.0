Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57693D4CA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA4910E010;
	Fri, 26 Jul 2024 14:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FDC5K7c1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8D810E010
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 14:11:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-368660d5922so118202f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722003063; x=1722607863; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5qUxWkvyxHZb2ciqYFzrYHXVExzY/Eep0GzXfqDuc04=;
 b=FDC5K7c1Zv7blYDsCrMQOCv+1T1CfCF7V8+eWBxM5pdLbZ9/eMONtWdho4LzFom+Gg
 mBwYwT2hYITZhCwm6He4l/n1MmGZ9fKQNfKOxqt/wyW+d12PuKaatGGjcI4sKMpiLaKP
 GCvLUCVy8Lfd/bGDdwbX55T88K9gzSEZxoUdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722003063; x=1722607863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qUxWkvyxHZb2ciqYFzrYHXVExzY/Eep0GzXfqDuc04=;
 b=JQ4W4a5+kAHBFuistyjbqTxV1fxrXzGA7oegF/XyCwfg/yTZlz7Nnph2WkY5qiZUWi
 s83UYc0ZyhIp2QoMje6FQZviDfSPN0YedgcUEk7ugOxuy/4crLetSM4N04Bsz4pLOd1S
 /+DT+11/ujgmTKNWegoaom5qDasc7+dmjK5PNf4gBeGlI27TcDP3NUClZMwI0AAKr77Z
 4yB5dnmBFx46nFDEwFatU7ceuKyWZCrfiTkaGD5uUHTbY5tCwtxCSYIRryMMCrY7NBUF
 S5Q8wasXaj1nvjrGOPMnpSFFlio0b9lsvRnaQ2ZSjHZas5lubxEmnrXKLcgPexlJrJ4Y
 uE6w==
X-Gm-Message-State: AOJu0YwTnYmxFWRd3xdR5w+KxIeuzEPblcXQeiY59InXOhZp1mpy3fx7
 3GNp+3PcmRt56RicyeWiSy+nUWWZ05/KZJ3RKFOUkFny/9cdeDnHSDZgCU94VP8=
X-Google-Smtp-Source: AGHT+IFwCxQ19lU72DAgrcUfrtjOIWQIB6Qcp62Nz3rB4QKb4gm/ka/4WsILhcQqkscx26zT30uQ8A==
X-Received: by 2002:a05:6000:400d:b0:360:872b:7e03 with SMTP id
 ffacd0b85a97d-36b34b7397bmr2648515f8f.0.1722003062655; 
 Fri, 26 Jul 2024 07:11:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367d9a2fsm5217582f8f.32.2024.07.26.07.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 07:11:02 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:11:00 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/vblank: add dynamic per-crtc vblank
 configuration support
Message-ID: <ZqOudGMANXlApFH6@phenom.ffwll.local>
References: <20240725205109.209743-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725205109.209743-1-hamza.mahfooz@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Thu, Jul 25, 2024 at 04:51:08PM -0400, Hamza Mahfooz wrote:
> We would like to be able to enable vblank_disable_immediate
> unconditionally, however there are a handful of cases where a small off
> delay is necessary (e.g. with PSR enabled). So, we would like to be able
> to adjust the vblank off delay and disable imminent values dynamically
> for a given CRTC. Since, it will allow drivers to apply static screen
> optimizations more quickly and consequently allow users to benefit more
> so from the power savings afforded by the aforementioned optimizations,
> while avoiding issues in cases where an off delay is still warranted.
> In particular, the PSR case requires a small off delay of 2 frames,
> otherwise display firmware isn't able to keep up with all of the
> requests made to amdgpu. So, introduce drm_crtc_vblank_on_config() which
> is like drm_crtc_vblank_on(), but it allows drivers to specify the
> vblank CRTC configuration before enabling vblanking support for a given
> CRTC.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Yeah looks reasonable, bunch of details below. With those addressed:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_vblank.c | 57 ++++++++++++++++++++++++++----------
>  include/drm/drm_vblank.h     | 25 ++++++++++++++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index cc3571e25a9a..c9de7d18389a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c

The intro kerneldoc at the top of this needs to be updated. Might be good
to grep for vblank_disable_immediate to make sure you haven't missed any
reference.

> @@ -1241,6 +1241,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
>  void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> +	int vblank_offdelay = vblank->config.offdelay_ms;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
> @@ -1250,13 +1251,13 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  
>  	/* Last user schedules interrupt disable */
>  	if (atomic_dec_and_test(&vblank->refcount)) {
> -		if (drm_vblank_offdelay == 0)
> +		if (!vblank_offdelay)
>  			return;
> -		else if (drm_vblank_offdelay < 0)
> +		else if (vblank_offdelay < 0)
>  			vblank_disable_fn(&vblank->disable_timer);
> -		else if (!dev->vblank_disable_immediate)
> +		else if (!vblank->config.disable_immediate)
>  			mod_timer(&vblank->disable_timer,
> -				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
> +				  jiffies + ((vblank_offdelay * HZ) / 1000));
>  	}
>  }

The kerneldoc for drm_crtc_vblank_put also needs updating to point at
drm_vblank_config.offdelay_ms.
>  
> @@ -1466,16 +1467,16 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>  EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
>  
>  /**
> - * drm_crtc_vblank_on - enable vblank events on a CRTC
> + * drm_crtc_vblank_on_config - enable vblank events on a CRTC with custom
> + *     configuration options
>   * @crtc: CRTC in question
> + * @config: Vblank configuration value
>   *
> - * This functions restores the vblank interrupt state captured with
> - * drm_crtc_vblank_off() again and is generally called when enabling @crtc. Note
> - * that calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() can be
> - * unbalanced and so can also be unconditionally called in driver load code to
> - * reflect the current hardware state of the crtc.
> + * See drm_crtc_vblank_on(). In addition, this function allows you to provide a
> + * custom vblank configuration for a given CRTC.

I'd add

"Note that @config is copied, the pointer does not need to stay
valid beyond this function call. For details of the parameters see struct
drm_vblank_crtc_config."

to make the kerneldoc more meaningful.

>   */
> -void drm_crtc_vblank_on(struct drm_crtc *crtc)
> +void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
> +			       const struct drm_vblank_crtc_config *config)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
> @@ -1488,6 +1489,8 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
>  
> +	vblank->config = *config;
> +
>  	/* Drop our private "prevent drm_vblank_get" refcount */
>  	if (vblank->inmodeset) {
>  		atomic_dec(&vblank->refcount);
> @@ -1500,10 +1503,31 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  	 * re-enable interrupts if there are users left, or the
>  	 * user wishes vblank interrupts to be enabled all the time.
>  	 */
> -	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> +	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
>  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
>  	spin_unlock_irq(&dev->vbl_lock);
>  }
> +EXPORT_SYMBOL(drm_crtc_vblank_on_config);
> +
> +/**
> + * drm_crtc_vblank_on - enable vblank events on a CRTC
> + * @crtc: CRTC in question
> + *
> + * This functions restores the vblank interrupt state captured with
> + * drm_crtc_vblank_off() again and is generally called when enabling @crtc. Note
> + * that calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() can be
> + * unbalanced and so can also be unconditionally called in driver load code to
> + * reflect the current hardware state of the crtc.

I'd add something like "Unlike drm_crtc_vblank_on_config() default values
are used." here.

> + */
> +void drm_crtc_vblank_on(struct drm_crtc *crtc)
> +{
> +	const struct drm_vblank_crtc_config config = {
> +		.offdelay_ms = drm_vblank_offdelay,
> +		.disable_immediate = crtc->dev->vblank_disable_immediate
> +	};
> +
> +	drm_crtc_vblank_on_config(crtc, &config);
> +}
>  EXPORT_SYMBOL(drm_crtc_vblank_on);
>  
>  static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)

You don't update the reference to dev->vblank_disable_immediate in this
function. Might also be good to add an assert here that we're not in a
modeset as indicated by vbl->inmodeset, since without that the check
breaks.

> @@ -1754,7 +1778,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	/* If the counter is currently enabled and accurate, short-circuit
>  	 * queries to return the cached timestamp of the last vblank.
>  	 */
> -	if (dev->vblank_disable_immediate &&
> +	if (vblank->config.disable_immediate &&
>  	    drm_wait_vblank_is_query(vblwait) &&
>  	    READ_ONCE(vblank->enabled)) {
>  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> @@ -1918,8 +1942,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  	 * been signaled. The disable has to be last (after
>  	 * drm_handle_vblank_events) so that the timestamp is always accurate.
>  	 */
> -	disable_irq = (dev->vblank_disable_immediate &&
> -		       drm_vblank_offdelay > 0 &&
> +	disable_irq = (vblank->config.disable_immediate &&
> +		       vblank->config.offdelay_ms > 0 &&
>  		       !atomic_read(&vblank->refcount));
>  
>  	drm_handle_vblank_events(dev, pipe);
> @@ -1992,7 +2016,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	pipe = drm_crtc_index(crtc);
>  
>  	vblank = drm_crtc_vblank_crtc(crtc);
> -	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
> +	vblank_enabled = READ_ONCE(vblank->config.disable_immediate) &&
> +		READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
>  		ret = drm_crtc_vblank_get(crtc);
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index c8f829b4307c..e70d4383a674 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -78,6 +78,24 @@ struct drm_pending_vblank_event {
>  	} event;
>  };
>  
> +/**
> + * struct drm_vblank_config - vblank configuration for a CRTC
> + */
> +struct drm_vblank_crtc_config {
> +	/**
> +	 * @offdelay_ms: Vblank off delay in ms, used to determine how long
> +	 * @disable_timer waits before disabling.

Please add kerneldoc here and below that explains what
drm_crtc_vblank_on() uses as the default value, including working
kerneldoc hyperlinks to other structs/functions.

> +	 */
> +	int offdelay_ms;
> +
> +	/**
> +	 * @disable_immediate: See @struct drm_device.vblank_disable_immediate.

Just struct drm_device.vblank_disable_immediate is the right way to link.
Maybe check the html output to make sure it's all formatted correctly.
Also please add here that people should look in the linked kerneldoc for
details of the exact semantics of immediate vblank disabling.

> +	 * Additonally, this tracks the disable_immediate value per crtc, just
> +	 * in case it needs to differ from the default value for a given device.
> +	 */
> +	bool disable_immediate;
> +};
> +
>  /**
>   * struct drm_vblank_crtc - vblank tracking for a CRTC
>   *
> @@ -198,6 +216,11 @@ struct drm_vblank_crtc {
>  	 */
>  	struct drm_display_mode hwmode;
>  
> +	/**
> +	 * config: Stores vblank configuration values for a given CRTC.

Might be good to link to drm_crtc_vblank_on_config() here.

> +	 */
> +	struct drm_vblank_crtc_config config;
> +
>  	/**
>  	 * @enabled: Tracks the enabling state of the corresponding &drm_crtc to
>  	 * avoid double-disabling and hence corrupting saved state. Needed by
> @@ -247,6 +270,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
>  void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
>  void drm_crtc_vblank_off(struct drm_crtc *crtc);
>  void drm_crtc_vblank_reset(struct drm_crtc *crtc);
> +void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
> +			       const struct drm_vblank_crtc_config *config);
>  void drm_crtc_vblank_on(struct drm_crtc *crtc);
>  u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc);
>  void drm_crtc_vblank_restore(struct drm_crtc *crtc);

Also please update the kerneldoc for drm_device.vblank_disable_immediate.

Cheers, Sima

> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
