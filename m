Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1D946FFE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 19:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1F10E0E7;
	Sun,  4 Aug 2024 17:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxyGYg/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177310E0E7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 17:14:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-428163f7635so66149825e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722791672; x=1723396472; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p/4bczz6CJr9dhiOX7HKYOe1viOeV19Z0JANISgbZEs=;
 b=bxyGYg/AhDSV+2NRLxgHcPQtZIg7z9Hb+GVLRGNnqtZWO5s1LdSwnYjGDzr5Ne0U7B
 J10oCvXKuPy0CQKlQoFlUIeDDU6J+LHnX5Vc3O9egvibaJuJNk1S4mdEgk1wzGau99X2
 eR3f4PtbbMnrk9LY/OOTfI5zYXFNs0DLUNy6WU0vdpYItUeyicvVFjgN5Wuh6jhwbkhk
 32tG7hbvkN9vzlGGzDjhwO0sG6S9/noNvsHvzn2KkBiKO8pDId4Ks/nZg8cGtrrAGQbo
 NFBEeKUCeS+pq0REZrr8Jx9fNrzO/rdkGQTknHyKfPJM+AwCKrMBWdkJeKaWfSEJO1v4
 lOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722791672; x=1723396472;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p/4bczz6CJr9dhiOX7HKYOe1viOeV19Z0JANISgbZEs=;
 b=n3uY3Od36KoyWSpQwcOGE1MQpiZUnTdg6Ksf5VSQCw3QtDTyJj5G+qCKzt6e39fhD2
 Mbtyobzf2f2NZDLm9WZtsIfXf19gD8gHgTrcYvj8a/yar3yrsb98PEgtWgAkVCVAUyDb
 FVzy6BjCAWH2wkm5hbqlwxG98T8j5P4VDR2Yj77bfQt9LvNlKKSXpDZGVrNedymybQcY
 1W3/zIku6Euilh+9LrQuQuF1lWhIKA6z0Ax7mYgID8i8xaaDtcWgMYTfBJOWkhtkwIBQ
 k235gOpn9HwkMQmZFwv5CdfKpxu1QAKR4t/XVpJS39vT3HkfntC0MlRCE7YF8fRe1bcr
 I4Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUui3jo4s/7sDamNgsgOacEC8yb/8fqLU5nBT8a0bzjkXd9rIKSFa1qil8BYJVf+1DovcZBBJQfhK5UXAeowOphSZoSLUbi7l5bHzCK4My3
X-Gm-Message-State: AOJu0Yzk7vWQQX7quLjpZk1L/AuT6YniTrLGZVjFG17UI8NVsJhFl/iX
 HuYrIvzPKJHDgIfh5FuHFgvolxGN+DOG2w3/whX+oJojTiLkS+F3cd1aFpJB
X-Google-Smtp-Source: AGHT+IEKO5RBYTDzHkiZWGRWKYYN7qHNgy8QdQzVisJNOAgr683jPNUBW7oHzC2AkIen8oLpIjxcIg==
X-Received: by 2002:a05:600c:198f:b0:426:5c34:b19b with SMTP id
 5b1f17b1804b1-428e6b00c7dmr67548935e9.20.1722791671988; 
 Sun, 04 Aug 2024 10:14:31 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd05b92esm7541252f8f.85.2024.08.04.10.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Aug 2024 10:14:31 -0700 (PDT)
Date: Sun, 4 Aug 2024 19:14:29 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH v3] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Message-ID: <Zq-29RHgywzw96xz@fedora>
References: <20240716161725.41408-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716161725.41408-2-jose.exposito89@gmail.com>
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

On Tue, Jul 16, 2024 at 06:17:26PM +0200, José Expósito wrote:
> Building with Sparse enabled prints this warning for cpu_to_le16()
> calls:
> 
>     warning: incorrect type in assignment (different base types)
>         expected unsigned short [usertype]
>         got restricted __le16 [usertype]
> 
> And this warning for le16_to_cpu() calls:
> 
>     warning: cast to restricted __le16
> 
> Declare the target buffer as __le16 to fix both warnings.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/
> 
>  - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
>    multiple casting.
> 
> v2 -> v3: https://lore.kernel.org/dri-devel/20240715151625.6968-2-jose.exposito89@gmail.com/
> 
>  - Thomas Zimmermann: Use cpu_to_le16() instead of casting 0xffff
>  - Reviewed-by Thomas and Louis
> ---

Would it be possible to get an ACK from the maintainers? It is a very simple patch
and it already has 2 reviewed-by, hopefully we can get it merged.

Thanks a lot in advance!

>  drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 36046b12f296..040b7f113a3b 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,7 +75,7 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
>  
>  static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>  
>  	out_pixel->a = le16_to_cpu(pixels[3]);
>  	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -85,7 +85,7 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>  
>  static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>  
>  	out_pixel->a = (u16)0xffff;
>  	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -95,7 +95,7 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>  
>  static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>  
>  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -178,7 +178,7 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
>  
>  static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>  
>  	pixels[3] = cpu_to_le16(in_pixel->a);
>  	pixels[2] = cpu_to_le16(in_pixel->r);
> @@ -188,9 +188,9 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>  
>  static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>  
> -	pixels[3] = 0xffff;
> +	pixels[3] = cpu_to_le16(0xffff);
>  	pixels[2] = cpu_to_le16(in_pixel->r);
>  	pixels[1] = cpu_to_le16(in_pixel->g);
>  	pixels[0] = cpu_to_le16(in_pixel->b);
> @@ -198,7 +198,7 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>  
>  static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>  
>  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> -- 
> 2.45.2
> 
