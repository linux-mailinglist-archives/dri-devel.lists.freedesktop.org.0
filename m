Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7043D89B935
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEE4112211;
	Mon,  8 Apr 2024 07:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y3M+f3+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9401112203
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:50:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A357E000F;
 Mon,  8 Apr 2024 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712562625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8929Ht2F0eqnJanMo124GV2zt49aSsSpdMeXmcF5Ky0=;
 b=Y3M+f3+YLeI2D6jgBWix/2Ap9dYrF463ZYyYtwkrJJzJgPOVqJlV3qGT6HjIQHKww52/YO
 vD6s7/eEtJiQ0JfiW7XJNUs+msy7VbL/V0ktJW0/QhHr4ZUlR3LkzqTQsOA0FsTeeDc9/M
 9NV1G6DVkbr17N80sywHgFJMRsUc8mtaQYB729Gn211hPbD6VXpq9Ax5RN2fDhI8WZs1D8
 AqzKsL7z2CH/33v5gjn2MmkWoy5mfXfUIRbVVe1twEYyXwNwbPsLVC+6CexQFsnJtk0dZ2
 h3CjYt0WJWXfa4kTHK77Zm9kPPxGLzAH8R9Ch/T7T92+8aMKOUOq2RJneQUDpg==
Date: Mon, 8 Apr 2024 09:50:20 +0200
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 16/16] drm/vkms: Add support for DRM_FORMAT_R*
Message-ID: <ZhOhvM3HTsxTEXTT@louis-chauvet-laptop>
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-16-e610cbd03f52@bootlin.com>
 <20240328160057.124b32c4.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240328160057.124b32c4.pekka.paalanen@collabora.com>
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

Le 28/03/24 - 16:00, Pekka Paalanen a écrit :
> On Wed, 13 Mar 2024 18:45:10 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > This add the support for:
> > - R1/R2/R4/R8
> > 
> > R1 format was tested with [1] and [2].
> > 
> > [1]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com
> > [2]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com/
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_formats.c | 100 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_plane.c   |   6 ++-
> >  2 files changed, 105 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 863fc91d6d48..cbb2ec09564a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -201,6 +201,11 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
> >  	return out_pixel;
> >  }
> >  
> > +static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
> > +{
> > +	return argb_u16_from_u8888(255, gray, gray, gray);
> > +}
> > +
> >  VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> >  							    struct conversion_matrix *matrix)
> >  {
> > @@ -269,6 +274,89 @@ static void black_to_argb_u16(const struct vkms_plane_state *plane, int x_start,
> >  	}
> >  }
> >  
> > +static void Rx_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			 int y_start, enum pixel_read_direction direction, int count,
> > +			 struct pixel_argb_u16 out_pixel[], u8 bit_per_pixel, u8 lum_per_level)
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> 
> Maybe assert that rem_y = 0? Or block_h = 1.

Done for the v6.
 
> > +	int bit_offset = (int)rem_x * bit_per_pixel;
> 
> Why cast rem_x to int when it was defined to be int?

Because it was not the case for my first implementation, and I miss this 
cast... Thanks.

> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +	int mask = (0x1 << bit_per_pixel) - 1;
> 
> Since mask will interact with u8, it should be unsigned too.

Ok, I will change it for the v6.

