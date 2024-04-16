Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA68A77C7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98341112EC5;
	Tue, 16 Apr 2024 22:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NY/H/zv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800AA112EC4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 22:31:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E43360003;
 Tue, 16 Apr 2024 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713306664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7v5DYB4njHPlAcHMd9xQqIDDOMG4OpQi4L+t9KO0bJU=;
 b=NY/H/zv2v/HEDn/Pg2efsgz7T68/imcNoKzTDIYDjH76G2NQ+YlUrZ3xAt3UTNfbUOn1jF
 yAs8OTTKy93LG/SfP0cAkRV6bTxgrsHSvbZVamiMMkwyzFQBnEzHFp6zsbO1/m/YRitKFl
 RfQO6wqHCLK1cYzUpPdaryQr1SSEudYyYbYWjn9qZAtAUuKgLggePwLzrClZWVm7+zi2Vw
 tcXlmw8QHAG1Lpi5ZjPuMXpRqkAwzp+pKxRyHxiQkbccKSEJDzMCPkTu/N0Y5mDxEyTVOH
 RjQ69krzQAenimnFZ6DhQ+/UanJ+t9l7unrBdiBwL6wo4i9lpg5Jbje+GKnTtw==
Date: Wed, 17 Apr 2024 00:30:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 3/3] drm/fourcc: Add documentation around drm_format_info
Message-ID: <Zh78It5SLbSVZAd8@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
 <20240415150021.13d9b637.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415150021.13d9b637.pekka.paalanen@collabora.com>
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

Le 15/04/24 - 15:00, Pekka Paalanen a écrit :
> On Tue, 09 Apr 2024 12:04:07 +0200
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Let's provide more details about the drm_format_info structure because
> > its content may not be straightforward for someone not used to video
> > formats and drm internals.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  include/drm/drm_fourcc.h | 45 ++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> > index ccf91daa4307..66cc30e28f79 100644
> > --- a/include/drm/drm_fourcc.h
> > +++ b/include/drm/drm_fourcc.h
> > @@ -58,6 +58,44 @@ struct drm_mode_fb_cmd2;
> >  
> >  /**
> >   * struct drm_format_info - information about a DRM format
> > + *
> > + * A drm_format_info describes how planes and pixels are stored in memory.
> > + *
> > + * Some format like YUV can have multiple planes, counted in @num_planes. It
> > + * means that a full pixel can be stored in multiple non-continuous buffers.
> > + * For example, NV12 is a YUV format using two planes: one for the Y values and
> > + * one for the UV values.
> > + *
> > + * On each plane, the "pixel" unit can be different in case of subsampling. For
> > + * example with the NV12 format, a pixel in the UV plane is used for four pixels
> > + * in the Y plane.
> > + * The fields @hsub and @vsub are the relation between the size of the main
> > + * plane and the size of the subsampled planes in pixels:
> > + *	plane[0] width = hsub * plane[1] width
> > + *	plane[0] height = vsub * plane[1] height
> 
> This makes it sound like plane[1] would be the one determining the
> image size. It is plane[0] that determines the image size (I don't know
> of a format that would have it otherwise), and vsub and hsub are used
> as divisors. It's in their name, too: horizontal/vertical sub-sampling.
> 
> This is important for images with odd dimensions. If plane[1]
> determined the image size, it would be impossible to have odd sized
> NV12 images, for instance.
> 
> Odd dimensions also imply something about rounding the size of the
> sub-sampled planes. I guess the rounding is up, not down?

I will change the equation to:

plane[1] = plane[0] / hsub (round up)

Can a DRM maintainer confirm the rounding up?
 
> > + *
> > + * In some formats, pixels are not independent in memory. It can be a packed
> 
> "Independent in memory" sounds to me like it describes sub-sampling:
> some pixel components are shared between multiple pixels. Here you seem
> to refer to just packing: one pixel's data may take a fractional number
> of bytes.

 * In some formats, pixels are not individually addressable. It ...

> > + * representation to store more pixels per byte (for example P030 uses 4 bytes
> > + * for three 10 bit pixels). It can also be used to represent tiled formats,
> 
> s/tiled/block/
> 
> Tiling is given by format modifiers rather than formats.

Fixed in the v2.

> > + * where a continuous buffer in memory can represent a rectangle of pixels (for
> > + * example, in DRM_FORMAT_Y0L0, a buffer of 8 bytes represents a 2x2 pixel
> > + * region of the picture).
> > + *	The field @char_per_block is the size of a block on a specific plane, in
> > + *	bytes.
> > + *	The fields @block_w and @block_h are the size of a block in pixels.
> > + *
> > + * The older format representation (which only uses @cpp, kept for historical
> 
> Move the paren to: representation which only uses @cpp (kept
> 
> so that the sentence is still understandable if one skips the
> parenthesised part.

Fixed in v2.

> > + * reasons because there are a lot of places in drivers where it's used) is
> > + * assuming that a block is always 1x1 pixel.
> > + *
> > + * To keep the compatibility with older format representations and treat block
> > + * and non-block formats in the same way one should use:
> > + *	- @char_per_block to access the size of a block on a specific plane, in
> > + *	bytes.
> > + *	- drm_format_info_block_width() to access the width of a block of a
> > + *	specific plane, in pixels.
> > + *	- drm_format_info_block_height() to access the height of a block of a
> > + *	specific plane, in pixels.
> >   */
> >  struct drm_format_info {
> >  	/** @format: 4CC format identifier (DRM_FORMAT_*) */
> > @@ -97,13 +135,6 @@ struct drm_format_info {
> >  		 * formats for which the memory needed for a single pixel is not
> >  		 * byte aligned.
> >  		 *
> > -		 * @cpp has been kept for historical reasons because there are
> > -		 * a lot of places in drivers where it's used. In drm core for
> > -		 * generic code paths the preferred way is to use
> > -		 * @char_per_block, drm_format_info_block_width() and
> > -		 * drm_format_info_block_height() which allows handling both
> > -		 * block and non-block formats in the same way.
> > -		 *
> >  		 * For formats that are intended to be used only with non-linear
> >  		 * modifiers both @cpp and @char_per_block must be 0 in the
> >  		 * generic format table. Drivers could supply accurate
> > 
> 
> Other than that, sounds fine to me.
> 
> Perhaps one thing to clarify is that chroma sub-sampling and blocks are
> two different things. Chroma sub-sampling is about the resolution of
> the chroma (image). Blocks are about packing multiple pixels' components
> into a contiguous addressable block of memory. Blocks could appear
> inside a separate sub-sampled UV plane, for example.

Is this clear? i will add it just before "In some formats, 
pixels...

 * Chroma subsamping (hsub/vsub) must not be confused with pixel blocks. The
 * first describe the relation between the resolution of each color components
 * (for YUV format, the relation between the "y" resolution and the "uv"
 * resolution), the second describe the way to pack multiple pixels into one
 * contiguous block of memory (for example, DRM_FORMAT_Y0L0, one block is 2x2
 * pixels).

Thanks,
Louis Chauvet
 
> Thanks,
> pq


-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
