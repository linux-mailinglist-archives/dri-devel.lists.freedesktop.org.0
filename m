Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51C25A607
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272B6E148;
	Wed,  2 Sep 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B36E148
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 07:06:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z4so4017871wrr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rkTZMijcCdb7R73WMjcJwoDJpyuFmRLLt3VFQ2uy0/s=;
 b=IuX1MYMnztiVazuKzEvkfC0dS7YOl4VWd8wFdJkeTn/GHsz+RFE1358vX++F/3KrVi
 X+iWQPHUoOrwp9EkDYp++RA1blvOTpe8yF0ohKZAw8GVQ8VQs2+vsAMO/vsrIh6BoSGT
 7OZsqHExHmcBlGO0IJXD2OJeeC7A4Bz+DBlNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rkTZMijcCdb7R73WMjcJwoDJpyuFmRLLt3VFQ2uy0/s=;
 b=k8lu8P3gLCebMotM3Dxkuc0HOUyIc0XR0SW9KD/zgcmGyM+tyYFEXhUGTQHdBfEEgy
 TDjU23wvJJZY5JNgkexAkMLIQ1bephFJiqdg9FCl8Vf7IXI8yeuglipqOQL8v6Eq2LpN
 R5yCdOxrAVQON5kjd1KWQcZH5iyDbZUipC47RsO7/I54dWVjOJxFCWA/JHiwgiZLPgS+
 gIABJDFUVxMl3lmoT8iI7rgvF3guNLMUmTMye+GjPGrOswgc9F/Bh7osP54fWMoyo9+6
 +SZcCHJTZPUo7eckJ9kEXW0uTtSKlcJCSFEkfBC8VkAyDIDfZx0t1yy7SwY4p+N8xHej
 wOrQ==
X-Gm-Message-State: AOAM53344WZyAtFGNlRAgH62T6rjSMtVx+K8wZMcZCGzt8WezEmWtMfd
 4Fc6jd+7w7nwzRN1OGQ57yDSeYHEQJ9Eufuw
X-Google-Smtp-Source: ABdhPJxaJ+IxJWuFy7oZ7TtuBUbU3Xfuq17mLFKU8s1P/KSgqx0wMD4/sSPdW7nl/FGrJUFgeuyroA==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr5520665wrr.167.1599030382996; 
 Wed, 02 Sep 2020 00:06:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j7sm5744762wrw.35.2020.09.02.00.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 00:06:22 -0700 (PDT)
Date: Wed, 2 Sep 2020 09:06:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] drm: add drmm_encoder_alloc()
Message-ID: <20200902070620.GI2352366@phenom.ffwll.local>
References: <20200827160545.1146-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827160545.1146-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 06:05:42PM +0200, Philipp Zabel wrote:
> Add an alternative to drm_encoder_init() that allocates and initializes
> an encoder and registers drm_encoder_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1:
>  - add __printf annotation to __drm_encoder_init()