> > +
> > +	if (direction == READ_LEFT_TO_RIGHT || direction == READ_RIGHT_TO_LEFT) {
> > +		int restart_bit_offset = 0;
> > +		int step_bit_offset = bit_per_pixel;
> > +
> > +		if (direction == READ_RIGHT_TO_LEFT) {
> > +			restart_bit_offset = 8 - bit_per_pixel;
> > +			step_bit_offset = -bit_per_pixel;
> > +		}
> > +
> > +		while (out_pixel < end) {
> > +			u8 val = (*src_pixels & (mask << bit_offset)) >> bit_offset;
> 
> or shorter: (*src_pixels >> bit_offset) & mask
> 
> However, shouldn't the first pixel be on the high bits?

Obviously yes... I missunderstood it... fixed in the v6 (and it will be 
fixed in the next iteration of my igt series).

> That how I would understand the comments in drm_fourcc.h.
> 
> Again a reason to avoid a solid color fill in IGT.

Yes, but in this case I wrote the IGT test too... So "wrong + wrong = 
test SUCCESS" :)

There are some patterns in IGT, but they are only for "color". None of 
them are available for "black and white"/"gray" formats.

> > +
> > +			*out_pixel = argb_u16_from_gray8(val * lum_per_level);
> > +
> > +			bit_offset += step_bit_offset;
> > +			if (bit_offset < 0 || 8 <= bit_offset) {
> > +				bit_offset = restart_bit_offset;
> > +				src_pixels += step;
> > +			}
> > +			out_pixel += 1;
> > +		}
> > +	} else if (direction == READ_TOP_TO_BOTTOM || direction == READ_BOTTOM_TO_TOP) {
> > +		while (out_pixel < end) {
> > +			u8 val = (*src_pixels & (mask << bit_offset)) >> bit_offset;
> > +			*out_pixel = argb_u16_from_gray8(val * lum_per_level);
> > +			src_pixels += step;
> > +			out_pixel += 1;
> > +		}
> > +	}
> > +}
> > +
> > +static void R1_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			 int y_start, enum pixel_read_direction direction, int count,
> > +			 struct pixel_argb_u16 out_pixel[])
> > +{
> > +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 1, 0xFF);
> > +}
> > +
> > +static void R2_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			 int y_start, enum pixel_read_direction direction, int count,
> > +			 struct pixel_argb_u16 out_pixel[])
> > +{
> > +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 2, 0x55);
> > +}
> > +
> > +static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			 int y_start, enum pixel_read_direction direction, int count,
> > +			 struct pixel_argb_u16 out_pixel[])
> > +{
> > +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 4, 0x11);
> > +}
> > +
> > +static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			 int y_start, enum pixel_read_direction direction, int count,
> > +			 struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> 
> Assert on block size?

Fixed in v6.

> > +
> > +	while (out_pixel < end) {
> > +		*out_pixel = argb_u16_from_gray8(*src_pixels);
> > +		src_pixels += step;
> > +		out_pixel += 1;
> > +	}
> > +}
> > +
> >  static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> >  			       enum pixel_read_direction direction, int count,
> >  			       struct pixel_argb_u16 out_pixel[])
> > @@ -582,6 +670,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >  	case DRM_FORMAT_YVU422:
> >  	case DRM_FORMAT_YVU444:
> >  		return &planar_yuv_read_line;
> > +	case DRM_FORMAT_R1:
> > +		return &R1_read_line;
> > +	case DRM_FORMAT_R2:
> > +		return &R2_read_line;
> > +	case DRM_FORMAT_R4:
> > +		return &R4_read_line;
> > +	case DRM_FORMAT_R8:
> > +		return &R8_read_line;
> >  	default:
> >  		/*
> >  		 * This is a bug in vkms_plane_atomic_check. All the supported
> > @@ -855,6 +951,10 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> >  	case DRM_FORMAT_ARGB16161616:
> >  	case DRM_FORMAT_XRGB16161616:
> >  	case DRM_FORMAT_RGB565:
> > +	case DRM_FORMAT_R1:
> > +	case DRM_FORMAT_R2:
> > +	case DRM_FORMAT_R4:
> > +	case DRM_FORMAT_R8:
> >  		/*
> >  		 * Those formats are supported, but they don't need a conversion matrix. Return
> 
> It is strange that you need to list irrelevant formats here.

It is not needed anymore.

Thanks for your review,
Louis Chauvet

> 
> >  		 * a valid pointer to avoid kernel panic in case this matrix is used/checked
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index e21cc92cf497..dc9d62acf350 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -29,7 +29,11 @@ static const u32 vkms_formats[] = {
> >  	DRM_FORMAT_YUV444,
> >  	DRM_FORMAT_YVU420,
> >  	DRM_FORMAT_YVU422,
> > -	DRM_FORMAT_YVU444
> > +	DRM_FORMAT_YVU444,
> > +	DRM_FORMAT_R1,
> > +	DRM_FORMAT_R2,
> > +	DRM_FORMAT_R4,
> > +	DRM_FORMAT_R8
> >  };
> >  
> >  static struct drm_plane_state *
> > 
> 
> Thanks,
> pq



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
