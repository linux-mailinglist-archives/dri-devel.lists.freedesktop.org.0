Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323419D16C8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956E710E52A;
	Mon, 18 Nov 2024 17:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bJ6ggD3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE1610E529
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 17:10:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so36789015e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731949839; x=1732554639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVCU8P/1rDkdwsbj3DoyKB90cF22kVnBKHC+JWzuvzY=;
 b=bJ6ggD3WnBK6b4e+E0CoiuMGG31nFtZnlP/IvII0eEJTrxdnlXGGqMzGNs4xJLpcCi
 8pWJZM1m83gMvYiYxfhGGn7dcPRyE3Jm1YUpMnkcftrIQuWJDTHg7hebN/AczH2vw1J/
 znB0w6Cfob5L5Rpw4rGLW+Meex/iNOztFcTCculHfbuiNOFBMlCcILhlchikURIC/nM/
 IGUUMUR8fvkowl/P9nBjzeayIHM3pcfEl2kJPj0mM8n2FtK7CB6PzPYzwjItSr/3ILop
 9jXN4bSW7a+HRsz1V4tZBwyuvoyIrj087zjr51p0AMLWXHVxMACoIm//OXBVXb8hmnCo
 Dzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731949839; x=1732554639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVCU8P/1rDkdwsbj3DoyKB90cF22kVnBKHC+JWzuvzY=;
 b=YbwXBvILifvYeRtfKatktGpCHhvOsFl5twT7UDjXY48vX/YdJI9UNNzBLCtsf4nOLY
 +VWEyvrkeH/RCJZAuawo1WcInx2k4XlYCzRs7vOIBzuaffGfKAqRVaZ4kZjycGfO50Jb
 oX23Sp3YYuaNPaIiq8FeoAps/9lgWYPVyHXiy7EaEt9uTjHsreZw2wBbC6GPm9kfiu8+
 TAk9uUQ52izJ8HrAcUyNQibxCt7EQGtrx7/75OSdEyxCMNicyokotfbbrDi65trYEb8w
 TibZEU++0EQyo4OMjgM5WFxOwDYJ46WgJ0PWjxwyF36T32Hju2QpsMnWXRjO3sVMoyhR
 lvjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqSI+y1OjvDYtWkjbDuz9tNZnf50iVjveLO8d1zL5xVwkVa8wo2auvx+mASTOSuqbzR3opJIjUa6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfWiPig4pEz3disSoKZsyWjanTy2MsXofhtb+tcrxbsfBElHwe
 6XeXj1gJR2gjfqkYfAL4gzjgs0d7Hm9F1v9larg3kK/X39IbEQvs
X-Google-Smtp-Source: AGHT+IGzZtUA/mFXZHuQqRqpaK0R98UUjrlsUVZIQgXExwKHzv7fXllbuBmBsEV40Pqxan8uG4k07w==
X-Received: by 2002:a05:600c:4595:b0:42c:b80e:5e50 with SMTP id
 5b1f17b1804b1-432df67991emr115211925e9.0.1731949838681; 
 Mon, 18 Nov 2024 09:10:38 -0800 (PST)