I think these are the ones we want, but much easier to judge if the series
comes with an example conversion and corresponding cleanup of driver
load/unload code. With that we'd see whether anything silly is left
sticking behind, or whether we have some cleanup inversion issues that
break it all.

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_encoder.c | 105 ++++++++++++++++++++++++++--------
>  include/drm/drm_encoder.h     |  30 ++++++++++
>  2 files changed, 112 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index e555281f43d4..de8c59087721 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_managed.h>
>  
>  #include "drm_crtc_internal.h"
>  
> @@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	}
>  }
>  
> -/**
> - * drm_encoder_init - Init a preallocated encoder
> - * @dev: drm device
> - * @encoder: the encoder to init
> - * @funcs: callbacks for this encoder
> - * @encoder_type: user visible type of the encoder
> - * @name: printf style format string for the encoder name, or NULL for default name
> - *
> - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> - * called from the driver's &drm_encoder_funcs.destroy hook.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_encoder_init(struct drm_device *dev,
> -		     struct drm_encoder *encoder,
> -		     const struct drm_encoder_funcs *funcs,
> -		     int encoder_type, const char *name, ...)
> +__printf(5, 0)
> +static int __drm_encoder_init(struct drm_device *dev,
> +			      struct drm_encoder *encoder,
> +			      const struct drm_encoder_funcs *funcs,
> +			      int encoder_type, const char *name, va_list ap)
>  {
>  	int ret;
>  
> @@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
>  	encoder->encoder_type = encoder_type;
>  	encoder->funcs = funcs;
>  	if (name) {
> -		va_list ap;
> -
> -		va_start(ap, name);
>  		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> -		va_end(ap);
>  	} else {
>  		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
>  					  drm_encoder_enum_list[encoder_type].name,
> @@ -150,6 +133,38 @@ int drm_encoder_init(struct drm_device *dev,
>  
>  	return ret;
>  }
> +
> +/**
> + * drm_encoder_init - Init a preallocated encoder
> + * @dev: drm device
> + * @encoder: the encoder to init
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for default name
> + *
> + * Initializes a preallocated encoder. Encoder should be subclassed as part of
> + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> + * called from the driver's &drm_encoder_funcs.destroy hook.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_encoder_init(struct drm_device *dev,
> +		     struct drm_encoder *encoder,
> +		     const struct drm_encoder_funcs *funcs,
> +		     int encoder_type, const char *name, ...)
> +{
> +	va_list ap;
> +	int ret;
> +
> +	if (name)
> +		va_start(ap, name);
> +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> +	if (name)
> +		va_end(ap);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_encoder_init);
>  
>  /**
> @@ -181,6 +196,50 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  }
>  EXPORT_SYMBOL(drm_encoder_cleanup);
>  
> +static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
> +{
> +	struct drm_encoder *encoder = ptr;
> +
> +	if (WARN_ON(!encoder->dev))
> +		return;
> +
> +	drm_encoder_cleanup(encoder);
> +}
> +
> +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> +			   const struct drm_encoder_funcs *funcs,
> +			   int encoder_type, const char *name, ...)
> +{
> +	void *container;
> +	struct drm_encoder *encoder;
> +	va_list ap;
> +	int ret;
> +
> +	if (WARN_ON(!funcs || funcs->destroy))
> +		return ERR_PTR(-EINVAL);
> +
> +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-EINVAL);
> +
> +	encoder = container + offset;
> +
> +	if (name)
> +		va_start(ap, name);
> +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> +	if (name)
> +		va_end(ap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__drmm_encoder_alloc);
> +
>  static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..4ecad1260ff7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -195,6 +195,36 @@ int drm_encoder_init(struct drm_device *dev,
>  		     const struct drm_encoder_funcs *funcs,
>  		     int encoder_type, const char *name, ...);
>  
> +__printf(6, 7)
> +void *__drmm_encoder_alloc(struct drm_device *dev,
> +			   size_t size, size_t offset,
> +			   const struct drm_encoder_funcs *funcs,
> +			   int encoder_type,
> +			   const char *name, ...);
> +
> +/**
> + * drmm_encoder_alloc - Allocate and initialize an encoder
> + * @dev: drm device
> + * @type: the type of the struct which contains struct &drm_encoder
> + * @member: the name of the &drm_encoder within @type.
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for default name
> + *
> + * Allocates and initializes an encoder. Encoder should be subclassed as part of
> + * driver encoder objects. Cleanup is automatically handled through registering
> + * drm_encoder_cleanup() with drmm_add_action().
> + *
> + * The @drm_encoder_funcs.destroy hook must be NULL.
> + *
> + * Returns:
> + * Pointer to new encoder, or ERR_PTR on failure.
> + */
> +#define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
> +	((type *)__drmm_encoder_alloc(dev, sizeof(type), \
> +				      offsetof(type, member), funcs, \
> +				      encoder_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_encoder_index - find the index of a registered encoder
>   * @encoder: encoder to find index for
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
