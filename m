Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522E9B2BF4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51D510E44C;
	Mon, 28 Oct 2024 09:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PIdfLF6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5167410E442
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2DCE1BF209;
 Mon, 28 Oct 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMje/jaMOBOoFF5sU1fzBOV+Al4oCoFrkcWCIyXxAMc=;
 b=PIdfLF6xV2QjEBH9FyJ/Z/waKAEdyYQeDZdYj0CHhgAeh3Fm02NSySlyHgVKlEIllLCEUy
 4tYdBuPpBbzSmgNYz7tTV1vRSc3wCGyAlIoOrj9yMMSC9FPI8seDyr+cBnbQxA5nvXNprj
 0dxcqprRg2KA2al2amKwyO3Mwgi7l7jzAvkuZg87DXhMXjR2oB0ay+XqhE+be9BsUvdoC1
 KV6aQEzH0l6QKZb90OmeHKTcxHt2TiMKbkmE1rxi/ZAVwRX49Ck9C2/QxZNNTJz8W3Kcgb
 ZSuroVB7kactx9+d5z4U6mP5wDU/LISDZeidM6aSor7LNah7dRlTZMs69JAz+A==
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
Subject: Re: [PATCH RESEND v2 3/8] drm/vkms: Add support for ARGB16161616
 formats
Message-ID: <Zx9ebwyYnUDs7a-A@fedora>
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
 <20241007-b4-new-color-formats-v2-3-d47da50d4674@bootlin.com>
 <d61fc345-df97-498b-ab2a-49541d88354a@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d61fc345-df97-498b-ab2a-49541d88354a@riseup.net>
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

On 26/10/24 - 11:15, Maíra Canal wrote:
> Hi Louis,
> 
> On 07/10/24 13:46, Louis Chauvet wrote:
> > The formats XRGB16161616 and ARGB16161616 were already supported.
> > Add the support for:
> > - ABGR16161616
> > - XBGR16161616
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 11 ++++++++---
> >   drivers/gpu/drm/vkms/vkms_plane.c   |  2 ++
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index b5a38f70c62b..c03a481f5005 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -441,9 +441,10 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
> >   READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
> >   READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
> > -
> > -READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
> > -READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
> 
> Please, correct the error in the patch that introduced. Don't fix it in
> an unrelated patch.

Thanks! 
 
> > +READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
> > +READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
> > +READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
> 
> Please, be consistent in the use of decimal numbers and hexadecimal
> number. If you prefer to use hexadecimal, don't use 255, use 0xFF.

I will change everything to hexadecimal for the v2.
 
> > +READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
> 
> Are you using tests to check the new formats?

I need to check which ones, but I think yes.

Thanks,
Louis Chauvet

> Best Regards,
> - Maíra
> 
> >   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
> > @@ -659,8 +660,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >   		return &BGRX8888_read_line;
> >   	case DRM_FORMAT_ARGB16161616:
> >   		return &ARGB16161616_read_line;
> > +	case DRM_FORMAT_ABGR16161616:
> > +		return &ABGR16161616_read_line;
> >   	case DRM_FORMAT_XRGB16161616:
> >   		return &XRGB16161616_read_line;
> > +	case DRM_FORMAT_XBGR16161616:
> > +		return &XBGR16161616_read_line;
> >   	case DRM_FORMAT_RGB565:
> >   		return &RGB565_read_line;
> >   	case DRM_FORMAT_NV12:
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 941a6e92a040..1e971c7760d9 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -22,7 +22,9 @@ static const u32 vkms_formats[] = {
> >   	DRM_FORMAT_RGBX8888,
> >   	DRM_FORMAT_BGRX8888,
> >   	DRM_FORMAT_XRGB16161616,
> > +	DRM_FORMAT_XBGR16161616,
> >   	DRM_FORMAT_ARGB16161616,
> > +	DRM_FORMAT_ABGR16161616,
> >   	DRM_FORMAT_RGB565,
> >   	DRM_FORMAT_NV12,
> >   	DRM_FORMAT_NV16,
> > 
