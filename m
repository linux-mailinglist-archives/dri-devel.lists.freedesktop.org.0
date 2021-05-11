Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A628537AC93
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90F6E7D9;
	Tue, 11 May 2021 17:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B6A6E7D9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:01:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id b25so30771444eju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eGT6CM6zrpvckhwY2iFtZZ4WRRjUGJkZSXc1+KZHMl8=;
 b=QzToW1eSHCWAISplke1PIt+BrR6F3B3Nbt5Srr1CpzYbS1RRKF00pTaZRNBSqZIgSd
 tvB8RDDy/bJdWoFkrLUG3eyEJbxqJslbVANovum3tc4p7f3tsXGDpfiDpxd0kdHsSAEw
 Ww5YwauY5+yTgFT3617Q0XFa/0Wm7eDEuDuFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eGT6CM6zrpvckhwY2iFtZZ4WRRjUGJkZSXc1+KZHMl8=;
 b=lzpoxm//JGYjuGhZOph0Y/IUqNEWZshhkccQEQcm/GqU8K1WjZQkq/Jgkt1AdEeLpe
 acUNNV7ahmpK03XrYklvMfr4qFuWY3wLgkGH4lM+D2oE80c7hIlrEQbznjSSRbbiiIJe
 VdtF+DriHG88NCkt85ooy9RmrbmnoDtqhB97CPbwCyfobNu23HKfKg3FeIcbgs/bzVgu
 V6N336zgFcXboX1+k5+r7oAO4BvBAxr+pcmf3vZy4cnHS867kvIn4Zj0auAFIEd4VTd1
 XSzxUD8qHcU/MR2tpljoV6F8piQ8X9gmlroN8u0dcnuPjYU2C05mxt/KCFAi1cBIFsU5
 32lg==
X-Gm-Message-State: AOAM5313n2QwdoSdn6QsnG81aYD5WAm87y116sCia6WOot2p8I80joeL
 1vLLbv5PyTj56UGJ0ONgPqZDfw==
X-Google-Smtp-Source: ABdhPJzT/CXrz681TJwUy7D7wBrXWsL4q3t0HYBJqEaa8WOWVO5keFYHKuzQ6ONn6NDZTSFTqEO8ng==
X-Received: by 2002:a17:906:17cc:: with SMTP id
 u12mr32401916eje.170.1620752479997; 
 Tue, 11 May 2021 10:01:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k5sm16929612edk.46.2021.05.11.10.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 10:01:19 -0700 (PDT)
Date: Tue, 11 May 2021 19:01:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH RFC 1/3] drm: Add drm_plane_add_modifiers()
Message-ID: <YJq4XWiT+SKwaLr8@phenom.ffwll.local>
References: <20210511014940.2067715-1-tina.zhang@intel.com>
 <20210511014940.2067715-2-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511014940.2067715-2-tina.zhang@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 09:49:38PM -0400, Tina Zhang wrote:
> Add a function to add modifiers to a plane.
> 
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>

For one, new functions for drivers needs kerneldoc.

But the real issue here is that you're suppoed to supply the modifiers
when creating the plane, not later on. So this function doesn't make
sense.

Please fix virtio code to use the existing functions
(drm_universal_plane_init() to be specific), or explain what that's not
possible.
-Daniel
> ---
>  drivers/gpu/drm/drm_plane.c | 41 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_plane.h     |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index b570a480090a..793b16d84f86 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -288,6 +288,47 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  }
>  EXPORT_SYMBOL(drm_universal_plane_init);
>  
> +int drm_plane_add_modifiers(struct drm_device *dev,
> +				  struct drm_plane *plane,
> +				  const uint64_t *format_modifiers)
> +{
> +	struct drm_mode_config *config = &dev->mode_config;
> +	const uint64_t *temp_modifiers = format_modifiers;
> +	unsigned int format_modifier_count = 0;
> +
> +	/*
> +	 * Only considering adding modifiers when no modifier was
> +	 * added to that plane before.
> +	 */
> +	if (!temp_modifiers || plane->modifier_count)
> +		return -EINVAL;
> +
> +	while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
> +		format_modifier_count++;
> +
> +	if (format_modifier_count)
> +		config->allow_fb_modifiers = true;
> +
> +	plane->modifier_count = format_modifier_count;
> +	plane->modifiers = kmalloc_array(format_modifier_count,
> +					 sizeof(format_modifiers[0]),
> +					 GFP_KERNEL);
> +
> +	if (format_modifier_count && !plane->modifiers) {
> +		DRM_DEBUG_KMS("out of memory when allocating plane\n");
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(plane->modifiers, format_modifiers,
> +		   format_modifier_count * sizeof(format_modifiers[0]));
> +	if (config->allow_fb_modifiers)
> +		create_in_format_blob(dev, plane);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_modifiers);
> +
> +
>  int drm_plane_register_all(struct drm_device *dev)
>  {
>  	unsigned int num_planes = 0;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 50c23eb432b7..0dacdeffc3bc 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -827,6 +827,9 @@ int drm_universal_plane_init(struct drm_device *dev,
>  			     const uint64_t *format_modifiers,
>  			     enum drm_plane_type type,
>  			     const char *name, ...);
> +int drm_plane_add_modifiers(struct drm_device *dev,
> +			       struct drm_plane *plane,
> +			       const uint64_t *format_modifiers);
>  int drm_plane_init(struct drm_device *dev,
>  		   struct drm_plane *plane,
>  		   uint32_t possible_crtcs,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
