Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D98D5E03
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426C510E09F;
	Fri, 31 May 2024 09:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fGR0iwZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2BA10E09F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717146962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t27nEi6UIMG/D7b8yK9PBdBkplZb905A3ZpyjyJvCWs=;
 b=fGR0iwZm0hWgM7djRGTyFsetEgJPlsCBi4kF60kejT4lM7dNC1ukD3z8OfRJ5m8DqrJohW
 iIiXfSgRJb79BRTArO2qygXRX4Nk/vY9BZI7JwtRDq2H+gq5/whnTxyng/nkspWwgp6k71
 XiOm4ck82HUf8DjSaxj4EfkHQh/zcC4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-2X0Y3BDqOOKZEyKNENNh0w-1; Fri, 31 May 2024 05:15:59 -0400
X-MC-Unique: 2X0Y3BDqOOKZEyKNENNh0w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-354fa62abd7so616718f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717146958; x=1717751758;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t27nEi6UIMG/D7b8yK9PBdBkplZb905A3ZpyjyJvCWs=;
 b=LCE3IzT8DMrThlzJbN4g/t8DX8sGF0noyb/QEnpZzZQTptnA6wXoPNJSiVINsysd38
 RbDWaCaAoYTYxflcZr9HN2PfRcw0aI0lXA3/k3diKGj1DP9yfGNDIBfpV80IW94d8QIn
 Tf7+xlOm4VJ4wKcaw+qI4m/zEgre5TgDNcIlap4EX6U/gtu2XHqz3ZJKUCa7sRK8B8Jv
 s4+hAJaB4UpHbzm/fXYgzoxw9c20XYjhXYxEZ49tFpQN3bUTZlI92c7LBWFTbFwbOcFV
 6HZBh0dZkVQEJAnUxXI6inhxw6gkgvmhCEgjOcc7olMgEKhmjE+YHsh58oGSrioMVItx
 5LpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCzj5eoR3sAqKfnxo/SizLfyyTVi/362orVR+kTvB0SijY6DxIxQ8bUNGHpKfyZOeNQfPkhiFg5bvMQIhdNqm0S1WkWdQuqd4yGZv0aYvX
X-Gm-Message-State: AOJu0YyhM20u0v04Oc3/UhjYcsJhtsRr1L2371a9BvWiQskwlcsoTwZe
 WWJ6TDnFt6p0th9JSKW6Iex8fQDybCtRd9UyLHY5A8kdpRGM3vmuWcdo79DLVBXsuKzamhrvxo1
 OcDnf8mjq3F6sLlCVqB5MMFDrzL/AdFC8Z5BANuPE36+mf5bwrCs3NWLuhcamzDad9w==
X-Received: by 2002:a5d:560f:0:b0:354:f802:f3a6 with SMTP id
 ffacd0b85a97d-35e0f25dcb1mr884344f8f.9.1717146958112; 
 Fri, 31 May 2024 02:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrkRGzKUmisjuN7VhScdSjUynwoyILqUA1mdoxx/Htzl4GOeC+VC3zjfLnNVjYgUcCur6uLw==
X-Received: by 2002:a5d:560f:0:b0:354:f802:f3a6 with SMTP id
 ffacd0b85a97d-35e0f25dcb1mr884325f8f.9.1717146957468; 
 Fri, 31 May 2024 02:15:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm1399243f8f.76.2024.05.31.02.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:15:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/3] drm/panic: only draw the foreground color in
 drm_panic_blit()
In-Reply-To: <20240531080750.765982-2-jfalempe@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-2-jfalempe@redhat.com>
Date: Fri, 31 May 2024 11:15:56 +0200
Message-ID: <87frty1gvn.fsf@minerva.mail-host-address-is-not-set>
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

Hello Jocelyn,

> The whole framebuffer is cleared, so it's useless to rewrite the
> background colored pixels. It allows to simplify the drawing
> functions, and prepare the work for the set_pixel() callback.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 63 +++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 7ece67086cec..9d95c7eaae83 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -197,37 +197,33 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>  static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
>  			     const u8 *sbuf8, unsigned int spitch,
>  			     unsigned int height, unsigned int width,
> -			     u16 fg16, u16 bg16)
> +			     u16 color)

What about calling this fg16 instead of color? That way is clear that only
the fb is written and not the background ?

>  {
>  	unsigned int y, x;
> -	u16 val16;
>  
> -	for (y = 0; y < height; y++) {
> -		for (x = 0; x < width; x++) {
> -			val16 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg16 : bg16;
> -			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, val16);
> -		}
> -	}
> +	for (y = 0; y < height; y++)
> +		for (x = 0; x < width; x++)

I would add here a comment that this check is about determining if a color
is suitable for foreground or background, depending on the luminance
threshold (which I understand is the 0x80 value?).

> +			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
> +				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
>  }
>  
>  static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
>  			     const u8 *sbuf8, unsigned int spitch,
>  			     unsigned int height, unsigned int width,
> -			     u32 fg32, u32 bg32)
> +			     u32 color)
>  {
>  	unsigned int y, x;
> -	u32 val32;
>

Same here, I would left the variable name as fg32.

[...]

and also here would add a comment or use a variable to make it more readable.

Same comments for drm_panic_blit32().

[...]

>  /*
> @@ -256,8 +249,7 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>   * @spitch: source pitch in bytes
>   * @height: height of the image to copy, in pixels
>   * @width: width of the image to copy, in pixels
> - * @fg_color: foreground color, in destination format
> - * @bg_color: background color, in destination format
> + * @color: foreground color, in destination format

Leaving as fg_color would even be consistent with your comment.

Feel free to ignore my comments though if you disagree, the patch looks
good to me regardless.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

