Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131E59C639
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DCF9E61B;
	Mon, 22 Aug 2022 18:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38F9E54D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:27:41 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id a10so4678491uas.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=nfaZR4XyX6Uktb+n8wGOrlRWEsVPxrwkh/JZZXewyM8=;
 b=KO2liR3P/Ov+ifno424MDGJfOsxtp7YUw1thT8kLLq2N3PMbU16kz1f7n3IRSlP+5V
 tB9KZiWQDDBgWZe87zSRUv4dEPUNqQPvoA3q5QTn6NmaNwjGE6ndS7F2YlTZJ2oLNLeK
 gUvyinqGNw5LD4vLREKfCEXuSR3aH2Dw4zr1X9pDK0sBoOQBefsyQ7PCdis9HumMCarq
 sFvDaQ9NIYXhzwPQIbVJ3f3l0HeTf0gKQNHY/GQ9ushpASjZvofa/hwOmwx3G7auYGxH
 utKN11WzVf6WWyDqKW6TRIkpmeRBZM7gGO3GaVRB1vQN5kZe4cjZuLKNdmAY/61YurZU
 p13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nfaZR4XyX6Uktb+n8wGOrlRWEsVPxrwkh/JZZXewyM8=;
 b=e8tMzWeA0mvqfeyVp55BYsKQB5kBMH4EHe9zRxklM/8/9GtEwMJIll0SLYmf+EfLV7
 r3OCje6P/6rOzHls9D24a7PhFcbXWg7YyVYpYkQU8uVqGZuJ8otN5EceEFISo26lucpO
 FWBdZObSexczNKASsXfiZM0nzrGit/b+KzT1aihcvkDtntUpNokDaYJ9PFSiuMyu+izj
 YgX9+sD6n6yUQ54YRxfi8kRsRjEcSpOW7m+p7c0EOPUhg9/0MO+bJPbfFQtZo3K+Tsp8
 4lKrz05C/8VjAbPDB3CYvOLw615gqTfSf2PBaN4aC0QV3iaSwBXm8q61IQfFij+Cn3XG
 Ut8w==
X-Gm-Message-State: ACgBeo0zPAUvyj6aQWpUeQfwfSM2JKa1ZrNWgiSeZWjqy2m/4UMHE15m
 LakrZ9KMDYW2dve+T/EHOgw=
X-Google-Smtp-Source: AA6agR6NCxiIUJygfNYKQKMk5YPrffE+elSaNtVrtmy5m6D27Q7ikTU6FesiqOmc24vdED5KkFiz4Q==
X-Received: by 2002:ab0:2102:0:b0:382:2773:aa7f with SMTP id
 d2-20020ab02102000000b003822773aa7fmr7965022ual.31.1661192860036; 
 Mon, 22 Aug 2022 11:27:40 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:da86:e8a2:466a:a971:9305?
 ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ab0280f000000b00393c48cd8a5sm9764434uap.7.2022.08.22.11.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 11:27:39 -0700 (PDT)
Message-ID: <b90f2c07-18ad-411f-82ec-914974cf8d2c@gmail.com>
Date: Mon, 22 Aug 2022 15:27:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RESEND v6 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
 <20220819182411.20246-7-igormtorrente@gmail.com>
 <20220820105046.cittsquvjvenw54z@mail.igalia.com>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220820105046.cittsquvjvenw54z@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: hamohammed.sa@gmail.com, kernel test robot <lkp@intel.com>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, tales.aparecida@gmail.com,
 leandro.ribeiro@collabora.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On 8/20/22 07:51, Melissa Wen wrote:
