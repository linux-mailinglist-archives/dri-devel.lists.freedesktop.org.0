Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D8870562
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797B9112286;
	Mon,  4 Mar 2024 15:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E/lDvTTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E1F1122A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:28:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EC981BF204;
 Mon,  4 Mar 2024 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4Zv8m/UXPDGpZewLmyg0pl/W4ahyJ8xUUUXXUY66xc=;
 b=E/lDvTTl8F84vRyAi+hKvmn0JWisQyYP1UEdCQd8fmO5ZjfWdtsuTORqExmXL6CuAOdsMp
 c56yDlg9yPH2s9fjLX0tz+vskbRBb0YDxKZszPXSuQCaAahyj7F6HC8laaThNCxF7iISjZ
 f2zqQba8qhfnTAkTwIzCM2X+PN0kf585lLXnoifMQQprJI2xPQgAzG2J3kStq7bVMMB2tk
 Wd7+fpOxIXImnLYR5tNlniuE+On92t538kBDTwrmgZ86QgYLx5mab3C0nlNnCTEilpDPgH
 VytIyaCLrwV7hZ/hrqG5vFNUV3edyPiUvuaTHDyJNpPjdZj3bZlH6ffFdn0rag==
Date: Mon, 4 Mar 2024 16:28:30 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 3/9] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <ZeXonl-jZq4xHnBK@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-3-aa6be2827bb7@bootlin.com>
 <20240226133700.3fef91d9.pekka.paalanen@collabora.com>
 <Zd35cimh8BLICUuY@localhost.localdomain>
 <20240229104833.2a404d6b.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229104833.2a404d6b.pekka.paalanen@collabora.com>
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

Le 29/02/24 - 10:48, Pekka Paalanen a écrit :
> On Tue, 27 Feb 2024 16:02:10 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > [...]
> > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > index 172830a3936a..cb7a49b7c8e7 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > @@ -9,6 +9,17 @@
> > > >  
> > > >  #include "vkms_formats.h"
> > > >  
> > > > +/**
> > > > + * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> > > > + * in the first plane
> > > > + *
> > > > + * @frame_info: Buffer metadata
> > > > + * @x: The x coordinate of the wanted pixel in the buffer
> > > > + * @y: The y coordinate of the wanted pixel in the buffer
> > > > + *
> > > > + * The caller must be aware that this offset is not always a pointer to a pixel. If individual
> > > > + * pixel values are needed, they have to be extracted from the resulting block.  
> > > 
> > > Just wondering how the caller will be able to extract the right pixel
> > > from the block without re-using the knowledge already used in this
> > > function. I'd also expect the function to round down x,y to be
> > > divisible by block dimensions, but that's not visible in this email.
> > > Then the caller needs the remainder from the round-down, too?  
> > 
> > You are right, the current implementation is only working when block_h == 
> > block_w == 1. I think I wrote the documentation for PATCHv2 5/9, but when 
> > backporting this comment for PATCHv2 3/9 I forgot to update it.
> > The new comment will be:
> > 
> >  * pixels_offset() - Get the offset of a given pixel data at coordinate 
> >  * x/y in the first plane
> >    [...]
> >  * The caller must ensure that the framebuffer associated with this 
> >  * request uses a pixel format where block_h == block_w == 1.
> >  * If this requirement is not fulfilled, the resulting offset can be 
> >  * completly wrong.
> 
> Hi Louis,

Hi Pekka,

> if there is no plan for how non-1x1 blocks would work yet, then I think
> the above wording is fine. In my mind, the below wording would
> encourage callers to seek out and try arbitrary tricks to make things
> work for non-1x1 without rewriting the function to actually work.
>
> I believe something would need to change in the function signature to
> make it properly usable for non-1x1 blocks, but I too cannot suggest
> anything off-hand.

I already made the change to support non-1x1 blocks in Patchv2 5/9 
(I will extract this modification in "drm/vkms: Update pixels accessor to 
support packed and multi-plane formats"), this function is now able 
to extract the pointer to the start of a block. But as stated in the 
comment, the caller must manually extract the correct pixel values (if the 
format is 2x2, the pointer will point to the first byte of this block, the 
caller must do some computation to access the bottom-right value).
 
> > 
> > And yes, even after PATCHv2 5/9 it is not clear what is the offset. Is 
> > this better to replace the last sentence? (I will do the same update for 
> > the last sentence of packed_pixels_addr)
> > 
> >    [...]
> >  * The returned offset correspond to the offset of the block containing the pixel at coordinates 
> >  * x/y.
> >  * The caller must use this offset with care, as for formats with block_h != 1 or block_w != 1 
> >  * the requested pixel value may have to be extracted from the block, even if they are 
> >  * individually adressable.
> >  
> > > > + */
> > > >  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> > > >  {
> > > >  	struct drm_framebuffer *fb = frame_info->fb;
> > > > @@ -17,12 +28,13 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
> > > >  			      + (x * fb->format->cpp[0]);
> > > >  }
> > > >    
> > 
> > [...]
> > 
> > > > +/**
> > > > + * Retrieve the correct read_pixel function for a specific format.
> > > > + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> > > > + * pointer is valid before using it in a vkms_plane_state.
> > > > + *
> > > > + * @format: 4cc of the format  
> > > 
> > > Since there are many different 4cc style pixel format definition tables
> > > in existence with conflicting definitions, it would not hurt to be more
> > > specific that this is about DRM_FORMAT_* or drm_fourcc.h.  
> > 
> > Is this better?
> > 
> >    @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> 
> Much better!
> 
> 
> Thanks,
> pq

[...]

Kind regards,
Louis Chauvet

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