Received: from fedora.. ([213.94.25.69]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab76dafsm161563625e9.10.2024.11.18.09.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 09:10:38 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 helen.koike@collabora.com, jeremie.dautheribes@bootlin.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: [PATCH v13 5/9] drm/vkms: Update pixels accessor to support packed
 and multi-plane formats.
Date: Mon, 18 Nov 2024 18:10:36 +0100
Message-ID: <20241118171037.2847-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031-yuv-v13-5-bd5463126faa@bootlin.com>
References: <20241031-yuv-v13-5-bd5463126faa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

> Introduce the usage of block_h/block_w to compute the offset and the
> pointer of a pixel. The previous implementation was specialized for
> planes with block_h == block_w == 1. To avoid confusion and allow easier
> implementation of tiled formats. It also remove the usage of the
> deprecated format field `cpp`.
> 
> Introduce the plane_index parameter to get an offset/pointer on a
> different plane.
> 
> Acked-by: Maíra Canal <mairacanal@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 114 ++++++++++++++++++++++++++++--------
>  1 file changed, 91 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 06aef5162529..7f932d42394d 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -10,22 +10,46 @@
>  #include "vkms_formats.h"
>  
>  /**
> - * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
> + * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
>   *
>   * @frame_info: Buffer metadata
>   * @x: The x coordinate of the wanted pixel in the buffer
>   * @y: The y coordinate of the wanted pixel in the buffer
> + * @plane_index: The index of the plane to use
> + * @offset: The returned offset inside the buffer of the block

The previous function (pixel_offset) returned a size_t for the offset rather
than an int. Do you know if we are safe using an int in this case?

> + * @rem_x: The returned X coordinate of the requested pixel in the block
> + * @rem_y: The returned Y coordinate of the requested pixel in the block
>   *
> - * The caller must ensure that the framebuffer associated with this request uses a pixel format
> - * where block_h == block_w == 1.
> - * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
> - * outside of the buffer.
> + * As some pixel formats store multiple pixels in a block (DRM_FORMAT_R* for example), some
> + * pixels are not individually addressable. This function return 3 values: the offset of the
> + * whole block, and the coordinate of the requested pixel inside this block.
> + * For example, if the format is DRM_FORMAT_R1 and the requested coordinate is 13,5, the offset
> + * will point to the byte 5*pitches + 13/8 (second byte of the 5th line), and the rem_x/rem_y
> + * coordinates will be (13 % 8, 5 % 1) = (5, 0)
> + *
> + * With this function, the caller just have to extract the correct pixel from the block.
>   */
> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> +static void packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
> +				 int plane_index, int *offset, int *rem_x, int *rem_y)
>  {
>  	struct drm_framebuffer *fb = frame_info->fb;
> +	const struct drm_format_info *format = frame_info->fb->format;
> +	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
> +	 * in some formats a block can represent multiple pixels.
> +	 *
> +	 * Dividing x and y by the block size allows to extract the correct offset of the block
> +	 * containing the pixel.
> +	 */
>  
> -	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
> +	int block_x = x / drm_format_info_block_width(format, plane_index);
> +	int block_y = y / drm_format_info_block_height(format, plane_index);
> +	int block_pitch = fb->pitches[plane_index] * drm_format_info_block_height(format,
> +										  plane_index);
> +	*rem_x = x % drm_format_info_block_width(format, plane_index);
> +	*rem_y = y % drm_format_info_block_height(format, plane_index);
> +	*offset = fb->offsets[plane_index] +
> +		  block_y * block_pitch +
> +		  block_x * format->char_per_block[plane_index];
>  }
>  
>  /**
> @@ -35,30 +59,71 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>   * @frame_info: Buffer metadata
>   * @x: The x (width) coordinate inside the plane
>   * @y: The y (height) coordinate inside the plane
> + * @plane_index: The index of the plane
> + * @addr: The returned pointer
> + * @rem_x: The returned X coordinate of the requested pixel in the block
> + * @rem_y: The returned Y coordinate of the requested pixel in the block
>   *
> - * Takes the information stored in the frame_info, a pair of coordinates, and
> - * returns the address of the first color channel.
> - * This function assumes the channels are packed together, i.e. a color channel
> - * comes immediately after another in the memory. And therefore, this function
> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
> + * of the block containing this pixel and the pixel position inside this block.
>   *
> - * The caller must ensure that the framebuffer associated with this request uses a pixel format
> - * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
> + * See @packed_pixel_offset for details about rem_x/rem_y behavior.

Missing "s" in the name of the function. Should read "@packed_pixels_offset".

>   */
> -static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> -				int x, int y)
> +static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
> +			       int x, int y, int plane_index, u8 **addr, int *rem_x,
> +			       int *rem_y)
>  {
> -	size_t offset = pixel_offset(frame_info, x, y);
> +	int offset;
>  
> -	return (u8 *)frame_info->map[0].vaddr + offset;
> +	packed_pixels_offset(frame_info, x, y, plane_index, &offset, rem_x, rem_y);
> +	*addr = (u8 *)frame_info->map[0].vaddr + offset;
>  }
>  
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
> +/**
> + * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
> + * coordinates
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x (width) coordinate inside the plane
> + * @y: The y (height) coordinate inside the plane
> + * @plane_index: The index of the plane
> + * @addr: The returned pointer
> + *
> + * This function can only be used with format where block_h == block_w == 1.
> + */
> +static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
> +				   int x, int y, int plane_index, u8 **addr)
> +{
> +	int offset, rem_x, rem_y;

Nitpick, but it'd be nice if packed_pixels_offset() could take NULLs in
the output values so we avoid declaring unused variables here and when
calling packed_pixels_addr().

> +
> +	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format,
> +					      plane_index) != 1,
> +		"%s() only support formats with block_w == 1", __func__);
> +	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format,
> +					       plane_index) != 1,
> +		"%s() only support formats with block_h == 1", __func__);
> +
> +	packed_pixels_offset(frame_info, x, y, plane_index, &offset, &rem_x,
> +			     &rem_y);
> +	*addr = (u8 *)frame_info->map[0].vaddr + offset;
> +}
> +
> +static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
> +				 int plane_index)
>  {
>  	int x_src = frame_info->src.x1 >> 16;
>  	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> +	u8 *addr;
> +	int rem_x, rem_y;
> +
> +	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format, plane_index) != 1,
> +		  "%s() only support formats with block_w == 1", __func__);
> +	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format, plane_index) != 1,
> +		  "%s() only support formats with block_h == 1", __func__);
>  
> -	return packed_pixels_addr(frame_info, x_src, y_src);
> +	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x, &rem_y);
> +
> +	return addr;
>  }
>  
>  static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
> @@ -152,14 +217,14 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  {
>  	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>  	struct vkms_frame_info *frame_info = plane->frame_info;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> +	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
>  	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
>  
>  	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
>  		int x_pos = get_x_position(frame_info, limit, x);
>  
>  		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
> +			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
>  				+ frame_info->fb->format->cpp[0] * y;
>  
>  		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> @@ -250,7 +315,10 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
>  	int x_dst = frame_info->dst.x1;
> -	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
> +	u8 *dst_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y);
>  	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>  	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
>  
> 
