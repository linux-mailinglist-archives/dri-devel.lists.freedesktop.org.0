Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F7846B54
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 09:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CED410ECB3;
	Fri,  2 Feb 2024 08:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="VdRNRtAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809AA10EB79
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EF0g8hdn4k4CWjdo642zXS4RArnTqN69gAhvwGxtLbk=; b=VdRNRtAHRt463KLtDefQmCHvRa
 /shMC0j+QlL/+VkxfWMMCPF2tKtgiKSjdAf6r1rO9fLqrNbL3al1N3ibcQq05Fr7L0kU989hdDiEc
 t2aJOLPAqDSpNQT3vsx5P1p+xPGBTTdbjtOtAQG3fGTyfYTcc7EVzNULQlLHldnEg78PrIo3DoNfv
 pJuAVLFeI4fXmdNyzzWoSAoYfSsO2tzXf3cr3eLCd34w+GQCNeJFtW3ZehsWHCTmqm7iulcfZ+uMi
 Wjmzx+695aVRQ3lzVrrLuyuLfj677z8dOJS0hZ6R6nQYivwrAez+F6SKgFD6UuSRPMmcFMgvn0kiN
 IlwRRxvA==;
Received: from [194.136.85.206] (port=38564 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rVpKf-0000Uh-1Q;
 Fri, 02 Feb 2024 10:55:33 +0200
Date: Fri, 2 Feb 2024 10:55:22 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240202105522.43128e19@eldfell>
In-Reply-To: <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NCwbe5RWX0/knK6zyf.GJuP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/NCwbe5RWX0/knK6zyf.GJuP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 01 Feb 2024 18:31:32 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Change the composition algorithm to iterate over pixels instead of lines.
> It allows a simpler management of rotation and pixel access for complex f=
ormats.
>=20
> This new algorithm allows read_pixel function to have access to x/y
> coordinates and make it possible to read the correct thing in a block
> when block_w and block_h are not 1.
> The iteration pixel-by-pixel in the same method also allows a simpler
> management of rotation with drm_rect_* helpers. This way it's not needed
> anymore to have misterious switch-case distributed in multiple places.

Hi,

there was a very good reason to write this code using lines:
performance. Before lines, it was indeed operating on individual pixels.

Please, include performance measurements before and after this series
to quantify the impact on the previously already supported pixel
formats, particularly the 32-bit-per-pixel RGB variants.

VKMS will be used more and more in CI for userspace projects, and
performance actually matters there.

I'm worrying that this performance degradation here is significant. I
believe it is possible to keep blending with lines, if you add new line
getters for reading from rotated, sub-sampled etc. images. That way you
don't have to regress the most common formats' performance.


Thanks,
pq

>=20
> This patch is tested with IGT:
> - kms_plane@pixel_format
> - kms_plane@pixel-format-source-clamping
> - kms_plane@plane-position-covered
> - kms_plane@plane-position-hole
> - kms_plane@plane-position-hole-dpms
> - kms_plane@plane-panning-top-left
> - kms_plane@plane-panning-bottom-right
> - kms_plane@test-odd-size-with-yuv - See [1]
> - kms_cursor_crc@cursor-size-change
> - kms_cursor_crc@cursor-alpha-opaque
> - kms_cursor_crc@cursor-alpha-transparent
> - kms_cursor_crc@cursor-dpms
> - kms_cursor_crc@cursor-onscreen-*
> - kms_cursor_crc@cursor-offscreen-*
> - kms_cursor_crc@cursor-sliding-*
> - kms_cursor_crc@cursor-random-*
> - kms_cursor_crc@cursor-rapid-movement-* - FAIL, but with Overflow of
> CRC buffer
> - kms_rotation_crc@primary-rotation-* - See [1]
> - kms_rotation_crc@sprite-rotation-* - See [1]
> - kms_rotation_crc@cursor-rotation-* - See [1]
> - kms_rotation_crc@sprite-rotation-90-pos-100-0 - See [1]
> - kms_rotation_crc@multiplane-rotation - See [1]
> - kms_rotation_crc@multiplane-rotation-cropping-* - See [1]
>=20
> [1]: https://lore.kernel.org/igt-dev/20240201-kms_tests-v1-0-bc34c5d28b3f=
@bootlin.com/T/#t
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  97 +++++++++-----
>  drivers/gpu/drm/vkms/vkms_drv.h      |  21 ++-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 250 ++++++++++++++++++-----------=
------
>  drivers/gpu/drm/vkms/vkms_plane.c    |  13 +-
>  4 files changed, 221 insertions(+), 160 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 3c99fb8b54e2..4c5439209907 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -43,7 +43,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info =
*frame_info,
>  {
>  	int x_dst =3D frame_info->dst.x1;
>  	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> +	struct pixel_argb_u16 *in =3D stage_buffer->pixels + x_dst;
>  	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
>  			    stage_buffer->n_pixels);
> =20
> @@ -55,33 +55,6 @@ static void pre_mul_alpha_blend(struct vkms_frame_info=
 *frame_info,
>  	}
>  }
> =20
> -static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> -{
> -	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> -		return drm_rect_height(&frame_info->rotated) - y - 1;
> -
> -	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
> -	case DRM_MODE_ROTATE_90:
> -		return frame_info->rotated.x2 - y - 1;
> -	case DRM_MODE_ROTATE_270:
> -		return y + frame_info->rotated.x1;
> -	default:
> -		return y;
> -	}
> -}
> -
> -static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> -{
> -	if (drm_rotation_90_or_270(frame_info->rotation)) {
> -		if (pos >=3D 0 && pos < drm_rect_width(&frame_info->rotated))
> -			return true;
> -	} else {
> -		if (pos >=3D frame_info->rotated.y1 && pos < frame_info->rotated.y2)
> -			return true;
> -	}
> -
> -	return false;
> -}
> =20
>  static void fill_background(const struct pixel_argb_u16 *background_colo=
r,
>  			    struct line_buffer *output_buffer)
> @@ -182,18 +155,74 @@ static void blend(struct vkms_writeback_job *wb,
>  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> =20
>  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> +	size_t crtc_x_limit =3D crtc_state->base.crtc->mode.hdisplay;
> =20
> +	/*
> +	 * Iterating over each pixel to simplify the handling of rotations by u=
sing drm_rect_*
> +	 * helpers.
> +	 * Iteration per pixel also allosw a simple management of complex pixel=
 formats.
> +	 *
> +	 * If needed, this triple loop might be a good place for optimizations.
> +	 */
>  	for (size_t y =3D 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> -			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> -
> -			if (!check_limit(plane[i]->frame_info, y_pos))
> -				continue;
> -
> -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> +			for (size_t x =3D 0; x < crtc_x_limit; x++) {
> +				/*
> +				 * @x and @y are the coordinate in the output crtc.
> +				 * @dst_px is used to easily check if a pixel must be blended.
> +				 * @src_px is used to handle rotation. Just before blending, it
> +				 *  will contain the coordinate of the wanted source pixel in
> +				 *  the source buffer.
> +				 * @tmp_src is the conversion of src rectangle to integer.
> +				 */
> +
> +				struct drm_rect dst_px =3D DRM_RECT_INIT(x, y, 1, 1);
> +				struct drm_rect src_px =3D DRM_RECT_INIT(x, y, 1, 1);
> +				struct drm_rect tmp_src;
> +
> +				drm_rect_fp_to_int(&tmp_src, &plane[i]->frame_info->src);
> +
> +				/*
> +				 * Check that dst_px is inside the plane output
> +				 * Note: This is destructive for dst_px, if you need this
> +				 * rectangle you have to do a copy
> +				 */
> +				if (!drm_rect_intersect(&dst_px, &plane[i]->frame_info->dst))
> +					continue;
> +
> +				/*
> +				 * Transform the coordinate x/y from the crtc to coordinates into
> +				 * coordinates for the src buffer.
> +				 *
> +				 * First step is to cancel the offset of the dst buffer.
> +				 * Then t will have to invert the rotation. This assumes that
> +				 * dst =3D drm_rect_rotate(src, rotation) (dst and src have the
> +				 * space size, but can be rotated).
> +				 * And then, apply the offset of the source rectangle to the
> +				 * coordinate.
> +				 */
> +				drm_rect_translate(&src_px, -plane[i]->frame_info->dst.x1,
> +						   -plane[i]->frame_info->dst.y1);
> +				drm_rect_rotate_inv(&src_px,
> +						    drm_rect_width(&tmp_src),
> +						    drm_rect_height(&tmp_src),
> +						    plane[i]->frame_info->rotation);
> +				drm_rect_translate(&src_px, tmp_src.x1, tmp_src.y1);
> +
> +				/*
> +				 * Now, as the src_px contains the correct position, we can use
> +				 * it to convert the pixel color
> +				 */
> +				plane[i]->pixel_read(plane[i]->frame_info,
> +						     src_px.x1,
> +						     src_px.y1,
> +						     &stage_buffer->pixels[x],
> +						     plane[i]->base.base.color_encoding,
> +						     plane[i]->base.base.color_range);
> +			}
>  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>  					    output_buffer);
>  		}
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index cb20bab26cae..ba3c063adc5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,10 +25,20 @@
> =20
>  #define VKMS_LUT_SIZE 256
> =20
> +/**
> + * struct vkms_frame_info - structure to store the state of a frame
> + *
> + * @fb: backing drm framebuffer
> + * @src: source rectangle of this frame in the source framebuffer
> + * @dst: destination rectangle in the crtc buffer
> + * @map: see drm_shadow_plane_state@data
> + * @rotation: rotation applied to the source.
> + *
> + * @src and @dst should have the same size modulo the rotation.
> + */
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> -	struct drm_rect rotated;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	unsigned int rotation;
>  };
> @@ -51,14 +61,15 @@ struct vkms_writeback_job {
>  /**
>   * typedef pixel_read_t - These functions are used to read the pixels in=
 the source frame, convert
>   * them to argb16 and write them to out_pixel.
> - * It assumes that src_pixels point to a valid pixel (not a block, or a =
block of 1x1 pixel)
>   *
> - * @src_pixels: Source pointer to a pixel
> + * @frame_info: Frame used as source for the pixel value
> + * @x: X (width) coordinate in the source buffer
> + * @y: Y (height) coordinate in the source buffer
>   * @out_pixel: Pointer where to write the pixel value
>   * @encoding: Color encoding to use (mainly used for YUV formats)
>   * @range: Color range to use (mainly used for YUV formats)
>   */
> -typedef void (*pixel_read_t)(u8 **src_pixels, int y,
> +typedef void (*pixel_read_t)(struct vkms_frame_info *frame_info, int x, =
int y,
>  			     struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encond=
ing,
>  			     enum drm_color_range range);
> =20
> @@ -66,6 +77,8 @@ typedef void (*pixel_read_t)(u8 **src_pixels, int y,
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
> + * @pixel_read: function to read a pixel in this plane. The creator of a=
 vkms_plane_state must
> + * ensure that this pointer is valid
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index c6376db58d38..8ff85ffda94f 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,79 +11,88 @@
> =20
>  #include "vkms_formats.h"
> =20
> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y, size_t index)
> +
> +/**
> + * packed_pixels_offset() - Get the offset of the block containing the p=
ixel at coordinates x/y
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + * @plane: The index of the plane to use
> + *
> + * The caller must be aware that this offset is not always a pointer to =
a pixel. If individual
> + * pixel values are needed, they have to be extracted from the block.
> + */
> +static size_t packed_pixels_offset(const struct vkms_frame_info *frame_i=
nfo, int x, int y, size_t plane)
>  {
>  	struct drm_framebuffer *fb =3D frame_info->fb;
> -
> -	return fb->offsets[index] + (y * fb->pitches[index])
> -				  + (x * fb->format->cpp[index]);
> +	const struct drm_format_info *format =3D frame_info->fb->format;
> +	/* Directly using x and y to multiply pitches and format->ccp is not su=
fficient because
> +	 * in some formats a block can represent multiple pixels.
> +	 *
> +	 * Dividing x and y by the block size allows to extract the correct off=
set of the block
> +	 * containing the pixel.
> +	 */
> +	return fb->offsets[plane] +
> +	       (y / drm_format_info_block_width(format, plane)) * fb->pitches[p=
lane] +
> +	       (x / drm_format_info_block_height(format, plane)) * format->char=
_per_block[plane];
>  }
> =20
>  /*
> - * packed_pixels_addr - Get the pointer to pixel of a given pair of coor=
dinates
> + * packed_pixels_addr - Get the pointer to the block containing the pixe=
l at the given coordinate
>   *
>   * @frame_info: Buffer metadata
> - * @x: The x(width) coordinate of the 2D buffer
> - * @y: The y(Heigth) coordinate of the 2D buffer
> + * @x: The x(width) coordinate inside the 2D buffer
> + * @y: The y(Heigth) coordinate inside the 2D buffer
>   * @index: The index of the plane on the 2D buffer
>   *
> - * Takes the information stored in the frame_info, a pair of coordinates=
, and
> - * returns the address of the first color channel on the desired index. =
The
> - * format's specific subsample is applied.
> + * Takes the information stored in the frame_info, a pair of coordinates=
, and returns the address
> + * of the block containing this pixel.
> + * The caller must be aware that this pointer is sometimes not directly =
a pixel, it needs some
> + * additional work to extract pixel color from this block.
>   */
>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>  				int x, int y, size_t index)
>  {
> -	int vsub =3D index =3D=3D 0 ? 1 : frame_info->fb->format->vsub;
> -	int hsub =3D index =3D=3D 0 ? 1 : frame_info->fb->format->hsub;
> -	size_t offset =3D pixel_offset(frame_info, x / hsub, y / vsub, index);
> -
> -	return (u8 *)frame_info->map[0].vaddr + offset;
> +	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info=
, x, y, index);
>  }
> =20
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y, size_t index)
> +static void ARGB8888_to_argb_u16(struct vkms_frame_info *frame_info, int=
 x, int y,
> +				 struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encoding,
> +				 enum drm_color_range range)
>  {
> -	int x_src =3D frame_info->src.x1 >> 16;
> -	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> -
> -	return packed_pixels_addr(frame_info, x_src, y_src, index);
> -}
> +	u8 *src_pixel =3D packed_pixels_addr(frame_info, x, y, 0);
> =20
> -static int get_x_position(const struct vkms_frame_info *frame_info, int =
limit, int x)
> -{
> -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> -		return limit - x - 1;
> -	return x;
> -}
> -
> -static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 =
*out_pixel,
> -				 enum drm_color_encoding encoding, enum drm_color_range range)
> -{
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
>  	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>  	 * the best color value in a pixel format with more possibilities.
>  	 * A similar idea applies to others RGB color conversions.
>  	 */
> -	out_pixel->a =3D (u16)src_pixels[0][3] * 257;
> -	out_pixel->r =3D (u16)src_pixels[0][2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[0][1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0][0] * 257;
> +	out_pixel->a =3D (u16)src_pixel[3] * 257;
> +	out_pixel->r =3D (u16)src_pixel[2] * 257;
> +	out_pixel->g =3D (u16)src_pixel[1] * 257;
> +	out_pixel->b =3D (u16)src_pixel[0] * 257;
>  }
> =20
> -static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 =
*out_pixel,
> -				 enum drm_color_encoding encoding, enum drm_color_range range)
> +static void XRGB8888_to_argb_u16(struct vkms_frame_info *frame_info, int=
 x, int y,
> +				 struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encoding,
> +				 enum drm_color_range range)
>  {
> +	u8 *src_pixel =3D packed_pixels_addr(frame_info, x, y, 0);
>  	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D (u16)src_pixels[0][2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[0][1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0][0] * 257;
> +	out_pixel->r =3D (u16)src_pixel[2] * 257;
> +	out_pixel->g =3D (u16)src_pixel[1] * 257;
> +	out_pixel->b =3D (u16)src_pixel[0] * 257;
>  }
> =20
> -static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_=
u16 *out_pixel,
> -				     enum drm_color_encoding encoding, enum drm_color_range range)
> +static void ARGB16161616_to_argb_u16(struct vkms_frame_info *frame_info,=
 int x, int y,
> +				     struct pixel_argb_u16 *out_pixel,
> +				     enum drm_color_encoding encoding,
> +				     enum drm_color_range range)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels[0];
> +	u8 *src_pixel =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u16 *pixels =3D (u16 *)src_pixel;
> =20
>  	out_pixel->a =3D le16_to_cpu(pixels[3]);
>  	out_pixel->r =3D le16_to_cpu(pixels[2]);
> @@ -91,10 +100,13 @@ static void ARGB16161616_to_argb_u16(u8 **src_pixels=
, struct pixel_argb_u16 *out
>  	out_pixel->b =3D le16_to_cpu(pixels[0]);
>  }
> =20
> -static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_=
u16 *out_pixel,
> -				     enum drm_color_encoding encoding, enum drm_color_range range)
> +static void XRGB16161616_to_argb_u16(struct vkms_frame_info *frame_info,=
 int x, int y,
> +				     struct pixel_argb_u16 *out_pixel,
> +				     enum drm_color_encoding encoding,
> +				     enum drm_color_range range)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels[0];
> +	u8 *src_pixel =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u16 *pixels =3D (u16 *)src_pixel;
> =20
>  	out_pixel->a =3D (u16)0xffff;
>  	out_pixel->r =3D le16_to_cpu(pixels[2]);
> @@ -102,10 +114,12 @@ static void XRGB16161616_to_argb_u16(u8 **src_pixel=
s, struct pixel_argb_u16 *out
>  	out_pixel->b =3D le16_to_cpu(pixels[0]);
>  }
> =20
> -static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *o=
ut_pixel,
> -			       enum drm_color_encoding encoding, enum drm_color_range range)
> +static void RGB565_to_argb_u16(struct vkms_frame_info *frame_info, int x=
, int y,
> +			       struct pixel_argb_u16 *out_pixel, enum drm_color_encoding enco=
ding,
> +			       enum drm_color_range range)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels[0];
> +	u8 *src_pixel =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u16 *pixels =3D (u16 *)src_pixel;
> =20
>  	s64 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -121,12 +135,19 @@ static void RGB565_to_argb_u16(u8 **src_pixels, str=
uct pixel_argb_u16 *out_pixel
>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
> =20
> +/**
> + * ycbcr2rgb() - helper to convert ycbcr 8 bits to rbg 16 bits
> + *
> + * @m: conversion matrix to use
> + * @y, @cb, @cr: component of the ycbcr pixel
> + * @r, @g, @b: pointers to write the rbg pixel
> + */
>  static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset=
, u8 *r, u8 *g, u8 *b)
>  {
>  	s32 y_16, cb_16, cr_16;
>  	s32 r_16, g_16, b_16;
> =20
> -	y_16 =3D  y - y_offset;
> +	y_16 =3D y - y_offset;
>  	cb_16 =3D cb - 128;
>  	cr_16 =3D cr - 128;
> =20
> @@ -139,6 +160,14 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb=
, u8 cr, u8 y_offset, u8 *r,
>  	*b =3D clamp(b_16, 0, 0xffff) >> 8;
>  }
> =20
> +/**
> + * yuv_u8_to_argb_u16() - helper to convert yuv 8 bits to argb 16 bits
> + *
> + * @argb_u16: pointer to write the converted pixel
> + * @yuv_u8: pointer to the source yuv pixel
> + * @encoding: encoding to use
> + * @range: range to use
> + */
>  VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
>  					 const struct pixel_yuv_u8 *yuv_u8,
>  					 enum drm_color_encoding encoding,
> @@ -205,104 +234,89 @@ VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pi=
xel_argb_u16 *argb_u16,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(yuv_u8_to_argb_u16);
> =20
> -static void semi_planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_ar=
gb_u16 *out_pixel,
> +static void semi_planar_yuv_to_argb_u16(struct vkms_frame_info *frame_in=
fo, int x,
> +					int y, struct pixel_argb_u16 *out_pixel,
>  					enum drm_color_encoding encoding,
>  					enum drm_color_range range)
>  {
>  	struct pixel_yuv_u8 yuv_u8;
> =20
> -	yuv_u8.y =3D src_pixels[0][0];
> -	yuv_u8.u =3D src_pixels[1][0];
> -	yuv_u8.v =3D src_pixels[1][1];
> +	/* Subsampling must be applied for semi-planar yuv formats */
> +	int vsub =3D frame_info->fb->format->vsub;
> +	int hsub =3D frame_info->fb->format->hsub;
> +
> +	u8 *src_y =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u8 *src_uv =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
> +
> +	yuv_u8.y =3D src_y[0];
> +	yuv_u8.u =3D src_uv[0];
> +	yuv_u8.v =3D src_uv[1];
> =20
>  	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
>  }
> =20
> -static void semi_planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_ar=
gb_u16 *out_pixel,
> +static void semi_planar_yvu_to_argb_u16(struct vkms_frame_info *frame_in=
fo, int x,
> +					int y, struct pixel_argb_u16 *out_pixel,
>  					enum drm_color_encoding encoding,
>  					enum drm_color_range range)
>  {
>  	struct pixel_yuv_u8 yuv_u8;
> =20
> -	yuv_u8.y =3D src_pixels[0][0];
> -	yuv_u8.v =3D src_pixels[1][0];
> -	yuv_u8.u =3D src_pixels[1][1];
> +	/* Subsampling must be applied for semi-planar yuv formats */
> +	int vsub =3D frame_info->fb->format->vsub ? frame_info->fb->format->vsu=
b : 1;
> +	int hsub =3D frame_info->fb->format->hsub ? frame_info->fb->format->hsu=
b : 1;
> +	u8 *src_y =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u8 *src_vu =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
> +
> +	yuv_u8.y =3D src_y[0];
> +	yuv_u8.v =3D src_vu[0];
> +	yuv_u8.u =3D src_vu[1];
> =20
>  	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
>  }
> =20
> -static void planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u1=
6 *out_pixel,
> -				   enum drm_color_encoding encoding, enum drm_color_range range)
> +static void planar_yuv_to_argb_u16(struct vkms_frame_info *frame_info, i=
nt x, int y,
> +				   struct pixel_argb_u16 *out_pixel,
> +				   enum drm_color_encoding encoding,
> +				   enum drm_color_range range)
>  {
>  	struct pixel_yuv_u8 yuv_u8;
> =20
> -	yuv_u8.y =3D src_pixels[0][0];
> -	yuv_u8.u =3D src_pixels[1][0];
> -	yuv_u8.v =3D src_pixels[2][0];
> +	/* Subsampling must be applied for planar yuv formats */
> +	int vsub =3D frame_info->fb->format->vsub ? frame_info->fb->format->vsu=
b : 1;
> +	int hsub =3D frame_info->fb->format->hsub ? frame_info->fb->format->hsu=
b : 1;
> +
> +	u8 *src_y =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u8 *src_u =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
> +	u8 *src_v =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 2);
> +
> +	yuv_u8.y =3D src_y[0];
> +	yuv_u8.u =3D src_u[0];
> +	yuv_u8.v =3D src_v[0];
> =20
>  	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
>  }
> =20
> -static void planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_argb_u1=
6 *out_pixel,
> -				   enum drm_color_encoding encoding, enum drm_color_range range)
> +static void planar_yvu_to_argb_u16(struct vkms_frame_info *frame_info, i=
nt x, int y,
> +				   struct pixel_argb_u16 *out_pixel,
> +				   enum drm_color_encoding encoding,
> +				   enum drm_color_range range)
>  {
>  	struct pixel_yuv_u8 yuv_u8;
> =20
> -	yuv_u8.y =3D src_pixels[0][0];
> -	yuv_u8.v =3D src_pixels[1][0];
> -	yuv_u8.u =3D src_pixels[2][0];
> +	/* Subsampling must be applied for semi-planar yuv formats */
> +	int vsub =3D frame_info->fb->format->vsub ? frame_info->fb->format->vsu=
b : 1;
> +	int hsub =3D frame_info->fb->format->hsub ? frame_info->fb->format->hsu=
b : 1;
> =20
> -	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
> -}
> +	u8 *src_y =3D packed_pixels_addr(frame_info, x, y, 0);
> +	u8 *src_u =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
> +	u8 *src_v =3D packed_pixels_addr(frame_info, x / hsub, y / vsub, 2);
> =20
> -/**
> - * vkms_compose_row - compose a single row of a plane
> - * @stage_buffer: output line with the composed pixels
> - * @plane: state of the plane that is being composed
> - * @y: y coordinate of the row
> - *
> - * This function composes a single row of a plane. It gets the source pi=
xels
> - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> - * through the source pixel, reading the pixels and converting it to
> - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotat=
e-270,
> - * the source pixels are not traversed linearly. The source pixels are q=
ueried
> - * on each iteration in order to traverse the pixels vertically.
> - */
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plan=
e_state *plane, int y)
> -{
> -	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> -	struct vkms_frame_info *frame_info =3D plane->frame_info;
> -	const struct drm_format_info *frame_format =3D frame_info->fb->format;
> -	int limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), stage_buf=
fer->n_pixels);
> -	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
> -
> -	enum drm_color_encoding encoding =3D plane->base.base.color_encoding;
> -	enum drm_color_range range =3D plane->base.base.color_range;
> -
> -	for (size_t i =3D 0; i < frame_format->num_planes; i++)
> -		src_pixels[i] =3D get_packed_src_addr(frame_info, y, i);
> -
> -	for (size_t x =3D 0; x < limit; x++) {
> -		int x_pos =3D get_x_position(frame_info, limit, x);
> -
> -		bool shoud_inc =3D !((x + 1) % frame_format->num_planes);
> -
> -		if (drm_rotation_90_or_270(frame_info->rotation)) {
> -			for (size_t i =3D 0; i < frame_format->num_planes; i++) {
> -				src_pixels[i] =3D get_packed_src_addr(frame_info,
> -								    x + frame_info->rotated.y1, i);
> -				if (!i || shoud_inc)
> -					src_pixels[i] +=3D frame_format->cpp[i] * y;
> -			}
> -		}
> -
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos], encoding, range);
> -
> -		for (size_t i =3D 0; i < frame_format->num_planes; i++) {
> -			if (!i || shoud_inc)
> -				src_pixels[i] +=3D frame_format->cpp[i];
> -		}
> -	}
> +	yuv_u8.y =3D src_y[0];
> +	yuv_u8.v =3D src_u[0];
> +	yuv_u8.u =3D src_v[0];
> +
> +	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 932736fc3ee9..d818ed246a46 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -118,13 +118,20 @@ static void vkms_plane_atomic_update(struct drm_pla=
ne *plane,
>  		return;
> =20
>  	fmt =3D fb->format->format;
> +	pixel_read_t pixel_read =3D get_pixel_conversion_function(fmt);
> +=09
> +	if (!pixel_read) {
> +		DRM_WARN("The requested pixel format is not supported by VKMS. The new=
 state is "
> +			 "not applied.\n");
> +		return;
> +	}
> +
>  	vkms_plane_state =3D to_vkms_plane_state(new_state);
>  	shadow_plane_state =3D &vkms_plane_state->base;
> =20
>  	frame_info =3D vkms_plane_state->frame_info;
>  	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>  	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> -	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
>  	frame_info->fb =3D fb;
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
>  	drm_framebuffer_get(frame_info->fb);
> @@ -134,10 +141,8 @@ static void vkms_plane_atomic_update(struct drm_plan=
e *plane,
>  						     DRM_MODE_REFLECT_X |
>  						     DRM_MODE_REFLECT_Y);
> =20
> -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
> -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	vkms_plane_state->pixel_read =3D get_pixel_conversion_function(fmt);
> +	vkms_plane_state->pixel_read =3D pixel_read;
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20


--Sig_/NCwbe5RWX0/knK6zyf.GJuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmW8rfoACgkQI1/ltBGq
qqcD6BAAnOdNQJC8hVo3awSDGlYGbQ4tQZR8OG70m55QBl41gj9gJ3N74uVpbr6e
GmL26rF8ax4gKfHHyt+HfRqlHHxWMKs7bzRVFeVf0fECbEB01lyY5wsOD1vBAHOa
EYUWXAMGnWCetzwclFMHWvGfYa0TGm4+BHOz6Yr/cwS3KPsb+gVGcccSG4yXSAkX
WfSlAZu8j6BWZk+U0brGPwdMMKJ8nU5bN9Q/o+KMoh07yV4Vnvbd6U0j+bNi7nv7
LM6Of3AqTqb+RdBMyMOyw6QreeHYCJKNwfl8f+gaStBJHE7qBhmHzUAcJtkblaWd
lHD81J4vynjPzqGJ0Ek6vUHlLsqrWaBWHd6bbUZSlX9lvhZqpRCGRpvsd89afbhb
6pYgyY6lMo5hnxDVUgpeT0xvNSXjpUi2pD+dQc7YsLL9jvXWXl11Obq2OJZiHSwg
n3wTP0qkSXYbhcVoxaaPF2b9Q+CS0I4N+Bs1ekqq+1RIsmMBw3YU8qX6/10ZcpIv
FZ+yy0esfNr7SQ08Ijtk5K43uXT74y9AWkksapobw73JFmZtQEtWVI+omInRycfF
tbF6K0Ulg4IeWOdGLYpAgtwVtyvBvMgFfSWVZnhYHnBG8rV6v0ZbEDQP9RxAtNCQ
el90LlKRUpsIK/+g0fZM/wNePQfN7OO9S2RIJF7EcGKBkffMZZg=
=OsDy
-----END PGP SIGNATURE-----

--Sig_/NCwbe5RWX0/knK6zyf.GJuP--
