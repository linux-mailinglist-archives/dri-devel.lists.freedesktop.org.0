Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2278C3B57
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 08:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99AE10E1AA;
	Mon, 13 May 2024 06:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="D94ZXrYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF9810E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 06:31:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59EABE0009;
 Mon, 13 May 2024 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715581879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfRoAFfC/1PV/3iC+jAvDAhNdr3/rvOcMyIFh+A5RLE=;
 b=D94ZXrYsv0C3e3g1KLqfGtvFsrQmwc5/78CFWP+o/WShVTsybRFJLQ2Pg8IcyaRue3JkDD
 ADn7ebqLAmz7Vp7+YW7qkeNxnjcViTJX/Axrp+LKxIrSwLL/7tKFkOPTZay7DYxJVvmjRD
 GTJYx6SzalaL4eGRfOHLWWAJiDo9w82cXlQxmPREzhtutkYxOgVz0ZLQqoW94GYMX9subN
 P9/Vrw0UhFRyQ1DTmS+dDvXv/+qP1yMNqien+fSxBtV52xpDx17ix3ORlbVZKaAD6fxQ4L
 yD0tsfJHGjbJQ4+s4o5AxK7hZv0yOp+fzv8C2PPeqiyMTzICbVpRlH57N11Teg==
Date: Mon, 13 May 2024 08:31:15 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 03/17] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <ZkGzsyR3U1fhpPqZ@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-3-de1c5728fd70@bootlin.com>
 <20240422133358.59fb6221.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422133358.59fb6221.pekka.paalanen@collabora.com>
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

Le 22/04/24 - 13:33, Pekka Paalanen a écrit :
> On Tue, 09 Apr 2024 15:25:21 +0200
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Add some documentation on pixel conversion functions.
> > Update of outdated comments for pixel_write functions.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
> >  drivers/gpu/drm/vkms/vkms_drv.h      | 15 ++++++++-
> >  drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++------
> >  3 files changed, 74 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index c6d9b4a65809..da0651a94c9b 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> >  
> > +	/*
> > +	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> > +	 * complexity to avoid poor blending performance.
> > +	 *
> > +	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
> > +	 * buffer.
> > +	 */
> >  	for (size_t y = 0; y < crtc_y_limit; y++) {
> >  		fill_background(&background_color, output_buffer);
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index b4b357447292..a86cb537d6aa 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -25,6 +25,17 @@
> >  
> >  #define VKMS_LUT_SIZE 256
> >  
> > +/**
> > + * struct vkms_frame_info - structure to store the state of a frame
> > + *
> > + * @fb: backing drm framebuffer
> > + * @src: source rectangle of this frame in the source framebuffer
> > + * @dst: destination rectangle in the crtc buffer
> 
> Are both src and dst using whole pixel units, or is src using 1/65536th
> pixel units?

dst is in whole pixels, src in 1/65536 yes, I will clarify.
 
> Asking because UAPI has src rect in 16.16 fixed-point, IIRC.
> 
> With that clarified:
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

[...]


-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
