Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E293177B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC6B10E3FB;
	Mon, 15 Jul 2024 15:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7PXd77I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0010E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:19:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-427aeebaecdso7451335e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721056763; x=1721661563; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+6/9yVcqNk+yc1ku2qgMlldOlCtEZ34pcOU7mb/yg20=;
 b=B7PXd77IMRfNAeV0OvWuqZ5klTVIl8V4/8BY/Wcw7EH0RebYVsQzwY15CzgHnwzhIU
 LVBtM0BO8w/zg3ItAQR+C72VmMOwyKez9Yxf7Cml6k3PWIVDRN9kPSr0d3qPROCJOq5P
 ufYLdOwi3EBndze3PlklGMhLfFV3eS5fCuNFiEd27yGdLz33gkJ/LSa5O+Nj2pcctkjW
 ujCzhICkpt20coQUAHe+ancN2pUida4s/I2+ZouVxftNdoATKGxMfX/gLr49tw8yp8+t
 u+7Qpumf8uYHqEpALjS/vY6CJ3VAL9BEaDM6yy8ZemkW/q1qZ539OfNeqEagOpVrGdYh
 iaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721056763; x=1721661563;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6/9yVcqNk+yc1ku2qgMlldOlCtEZ34pcOU7mb/yg20=;
 b=Ho00bg07LiX7NwcexjqZgR55JJiXSicYx8S05pi4/QgmEgcMDnoTPkDt0HvM+2HpvJ
 CVr+7GJZUJLPkP6WNDTD/Q6F8zeBCLk9EPaUdBx0WuNm22QSZ/RBSUx+akKKKq+CmW4X
 Z8dT1fcTFNjy6htxFAdUdFNQlq8EvobQfb0a4F1L9G28hdZuPaD17e/fpEO6ZPdbI02I
 9qtc2Tq5ksTCNRwsMorTd79CVZF8uSGUMCAh2ccLUh9aNdfasHcZ+CAMMKZiCBhAGtEt
 wSw/yPHGuhZHYQu4pxuCat7hFZNvzc332JfWlt8dX/5cq+JeWyKhZJveYURICEMsk88D
 hOBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVflQeLNQmnPRQHQWdLdqroLComSAnZXtUxDSP9dp0H4EyEiiWrK/14dB1zaoD5VzBkK8m7NG7Sg1bck1doE+1oqJhJVwbIlCQZNRfrVHSK
X-Gm-Message-State: AOJu0YzSRPKbNLJby6xqQzQIgGv9lehVXICmGxeAlN5ligqti7ugUDVv
 OUW/GfezhyQ2Lge21zCESH7jRc7BAfyJStNNo2RHH8S1gxn1TCUm
X-Google-Smtp-Source: AGHT+IHV2Yw/R6G9b0Iv22/E5dwI7sAeswLR3PWDkJc3VOB2IcAqBSAmi7O4wVvuyRNX14LLniZvKA==
X-Received: by 2002:a05:600c:1788:b0:426:61fc:fc22 with SMTP id
 5b1f17b1804b1-426707cbf40mr117915785e9.3.1721056762656; 
 Mon, 15 Jul 2024 08:19:22 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef44b4sm91134755e9.42.2024.07.15.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:19:22 -0700 (PDT)
Date: Mon, 15 Jul 2024 17:19:20 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Message-ID: <ZpU9-Oa8quyfA0Gq@fedora>
References: <20240712161656.7480-1-jose.exposito89@gmail.com>
 <bef8086b-754e-4260-b3b5-e45744a714ab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bef8086b-754e-4260-b3b5-e45744a714ab@suse.de>
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

