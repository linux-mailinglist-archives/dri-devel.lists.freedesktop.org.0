Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657AA873D8E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522BE113396;
	Wed,  6 Mar 2024 17:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GZH1+1J6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6D113396
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 17:29:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDD46C0005;
 Wed,  6 Mar 2024 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXLhJ0O6OO6mf1nCrL/ZtBeWa84FHx+qoQdFINeOTeU=;
 b=GZH1+1J6RkqrwG+vvNkjS/qywjS7wLBfuXk31cPPc6Qn8vwL8lZJZw7W6B9aYb1xhaJTjQ
 IikGU9mtyxPoD4BZFamhiWRd7JrY1F0Bea7GzXahlL07zoFYjYVdpzmRLTzU3IFv02ekZp
 BXxV0rHDqglXSBJD24WlGE2xYq4a9GGlnSN0D2X+2Nly86bcSa9LnmHE+1IECN94MxHOL2
 +SpHQopB5QazFeoGORV/v8Qu121jaaQjKiT0qBzcmBsGcmw7zdTKkj6YCK1CT/45LOY4Fg
 C87OQ3ftMWS8sLjABXhWBM/49MmwqH8rNx0kNEnCGzBq5NsXKysX+4cKrj/0oA==
Date: Wed, 6 Mar 2024 18:29:53 +0100
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
Message-ID: <ZeioEcyCo4XKHHX8@localhost.localdomain>
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
 <ZeXonl-jZq4xHnBK@localhost.localdomain>
 <20240305115007.0d0d49ef.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305115007.0d0d49ef.pekka.paalanen@collabora.com>
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

[...]

> > > > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > > > @@ -9,6 +9,17 @@
> > > > > >  
> > > > > >  #include "vkms_formats.h"
> > > > > >  
> > > > > > +/**
> > > > > > + * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> > > > > > + * in the first plane
> > > > > > + *
> > > > > > + * @frame_info: Buffer metadata
> > > > > > + * @x: The x coordinate of the wanted pixel in the buffer
> > > > > > + * @y: The y coordinate of the wanted pixel in the buffer
> > > > > > + *
> > > > > > + * The caller must be aware that this offset is not always a pointer to a pixel. If individual
> > > > > > + * pixel values are needed, they have to be extracted from the resulting block.    
> > > > > 
> > > > > Just wondering how the caller will be able to extract the right pixel
> > > > > from the block without re-using the knowledge already used in this
> > > > > function. I'd also expect the function to round down x,y to be
> > > > > divisible by block dimensions, but that's not visible in this email.
> > > > > Then the caller needs the remainder from the round-down, too?    
> > > > 
> > > > You are right, the current implementation is only working when block_h == 
> > > > block_w == 1. I think I wrote the documentation for PATCHv2 5/9, but when 
> > > > backporting this comment for PATCHv2 3/9 I forgot to update it.
> > > > The new comment will be:
> > > > 
> > > >  * pixels_offset() - Get the offset of a given pixel data at coordinate 
> > > >  * x/y in the first plane
> > > >    [...]
> > > >  * The caller must ensure that the framebuffer associated with this 
> > > >  * request uses a pixel format where block_h == block_w == 1.
> > > >  * If this requirement is not fulfilled, the resulting offset can be 
> > > >  * completly wrong.  
> > > 
> > > Hi Louis,  
> > 
> > Hi Pekka,
> > 
> > > if there is no plan for how non-1x1 blocks would work yet, then I think
> > > the above wording is fine. In my mind, the below wording would
> > > encourage callers to seek out and try arbitrary tricks to make things
> > > work for non-1x1 without rewriting the function to actually work.
> > >
> > > I believe something would need to change in the function signature to
> > > make it properly usable for non-1x1 blocks, but I too cannot suggest
> > > anything off-hand.  
> > 
> > I already made the change to support non-1x1 blocks in Patchv2 5/9 
> > (I will extract this modification in "drm/vkms: Update pixels accessor to 
> > support packed and multi-plane formats"), this function is now able 
> > to extract the pointer to the start of a block. But as stated in the 
> > comment, the caller must manually extract the correct pixel values (if the 
> > format is 2x2, the pointer will point to the first byte of this block, the 
> > caller must do some computation to access the bottom-right value).
> 
> Patchv2 5/9 is not enough.
> 
> "Manually extract the correct pixels" is the thing I have a problem
> with here. The caller should not need to re-do any semantic
> calculations this function already did. Most likely this function
> should return the remainders from the x,y coordinate division, so that
> the caller can extract the right pixels from the block, or something
> else equivalent.
> 
> That same semantic division should not be done in two different places.
> It is too easy for someone later to come and change one site while
> missing the other.

I did not notice this, and I agree, thanks for this feedback. For the v5 I 
will change it and update the function signature to:

static void packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
				 size_t plane_index, size_t *offset, size_t *rem_x, size_t *rem_y)

where rem_x and rem_y are those reminder.
 
> I have a hard time finding in "[PATCH v2 6/9] drm/vkms: Add YUV
> support" how you actually handle blocks bigger than 1x1. I see
> get_subsampling() which returns format->{hsub,vsub}, and I see
> get_subsampling_offset() which combined with remainder-division gates U
> and V plane pixel pointer increments.
> 
> However, I do not see you ever using
> drm_format_info_block_{width,height}() anywhere else. That makes me
> think you have no code to actually handle non-1x1 block formats, which
> means that you cannot get the function signature of
> packed_pixels_offset() right in this series either. It would be better
> to not even pretend the function works for non-1x1 blocks until you
> have code handling at least one such format.
> 
> All of the YUV formats that patch 6 adds support for use 1x1 blocks all
> all their planes.

Yes, none of the supported format have block_h != block_w != 1, so there 
is no need to drm_format_info_block*() helpers.

I wrote the code for DRM_FORMAT_R*. They are packed, with block_w != 1. I 
will add this patch in the next revision. I also wrote the IGT test for 
DRM_FORMAT_R1 [1]. Everything will be in the v5 (I will send it when you have the 
time to review the v4).

For information, I also have a series ready for adding more RGB variants
(I introduced a macro to make it easier and avoid copy/pasting the same
loop). I don't send them yet, because I realy want this series merged 
first. I also have the work for the writeback "line-by-line" algorithm 
ready (I just need to rebase it, but it will be fast).

[1]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com

Kind regards,
Louis Chauvet

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
