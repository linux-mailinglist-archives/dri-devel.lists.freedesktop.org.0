Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3993C9B2BEC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6680610E43F;
	Mon, 28 Oct 2024 09:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W6aQO6tI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2810E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B9FF1C0006;
 Mon, 28 Oct 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeaOMU1TZIhIRYQ0x1moayff8wABo4up92bIIy3XXRs=;
 b=W6aQO6tI46OHCFqyHWD8hWHzWAdWXb2/R+GKXVlXM8fCybdcDK7H92P0HGSvGwhFerZzv2
 pOFhc6elvWm+QZxoe5sjaxAxMdQ5XVKiFYw5uBYoX9Rezg1aUL32juzhcye7kevGnTsNxQ
 0VYtFZke6fB0jeqKNeJQn7CvU3gEZ0j1s23lNpDCMOYxCMaq+TMH0CjIAkl8KM4eam8AJK
 8f/u3vda02F90WxEWFSI9C64Xy5aFqWUdjiyKOsOCLNTAx8zeh2uml4xSa9TOC6r8g9caI
 kqAmx4j0IxRpRoWpVyHcmiTS2h1baay7qTE859fVsSj7dCUimAbMW0iMua+DJQ==
Date: Mon, 28 Oct 2024 10:50:39 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
Subject: Re: [PATCH RESEND v2 4/8] drm/vkms: Add support for RGB565 formats
Message-ID: <Zx9eby4wpmnYPc7Y@fedora>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-4-d47da50d4674@bootlin.com>
 <63f0bf12-4df8-48d1-b8c8-2ed27a860937@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63f0bf12-4df8-48d1-b8c8-2ed27a860937@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 26/10/24 - 11:17, Maíra Canal wrote:
> Hi Louis,
> 
> On 07/10/24 13:46, Louis Chauvet wrote:
> > The format RGB565 was already supported. Add the support for:
> > - BGR565
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 25 ++++++++++++++++++++++++-
> >   drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
> >   2 files changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index c03a481f5005..e34bea5da752 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -249,7 +249,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
> >   	return out_pixel;
> >   }
> > -static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
> > +static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
> 
> Again, fix the issue in the patch that introduce it.

Will do for the v2!

Thanks,
Louis Chauvet
 
> Best Regards,
> - Maíra
> 
> >   {
> >   	return argb_u16_from_u8888(255, gray, gray, gray);
> >   }
> > @@ -259,6 +259,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
> >   	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
> >   }
> > +static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
> > +{
> > +	struct pixel_argb_u16 out_pixel;
> > +
> > +	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> > +	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > +
> > +	u16 rgb_565 = le16_to_cpu(*pixel);
> > +	s64 fp_b = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> > +	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> > +	s64 fp_r = drm_int2fixp(rgb_565 & 0x1f);
> > +
> > +	out_pixel.a = (u16)0xffff;
> > +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> > +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> > +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> > +
> > +	return out_pixel;
> > +}
> > +
> >   VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> >   							    const struct conversion_matrix *matrix)
> >   {
> > @@ -447,6 +467,7 @@ READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
> >   READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
> >   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
> > +READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
> >   READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
> > @@ -668,6 +689,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >   		return &XBGR16161616_read_line;
> >   	case DRM_FORMAT_RGB565:
> >   		return &RGB565_read_line;
> > +	case DRM_FORMAT_BGR565:
> > +		return &BGR565_read_line;
> >   	case DRM_FORMAT_NV12:
> >   	case DRM_FORMAT_NV16:
> >   	case DRM_FORMAT_NV24:
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 1e971c7760d9..a243a706459f 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -26,6 +26,7 @@ static const u32 vkms_formats[] = {
> >   	DRM_FORMAT_ARGB16161616,
> >   	DRM_FORMAT_ABGR16161616,
> >   	DRM_FORMAT_RGB565,
> > +	DRM_FORMAT_BGR565,
> >   	DRM_FORMAT_NV12,
> >   	DRM_FORMAT_NV16,
> >   	DRM_FORMAT_NV24,
> > 
