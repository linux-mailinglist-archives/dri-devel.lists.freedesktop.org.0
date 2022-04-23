Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69850CC23
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 18:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5010E5C8;
	Sat, 23 Apr 2022 16:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685410E5C8
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 16:04:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so7647626ots.6
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dlMJ1syGy/VhMI2WiJPlLT9caOAZEf1otodLD14CGvk=;
 b=XWoqxuTmAQ1X7Lbh7aBt8OsjmxmgBTVncFA5s0O548FnT6Ueee/KnKDbUOmsCT92wY
 tijkP7epL19pJPOrQfeDTAWKlK4hxcJI1MSS7X2hgVcrdKAjZXkLnWpYsIA/s2KUEg0H
 cLXtBY+xsqMttmpAGmYGSJdVjTl3E5qgImNrmn/oEOqAdDvsDj7O2FAEc1hZOwQkxetW
 XKk9IoUE6hwYZHyB/GAi5Bzs9ThatxZjbfiwF8Vb5Uj8SWR2u/y/Z84On++aA9SHOx8u
 2+NpsbZVUWoOR/CQ3GdGd1iJil3nY7On4/NP2Z8VSPQ3GOiDEwEEKONEzN6WSJYTOUz+
 p1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dlMJ1syGy/VhMI2WiJPlLT9caOAZEf1otodLD14CGvk=;
 b=EuDZ0NdbtHm375Y6TNhQXd2JItrsAgAr10VtyEMKhTfABUHJC8rIiPTeCfn36RTCBK
 fbf5VdF/k9mZpRFgtTKE+eh4C4EGcnsOUC0ID9DoO0REi4an0rce4xLk3bXyWWPup82s
 vkykaih0/8ielv9R0xth9qHEbFVa5qFF+7NS+mwmz4XVWu4CI4M/vqeZt6weDLJUsZMY
 O+d60ygqa5/UA0K66DffGDs9X3R9MsgU5WIZl+YVMbfVG+tTOIiGauJxNfZFuacdjuJM
 zyHNloRL4TjyYBu5RmIEu5/ofxU8T5A+bRCVQR1LPFj5fc377+KSAd3q6ukGvAUdQTAn
 /3bg==
X-Gm-Message-State: AOAM530B53IKSM8abzaCx3sxszCUieimrBITbw3e4Y3aFrgOJoCjEi/D
 udXKuUSTN9z30/2tUb4mWkU=
X-Google-Smtp-Source: ABdhPJwPRUEEy2o+EMp1xlOHuaCPZ5jGqpHgk2Fjd5q4+NdDCFN51mW4s+MWkR6AFAGNMoVeq2COgQ==
X-Received: by 2002:a05:6830:4128:b0:605:6729:1ff8 with SMTP id
 w40-20020a056830412800b0060567291ff8mr3690869ott.143.1650729886193; 
 Sat, 23 Apr 2022 09:04:46 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:7532:da7c:53df:9a5f:fa64?
 ([2804:431:c7f5:7532:da7c:53df:9a5f:fa64])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a056830148a00b005ea12d6454bsm546284otq.38.2022.04.23.09.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:04:45 -0700 (PDT)
Message-ID: <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
Date: Sat, 23 Apr 2022 13:04:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220420153628.0a91fcb6@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 4/20/22 09:36, Pekka Paalanen wrote:
> On Mon,  4 Apr 2022 17:45:12 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>> as a color input.
>>
>> This patch refactors all the functions related to the plane composition
>> to overcome this limitation.
>>
>> A new internal format(`struct pixel`) is introduced to deal with all
> 
> Hi,
> 
> struct pixel_argb_u16 was added in the previous patch.

I will fix it. Thanks!

