Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91381958B38
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F1710E0A6;
	Tue, 20 Aug 2024 15:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSwCjT1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464C10E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:28:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-428163f7635so49801015e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167688; x=1724772488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLja7U6slSTOMGBcSoZ/i5FaagZbUM5mV8xORy86o7M=;
 b=PSwCjT1qSWeA2kLSRiEO7etE7m7ehDSC6UMrs8VJHs9K4j+U3jxglK0mseJL9fdvcZ
 b342CYdg00ZHAdrziOQipumSZWVMBn01cG3dOFsopNKKahY4xCIK7e5+iMYNHhUa2f0l
 cQJoiKQLWbCbNiL4TgdH/qBmwGFr6u+PScG+6tjXAOuze+XWp6hJlPCdv9d7v1+76iW7
 V17g4CVYKVaeIaqjBeT0qRsOOBpcU4stY2DgJu3SnOjtPT0e2T52b26F7zmLXtvECqLG
 WjBtxxBcSmbMF9W0qOSlAXEknmLbzZ6QCqZOCFpOZdRa0hZRa3rpNyaePzbC9p0XCFPI
 JXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167688; x=1724772488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLja7U6slSTOMGBcSoZ/i5FaagZbUM5mV8xORy86o7M=;
 b=ASBPfq8lzqSRTKQ2vmjalrjxje0HpGOp4YiMpZr25z1v6HlqNDBUdUk6CEfTFeIrIq
 PIj/ci4RcvKTKKf8Wurf3l02huXf1JL4Kpj4zmXTfnd83lkLDshYBYmO4Bne1uOOi755
 PQUgZLFsmRnpc15pk1f0hV6meyl/t3H1+TofvafDRovYRFll6vdlXf+syV/saeLt0pR4
 fQdavc2ow86c9Zosxc7hpIvv6HnvHBjv3MPUPzDjPy5giA0A0gEI0nlofe9ZVBcA+fjW
 i6bj3oPiaEw9+RKTFRoeh/fSVxs8IkVGzXuhoeDRCI7rWEaEwDryJgt/Ke90qonpmac/
 hAGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/S0ST2kfQAudKiRK4eFh/1ZraihmmFkCSiFSHUgK31gJOAV5BHdmVP12nFWKonSv2QTd0j9TdGzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDzTMQVgAx1wT7aTLx8ZQramOm9Q+8N65zmYQ+FQRWrRk7bwkX
 U/44W9EztR0LSXjsqzMJn+7aTWmko1jfNVAf9Ah7E4k6PSGLhqlf
X-Google-Smtp-Source: AGHT+IG7KBJ1TK+wrNLlXtyn2rRtL79GkKoGictFWHUDR6SqwLtrLEiVjNVm1gvu6aw6ngxV7zgOqQ==
X-Received: by 2002:a05:600c:19c9:b0:428:151b:e8e with SMTP id
 5b1f17b1804b1-429ed79c7a5mr104676605e9.10.1724167687717; 
 Tue, 20 Aug 2024 08:28:07 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded71ed8sm200596095e9.31.2024.08.20.08.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:28:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RFC 1/6] drm/vkms: Properly extract vkms_formats header
Date: Tue, 20 Aug 2024 17:28:02 +0200
Message-ID: <20240820152803.2805-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-1-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-1-51712f088f5d@bootlin.com>
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

Hi Louis,

Thanks for refactoring this, it make things a bit easier to find.

I already reviewed this series on your GitHub fork, but I'm adding the missing
fixes here as well so we can discusse them in the right forum.

Since these patches only move code around, I wonder if it'd make sense to merge
them before the complex changes, like configfs.

For reference, I already rebased them on top drm-misc-next as part of my review
work:
https://github.com/JoseExposito/linux/commits/patch-vkms-header-refactor/

It is easy to do, but the decision to rebase or not depends on how much it
impacts the other series you are trying to get merged. I'll leave that up to you
and the maintainers.

> The vkms_format.h header was already separated from vkms_drv.h, but some
> function were missing. Move those function in vkms_format.h.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     | 74 +---------------------------------
>  drivers/gpu/drm/vkms/vkms_formats.c |  3 ++
>  drivers/gpu/drm/vkms/vkms_formats.h | 80 ++++++++++++++++++++++++++++++++++++-
>  3 files changed, 84 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8f6c9e67e671..0db443924a15 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,6 +12,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_writeback.h>
>  
> +#include "vkms_formats.h"
> +

A general thought about includes to comment on. While including vkms_drv.h from
any other header or source file should be fine, including other vkms_*.h headers
could lead to circular dependencies if included from the wrong file.
Commenting on this becase, when I rebased this series on top of drm-misc-next, I
hit a few compiler errors due to circular dependencies.

I think that forward declaring always (if possible) could be a good approach.
Also, patch 5/6 of this series removes this include and I guess it is because
you found the same issues I did. What do you think about forward declaring when
possible?


On a different topic: The structures moved to vkms_formats.h are used in
vkms_composer.c, so, even though it compiles as it is, it'd be nice to add this
include in vkms_composer.c as well.

