Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5C82C107
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D2C10EB25;
	Fri, 12 Jan 2024 13:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7610EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:45:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7b03fbbeso969401e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 05:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705067099; x=1705671899; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fZCpSiMfxBnHGKfhSnFLPmZX8eZC/zWiE4Y48KIlXIw=;
 b=YMGBeKYgJahuwcInPdkSo1qlP6yJK8HlCTXXyUwb9ioRx/fjBM0C2oV2gXeFG7qlNE
 AD5LSeV89oTPUt2hTaG/v3hdlotawcpcnuxMza9cAFveTOlo4sB3IhDYqMMsNS8bSqzw
 tCN0URQubHkCW+lnF+McETHUyfvmtaH08UX+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705067099; x=1705671899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZCpSiMfxBnHGKfhSnFLPmZX8eZC/zWiE4Y48KIlXIw=;
 b=wp8WO+ONsOxsXJyeCBGJUuiuUSEEw935tDTRJp+OHcGAD9B6vktrKlnE99GMzX2ZlX
 KFkR+Nn5LtGHyiPfo2C/X3SC9ftocA3dY6uDtbOELJCj0mB00a3IFy1nTfHCCRU4npO+
 qEQJKaZ+DTMn47xDbsI/tbymKyafSPNNMhH5ipJ6wNmofyTok/Vgv+rS+i6OdmJ4ZEUS
 nUq/7xd9T2oJK54hH8ZTAroUDrOgIaJMEiHMqiDOx9HukR+Nyqm8ducOwZbjze1qU2tw
 Dn8mhy/n7bkZeV2EOni/w8tTqtJ3DIyoUmdZR472zJwgwQxCmo7k7L6LY0+OiFqqGBTW
 iZtA==
X-Gm-Message-State: AOJu0Ywiun87vUO4GWCp8RdbgpozRiiCYvCf7yo7RpRdarooaDMJRMZY
 fqLOKMKR5ca+aSpL5zUe7xFMe4Gh5F7EfhHC4oXoYQVB3Zk=
X-Google-Smtp-Source: AGHT+IF4AosghOXgauYXtDDnhfH2Ifgl2ns9lGkUMMpe6VsWItWkVi3hULqG7bT0VZZZvbTFB1dnYg==
X-Received: by 2002:a19:6406:0:b0:50e:74f2:fada with SMTP id
 y6-20020a196406000000b0050e74f2fadamr1393249lfb.0.1705067099576; 
 Fri, 12 Jan 2024 05:44:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170906090d00b00a2c11a438a8sm1812549ejd.25.2024.01.12.05.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:44:59 -0800 (PST)
Date: Fri, 12 Jan 2024 14:44:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Message-ID: <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-7-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 mripard@kernel.org, gpiccoli@igalia.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 05:00:50PM +0100, Jocelyn Falempe wrote:
> Add support for the drm_panic module, which displays a user-friendly
> message to the screen when a kernel panic occurs.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 7ce1c4617675..6dd2afee84d4 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #define DRIVER_NAME	"simpledrm"
> @@ -985,6 +986,19 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  	return sdev;
>  }
>  
> +static int simpledrm_get_scanout_buffer(struct drm_device *dev,
> +					struct drm_scanout_buffer *sb)
> +{
> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);

So I guess simpledrm is the reason why the get_scanout_buffer hook is at
the device level and not at the plane level. Even from the few drivers you
have in your series it seems very much the exception, so I'm not sure
whether that's the best design.

I guess we'll know when we see the plane iterator code with the right
locking, whether it's ok to have that in driver hooks or it's better to
pull it out into shared code.
-Sima

> +
> +	sb->width = sdev->mode.hdisplay;
> +	sb->height = sdev->mode.vdisplay;
> +	sb->pitch = sdev->pitch;
> +	sb->format = sdev->format;
> +	sb->map = sdev->screen_base;
> +	return 0;
> +}
> +
>  /*
>   * DRM driver
>   */
> @@ -1000,6 +1014,7 @@ static struct drm_driver simpledrm_driver = {
>  	.minor			= DRIVER_MINOR,
>  	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>  	.fops			= &simpledrm_fops,
> +	.get_scanout_buffer	= simpledrm_get_scanout_buffer,
>  };
>  
>  /*
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