> 
>> possible inputs. It consists of 16 bits fields that represent each of
>> the channels.
>>
>> The pixels blend is done using this internal format. And new handlers
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
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>   Documentation/gpu/vkms.rst            |   4 -
>>   drivers/gpu/drm/vkms/Makefile         |   1 +
>>   drivers/gpu/drm/vkms/vkms_composer.c  | 318 ++++++++++++--------------
>>   drivers/gpu/drm/vkms/vkms_formats.c   | 151 ++++++++++++
>>   drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>>   drivers/gpu/drm/vkms/vkms_plane.c     |   3 +
>>   drivers/gpu/drm/vkms/vkms_writeback.c |   3 +
>>   7 files changed, 311 insertions(+), 181 deletions(-)
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
>> index 95029d2ebcac..cf24015bf90f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> 
> (For this file, I have removed all the minus diff lines from below to
> better see the new code.)
> 
> 
>> @@ -7,204 +7,186 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_vblank.h>
>> +#include <linux/minmax.h>
>>   
>>   #include "vkms_drv.h"
>>   
>> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>> +	u32 new_color;
>>   
>> +	new_color = (src * 0xffff + dst * (0xffff - alpha));
>>   
>> +	return DIV_ROUND_CLOSEST(new_color, 0xffff);
> 
> This looks good.
> 
>>   }
>>   
>>   /**
>> + * pre_mul_alpha_blend - alpha blending equation
>> + * @src_frame_info: source framebuffer's metadata
>> + * @stage_buffer: The line with the pixels from src_plane
>> + * @output_buffer: A line buffer that receives all the blends output
>>    *
>> + * Using the information from the `frame_info`, this blends only the
>> + * necessary pixels from the `stage_buffer` to the `output_buffer`
>> + * using premultiplied blend formula.
>>    *
>> + * The current DRM assumption is that pixel color values have been already
>> + * pre-multiplied with the alpha channel values. See more
>> + * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>> + * completely opaque background.
>>    */
>> +static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
>> +				struct line_buffer *stage_buffer,
>> +				struct line_buffer *output_buffer)
>>   {
>> +	int x, x_dst = frame_info->dst.x1;
>> +	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
>> +	struct pixel_argb_u16 *in = stage_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++) {
>> +		out[x].a = (u16)0xffff;
>> +		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
>> +		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
>> +		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
>>   	}
>>   }
>>   
>> +static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
>>   {
>> +	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
>> +		return true;
>>   
>> +	return false;
>>   }
>>   
>>   /**
>> + * @wb_frame_info: The writeback frame buffer metadata
>> + * @crtc_state: The crtc state
>> + * @crc32: The crc output of the final frame
>> + * @output_buffer: A buffer of a row that will receive the result of the blend(s)
>> + * @stage_buffer: The line with the pixels from plane being blend to the output
>>    *
>> + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>> + * from all planes, calculates the crc32 of the output from the former step,
>> + * and, if necessary, convert and store the output to the writeback buffer.
>>    */
>> +static void blend(struct vkms_writeback_job *wb,
>> +		  struct vkms_crtc_state *crtc_state,
>> +		  u32 *crc32, struct line_buffer *stage_buffer,
>> +		  struct line_buffer *output_buffer, s64 row_size)
>>   {
>> +	struct vkms_plane_state **plane = crtc_state->active_planes;
>> +	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
>> +	u32 n_active_planes = crtc_state->num_active_planes;
>> +
>> +	int y_dst = primary_plane_info->dst.y1;
>> +	int h_dst = drm_rect_height(&primary_plane_info->dst);
>> +	int y_limit = y_dst + h_dst;
>> +	int y, i;
>> +
>> +	for (y = y_dst; y < y_limit; y++) {
>> +		plane[0]->format_func(output_buffer, primary_plane_info, y);
> 
> This is a bad assumption, but the next patch removes the need for this
> assumption. The primary plane may not be the bottom-most AFAIU.
> Overlays below the primary exist on real hardware.
> 
>> +
>> +		/* If there are other planes besides primary, we consider the active
>> +		 * planes should be in z-order and compose them associatively:
>> +		 * ((primary <- overlay) <- cursor)
>> +		 */
>> +		for (i = 1; i < n_active_planes; i++) {
>> +			if (!check_y_limit(plane[i]->frame_info, y))
>> +				continue;
>> +
>> +			plane[i]->format_func(stage_buffer, plane[i]->frame_info, y);
>> +			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>> +					    output_buffer);
>> +		}
>>   
>> +		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
>>   
>> +		if (wb)
>> +			wb->format_func(&wb->frame_info, output_buffer, y);
>>   	}
>>   }
>>   
>> +static int check_format_funcs(struct vkms_crtc_state *crtc_state,
>> +			      struct vkms_writeback_job *active_wb)
>>   {
>> +	struct vkms_plane_state **planes = crtc_state->active_planes;
>> +	u32 n_active_planes = crtc_state->num_active_planes;
>> +	int i;
>>   
>> +	for (i = 0; i < n_active_planes; i++)
>> +		if (!planes[i]->format_func)
>> +			return -1;
>>   
>> +	if (active_wb && !active_wb->format_func)
>> +		return -1;
>>   
>> +	return 0;
>>   }
>>   
>> +static int compose_active_planes(struct vkms_writeback_job *active_wb,
>> +				 struct vkms_crtc_state *crtc_state,
>> +				 u32 *crc32)
>>   {
>> +	int line_width, ret = 0, pixel_size = sizeof(struct pixel_argb_u16);
>> +	struct vkms_frame_info *primary_plane_info = NULL;
>> +	struct line_buffer output_buffer, stage_buffer;
>> +	struct vkms_plane_state *act_plane = NULL;
>> +	u32 wb_format;
>>   
>> +	if (WARN_ON(pixel_size != 8))
> 
> Isn't there a compile-time assert macro for this? Having to actually
> run VKMS to check for this reduces the chances of finding it early.
> What's the reason for this check anyway?
> 
>> +		return -EINVAL;
>> +
>> +	if (crtc_state->num_active_planes >= 1) {
>> +		act_plane = crtc_state->active_planes[0];
>> +		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +			primary_plane_info = act_plane->frame_info;
> 
> After the next patch, do you even need the primary plane for anything
> specifically? There is the map_is_null check below, but that should be
> done on all planes in the array, right?
> 
> I suspect the next patch, or another patch in this series, should just
> delete this chunk.



> 
>>   	}
>>   
>> +	if (!primary_plane_info)
>> +		return -EINVAL;
>> +
>>   	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
>>   		return -EINVAL;
>>   
>> +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>> +		return -EINVAL;
>>   
>> +	line_width = drm_rect_width(&primary_plane_info->dst);
>> +	stage_buffer.n_pixels = line_width;
>> +	output_buffer.n_pixels = line_width;
>>   
>> +	stage_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +	if (!stage_buffer.pixels) {
>> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
>> +		return -ENOMEM;
>> +	}
>>   
>> +	output_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +	if (!output_buffer.pixels) {
>> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
>> +		ret = -ENOMEM;
>> +		goto free_stage_buffer;
>> +	}
>> +
>> +	if (active_wb) {
>> +		struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
>> +
>> +		wb_format = wb_frame_info->fb->format->format;
> 
> I don't see wb_format being used, is it?

This is probably a leftover from the last versions. Thanks for catching
it.

> 
>> +		wb_frame_info->src = primary_plane_info->src;
>> +		wb_frame_info->dst = primary_plane_info->dst;
>> +	}
>> +
>> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
>> +	      &output_buffer, (s64)line_width * pixel_size);
> 
> What's the (s64) doing here?
> 
> Are byte sizes not usually expressed with size_t or ssize_t types, or
> is the kernel convention to use u64 and s64?
> 
> This makes me suspect that pixel_offset() and friends in vkms_format.c
> are going to need fixing as well. int type overflows at 2G.


