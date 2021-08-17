Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D940B3EEDB8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 15:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BAF6E1A2;
	Tue, 17 Aug 2021 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB1A6E197
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:49:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b15so38711178ejg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lGDfnJadJbDbqZnE43iJOR8ypRutP+18VSmV4QDc0JQ=;
 b=dSLBdqfhHnNzBTULfBrhSiqW10aFOoTt8XF4pCq8A4TmClHEz72C9vcZ93xkc8fTf4
 Kzav4huyd73RFYne+uTKKgTVJx87G4BhhcxaWOaFKCPzIQtZnY7w7bOI7AnEloEv/gHt
 ub4UhvHDIlMqmke0JT9H1U14A2qIG6W8eu1Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lGDfnJadJbDbqZnE43iJOR8ypRutP+18VSmV4QDc0JQ=;
 b=nvy8S+3EqzPW7Bn5Nk+1skULmRTbjNee3q09Zw+pZbaL2in6DayPirFniVRLhZoHFU
 Nfuh5JPN5D8BcB1rPD9cc1jHeiDISc1kGCPuLBmwCDm7hrUUfZ1xfwDz7p7fWLUsaWlp
 ZQqdgTI+kD/cy5DMLgEwc0s2TbDZ+7blGYoBw/M6VXLNJVEsNuCoCNpX20XmzBXOntxD
 y2BUBoCXGIofRyqTSGDaerpSSpT2VKjJFpM0/h+f5/co+2QhWYRmf3lGWvrQaopDcdxP
 enCOkLcq3+YfU4So6LvDI5yKwbvUn3NQMPB3gAvymNLsHijjleb5BAcXgkJpr1xy1RQU
 z5Bw==
X-Gm-Message-State: AOAM533j2FVjo/5XM0/tLI+9DUVIodJImc0F7a5p6ez+g4D/StKnvB8h
 FFXTcPCWFC7k8vAWQNqshn9sZA==
X-Google-Smtp-Source: ABdhPJzQs+Lq5T+7wlL6ozg6oFirUkXk70u/tYDqq/iZIwljzhpC8xjj3Tk/9PbZxvNdlj3zCd6Qmw==
X-Received: by 2002:a17:906:2414:: with SMTP id
 z20mr3988132eja.363.1629208174758; 
 Tue, 17 Aug 2021 06:49:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm798711ejl.73.2021.08.17.06.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:49:34 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:49:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se, linus.walleij@linaro.org
Subject: Re: [PATCH 7/7] drm/gud: Add module parameter to control emulation:
 xrgb8888
Message-ID: <YRu+bNmOrExbWEBT@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-8-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817122917.49929-8-noralf@tronnes.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 17, 2021 at 02:29:17PM +0200, Noralf Trønnes wrote:
> For devices that don't support XRGB8888 give the user the ability to
> choose what's most important: Color depth or frames per second.
> 
> Add an 'xrgb8888' module parameter to override the emulation format.
> 
> Assume the user wants full control if xrgb8888 is set and don't set
> DRM_CAP_DUMB_PREFERRED_DEPTH if RGB565 is supported (AFAIK only X.org
> supports this).
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/gud/gud_drv.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index 3f9d4b9a1e3d..60d27ee5ddbd 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -30,6 +30,10 @@
>  
>  #include "gud_internal.h"
>  
> +static int gud_xrgb8888;
> +module_param_named(xrgb8888, gud_xrgb8888, int, 0644);
> +MODULE_PARM_DESC(xrgb8888, "XRGB8888 emulation format: GUD_PIXEL_FORMAT_* value, 0=auto, -1=disable [default=auto]");
> +
>  /* Only used internally */
>  static const struct drm_format_info gud_drm_format_r1 = {
>  	.format = GUD_DRM_FORMAT_R1,
> @@ -530,12 +534,12 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  		case DRM_FORMAT_RGB332:
>  			fallthrough;
>  		case DRM_FORMAT_RGB888:
> -			if (!xrgb8888_emulation_format)
> +			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>  				xrgb8888_emulation_format = info;

Shouldn't the emulation format be per drm_device instance?
-Daniel

>  			break;
>  		case DRM_FORMAT_RGB565:
>  			rgb565_supported = true;
> -			if (!xrgb8888_emulation_format)
> +			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>  				xrgb8888_emulation_format = info;
>  			break;
>  		case DRM_FORMAT_XRGB8888:
> @@ -543,6 +547,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  			break;
>  		}
>  
> +		if (gud_xrgb8888 == formats_dev[i])
> +			xrgb8888_emulation_format = info;
> +
>  		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
>  			       drm->mode_config.max_height;
>  		max_buffer_size = max(max_buffer_size, fmt_buf_size);
> @@ -559,7 +566,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	}
>  
>  	/* Prefer speed over color depth */
> -	if (rgb565_supported)
> +	if (!gud_xrgb8888 && rgb565_supported)
>  		drm->mode_config.preferred_depth = 16;
>  
>  	if (!xrgb8888_supported && xrgb8888_emulation_format) {
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
