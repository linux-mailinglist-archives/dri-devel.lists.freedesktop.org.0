Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C299B2BF2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58710E448;
	Mon, 28 Oct 2024 09:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f8jaX2Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DED10E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79FAF60007;
 Mon, 28 Oct 2024 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fi6pq1NACgWnfMa0+CNbK0vFieEFrjbAN/bOLYefu4M=;
 b=f8jaX2Sfp9dwpsG5JUXlrHJGU3snaYBsr8HmAW/8KtTBRFMWZ5QKXB38oc2pfmN9wIxOQs
 YS0LAA4LKHNXP8vWIkxPhqCK4QsXDYlT494jKapS5EcxvsvHF2xWeBxPVleFBFR0cL8/UN
 LssiVoCTMWWZHe0y8tn9S+/e5pZQRuVEVGt7AjdGMgyZSZSXLUTkB1hiGMk6BkowkNcLBZ
 u1AOGKBEgbweXpoaHAeEP/5oIzPftZBinZjNU25XmBj2Rqn3s+qqUyHKkpmX+79MqLMu7t
 +cVfPRB0Z38fJAX4V/MWsjUs/2VpTrlwVNXq3jgv3U3FiG01vv5s9bayJHZ6JQ==
Date: Mon, 28 Oct 2024 10:50:37 +0100
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
Subject: Re: [PATCH RESEND v2 5/8] drm/vkms: Add support for RGB888 formats
Message-ID: <Zx9ebXIlkCAKz52F@fedora>
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
 <20241007-b4-new-color-formats-v2-5-d47da50d4674@bootlin.com>
 <53d04022-7199-4880-9b41-1ee7abdad997@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53d04022-7199-4880-9b41-1ee7abdad997@riseup.net>
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

On 26/10/24 - 11:51, Maíra Canal wrote:
> Hi Louis,
> 
> On 07/10/24 13:46, Louis Chauvet wrote:
> > Add the support for:
> > - RGB888
> > - BGR888
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
> >   drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index e34bea5da752..2376ea8661ac 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -461,6 +461,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
> >   READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
> >   READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
> > +READ_LINE_ARGB8888(RGB888_read_line, px, 255, px[2], px[1], px[0])
> > +READ_LINE_ARGB8888(BGR888_read_line, px, 255, px[0], px[1], px[2])
> > +
> >   READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
> >   READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
> >   READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
> > @@ -679,6 +682,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >   		return &RGBX8888_read_line;
> >   	case DRM_FORMAT_BGRX8888:
> >   		return &BGRX8888_read_line;
> > +	case DRM_FORMAT_RGB888:
> > +		return RGB888_read_line;
> 
> Shouldn't it be &RGB888_read_line?

According to [1], &function, function, ***function are understood the 
same by gcc.

But this is ugly and I will change to use & everywhere, thanks!

[1]:https://stackoverflow.com/questions/6893285/why-do-function-pointer-definitions-work-with-any-number-of-ampersands-or-as

Thanks,
Louis Chauvet
 
> > +	case DRM_FORMAT_BGR888:
> > +		return BGR888_read_line;
> 
> Same.
> 
> Best Regards,
> - Maíra
> 
> >   	case DRM_FORMAT_ARGB16161616:
> >   		return &ARGB16161616_read_line;
> >   	case DRM_FORMAT_ABGR16161616:
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index a243a706459f..0fa589abc53a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -21,6 +21,8 @@ static const u32 vkms_formats[] = {
> >   	DRM_FORMAT_XBGR8888,
> >   	DRM_FORMAT_RGBX8888,
> >   	DRM_FORMAT_BGRX8888,
> > +	DRM_FORMAT_RGB888,
> > +	DRM_FORMAT_BGR888,
> >   	DRM_FORMAT_XRGB16161616,
> >   	DRM_FORMAT_XBGR16161616,
> >   	DRM_FORMAT_ARGB16161616,
> > 