Yeah, I should be using size_t in all these places.

> 
>> +
>> +	kvfree(output_buffer.pixels);
>> +free_stage_buffer:
>> +	kvfree(stage_buffer.pixels);
>> +can
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -222,13 +204,11 @@ void vkms_composer_worker(struct work_struct *work)
>>   						struct vkms_crtc_state,
>>   						composer_work);
>>   	struct drm_crtc *crtc = crtc_state->base.crtc;
>> +	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
>>   	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>>   	bool crc_pending, wb_pending;
>>   	u64 frame_start, frame_end;
>> +	u32 crc32 = 0;
>>   	int ret;
>>   
>>   	spin_lock_irq(&out->composer_lock);
>> @@ -248,35 +228,19 @@ void vkms_composer_worker(struct work_struct *work)
>>   	if (!crc_pending)
>>   		return;
>>   
>>   	if (wb_pending)
>> +		ret = compose_active_planes(active_wb, crtc_state, &crc32);
>> +	else
>> +		ret = compose_active_planes(NULL, crtc_state, &crc32);
>>   
>> +	if (ret)
>>   		return;
>>   
>>   	if (wb_pending) {
>>   		drm_writeback_signal_completion(&out->wb_connector, 0);
>>   		spin_lock_irq(&out->composer_lock);
>>   		crtc_state->wb_pending = false;
>>   		spin_unlock_irq(&out->composer_lock);
>>   	}
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> new file mode 100644
>> index 000000000000..931a61405d6a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -0,0 +1,151 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <drm/drm_rect.h>
>> +#include <linux/minmax.h>
>> +
>> +#include "vkms_formats.h"
>> +
>> +static int pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
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
>> + * @y: The y(Heigth) coordinate of the 2D buffercan
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
>> +	int offset = pixel_offset(frame_info, x, y);
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
>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			       stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
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
>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			       stage_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
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
>> +	int x, x_dst = frame_info->dst.x1;
>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
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
>> +	int x, x_dst = frame_info->dst.x1;
>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>> +			    src_buffer->n_pixels);
>> +
>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +		dst_pixels[3] = (u8)0xff;
> 
> When writing to XRGB, it's not necessary to ensure the X channel has
> any sensible value. Anyone reading from XRGB must ignore that value
> anyway. So why not write something wacky here, like 0xa1, that is far
> enough from both 0x00 or 0xff to not be confused with them even
> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
> 
> Or, you could save a whole function and just use argb_u16_to_ARGBxxxx()
> instead, even for XRGB destination.


