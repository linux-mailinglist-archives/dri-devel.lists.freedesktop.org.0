Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59794B898
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 10:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BD910E684;
	Thu,  8 Aug 2024 08:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RRCyTqkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838D710E68C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 08:09:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so7008475e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 01:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723104549; x=1723709349; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+zNylQ6r6tzWOpIxo2dSSJXNR2tVraIPoTch3dKn0+U=;
 b=RRCyTqkxZoTK7yKahra7aoFmruHRBP52yq2rpU3OkTRZfEwu1f806W03lbNOuZRvEa
 AOav0SxanM85WIIITfOx1whlSzWnivaJHc8BTtsNz0IUWfZ+J/AU0BZi25Qf9zEeY38Z
 NJ4T1t++Sw5UrkO3HzIM80UCfeaTiaQbNPwAKH0TCsABQd7Qh2YSJ+DAjeZogdG/+KJY
 csQKLbfjJ2GjNLuBfeXQTz0Nr79T/6sCO4aLj4Td9EOfzoFhgKSIENl4s6khCqlvpkzs
 z9giOry0jZ4q1CEDlmyXTVlqyDtxxAKB5ZAKXG7f7yg7cmKbzsRLXKX2K3tT6Sc8RoNP
 LyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723104549; x=1723709349;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zNylQ6r6tzWOpIxo2dSSJXNR2tVraIPoTch3dKn0+U=;
 b=ibSCXDwTjnv5uczF61Tf1AV7TbTeCLPSRVxWdE4ykjnIySZACc8gy2wwTIIxbO36Ap
 CbxIRk8dmnq7K5EYanjyR+8gYhQc02nu7l9Xe61/Eb3NH7g8n3riPg5v3gaM5q/QEWbX
 qw/HusyBPvuB4/du2xrFyVFrHwZUzGXfrR9toeuy99hoILvLe9zBB83E/IJYoa6vzYFC
 P/GejLve0tNd3PHx4SwW0E6lKjgyMfimpOWBzieqbV0QAxG/rJtJHrinxN+tntCuwvjW
 533bY4WeKNlYnYfo29vUzvSlKy9CqqNSzfYvtCcE8KEvujBn/qhI0MbdB0YPPvAkPMI4
 G9GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOl58aLeQFRR0QXHhkHNI1Lctypkpy8DLCLCsY1f/WfT2RBf4wcPg9TkXdsVv0PycDafLcLvEhv75CF2EuZ0O1SNrTm7ZJu5PKWs+gbG+M
X-Gm-Message-State: AOJu0YznZO+2uVcXO3u4FF56BfL7FDDDprMUR7DsV39M3anFrQMpb9Ui
 7h3dEfVsUmZHJDsVuKonS7ir6mgDNGCEzBryKJs8YcNWv3OO9L6K
X-Google-Smtp-Source: AGHT+IHIM8wXBahqOwgKzjcoQdcYhjqSDLtYmrBYsWVI1x3jxLkh/PyMNyugYuaHW1wapDhY4Gj7lw==
X-Received: by 2002:a05:600c:4f95:b0:428:29e:8c42 with SMTP id
 5b1f17b1804b1-4290aeee05bmr13418635e9.9.1723104548324; 
 Thu, 08 Aug 2024 01:09:08 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c738e01sm9640885e9.11.2024.08.08.01.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 01:09:07 -0700 (PDT)
Date: Thu, 8 Aug 2024 10:09:06 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH v3] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Message-ID: <ZrR9IliUJB3mQi4l@fedora>
References: <20240716161725.41408-2-jose.exposito89@gmail.com>
 <Zq-29RHgywzw96xz@fedora>
 <e6913c12-14a3-4c00-bf07-90a72313dd39@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6913c12-14a3-4c00-bf07-90a72313dd39@igalia.com>
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

On Sun, Aug 04, 2024 at 05:46:55PM -0300, Maíra Canal wrote:
> Hi José,
> 
> On 8/4/24 14:14, José Expósito wrote:
> > On Tue, Jul 16, 2024 at 06:17:26PM +0200, José Expósito wrote:
> > > Building with Sparse enabled prints this warning for cpu_to_le16()
> > > calls:
> > > 
> > >      warning: incorrect type in assignment (different base types)
> > >          expected unsigned short [usertype]
> > >          got restricted __le16 [usertype]
> > > 
> > > And this warning for le16_to_cpu() calls:
> > > 
> > >      warning: cast to restricted __le16
> > > 
> > > Declare the target buffer as __le16 to fix both warnings.
> > > 
> > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > 
> > > ---
> > > 
> > > v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/
> > > 
> > >   - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
> > >     multiple casting.
> > > 
> > > v2 -> v3: https://lore.kernel.org/dri-devel/20240715151625.6968-2-jose.exposito89@gmail.com/
> > > 
> > >   - Thomas Zimmermann: Use cpu_to_le16() instead of casting 0xffff
> > >   - Reviewed-by Thomas and Louis
> > > ---
> > 
> > Would it be possible to get an ACK from the maintainers? It is a very simple patch
> > and it already has 2 reviewed-by, hopefully we can get it merged.
> 
> Acked-by: Maíra Canal <mcanal@igalia.com>
> 
> Could you please apply it to drm-misc-next?

Applied, thanks a lot for the ack Maíra.

Jose

> 
> Best Regards,
> - Maíra
> 
> > 
> > Thanks a lot in advance!
> > 
> > >   drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
> > >   1 file changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > > index 36046b12f296..040b7f113a3b 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -75,7 +75,7 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
> > >   static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)src_pixels;
> > > +	__le16 *pixels = (__force __le16 *)src_pixels;
> > >   	out_pixel->a = le16_to_cpu(pixels[3]);
> > >   	out_pixel->r = le16_to_cpu(pixels[2]);
> > > @@ -85,7 +85,7 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
> > >   static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)src_pixels;
> > > +	__le16 *pixels = (__force __le16 *)src_pixels;
> > >   	out_pixel->a = (u16)0xffff;
> > >   	out_pixel->r = le16_to_cpu(pixels[2]);
> > > @@ -95,7 +95,7 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
> > >   static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)src_pixels;
> > > +	__le16 *pixels = (__force __le16 *)src_pixels;
> > >   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> > >   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > > @@ -178,7 +178,7 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
> > >   static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)dst_pixels;
> > > +	__le16 *pixels = (__force __le16 *)dst_pixels;
> > >   	pixels[3] = cpu_to_le16(in_pixel->a);
> > >   	pixels[2] = cpu_to_le16(in_pixel->r);
> > > @@ -188,9 +188,9 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
> > >   static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)dst_pixels;
> > > +	__le16 *pixels = (__force __le16 *)dst_pixels;
> > > -	pixels[3] = 0xffff;
> > > +	pixels[3] = cpu_to_le16(0xffff);
> > >   	pixels[2] = cpu_to_le16(in_pixel->r);
> > >   	pixels[1] = cpu_to_le16(in_pixel->g);
> > >   	pixels[0] = cpu_to_le16(in_pixel->b);
> > > @@ -198,7 +198,7 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
> > >   static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > >   {
> > > -	u16 *pixels = (u16 *)dst_pixels;
> > > +	__le16 *pixels = (__force __le16 *)dst_pixels;
> > >   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> > >   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > > -- 
> > > 2.45.2
> > > 
