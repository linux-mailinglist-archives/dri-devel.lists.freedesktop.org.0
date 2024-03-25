Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C188A211
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74B310E457;
	Mon, 25 Mar 2024 13:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Iu0rrS7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AF510E457
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4VxfV6AgdvjxX73/hvblu3nE3rarhlINIjC7Zy1R/s=; b=Iu0rrS7hMztjMZZAKOC2wjPC+F
 PNenBVAqGdLM7qPpRe+UjzaBbZYJzeUxxaAhOpOJLv5yi8VdPMhYpxTcDiyLT5Wh1V55rEdVSNi/7
 +UKkXblvWTtArH94/XkpoAAQCrNnk6yNBnSUaSvsEjn80fZVFtzaDxZMjvP2loZHleIAt0J+NV19x
 oe+Jnj/aoUbQ9xLs8yXY0PAV2PVjLgvt8OVFHrpisfcTy8Cwgb7gmfwOD2gApLSqwORcvtNuYP4g8
 LoR5NaQ6/ENDayEaHFowS3dZWiw6Nyyu50f1BBzJfUs2lrGyHTofcvwhxbDM6wYUmugPaK3U1F+u5
 WUO10J5A==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rokRM-00F4yE-SW; Mon, 25 Mar 2024 14:32:41 +0100
Message-ID: <cae591ee-cd61-421c-b3b4-810790836f1b@igalia.com>
Date: Mon, 25 Mar 2024 10:32:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-3-e610cbd03f52@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240313-yuv-v5-3-e610cbd03f52@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/13/24 14:44, Louis Chauvet wrote:
> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
>   drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
>   drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++------
>   3 files changed, 73 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index c6d9b4a65809..da0651a94c9b 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
>   
>   	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
>   
> +	/*
> +	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> +	 * complexity to avoid poor blending performance.
> +	 *
> +	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
> +	 * buffer.
> +	 */
>   	for (size_t y = 0; y < crtc_y_limit; y++) {
>   		fill_background(&background_color, output_buffer);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index b4b357447292..18086423a3a7 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,6 +25,17 @@
>   
>   #define VKMS_LUT_SIZE 256
>   
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
>   struct vkms_frame_info {
>   	struct drm_framebuffer *fb;
>   	struct drm_rect src, dst;
> @@ -52,6 +63,8 @@ struct vkms_writeback_job {
>    * vkms_plane_state - Driver specific plane state

It should be "* struct vkms_plane_state - Driver specific plane state".

>    * @base: base plane state
>    * @frame_info: data required for composing computation
> + * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
> + * ensure that this pointer is valid
>    */
>   struct vkms_plane_state {
>   	struct drm_shadow_plane_state base;
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 172830a3936a..6e3dc8682ff9 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -9,6 +9,18 @@
>   
>   #include "vkms_formats.h"
>   
> +/**
> + * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + *
> + * The caller must ensure that the framebuffer associated with this request uses a pixel format
> + * where block_h == block_w == 1.
> + * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
> + * outside of the buffer.
> + */
>   static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>   {
>   	struct drm_framebuffer *fb = frame_info->fb;
> @@ -17,18 +29,22 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>   			      + (x * fb->format->cpp[0]);
>   }
>   
> -/*
> - * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
> +/**
> + * packed_pixels_addr() - Get the pointer to the block containing the pixel at the given
> + * coordinates
>    *
>    * @frame_info: Buffer metadata
> - * @x: The x(width) coordinate of the 2D buffer
> - * @y: The y(Heigth) coordinate of the 2D buffer
> + * @x: The x(width) coordinate inside the plane
> + * @y: The y(height) coordinate inside the plane

I would add a space after x and y.

>    *
>    * Takes the information stored in the frame_info, a pair of coordinates, and
>    * returns the address of the first color channel.
>    * This function assumes the channels are packed together, i.e. a color channel
>    * comes immediately after another in the memory. And therefore, this function
>    * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + *
> + * The caller must ensure that the framebuffer associated with this request uses a pixel format
> + * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
>    */
>   static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>   				int x, int y)
> @@ -53,6 +69,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
>   	return x;
>   }
>   
> +/*
> + * The following  functions take pixel data from the buffer and convert them to the format

Double-spacing.

> + * ARGB16161616 in out_pixel.
> + *
> + * They are used in the `vkms_compose_row` function to handle multiple formats.

For cross-referencing functions, we use vkms_compose_row() [1].

[1] 
https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-references

> + */
> +
>   static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
>   	/*
> @@ -145,12 +168,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>   }
>   
>   /*
> - * The following  functions take an line of argb_u16 pixels from the
> - * src_buffer, convert them to a specific format, and store them in the
> - * destination.
> + * The following functions take one argb_u16 pixel and convert it to a specific format. The

For cross-referencing structs, look here [1].

> + * result is stored in @dst_pixels.
>    *
> - * They are used in the `compose_active_planes` to convert and store a line
> - * from the src_buffer to the writeback buffer.
> + * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to

Same.

> + * the writeback buffer.
>    */
>   static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>   {
> @@ -216,6 +238,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>   	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
>   }
>   
> +/**
> + * Generic loop for all supported writeback format. It is executed just after the blending to
> + * write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>   void vkms_writeback_row(struct vkms_writeback_job *wb,
>   			const struct line_buffer *src_buffer, int y)
>   {
> @@ -229,6 +259,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   		wb->pixel_write(dst_pixels, &in_pixels[x]);
>   }
>   
> +/**

Where is the function name?

> + * Retrieve the correct read_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>   void *get_pixel_conversion_function(u32 format)
>   {
>   	switch (format) {
> @@ -247,6 +284,13 @@ void *get_pixel_conversion_function(u32 format)
>   	}
>   }
>   
> +/**

Same.

Best Regards,
- Maíra

> + * Retrieve the correct write_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>   void *get_pixel_write_function(u32 format)
>   {
>   	switch (format) {
> 