> On 08/19, Igor Torrente wrote:
>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>> as a color input.
>>
>> This patch refactors all the functions related to the plane composition
>> to overcome this limitation.
>>
>> The pixels blend is done using the new internal format. And new handlers
>> are being added to convert a specific format to/from this internal format.
>>
>> So the blend operation depends on these handlers to convert to this common
>> format. The blended result, if necessary, is converted to the writeback
>> buffer format.
>>
>> This patch introduces three major differences to the blend function.
>> 1 - All the planes are blended at once.
>> 2 - The blend calculus is done as per line instead of per pixel.
>> 3 - It is responsible to calculates the CRC and writing the writeback
>> buffer(if necessary).
>>
>> These changes allow us to allocate way less memory in the intermediate
>> buffer to compute these operations. Because now we don't need to
>> have the entire intermediate image lines at once, just one line is
>> enough.
>>
>> | Memory consumption (output dimensions) |
>> |:--------------------------------------:|
>> |       Current      |     This patch    |
>> |:------------------:|:-----------------:|
>> |   Width * Heigth   |     2 * Width     |
>>
>> Beyond memory, we also have a minor performance benefit from all
>> these changes. Results running the IGT[1] test
>> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>>
>> |                 Frametime                  |
>> |:------------------------------------------:|
>> |  Implementation |  Current  |  This commit |
>> |:---------------:|:---------:|:------------:|
>> | frametime range |  9~22 ms  |    5~17 ms   |
>> |     Average     |  11.4 ms  |    7.8 ms    |
>>
>> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>>
>> V2: Improves the performance drastically, by performing the operations
>>      per-line and not per-pixel(Pekka Paalanen).
>>      Minor improvements(Pekka Paalanen).
>> V3: Changes the code to blend the planes all at once. This improves
>>      performance, memory consumption, and removes much of the weirdness
>>      of the V2(Pekka Paalanen and me).
>>      Minor improvements(Pekka Paalanen and me).
>> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
>> V5: Minor checkpatch fixes and the removal of TO-DO item(Melissa Wen).
>>      Several security/robustness improvents(Pekka Paalanen).
>>      Removes check_planes_x_bounds function and allows partial
>>      partly off-screen(Pekka Paalanen).
>> V6: Fix a mismatch of some variable sizes (Pekka Paalanen).
>>      Several minor improvements (Pekka Paalanen).
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>   Documentation/gpu/vkms.rst            |   4 -
>>   drivers/gpu/drm/vkms/Makefile         |   1 +
>>   drivers/gpu/drm/vkms/vkms_composer.c  | 320 ++++++++++++--------------
>>   drivers/gpu/drm/vkms/vkms_formats.c   | 155 +++++++++++++
>>   drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>>   drivers/gpu/drm/vkms/vkms_plane.c     |   3 +
>>   drivers/gpu/drm/vkms/vkms_writeback.c |   3 +
>>   7 files changed, 317 insertions(+), 181 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>>
>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>> index 973e2d43108b..a49e4ae92653 100644
>> --- a/Documentation/gpu/vkms.rst
>> +++ b/Documentation/gpu/vkms.rst
>> @@ -118,10 +118,6 @@ Add Plane Features
>>   
>>   There's lots of plane features we could add support for:
>>   
>> -- Clearing primary plane: clear primary plane before plane composition (at the
>> -  start) for correctness of pixel blend ops. It also guarantees alpha channel
>> -  is cleared in the target buffer for stable crc. [Good to get started]
>> -
>>   - ARGB format on primary plane: blend the primary plane into background with
>>     translucent alpha.
>>   
>> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
>> index 72f779cbfedd..1b28a6a32948 100644
>> --- a/drivers/gpu/drm/vkms/Makefile
>> +++ b/drivers/gpu/drm/vkms/Makefile
>> @@ -3,6 +3,7 @@ vkms-y := \
>>   	vkms_drv.o \
>>   	vkms_plane.o \
>>   	vkms_output.o \
>> +	vkms_formats.o \
>>   	vkms_crtc.o \
>>   	vkms_composer.o \
>>   	vkms_writeback.o
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index b9fb408e8973..5b1a8bdd8268 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -7,204 +7,188 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_vblank.h>
>> +#include <linux/minmax.h>
>>   
>>   #include "vkms_drv.h"
>>   
>> -static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
>> -				 const struct vkms_frame_info *frame_info)
>> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>> -	u32 pixel;
>> -	int src_offset = frame_info->offset + (y * frame_info->pitch)
>> -					    + (x * frame_info->cpp);
>> +	u32 new_color;
>>   
>> -	pixel = *(u32 *)&buffer[src_offset];
>> +	new_color = (src * 0xffff + dst * (0xffff - alpha));
>>   
>> -	return pixel;
>> +	return DIV_ROUND_CLOSEST(new_color, 0xffff);
>>   }
>>   
>>   /**
>> - * compute_crc - Compute CRC value on output frame
>> + * pre_mul_alpha_blend - alpha blending equation
>> + * @src_frame_info: source framebuffer's metadata
>> + * @stage_buffer: The line with the pixels from src_plane
>> + * @output_buffer: A line buffer that receives all the blends output
>>    *
>> - * @vaddr: address to final framebuffer
>> - * @frame_info: framebuffer's metadata
>> + * Using the information from the `frame_info`, this blends only the
>> + * necessary pixels from the `stage_buffer` to the `output_buffer`
>> + * using premultiplied blend formula.
>>    *
>> - * returns CRC value computed using crc32 on the visible portion of
>> - * the final framebuffer at vaddr_out
>> + * The current DRM assumption is that pixel color values have been already
>> + * pre-multiplied with the alpha channel values. See more
>> + * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>> + * completely opaque background.
>>    */
>> -static uint32_t compute_crc(const u8 *vaddr,
>> -			    const struct vkms_frame_info *frame_info)
>> +static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
>> +				struct line_buffer *stage_buffer,
>> +				struct line_buffer *output_buffer)
>>   {
>> -	int x, y;
>> -	u32 crc = 0, pixel = 0;
>> -	int x_src = frame_info->src.x1 >> 16;
>> -	int y_src = frame_info->src.y1 >> 16;
>> -	int h_src = drm_rect_height(&frame_info->src) >> 16;
>> -	int w_src = drm_rect_width(&frame_info->src) >> 16;
>> -
>> -	for (y = y_src; y < y_src + h_src; ++y) {
>> -		for (x = x_src; x < x_src + w_src; ++x) {
>> -			pixel = get_pixel_from_buffer(x, y, vaddr, frame_info);
>> -			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
>> -		}
>> +	int x_dst = frame_info->dst.x1;
>> +	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
>> +	struct pixel_argb_u16 *in = stage_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    stage_buffer->n_pixels);
>> +
>> +	for (int x = 0; x < x_limit; x++) {
>> +		out[x].a = (u16)0xffff;
>> +		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
>> +		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
>> +		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
>>   	}
>> -
>> -	return crc;
>>   }
>>   
>> -static u8 blend_channel(u8 src, u8 dst, u8 alpha)
>> +static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
>>   {
>> -	u32 pre_blend;
>> -	u8 new_color;
>> -
>> -	pre_blend = (src * 255 + dst * (255 - alpha));
>> -
>> -	/* Faster div by 255 */
>> -	new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
>> +	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
>> +		return true;
>>   
>> -	return new_color;
>> +	return false;
>>   }
>>   
>>   /**
>> - * alpha_blend - alpha blending equation
>> - * @argb_src: src pixel on premultiplied alpha mode
>> - * @argb_dst: dst pixel completely opaque
>> + * @wb_frame_info: The writeback frame buffer metadata
>> + * @crtc_state: The crtc state
>> + * @crc32: The crc output of the final frame
>> + * @output_buffer: A buffer of a row that will receive the result of the blend(s)
>> + * @stage_buffer: The line with the pixels from plane being blend to the output
>>    *
>> - * blend pixels using premultiplied blend formula. The current DRM assumption
>> - * is that pixel color values have been already pre-multiplied with the alpha
>> - * channel values. See more drm_plane_create_blend_mode_property(). Also, this
>> - * formula assumes a completely opaque background.
>> + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>> + * from all planes, calculates the crc32 of the output from the former step,
>> + * and, if necessary, convert and store the output to the writeback buffer.
>>    */
>> -static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
>> +static void blend(struct vkms_writeback_job *wb,
>> +		  struct vkms_crtc_state *crtc_state,
>> +		  u32 *crc32, struct line_buffer *stage_buffer,
>> +		  struct line_buffer *output_buffer, size_t row_size)
>>   {
>> -	u8 alpha;
>> +	struct vkms_plane_state **plane = crtc_state->active_planes;
>> +	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
>> +	u32 n_active_planes = crtc_state->num_active_planes;
>> +
>> +	int y_dst = primary_plane_info->dst.y1;
>> +	int h_dst = drm_rect_height(&primary_plane_info->dst);
>> +	int y_limit = y_dst + h_dst;
>> +
>> +	for (size_t y = y_dst; y < y_limit; y++) {
>> +		plane[0]->plane_read(output_buffer, primary_plane_info, y);
>> +
>> +		/* If there are other planes besides primary, we consider the active
>> +		 * planes should be in z-order and compose them associatively:
>> +		 * ((primary <- overlay) <- cursor)
>> +		 */
>> +		for (size_t i = 1; i < n_active_planes; i++) {
>> +			if (!check_y_limit(plane[i]->frame_info, y))
>> +				continue;
>> +
>> +			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
>> +			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>> +					    output_buffer);
>> +		}
>> +
>> +		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
>>   
>> -	alpha = argb_src[3];
>> -	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
>> -	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
>> -	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
>> +		if (wb)
>> +			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
>> +	}
>>   }
>>   
>> -/**
>> - * x_blend - blending equation that ignores the pixel alpha
>> - *
>> - * overwrites RGB color value from src pixel to dst pixel.
>> - */
>> -static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
>> +static int check_format_funcs(struct vkms_crtc_state *crtc_state,
>> +			      struct vkms_writeback_job *active_wb)
>>   {
>> -	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
>> +	struct vkms_plane_state **planes = crtc_state->active_planes;
>> +	u32 n_active_planes = crtc_state->num_active_planes;
>> +
>> +	for (size_t i = 0; i < n_active_planes; i++)
>> +		if (!planes[i]->plane_read)
>> +			return -1;
>> +
>> +	if (active_wb && !active_wb->wb_write)
>> +		return -1;
>> +
>> +	return 0;
>>   }
>>   
>> -/**
>> - * blend - blend value at vaddr_src with value at vaddr_dst
>> - * @vaddr_dst: destination address
>> - * @vaddr_src: source address
>> - * @dst_frame_info: destination framebuffer's metadata
>> - * @src_frame_info: source framebuffer's metadata
>> - * @pixel_blend: blending equation based on plane format
>> - *
>> - * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
>> - * equation according to the supported plane formats DRM_FORMAT_(A/XRGB8888)
>> - * and clearing alpha channel to an completely opaque background. This function
>> - * uses buffer's metadata to locate the new composite values at vaddr_dst.
>> - *
>> - * TODO: completely clear the primary plane (a = 0xff) before starting to blend
>> - * pixel color values
>> - */
>> -static void blend(void *vaddr_dst, void *vaddr_src,
>> -		  struct vkms_frame_info *dst_frame_info,
>> -		  struct vkms_frame_info *src_frame_info,
>> -		  void (*pixel_blend)(const u8 *, u8 *))
>> +static int compose_active_planes(struct vkms_writeback_job *active_wb,
>> +				 struct vkms_crtc_state *crtc_state,
>> +				 u32 *crc32)
>>   {
>> -	int i, j, j_dst, i_dst;
>> -	int offset_src, offset_dst;
>> -	u8 *pixel_dst, *pixel_src;
>> -
>> -	int x_src = src_frame_info->src.x1 >> 16;
>> -	int y_src = src_frame_info->src.y1 >> 16;
>> -
>> -	int x_dst = src_frame_info->dst.x1;
>> -	int y_dst = src_frame_info->dst.y1;
>> -	int h_dst = drm_rect_height(&src_frame_info->dst);
>> -	int w_dst = drm_rect_width(&src_frame_info->dst);
>> -
>> -	int y_limit = y_src + h_dst;
>> -	int x_limit = x_src + w_dst;
>> -
>> -	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
>> -		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
>> -			offset_dst = dst_frame_info->offset
>> -				     + (i_dst * dst_frame_info->pitch)
>> -				     + (j_dst++ * dst_frame_info->cpp);
>> -			offset_src = src_frame_info->offset
>> -				     + (i * src_frame_info->pitch)
>> -				     + (j * src_frame_info->cpp);
>> -
>> -			pixel_src = (u8 *)(vaddr_src + offset_src);
>> -			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
>> -			pixel_blend(pixel_src, pixel_dst);
>> -			/* clearing alpha channel (0xff)*/
>> -			pixel_dst[3] = 0xff;
>> -		}
>> -		i_dst++;
>> +	size_t line_width, pixel_size = sizeof(struct pixel_argb_u16);
>> +	struct vkms_frame_info *primary_plane_info = NULL;
>> +	struct line_buffer output_buffer, stage_buffer;
>> +	struct vkms_plane_state *act_plane = NULL;
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * This check exists so we can call `crc32_le` for the entire line
>> +	 * instead doing it for each channel of each pixel in case
>> +	 * `struct `pixel_argb_u16` had any gap added by the compiler
>> +	 * between the struct fields.
>> +	 */
>> +	static_assert(sizeof(struct pixel_argb_u16) == 8);
>> +
>> +	if (crtc_state->num_active_planes >= 1) {
>> +		act_plane = crtc_state->active_planes[0];
>> +		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +			primary_plane_info = act_plane->frame_info;
>>   	}
>> -}
>>   
>> -static void compose_plane(struct vkms_frame_info *primary_plane_info,
>> -			  struct vkms_frame_info *plane_frame_info,
>> -			  void *vaddr_out)
>> -{
>> -	struct drm_framebuffer *fb = plane_frame_info->fb;
>> -	void *vaddr;
>> -	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>> +	if (!primary_plane_info)
>> +		return -EINVAL;
>>   
>>   	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
>> -		return;
>> +		return -EINVAL;
>>   
>> -	vaddr = plane_frame_info->map[0].vaddr;
>> +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>> +		return -EINVAL;
>>   
>> -	if (fb->format->format == DRM_FORMAT_ARGB8888)
>> -		pixel_blend = &alpha_blend;
>> -	else
>> -		pixel_blend = &x_blend;
>> +	line_width = drm_rect_width(&primary_plane_info->dst);
>> +	stage_buffer.n_pixels = line_width;
>> +	output_buffer.n_pixels = line_width;
>>   
>> -	blend(vaddr_out, vaddr, primary_plane_info,
>> -	      plane_frame_info, pixel_blend);
>> -}
>> +	stage_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +	if (!stage_buffer.pixels) {
>> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
>> +		return -ENOMEM;
>> +	}
>>   
>> -static int compose_active_planes(void **vaddr_out,
>> -				 struct vkms_frame_info *primary_plane_info,
>> -				 struct vkms_crtc_state *crtc_state)
>> -{
>> -	struct drm_framebuffer *fb = primary_plane_info->fb;
>> -	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
>> -	const void *vaddr;
>> -	int i;
>> -
>> -	if (!*vaddr_out) {
>> -		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
>> -		if (!*vaddr_out) {
>> -			DRM_ERROR("Cannot allocate memory for output frame.");
>> -			return -ENOMEM;
>> -		}
>> +	output_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +	if (!output_buffer.pixels) {
>> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
>> +		ret = -ENOMEM;
>> +		goto free_stage_buffer;
>>   	}
>>   
>> -	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
>> -		return -EINVAL;
>> +	if (active_wb) {
>> +		struct vkms_frame_info *wb_frame_info = &active_wb->wb_frame_info;
>>   
>> -	vaddr = primary_plane_info->map[0].vaddr;
>> +		wb_frame_info->src = primary_plane_info->src;
>> +		wb_frame_info->dst = primary_plane_info->dst;
>> +	}
>>   
>> -	memcpy(*vaddr_out, vaddr, gem_obj->size);
>> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
>> +	      &output_buffer, line_width * pixel_size);
>>   
>> -	/* If there are other planes besides primary, we consider the active
>> -	 * planes should be in z-order and compose them associatively:
>> -	 * ((primary <- overlay) <- cursor)
>> -	 */
>> -	for (i = 1; i < crtc_state->num_active_planes; i++)
>> -		compose_plane(primary_plane_info,
>> -			      crtc_state->active_planes[i]->frame_info,
>> -			      *vaddr_out);
>> +	kvfree(output_buffer.pixels);
>> +free_stage_buffer:
>> +	kvfree(stage_buffer.pixels);
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -222,13 +206,11 @@ void vkms_composer_worker(struct work_struct *work)
>>   						struct vkms_crtc_state,
>>   						composer_work);
>>   	struct drm_crtc *crtc = crtc_state->base.crtc;
>> +	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
>>   	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>> -	struct vkms_frame_info *primary_plane_info = NULL;
>> -	struct vkms_plane_state *act_plane = NULL;
>>   	bool crc_pending, wb_pending;
>> -	void *vaddr_out = NULL;
>> -	u32 crc32 = 0;
>>   	u64 frame_start, frame_end;
>> +	u32 crc32 = 0;
>>   	int ret;
>>   
>>   	spin_lock_irq(&out->composer_lock);
>> @@ -248,35 +230,19 @@ void vkms_composer_worker(struct work_struct *work)
>>   	if (!crc_pending)
>>   		return;
>>   
>> -	if (crtc_state->num_active_planes >= 1) {
>> -		act_plane = crtc_state->active_planes[0];
>> -		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
>> -			primary_plane_info = act_plane->frame_info;
>> -	}
>> -
>> -	if (!primary_plane_info)
>> -		return;
>> -
>>   	if (wb_pending)
>> -		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
>> +		ret = compose_active_planes(active_wb, crtc_state, &crc32);
>> +	else
>> +		ret = compose_active_planes(NULL, crtc_state, &crc32);
>>   
>> -	ret = compose_active_planes(&vaddr_out, primary_plane_info,
>> -				    crtc_state);
>> -	if (ret) {
>> -		if (ret == -EINVAL && !wb_pending)
>> -			kvfree(vaddr_out);
>> +	if (ret)
>>   		return;
>> -	}
>> -
>> -	crc32 = compute_crc(vaddr_out, primary_plane_info);
>>   
>>   	if (wb_pending) {
>>   		drm_writeback_signal_completion(&out->wb_connector, 0);
>>   		spin_lock_irq(&out->composer_lock);
>>   		crtc_state->wb_pending = false;
>>   		spin_unlock_irq(&out->composer_lock);
>> -	} else {
>> -		kvfree(vaddr_out);
>>   	}
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> new file mode 100644
>> index 000000000000..ca4bfcac686b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -0,0 +1,155 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <drm/drm_rect.h>
>> +#include <linux/minmax.h>
>> +
>> +#include "vkms_formats.h"
>> +
>> +static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>> +{
>> +	return frame_info->offset + (y * frame_info->pitch)
>> +				  + (x * frame_info->cpp);
>> +}
>> +
>> +/*
>> + * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
>> + *
>> + * @frame_info: Buffer metadata
>> + * @x: The x(width) coordinate of the 2D buffer
>> + * @y: The y(Heigth) coordinate of the 2D buffer
>> + *
>> + * Takes the information stored in the frame_info, a pair of coordinates, and
>> + * returns the address of the first color channel.
>> + * This function assumes the channels are packed together, i.e. a color channel
>> + * comes immediately after another in the memory. And therefore, this function
>> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
>> + */
>> +static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>> +				int x, int y)
>> +{
>> +	size_t offset = pixel_offset(frame_info, x, y);
>> +
>> +	return (u8 *)frame_info->map[0].vaddr + offset;
>> +}
>> +
>> +static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
>> +{
>> +	int x_src = frame_info->src.x1 >> 16;
>> +	int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
>> +
>> +	return packed_pixels_addr(frame_info, x_src, y_src);
>> +}
>> +
>> +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
>> +				 const struct vkms_frame_info *frame_info, int y)
>> +{
>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>> +	u8 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    stage_buffer->n_pixels);
>> +
>> +	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
>> +		/*
>> +		 * The 257 is the "conversion ratio". This number is obtained by the
>> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>> +		 * the best color value in a pixel format with more possibilities.
>> +		 * A similar idea applies to others RGB color conversions.
>> +		 */
>> +		out_pixels[x].a = (u16)src_pixels[3] * 257;
>> +		out_pixels[x].r = (u16)src_pixels[2] * 257;
>> +		out_pixels[x].g = (u16)src_pixels[1] * 257;
>> +		out_pixels[x].b = (u16)src_pixels[0] * 257;
>> +	}
>> +}
>> +
>> +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
>> +				 const struct vkms_frame_info *frame_info, int y)
>> +{
>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>> +	u8 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    stage_buffer->n_pixels);
>> +
>> +	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
>> +		out_pixels[x].a = (u16)0xffff;
>> +		out_pixels[x].r = (u16)src_pixels[2] * 257;
>> +		out_pixels[x].g = (u16)src_pixels[1] * 257;
>> +		out_pixels[x].b = (u16)src_pixels[0] * 257;
>> +	}
>> +}
>> +
>> +/*
>> + * The following  functions take an line of argb_u16 pixels from the
>> + * src_buffer, convert them to a specific format, and store them in the
>> + * destination.
>> + *
>> + * They are used in the `compose_active_planes` to convert and store a line
>> + * from the src_buffer to the writeback buffer.
>> + */
>> +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
>> +				 const struct line_buffer *src_buffer, int y)
>> +{
>> +	int x_dst = frame_info->dst.x1;
>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +		/*
>> +		 * This sequence below is important because the format's byte order is
>> +		 * in little-endian. In the case of the ARGB8888 the memory is
>> +		 * organized this way:
>> +		 *
>> +		 * | Addr     | = blue channel
>> +		 * | Addr + 1 | = green channel
>> +		 * | Addr + 2 | = Red channel
>> +		 * | Addr + 3 | = Alpha channel
>> +		 */
>> +		dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
>> +		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
>> +		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
>> +		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
>> +	}
>> +}
>> +
>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
>> +				 const struct line_buffer *src_buffer, int y)
>> +{
>> +	int x_dst = frame_info->dst.x1;
>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +		dst_pixels[3] = 0xff;
>> +		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
>> +		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
>> +		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
>> +	}
>> +}
>> +
>> +frame_to_line_func get_frame_to_line_function(u32 format)
>> +{
>> +	switch (format) {
>> +	case DRM_FORMAT_ARGB8888:
>> +		return &ARGB8888_to_argb_u16;
>> +	case DRM_FORMAT_XRGB8888:
>> +		return &XRGB8888_to_argb_u16;
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> +
>> +line_to_frame_func get_line_to_frame_function(u32 format)
>> +{
>> +	switch (format) {
>> +	case DRM_FORMAT_ARGB8888:
>> +		return &argb_u16_to_ARGB8888;
>> +	case DRM_FORMAT_XRGB8888:
>> +		return &argb_u16_to_XRGB8888;
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
>> new file mode 100644
>> index 000000000000..053ca42d5b31
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
>> @@ -0,0 +1,12 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#ifndef _VKMS_FORMATS_H_
>> +#define _VKMS_FORMATS_H_
>> +
>> +#include "vkms_drv.h"
>> +
>> +frame_to_line_func get_frame_to_line_function(u32 format);
>> +
>> +line_to_frame_func get_line_to_frame_function(u32 format);
>> +
>> +#endif /* _VKMS_FORMATS_H_ */
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 8adbfdc05e50..7a479a714565 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_plane_helper.h>
>>   
>>   #include "vkms_drv.h"
>> +#include "vkms_formats.h"
> ^ this line no longer applies (needs to rebase), but I can manage it before apply to drm-misc-next

I did the rebase and I hadn't any issues.

I'm using `git://anongit.freedesktop.org/drm/drm-misc` remote. Should I 
be using another git remote for vkms?

