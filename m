Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD708699A8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6C010E8C4;
	Tue, 27 Feb 2024 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="c0yxvVGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A210E8A4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C54CDC000F;
 Tue, 27 Feb 2024 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUOCVxfpOI9uiHHy1Cy0BnVynULM022d0cPPHRoVqbw=;
 b=c0yxvVGn99xoQcWd5VVOwbG+XxEzwO3fuHzxkATT/dylpI9GjiWsbZ0UCJimKTPH1ow6OF
 HL6zNPACnOGa3dZJjYRkRpfGyFOBHx0Rz2KDVvn3vccHuOIwiA5SnD1uWWglxSJKrIJYVX
 8UJ2Kqglz/Pv0f+jAjrtaM3YcJXgu86e5xIbiwVibz/hxN1TRI8TDeGSWZ/oFdoQd9FgWZ
 atPWxkiuyWx+Au40C2o+vxJjzP58kSwoquvZLEVIxGGvA0uVzJ6KmU+m5RZCQEPFp2rcSB
 O5GKBnZgIPAWoZ+vuJ6IOJz9qQ9R+EAMxhga8l5AQoO3d+ZNLxu9tFItJvRf2A==
Date: Tue, 27 Feb 2024 16:02:10 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v3 3/9] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <Zd35csjqRMstzElA@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-3-ff662f0994db@bootlin.com>
 <406988be-48a4-4762-9c03-7a27c8e7b91e@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <406988be-48a4-4762-9c03-7a27c8e7b91e@riseup.net>
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

Le 26/02/24 - 10:07, Arthur Grillo a écrit :
> 
> 
> On 26/02/24 05:46, Louis Chauvet wrote:
> > Add some documentation on pixel conversion functions.
> > Update of outdated comments for pixel_write functions.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c |  4 +++
> >  drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
> >  drivers/gpu/drm/vkms/vkms_formats.c  | 58 ++++++++++++++++++++++++++++++------
> >  3 files changed, 66 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index c6d9b4a65809..5b341222d239 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -189,6 +189,10 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> >  
> > +	/*
> > +	 * The planes are composed line-by-line. It is a necessary complexity to avoid poor
> > +	 * blending performance.
> 
> At this moment in the series, you have not yet reintroduced the
> line-by-line algorithm yet. Maybe it's better to add this comment when
> you do.

Is it better with this:

	/*
	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
	 * complexity to avoid poor blending performance.
	 *
	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
	 * buffer.
	 */
 
> Also, I think it's good to give more context, like:
> "The planes are composed line-by-line, instead of pixel-by-pixel"

And after PATCHv3 5/9:

	/*
	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
	 * complexity to avoid poor blending performance.
	 *
	 * The function pixel_read_line callback is used to read a line, using an efficient 
	 * algorithm for a specific format, into the staging buffer.
	 */

Kind regards,
Louis Chauvet

> Best Regards,
> ~Arthur Grillo

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