>  #define XRES_MIN    10
>  #define YRES_MIN    10
>  
> @@ -43,29 +45,6 @@ struct vkms_frame_info {
>  	unsigned int rotation;
>  };
>  
> -struct pixel_argb_u16 {
> -	u16 a, r, g, b;
> -};
> -
> -struct line_buffer {
> -	size_t n_pixels;
> -	struct pixel_argb_u16 *pixels;
> -};
> -
> -struct vkms_writeback_job;
> -/**
> - * typedef pixel_write_line_t - These functions are used to read a pixel line from a
> - * struct pixel_argb_u16 buffer, convert it and write it in the @wb job.
> - *
> - * @wb: the writeback job to write the output of the conversion
> - * @in_pixels: Source buffer containing the line to convert
> - * @count: The width of a line
> - * @x_start: The x (width) coordinate in the destination plane
> - * @y_start: The y (height) coordinate in the destination plane
> - */
> -typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
> -			      struct pixel_argb_u16 *in_pixels, int count, int x_start,
> -			      int y_start);
>  
>  struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> @@ -73,53 +52,10 @@ struct vkms_writeback_job {
>  	pixel_write_line_t pixel_write;
>  };
>  
> -/**
> - * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> - * plane.
> - */
> -enum pixel_read_direction {
> -	READ_BOTTOM_TO_TOP,
> -	READ_TOP_TO_BOTTOM,
> -	READ_RIGHT_TO_LEFT,
> -	READ_LEFT_TO_RIGHT
> -};
>  
>  struct vkms_plane_state;
>  
> -/**
> - * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> - * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> - *
> - * @plane: plane used as source for the pixel value
> - * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
> - * is non-negative and smaller than @plane->frame_info->fb->width.
> - * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
> - * is non-negative and smaller than @plane->frame_info->fb->height.
> - * @direction: direction to use for the copy, starting at @x_start/@y_start
> - * @count: number of pixels to copy
> - * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
> - * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
> - * length of at least @count.
> - */
> -typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
> -				  int y_start, enum pixel_read_direction direction, int count,
> -				  struct pixel_argb_u16 out_pixel[]);
>  
> -/**
> - * struct conversion_matrix - Matrix to use for a specific encoding and range
> - *
> - * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> - * used to compute rgb values from yuv values:
> - *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> - *   OR for yvu formats:
> - *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> - *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
> - * @y_offset: Offset to apply on the y value.
> - */
> -struct conversion_matrix {
> -	s64 matrix[3][3];
> -	int y_offset;
> -};
>  
>  /**
>   * struct vkms_plane_state - Driver specific plane state
> @@ -140,12 +76,6 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
>  
> -struct vkms_color_lut {
> -	struct drm_color_lut *base;
> -	size_t lut_length;
> -	s64 channel_value2index_ratio;
> -};
> -
>  /**
>   * struct vkms_crtc_state - Driver specific CRTC state
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 65fdd3999441..5ab84801d8da 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -6,9 +6,12 @@
>  #include <drm/drm_blend.h>
>  #include <drm/drm_rect.h>
>  #include <drm/drm_fixed.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
>  
>  #include <kunit/visibility.h>
>  
> +#include "vkms_drv.h"
>  #include "vkms_formats.h"
>  
>  /**
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 852ab9a4cee5..62b06bc26e79 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -3,7 +3,85 @@
>  #ifndef _VKMS_FORMATS_H_
>  #define _VKMS_FORMATS_H_
>  
> -#include "vkms_drv.h"
> +#include <drm/drm_color_mgmt.h>
> +
> +struct vkms_plane_state;
> +struct vkms_writeback_job;
> +
> +struct pixel_argb_u16 {
> +	u16 a, r, g, b;
> +};
> +
> +/**
> + * typedef pixel_write_line_t - These functions are used to read a pixel line from a
> + * struct pixel_argb_u16 buffer, convert it and write it in the @wb_job.
> + *
> + * @wb: the writeback job to write the output of the conversion
> + * @in_pixels: Source buffer containing the line to convert
> + * @count: The width of a line
> + * @x_start: The x (width) coordinate in the destination plane
> + * @y_start: The y (height) coordinate in the destination plane
> + */
> +typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
> +				   struct pixel_argb_u16 *in_pixels, int count, int x_start,
> +				   int y_start);
> +
> +struct line_buffer {
> +	size_t n_pixels;
> +	struct pixel_argb_u16 *pixels;
> +};
> +
> +/**
> + * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> + * plane.
> + */
> +enum pixel_read_direction {
> +	READ_BOTTOM_TO_TOP,
> +	READ_TOP_TO_BOTTOM,
> +	READ_RIGHT_TO_LEFT,
> +	READ_LEFT_TO_RIGHT
> +};
> +
> +/**
> + * struct conversion_matrix - Matrix to use for a specific encoding and range
> + *
> + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> + * used to compute rgb values from yuv values:
> + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> + *   OR for yvu formats:
> + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> + *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
> + * @y_offset: Offset to apply on the y value.
> + */
> +struct conversion_matrix {
> +	s64 matrix[3][3];
> +	int y_offset;
> +};
> +
> +struct vkms_color_lut {
> +	struct drm_color_lut *base;
> +	size_t lut_length;
> +	s64 channel_value2index_ratio;
> +};
> +
> +/**
> + * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> + *
> + * @plane: plane used as source for the pixel value
> + * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
> + * is non-negative and smaller than @plane->frame_info->fb->width.
> + * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
> + * is non-negative and smaller than @plane->frame_info->fb->height.
> + * @direction: direction to use for the copy, starting at @x_start/@y_start
> + * @count: number of pixels to copy
> + * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
> + * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
> + * length of at least @count.
> + */
> +typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
> +				  int y_start, enum pixel_read_direction direction, int count,
> +				  struct pixel_argb_u16 out_pixel[]);
>  
>  pixel_read_line_t get_pixel_read_line_function(u32 format);
