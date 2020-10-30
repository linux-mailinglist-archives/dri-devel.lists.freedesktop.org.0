Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173352A0097
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AB06E9CD;
	Fri, 30 Oct 2020 08:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582196E9CD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:59:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so2123465wmg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9ROGplUbZs7e1OJlVaZe98NOhP1EfRYzA6qupe/+nLU=;
 b=AoEKwFGhyB5gZS4CzG2eFqu3hhdK6JNE0R2CziU+UsBBQzDLpaoLqpV/yTfeEe9VXg
 NujTJ5OzBgeooFbOja1gIQ7R0bGMDinYormiXOl3jDG79VMCoSPoSHGmejmsn/HwRbxT
 Q9dxIC5bG+ycP0kJKA/B4Y4BGUJjP6UOOuZQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ROGplUbZs7e1OJlVaZe98NOhP1EfRYzA6qupe/+nLU=;
 b=csgyciQvydvo5+buxXtUCFfLEYd3MILH4uvNaBV4n8BIXzQ1eRImLbQVWnMoMvFnFX
 kC2tHVGbqAoH1ONbj2nPCX+Z9Pn5XGmuQQG3eg1m1kvIMu1q1ZyW3FryKRYftapM/4bq
 kKOg+ulZ2x3UloaiQr7cKJQ7u2F1urAi1BC0a6Buo47xBkOfQAD/t+Qdv/kjHss+CClU
 0S7UJQVzBHniqVxzyKeCeRgi7gbAHCpmknHPV8+VhkjHHyfEOc2StOF6j2+rODARXBtM
 OHxgqNn/Nk6Hio0pjnpoXYWJnanTeqmBTDrovSwO7vZgy0ErgW5+RAnGTgTH+ioSlA+3
 B5Rg==
X-Gm-Message-State: AOAM5323JjwuUdijDnMNy9q76lqcf79oq62IOdlhgvuq8bqVp0SrNfAr
 K1HuxlpkrcTim9wuAxQjkbkY5g==
X-Google-Smtp-Source: ABdhPJw/JsGj0APPXKGrGy5Gpvx/CdsJoh2PIE1ZJTzvhaR5RtOnMCTpIwes6Y9+ba3oU4ms7R847w==
X-Received: by 2002:a1c:4888:: with SMTP id v130mr537147wma.84.1604048374029; 
 Fri, 30 Oct 2020 01:59:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 26sm3937880wmk.42.2020.10.30.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 01:59:33 -0700 (PDT)
Date: Fri, 30 Oct 2020 09:59:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 6/6] drm/vc4: kms: Add functions to create the state
 objects
Message-ID: <20201030085931.GF401619@phenom.ffwll.local>
References: <20201029190104.2181730-1-maxime@cerno.tech>
 <20201029190104.2181730-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029190104.2181730-6-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 08:01:04PM +0100, Maxime Ripard wrote:
> In order to make the vc4_kms_load code and error path a bit easier to
> read and extend, add functions to create state objects, and use managed
> actions to cleanup if needed.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Nice. With an s/drmm_add_action/drmm_add_action_or_reset/ over the entire
series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

btw there's a series pending from imx people (Philip Zabel iirc) to add
drmm support for modeset objects. I think that would really help clean up
vc4. Or well make it slightly less buggy, since atm you're using
devm_kzalloc, which strictly speaking, frees the memory too early.

Anyway this here looks all nice.
-Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c |  3 --
>  drivers/gpu/drm/vc4/vc4_kms.c | 78 +++++++++++++++++++++++++----------
>  2 files changed, 57 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 6e037fbaa090..08c1cc225045 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -312,9 +312,6 @@ static void vc4_drm_unbind(struct device *dev)
>  	drm_dev_unregister(drm);
>  
>  	drm_atomic_helper_shutdown(drm);
> -
> -	drm_atomic_private_obj_fini(&vc4->load_tracker);
> -	drm_atomic_private_obj_fini(&vc4->ctm_manager);
>  }
>  
>  static const struct component_master_ops vc4_drm_ops = {
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 708099a24406..fbfb0698073e 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -93,6 +93,29 @@ static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
>  	.atomic_destroy_state = vc4_ctm_destroy_state,
>  };
>  
> +static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +	drm_atomic_private_obj_fini(&vc4->ctm_manager);
> +}
> +
> +static int vc4_ctm_obj_init(struct vc4_dev *vc4)
> +{
> +	struct vc4_ctm_state *ctm_state;
> +
> +	drm_modeset_lock_init(&vc4->ctm_state_lock);
> +
> +	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
> +	if (!ctm_state)
> +		return -ENOMEM;
> +
> +	drm_atomic_private_obj_init(vc4->dev, &vc4->ctm_manager, &ctm_state->base,
> +				    &vc4_ctm_state_funcs);
> +
> +	return drmm_add_action(&vc4->base, vc4_ctm_obj_fini, NULL);
> +}
> +
>  /* Converts a DRM S31.32 value to the HW S0.9 format. */
>  static u16 vc4_ctm_s31_32_to_s0_9(u64 in)
>  {
> @@ -609,6 +632,34 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
>  	.atomic_destroy_state = vc4_load_tracker_destroy_state,
>  };
>  
> +static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +	if (!vc4->load_tracker_available)
> +		return 0;
> +
> +	drm_atomic_private_obj_fini(&vc4->load_tracker);
> +}
> +
> +static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
> +{
> +	struct vc4_load_tracker_state *load_state;
> +
> +	if (!vc4->load_tracker_available)
> +		return 0;
> +
> +	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
> +	if (!load_state)
> +		return -ENOMEM;
> +
> +	drm_atomic_private_obj_init(vc4->dev, &vc4->load_tracker,
> +				    &load_state->base,
> +				    &vc4_load_tracker_state_funcs);
> +
> +	return drmm_add_action(&vc4->base, vc4_load_tracker_obj_fini, NULL);
> +}
> +
>  #define NUM_OUTPUTS  6
>  #define NUM_CHANNELS 3
>  
> @@ -711,8 +762,6 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
>  int vc4_kms_load(struct drm_device *dev)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> -	struct vc4_ctm_state *ctm_state;
> -	struct vc4_load_tracker_state *load_state;
>  	bool is_vc5 = of_device_is_compatible(dev->dev->of_node,
>  					      "brcm,bcm2711-vc5");
>  	int ret;
> @@ -751,26 +800,13 @@ int vc4_kms_load(struct drm_device *dev)
>  	dev->mode_config.async_page_flip = true;
>  	dev->mode_config.allow_fb_modifiers = true;
>  
> -	drm_modeset_lock_init(&vc4->ctm_state_lock);
> +	ret = vc4_ctm_obj_init(vc4);
> +	if (ret)
> +		return ret;
>  
> -	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
> -	if (!ctm_state)
> -		return -ENOMEM;
> -
> -	drm_atomic_private_obj_init(dev, &vc4->ctm_manager, &ctm_state->base,
> -				    &vc4_ctm_state_funcs);
> -
> -	if (vc4->load_tracker_available) {
> -		load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
> -		if (!load_state) {
> -			drm_atomic_private_obj_fini(&vc4->ctm_manager);
> -			return -ENOMEM;
> -		}
> -
> -		drm_atomic_private_obj_init(dev, &vc4->load_tracker,
> -					    &load_state->base,
> -					    &vc4_load_tracker_state_funcs);
> -	}
> +	ret = vc4_load_tracker_obj_init(vc4);
> +	if (ret)
> +		return ret;
>  
>  	drm_mode_config_reset(dev);
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
