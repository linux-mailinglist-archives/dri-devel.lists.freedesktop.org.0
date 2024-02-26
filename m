Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37872867608
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 14:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844910F1AF;
	Mon, 26 Feb 2024 13:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Q9HC9gdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EBF10F1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 13:08:07 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tk1BZ404zzDqG9;
 Mon, 26 Feb 2024 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708952887; bh=qitPqKYHu5SkbJi3zE8S/yb2YXcoDr4Jzx8rsJA2d/g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q9HC9gdXLpyVO/iXWdfYrJMCdrQUOQr4rdNwpkzqyHEFSDppyq0RC2XgISEqsvZ+d
 Mda5o7Z1F0QCzxx8Gk4NSq7mEkKh5oTpohLcpM+bae3ShSo8PGZpUTvLV7gb36tbHF
 1Dy7zTnM+3pb/3kICxxhLyI+Xc1QD4cGv8rs6M3U=
X-Riseup-User-ID: 2BC69804A301033890366CE1256AF965CF62B045EC3E4EC86A117B16AAEE2F45
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tk1BS1GSzzJsBS;
 Mon, 26 Feb 2024 13:07:59 +0000 (UTC)
Message-ID: <406988be-48a4-4762-9c03-7a27c8e7b91e@riseup.net>
Date: Mon, 26 Feb 2024 10:07:57 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/9] drm/vkms: write/update the documentation for pixel
 conversion and pixel write functions
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-3-ff662f0994db@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240226-yuv-v3-3-ff662f0994db@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 26/02/24 05:46, Louis Chauvet wrote:
> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  4 +++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 58 ++++++++++++++++++++++++++++++------
>  3 files changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index c6d9b4a65809..5b341222d239 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -189,6 +189,10 @@ static void blend(struct vkms_writeback_job *wb,
>  
>  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
>  
> +	/*
> +	 * The planes are composed line-by-line. It is a necessary complexity to avoid poor
> +	 * blending performance.

At this moment in the series, you have not yet reintroduced the
line-by-line algorithm yet. Maybe it's better to add this comment when
you do.

Also, I think it's good to give more context, like:
"The planes are composed line-by-line, instead of pixel-by-pixel"

Best Regards,
~Arthur Grillo

> +	 */
>  	for (size_t y = 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index b4b357447292..18086423a3a7 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,6 +25,17 @@
>  
>  #define VKMS_LUT_SIZE 256
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
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -52,6 +63,8 @@ struct vkms_writeback_job {
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
> + * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
> + * ensure that this pointer is valid
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 172830a3936a..cb7a49b7c8e7 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -9,6 +9,17 @@
>  
>  #include "vkms_formats.h"
>  
> +/**
> + * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> + * in the first plane
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + *
> + * The caller must be aware that this offset is not always a pointer to a pixel. If individual
> + * pixel values are needed, they have to be extracted from the resulting block.
> + */
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>  {
>  	struct drm_framebuffer *fb = frame_info->fb;
> @@ -17,12 +28,13 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>  			      + (x * fb->format->cpp[0]);
>  }
>  
> -/*
> - * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
> +/**
> + * packed_pixels_addr() - Get the pointer to the block containing the pixel at the given
> + * coordinates
>   *
>   * @frame_info: Buffer metadata
> - * @x: The x(width) coordinate of the 2D buffer
> - * @y: The y(Heigth) coordinate of the 2D buffer
> + * @x: The x(width) coordinate inside the plane
> + * @y: The y(height) coordinate inside the plane
>   *
>   * Takes the information stored in the frame_info, a pair of coordinates, and
>   * returns the address of the first color channel.
> @@ -53,6 +65,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
>  	return x;
>  }
>  
> +/*
> + * The following  functions take pixel data from the buffer and convert them to the format
> + * ARGB16161616 in out_pixel.
> + *
> + * They are used in the `vkms_compose_row` function to handle multiple formats.
> + */
> +
>  static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
>  	/*
> @@ -145,12 +164,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  }
>  
>  /*
> - * The following  functions take an line of argb_u16 pixels from the
> - * src_buffer, convert them to a specific format, and store them in the
> - * destination.
> + * The following functions take one argb_u16 pixel and convert it to a specific format. The
> + * result is stored in @dst_pixels.
>   *
> - * They are used in the `compose_active_planes` to convert and store a line
> - * from the src_buffer to the writeback buffer.
> + * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to
> + * the writeback buffer.
>   */
>  static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> @@ -216,6 +234,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
>  }
>  
> +/**
> + * Generic loop for all supported writeback format. It is executed just after the blending to
> + * write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>  void vkms_writeback_row(struct vkms_writeback_job *wb,
>  			const struct line_buffer *src_buffer, int y)
>  {
> @@ -229,6 +255,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
>  
> +/**
> + * Retrieve the correct read_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: 4cc of the format
> + */
>  void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
> @@ -247,6 +280,13 @@ void *get_pixel_conversion_function(u32 format)
>  	}
>  }
>  
> +/**
> + * Retrieve the correct write_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: 4cc of the format
> + */
>  void *get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
> 