>>   
>>   static const u32 vkms_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> @@ -100,6 +101,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>   	struct drm_shadow_plane_state *shadow_plane_state;
>>   	struct drm_framebuffer *fb = new_state->fb;
>>   	struct vkms_frame_info *frame_info;
>> +	u32 fmt = fb->format->format;
>>   
>>   	if (!new_state->crtc || !fb)
>>   		return;
>> @@ -116,6 +118,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>   	frame_info->offset = fb->offsets[0];
>>   	frame_info->pitch = fb->pitches[0];
>>   	frame_info->cpp = fb->format->cpp[0];
>> +	vkms_plane_state->plane_read = get_frame_to_line_function(fmt);
>>   }
>>   
>>   static int vkms_plane_atomic_check(struct drm_plane *plane,
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index c87f6c89e7b4..d2aabb52cb46 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_gem_shmem_helper.h>
>>   
>>   #include "vkms_drv.h"
>> +#include "vkms_formats.h"
>>   
>>   static const u32 vkms_wb_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> @@ -123,6 +124,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>>   	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>>   	struct vkms_writeback_job *active_wb;
>>   	struct vkms_frame_info *wb_frame_info;
>> +	u32 wb_format = fb->format->format;
>>   
>>   	if (!conn_state)
>>   		return;
>> @@ -140,6 +142,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>>   	crtc_state->wb_pending = true;
>>   	spin_unlock_irq(&output->composer_lock);
>>   	drm_writeback_queue_job(wb_conn, connector_state);
>> +	active_wb->wb_write = get_line_to_frame_function(wb_format);
>>   }
>>   
>>   static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>> -- 
>> 2.30.2
>>

