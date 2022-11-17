Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8F62DFCE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE5F10E62D;
	Thu, 17 Nov 2022 15:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B010E62A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:28:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j15so3877074wrq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BLhjSqtZBcaO6IJl2MY4mAhw6gobGVjogIEOAuK+CVg=;
 b=MKl8NHS0SnRbWiNdDTRtX8WeLE/unuyTdaP70egAjigupaX773HBzjM5qe9uGDoKEv
 hsjZv9RBcmzRcePBX+D2QPVi8TFod2cmapSPJqCI+y3PQqUkCmO9Jbm7FydfjwqCyKxF
 kERi93VyxyD9hfIjfKCJiPAsrzM/mWwntJwxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLhjSqtZBcaO6IJl2MY4mAhw6gobGVjogIEOAuK+CVg=;
 b=Xp/mDkq3MNDuj9YnrDQhkVtn3wv6QFmKxS8e80cqzhWM3M7hzl7NDUFHB5F9RiFatl
 o3Crar+wiC7WDJhseJ/1hhYI9M1JFeHsknWYIZ4NSFpVShrsbjkDjDEe8wLgatL7a9vJ
 EfCgUlgPVdERnDkGcgXrSGz2cUkrnqaOcw963GYlLOXC6CnYNkeCLiTAaM2RrpTcyK7X
 rc0AWfP0IrAFN9howXaD72R9ZaBAO8dikWobymLY6gmlzoE3Tbh0JDngedT+/yqfYuZl
 7EUcUPl0KPKZVSXa52r7chTvjOXriNiQRCq9XvDelKYeTKZ9KI4BoykBFCJVfGx1T1bC
 4Z7w==
X-Gm-Message-State: ANoB5pk7RtHV90e4LtTGJ0sIydk0rdn9Tm6ax8+qkVofY850n6YmUsIQ
 LUqFnWHwtsjJLD1eNuOHekf8+iK8gewaFw==
X-Google-Smtp-Source: AA0mqf56YN941ik38sJO9p+TL48rKB12C2/i/hI+Lz65gFY1cIFZkTGP7ESVxYPubO8Q3RftTaH/3Q==
X-Received: by 2002:adf:f951:0:b0:23a:2311:b35 with SMTP id
 q17-20020adff951000000b0023a23110b35mr1768682wrr.183.1668698886151; 
 Thu, 17 Nov 2022 07:28:06 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 x10-20020a5d54ca000000b00238df11940fsm1250344wrv.16.2022.11.17.07.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:28:05 -0800 (PST)
Date: Thu, 17 Nov 2022 16:28:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: add quirks for blind save/restore
Message-ID: <Y3ZTBI4BQ9/VvqH8@phenom.ffwll.local>
References: <20221117075433.222968-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117075433.222968-1-contact@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 07:54:40AM +0000, Simon Ser wrote:
> Two quirks to make blind atomic save/restore [1] work correctly:
> 
> - Mark the DPMS property as immutable for atomic clients, since
>   atomic clients cannot change it.
> - Allow user-space to set content protection to "enabled", interpret
>   it as "desired".
> 
> [1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3794
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think a doc patch which documents the guarantees we're trying to make
here and that they're uapi would be really nice. Maybe somewhere in the
KMS properties section in the docs.
-Daniel

> ---
> 
> I don't have the motivation to write IGT tests for this.
> 
>  drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
>  drivers/gpu/drm/drm_property.c    | 7 +++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c06d0639d552..95363aac7f69 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -741,8 +741,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->scaling_mode = val;
>  	} else if (property == config->content_protection_property) {
>  		if (val == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -			drm_dbg_kms(dev, "only drivers can set CP Enabled\n");
> -			return -EINVAL;
> +			/* Degrade ENABLED to DESIRED so that blind atomic
> +			 * save/restore works as intended. */
> +			val = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>  		}
>  		state->content_protection = val;
>  	} else if (property == config->hdcp_content_type_property) {
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e4..dde42986f8cb 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -474,7 +474,14 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
>  		return -ENOENT;
>  
>  	strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
> +
>  	out_resp->flags = property->flags;
> +	if (file_priv->atomic && property == dev->mode_config.dpms_property) {
> +		/* Quirk: indicate that the legacy DPMS property is not
> +		 * writable from atomic user-space, so that blind atomic
> +		 * save/restore works as intended. */
> +		out_resp->flags |= DRM_MODE_PROP_IMMUTABLE;
> +	}
>  
>  	value_count = property->num_values;
>  	values_ptr = u64_to_user_ptr(out_resp->values_ptr);
> -- 
> 2.38.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