On Sun, Jul 14, 2024 at 09:41:10PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.07.24 um 18:16 schrieb José Expósito:
> > Building with Sparse enabled prints this warning for cpu_to_le16()
> > calls:
> > 
> >      warning: incorrect type in assignment (different base types)
> >          expected unsigned short [usertype]
> >          got restricted __le16 [usertype]
> > 
> > And this warning for le16_to_cpu() calls:
> > 
> >      warning: cast to restricted __le16
> > 
> > Add casts to fix both warnings.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 32 ++++++++++++++---------------
> >   1 file changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 36046b12f296..053fa6ce41a9 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -77,10 +77,10 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
> >   {
> >   	u16 *pixels = (u16 *)src_pixels;
> 
> You should rather declare pixels as __le16 pointer. Same for the other
> changes. See [1] for an example.

Thanks a lot for the quick review Thomas.

v2 is available here:
https://lore.kernel.org/dri-devel/20240715151625.6968-2-jose.exposito89@gmail.com/T/#u

> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/drm_format_helper.c#L420
> 
> > -	out_pixel->a = le16_to_cpu(pixels[3]);
> > -	out_pixel->r = le16_to_cpu(pixels[2]);
> > -	out_pixel->g = le16_to_cpu(pixels[1]);
> > -	out_pixel->b = le16_to_cpu(pixels[0]);
> > +	out_pixel->a = le16_to_cpu((__force __le16)pixels[3]);
> > +	out_pixel->r = le16_to_cpu((__force __le16)pixels[2]);
> > +	out_pixel->g = le16_to_cpu((__force __le16)pixels[1]);
> > +	out_pixel->b = le16_to_cpu((__force __le16)pixels[0]);
> >   }
> >   static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > @@ -88,9 +88,9 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
> >   	u16 *pixels = (u16 *)src_pixels;
> >   	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = le16_to_cpu(pixels[2]);
> > -	out_pixel->g = le16_to_cpu(pixels[1]);
> > -	out_pixel->b = le16_to_cpu(pixels[0]);
> > +	out_pixel->r = le16_to_cpu((__force __le16)pixels[2]);
> > +	out_pixel->g = le16_to_cpu((__force __le16)pixels[1]);
> > +	out_pixel->b = le16_to_cpu((__force __le16)pixels[0]);
> >   }
> >   static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > @@ -100,7 +100,7 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> >   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> >   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > -	u16 rgb_565 = le16_to_cpu(*pixels);
> > +	u16 rgb_565 = le16_to_cpu((__force __le16)*pixels);
> >   	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> >   	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> >   	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> > @@ -180,10 +180,10 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
> >   {
> >   	u16 *pixels = (u16 *)dst_pixels;
> > -	pixels[3] = cpu_to_le16(in_pixel->a);
> > -	pixels[2] = cpu_to_le16(in_pixel->r);
> > -	pixels[1] = cpu_to_le16(in_pixel->g);
> > -	pixels[0] = cpu_to_le16(in_pixel->b);
> > +	pixels[3] = (__force u16)cpu_to_le16(in_pixel->a);
> > +	pixels[2] = (__force u16)cpu_to_le16(in_pixel->r);
> > +	pixels[1] = (__force u16)cpu_to_le16(in_pixel->g);
> > +	pixels[0] = (__force u16)cpu_to_le16(in_pixel->b);
> >   }
> >   static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > @@ -191,9 +191,9 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
> >   	u16 *pixels = (u16 *)dst_pixels;
> >   	pixels[3] = 0xffff;
> > -	pixels[2] = cpu_to_le16(in_pixel->r);
> > -	pixels[1] = cpu_to_le16(in_pixel->g);
> > -	pixels[0] = cpu_to_le16(in_pixel->b);
> > +	pixels[2] = (__force u16)cpu_to_le16(in_pixel->r);
> > +	pixels[1] = (__force u16)cpu_to_le16(in_pixel->g);
> > +	pixels[0] = (__force u16)cpu_to_le16(in_pixel->b);
> >   }
> >   static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > @@ -211,7 +211,7 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> >   	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> >   	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> > -	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
> > +	*pixels = (__force u16)cpu_to_le16(r << 11 | g << 5 | b);
> >   }
> >   void vkms_writeback_row(struct vkms_writeback_job *wb,
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
