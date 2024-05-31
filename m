Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D98D5E14
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4C410E778;
	Fri, 31 May 2024 09:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D4vkyS3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7710E2A5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717147220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m/BR6igREgcHIxu6ryrfDOKW46JWXMTPCbNl9gbrEyI=;
 b=D4vkyS3P1Y1k8ZxoGh4524gx7Y1IySPJHr5o8ORS0Vxxeztguf7fdVKUnAOWhEYrgegJmO
 aJW62pQR9l88qxtZfvC0ceuRznfJqFzXS9ngPUXM5u4a5RmcEDrrqgZvaTAqvUYlFVIzlU
 AefNevyh8hjBEKJyHlXAKknrUvH0M6c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-0Z7NvuKINH-FxzQ40XHC8g-1; Fri, 31 May 2024 05:20:18 -0400
X-MC-Unique: 0Z7NvuKINH-FxzQ40XHC8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4212aeac0e2so4494815e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717147216; x=1717752016;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m/BR6igREgcHIxu6ryrfDOKW46JWXMTPCbNl9gbrEyI=;
 b=Tmf6Sd6zZ+/t1/WVudkFGaW0X4bs7Aw1nwhPIAUW0zWdS7KMVUo1qDCWKgl0/jcc3Y
 CH0a/DCRQ/NZ88d8Twqd6LHHQRTp8YI0k6nGv9whNcA/j+DC9jFG7DJtAKZRtV+E3KSM
 +F2vFBaG7WkgPsDc1pBFeZrJxzM7rJRyxS+41IZVnvb6K7wMbTAuYRY2CG/fb4pXCn9d
 USVDB7eCZm9zj7ot4PJc/6AKdudQdmGksUx9A/nVLx87A5b54rep4h++hFzrRIWkIv7X
 H0g0VZH1B+xet7d0HChyavdZ/DQT9dUN9SD5ykVju696WdIXFBaCdwf+CA4O7zeOKBag
 x+JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbQen049viEu1gnZZwiox0CafW6QqpNWdbdsJSm3oJ/CUPhMJQmpS+jgi6e+7DHMZq1d0LvR518RkENkBl5RE+VXw2wH/bPy5UxY5+OQYS
X-Gm-Message-State: AOJu0YxQiaWvVtSeZ99u8l6NlXMC0Z8mVukMmBDSM6E+kU30vut9pfYp
 zLbxAPNrEufDdZe/Ututmc/Kj9mxr2sdMsbvAq/JT7r00XTD97ZzHoj5/z2AscTb49ln4mWU65K
 K4T0ZNJL/cWT5VM/FBMtuXG8/n8nyCCsFZmeuB+3ZPtk6rMYPwxb3ZfjQUQe0uZ08GA==
X-Received: by 2002:a05:600c:4f88:b0:421:2ee4:6b94 with SMTP id
 5b1f17b1804b1-4212ee46da4mr7150075e9.5.1717147216033; 
 Fri, 31 May 2024 02:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuEDM1dGmul8SxDHTQFKL7gHbQ2H8158mM/Jg9tdSIRIrXkipdVLXjNtH9lq4a0prKl9OZwA==
X-Received: by 2002:a05:600c:4f88:b0:421:2ee4:6b94 with SMTP id
 5b1f17b1804b1-4212ee46da4mr7149785e9.5.1717147215367; 
 Fri, 31 May 2024 02:20:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b101419sm15536625e9.1.2024.05.31.02.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:20:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 2/3] drm/panic: Add a set_pixel() callback to
 drm_scanout_buffer
In-Reply-To: <20240531080750.765982-3-jfalempe@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-3-jfalempe@redhat.com>
Date: Fri, 31 May 2024 11:20:14 +0200
Message-ID: <87cyp21goh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> This allows drivers to draw the pixel, and handle tiling, or specific
> color formats.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 120 +++++++++++++++++++++++-------------
>  include/drm/drm_panic.h     |   9 +++
>  2 files changed, 85 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 9d95c7eaae83..27e26b9d842c 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -241,40 +241,54 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>  				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
>  }
>  
> +static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
> +				 const u8 *sbuf8, unsigned int spitch, u32 color)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < drm_rect_height(clip); y++)
> +		for (x = 0; x < drm_rect_width(clip); x++)
> +			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))

You have the same check for fb vs bg in all your blit helpers, so maybe
this can be a macro or static inline function instead ? That would also
help with the issue I mentioned about making the logic easier to read.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

