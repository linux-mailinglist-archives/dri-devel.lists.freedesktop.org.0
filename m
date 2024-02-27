Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0348699AD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0610E90F;
	Tue, 27 Feb 2024 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n49clMpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1196510E7E0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E012AC0006;
 Tue, 27 Feb 2024 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vmRJBmi+ZC6wYqBjXwE3XAwhFeg/+dRhI35CFa/hVU=;
 b=n49clMpplySaqVcRnkEStW63nCBewgFvphdIswr9GpoOV7XuGaTT00pFB2IketLgsVAiWX
 qrrs32gsxh/C+WrzD3L6+1zd8MI/190gzF/5gFAzBY7GXUcAm2NQyM7aRKSXOgIVB7oeFJ
 EVV0dqnHdA8Lor4vXWV87CMFirUDl3vMGsVohbVOzIx58mtydIuFCpF/V+nhTjMuPgNjms
 xNbNR8Qp/kMzPnZrjbTefd4tHlw6ip1Q2xT7gaPZ3fBlVyGMHcYz/PIm+Wm0zgkUS34O2z
 jy4oAAMcI7510paUj5fsds8vusUZZOBj56n1gXsH8pFlzRqAjaF7lykKEChQFw==
Date: Tue, 27 Feb 2024 16:02:13 +0100
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
Subject: Re: [PATCH v2 4/9] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <Zd35ddrlHduMq3_Y@localhost.localdomain>
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
 <20240223-yuv-v2-4-aa6be2827bb7@bootlin.com>
 <20240226133646.174d3fb2.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226133646.174d3fb2.pekka.paalanen@collabora.com>
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

Le 26/02/24 - 13:36, Pekka Paalanen a écrit :
> On Fri, 23 Feb 2024 12:37:24 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> > compiler to check if the passed functions take the correct arguments.
> > Such typedefs will help ensuring consistency across the code base in
> > case of update of these prototypes.
> > 
> > Introduce a check around the get_pixel_*_functions to avoid using a
> > nullptr as a function.
> > 
> > Document for those typedefs.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h       | 23 +++++++++++++++++++++--
> >  drivers/gpu/drm/vkms/vkms_formats.c   |  8 ++++----
> >  drivers/gpu/drm/vkms/vkms_formats.h   |  4 ++--
> >  drivers/gpu/drm/vkms/vkms_plane.c     |  9 ++++++++-
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  9 ++++++++-
> >  5 files changed, 43 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 18086423a3a7..886c885c8cf5 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -53,12 +53,31 @@ struct line_buffer {
> >  	struct pixel_argb_u16 *pixels;
> >  };
> >  
> > +/**
> > + * typedef pixel_write_t - These functions are used to read a pixel from a
> > + * `struct pixel_argb_u16*`, convert it in a specific format and write it in the @dst_pixels
> > + * buffer.
> > + *
> > + * @dst_pixel: destination address to write the pixel
> > + * @in_pixel: pixel to write
> > + */
> > +typedef void (*pixel_write_t)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> 
> There are some inconsistencies in pixel_write_t and pixel_read_t. At
> this point of the series they still operate on a single pixel, but you
> use dst_pixels and src_pixels, plural. Yet the documentation correctly
> talks about processing a single pixel.

I will fix this for v4.
 
> I would also expect the source to be always const, but that's a whole
> another patch to change.

The v4 will contains a new patch "drm/vkms: Use const pointer for 
pixel_read and pixel_write functions"

[...]

> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index d5203f531d96..f68b1b03d632 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  		return;
> >  
> >  	fmt = fb->format->format;
> > +	pixel_read_t pixel_read = get_pixel_read_function(fmt);
> > +
> > +	if (!pixel_read) {
> > +		DRM_WARN("Pixel format is not supported by VKMS planes. State is inchanged\n");
> 
> DRM_WARN() is the kernel equivalent to userspace assert(), right?

For the DRM_WARN it is just a standard prinkt(KERN_WARN, ...) (hidden 
behind drm internal macros).

> In that failing the check means an internal invariant was violated,
> which means a code bug in kernel?
>
> Maybe this could be more specific about what invariant was violated?
> E.g. atomic check should have rejected this attempt already.

I'm not an expert (yet) in DRM, so please correct me:
When atomic_update is called, the new state is always validated by 
atomic_check before? There is no way to pass something not validated by 
atomic_check to atomic_update? If this is the case, yes, it should be an 
ERROR and not a WARN as an invalid format passed the atomic_check 
verification.

If so, is this better?

	if (!pixel_read) {
		/*
		 * This is a bug as the vkms_plane_atomic_check must forbid all unsupported formats.
		 */
		DRM_ERROR("Pixel format %4cc is not supported by VKMS planes.\n", fmt);
		return;
	}

I will put the same code in vkms_writeback.c.

[...]

Kind regards,
Louis Chauvet


-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