Right. Maybe I could just leave the channel untouched.

> 
>> +		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
>> +		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
>> +		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
>> +	}
>> +}
>> +
>> +plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>> +{
>> +	if (format == DRM_FORMAT_ARGB8888)
>> +		return &ARGB8888_to_argb_u16;
>> +	else if (format == DRM_FORMAT_XRGB8888)
>> +		return &XRGB8888_to_argb_u16;
>> +	else
>> +		return NULL;
> 
> This works for now, but when more formats are added, I'd think a switch
> statement would look better.

ok.

> 
>> +}
>> +
>> +wb_format_transform_func get_wb_fmt_transform_function(u32 format)
>> +{
>> +	if (format == DRM_FORMAT_ARGB8888)
>> +		return &argb_u16_to_ARGB8888;
>> +	else if (format == DRM_FORMAT_XRGB8888)
>> +		return &argb_u16_to_XRGB8888;
>> +	else
>> +		return NULL;
>> +}
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
>> new file mode 100644
>> index 000000000000..adc5a17b9584
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
>> +plane_format_transform_func get_plane_fmt_transform_function(u32 format);
>> +
>> +wb_format_transform_func get_wb_fmt_transform_function(u32 format);
> 
> This is good, exposing only what is necessary.
> 
> 
> Thanks,
> pq
> 
>> +
>> +#endif /* _VKMS_FORMATS_H_ */
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 28752af0118c..798243837fd0 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_plane_helper.h>
>>   
>>   #include "vkms_drv.h"
>> +#include "vkms_formats.h"
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
>> +	vkms_plane_state->format_func = get_plane_fmt_transform_function(fmt);
>>   }
>>   
>>   static int vkms_plane_atomic_check(struct drm_plane *plane,
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index ad4bb1fb37ca..97f71e784bbf 100644
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
>> +	active_wb->format_func = get_wb_fmt_transform_function(wb_format);
>>   }
>>   
>>   static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
> 
