Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473B50EE56
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 03:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1338910E4A7;
	Tue, 26 Apr 2022 01:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B6E10E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 01:54:17 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so12090363otn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 18:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z0sTTkMLjACR6+TYf8oT8kFkK+A8gRoJCrX9+QSjFWY=;
 b=Fijd4lPdmd88I2Hs9v4Y+f4VN7+UE9CehpyIBb+QaRUlRJ+OmgyvZ05tNPHQH3/Qzc
 JSK4J2zblogThjSNnzvKNlCk7t/ImlXB1DMAHkTAngOmEtku+5eq0zkOp4AlD9TPNcXt
 CBic12C0YZARCIWCCaN2K1blLpTypu6GbEorzx+tmE/X/c32LlRCHN69hS6msvUclNtA
 17UXEmyx6IkKRrNHUAfSiaPHsN61QRNuR4MD75ijHE6Ap8k9B+Sz4oOtQXf6VNKPnDAP
 xIvOUqgN75qxpNLIK3jmCuuw1bj5MKpjA0sV2AatLSK6SXoWXSdYzmI7Jy1NDQi1XSzs
 +2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0sTTkMLjACR6+TYf8oT8kFkK+A8gRoJCrX9+QSjFWY=;
 b=R2dJSsgOLUtQ3ibkeM7YyKkRAE564G+T6rZmxr1joB0nPJT2wpgwC3csXgBpiCatSm
 GYfGPMMrSzeu5KwZKc6Dk/r0vy0tuN2ih/VmNqnSRJU2U7BJOG5Kd/WhGVFWiqyPedC9
 oeiejfsAAdZWKpzpMEYVWXCRwOOND59xqu/fb230BHkOrg47e3xyRLBzV2F2DIHU+p0O
 OcHINxxpvSdgwYuUDBW23qmEzZj1m4THh8rbtwO8WDo7SmsHtySIfKgA+LTlnc/e4rRW
 QKoZVdvya2d5/UJfKzwM66MJ1Pvx3H731WuLtqiHgaBGlDNI9fBh9DhhcNy5zfGQ6mJU
 cl5g==
X-Gm-Message-State: AOAM533LJCUo89QA+DJM3x2uCt+tTveNEb9qruWeyZ26xK2iGGlI/hRW
 3Ic22g5YQlL1ZzO9YhHLUHVHn329xr0=
X-Google-Smtp-Source: ABdhPJxFJUkQ8PWcX9IUz0xtK5lsYJRqSvDYHEkbYBmiAKeP5ydlZHFnby3Y4opJdrRuVBtdY3gW1Q==
X-Received: by 2002:a9d:7a53:0:b0:605:4dd7:b868 with SMTP id
 z19-20020a9d7a53000000b006054dd7b868mr7750211otm.11.1650938057076; 
 Mon, 25 Apr 2022 18:54:17 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48?
 ([2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48])
 by smtp.gmail.com with ESMTPSA id
 b188-20020aca34c5000000b002da579c994dsm4333386oia.31.2022.04.25.18.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 18:54:16 -0700 (PDT)
Message-ID: <caa885ed-208a-3810-bd3e-e497e2c9ba93@gmail.com>
Date: Mon, 25 Apr 2022 22:54:12 -0300
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
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
 <20220425111026.485cba66@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220425111026.485cba66@eldfell>
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

On 4/25/22 05:10, Pekka Paalanen wrote:
> On Sat, 23 Apr 2022 15:53:20 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> I forgot to respond some points from your review.
>>
>> On 4/23/22 13:04, Igor Torrente wrote:
>>> Hi Pekka,
>>>
>>> On 4/20/22 09:36, Pekka Paalanen wrote:
>>>> On Mon,  4 Apr 2022 17:45:12 -0300
>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>>   
>>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>>>>> as a color input.
>>>>>
>>>>> This patch refactors all the functions related to the plane composition
>>>>> to overcome this limitation.
>>>>>
>>>>> A new internal format(`struct pixel`) is introduced to deal with all
>>>>
>>>> Hi,
>>>>
>>>> struct pixel_argb_u16 was added in the previous patch.
>>>
>>> I will fix it. Thanks!
> 
> ...
> 
>>>>> +static int compose_active_planes(struct vkms_writeback_job *active_wb,
>>>>> +				 struct vkms_crtc_state *crtc_state,
>>>>> +				 u32 *crc32)
>>>>>     {
>>>>> +	int line_width, ret = 0, pixel_size = sizeof(struct pixel_argb_u16);
>>>>> +	struct vkms_frame_info *primary_plane_info = NULL;
>>>>> +	struct line_buffer output_buffer, stage_buffer;
>>>>> +	struct vkms_plane_state *act_plane = NULL;
>>>>> +	u32 wb_format;
>>>>>     
>>>>> +	if (WARN_ON(pixel_size != 8))
>>>>
>>>> Isn't there a compile-time assert macro for this? Having to actually
>>>> run VKMS to check for this reduces the chances of finding it early.
>>>> What's the reason for this check anyway?
>>
>> Yes, it exists.
>>
>> include/linux/build_bug.h:1:#define static_assert(expr, ...)
>> __static_assert(expr, ##__VA_ARGS__, #expr)
>>
>> I didn't add it because I can imagine some people very mad if the kernel
>> did not compile because of vkms.
> 
> But that would mean that VKMS is broken on those platforms. You'd
> better know which platforms VKMS is broken, so the Kconfig can stop
> VKMS from being built there at all. Or better, fix it before anyone
> needs VKMS there.

Right. Makes sense. I will add it then.

> 
>> This check exists so we can call `crc32_le` for the entire line instead
>> doing it for each channel of each pixel in case `struct `pixel_argb_u16`
>> had any gap added by the compiler between the struct fields.
> 
> Oh the CRC computation. Good point.
> 
> Can you add a comment about that with the check?

Yeah, np.

I will copy the explanation above :)

> 
>>>>   
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (crtc_state->num_active_planes >= 1) {
>>>>> +		act_plane = crtc_state->active_planes[0];
>>>>> +		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
>>>>> +			primary_plane_info = act_plane->frame_info;
>>>>
>>>> After the next patch, do you even need the primary plane for anything
>>>> specifically?
>>
>> Yeah, I will not need it anymore.
>>
>>>> There is the map_is_null check below, but that should be
>>>> done on all planes in the array, right?
>>
>> Yes, I guess so. And I don't know why it only checks for the
>> primary_plane TBH.
> 
> Maybe a left-over from times when it didn't have anything but a primary
> plane?

Maybe.

Anyway, I have added this verification to all active planes in the  next 
version.

> 
>>>>
>>>> I suspect the next patch, or another patch in this series, should just
>>>> delete this chunk.
>> I should, and I will in the V6 of next patch.
>>
>>>
>>>
>>>    
>>>>   
>>>>>     	}
>>>>>     
>>>>> +	if (!primary_plane_info)
>>>>> +		return -EINVAL;
>>>>> +
>>>>>     	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
>>>>>     		return -EINVAL;
>>>>>     
>>>>> +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>>>>> +		return -EINVAL;
>>>>>     
>>>>> +	line_width = drm_rect_width(&primary_plane_info->dst);
>>>>> +	stage_buffer.n_pixels = line_width;
>>>>> +	output_buffer.n_pixels = line_width;
>>>>>     
>>>>> +	stage_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>>>>> +	if (!stage_buffer.pixels) {
>>>>> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
>>>>> +		return -ENOMEM;
>>>>> +	}
>>>>>     
>>>>> +	output_buffer.pixels = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>>>>> +	if (!output_buffer.pixels) {
>>>>> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
>>>>> +		ret = -ENOMEM;
>>>>> +		goto free_stage_buffer;
>>>>> +	}
>>>>> +
>>>>> +	if (active_wb) {
>>>>> +		struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
>>>>> +
>>>>> +		wb_format = wb_frame_info->fb->format->format;
>>>>
>>>> I don't see wb_format being used, is it?
>>>
>>> This is probably a leftover from the last versions. Thanks for catching
>>> it.
>>>    
>>>>   
>>>>> +		wb_frame_info->src = primary_plane_info->src;
>>>>> +		wb_frame_info->dst = primary_plane_info->dst;
>>>>> +	}
>>>>> +
>>>>> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
>>>>> +	      &output_buffer, (s64)line_width * pixel_size);
>>>>
>>>> What's the (s64) doing here?
>>>>
>>>> Are byte sizes not usually expressed with size_t or ssize_t types, or
>>>> is the kernel convention to use u64 and s64?
>>>>
>>>> This makes me suspect that pixel_offset() and friends in vkms_format.c
>>>> are going to need fixing as well. int type overflows at 2G.
>>>
>>>
>>> Yeah, I should be using size_t in all these places.
>>>    
>>>>   
>>>>> +
>>>>> +	kvfree(output_buffer.pixels);
>>>>> +free_stage_buffer:
>>>>> +	kvfree(stage_buffer.pixels);
>>>>> +can
>>>>> +	return ret;
>>>>>     }
>>>>>     
>>>>>     /**
>>>>> @@ -222,13 +204,11 @@ void vkms_composer_worker(struct work_struct *work)
>>>>>     						struct vkms_crtc_state,
>>>>>     						composer_work);
>>>>>     	struct drm_crtc *crtc = crtc_state->base.crtc;
>>>>> +	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
>>>>>     	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>>>>>     	bool crc_pending, wb_pending;
>>>>>     	u64 frame_start, frame_end;
>>>>> +	u32 crc32 = 0;
>>>>>     	int ret;
>>>>>     
>>>>>     	spin_lock_irq(&out->composer_lock);
>>>>> @@ -248,35 +228,19 @@ void vkms_composer_worker(struct work_struct *work)
>>>>>     	if (!crc_pending)
>>>>>     		return;
>>>>>     
>>>>>     	if (wb_pending)
>>>>> +		ret = compose_active_planes(active_wb, crtc_state, &crc32);
>>>>> +	else
>>>>> +		ret = compose_active_planes(NULL, crtc_state, &crc32);
>>>>>     
>>>>> +	if (ret)
>>>>>     		return;
>>>>>     
>>>>>     	if (wb_pending) {
>>>>>     		drm_writeback_signal_completion(&out->wb_connector, 0);
>>>>>     		spin_lock_irq(&out->composer_lock);
>>>>>     		crtc_state->wb_pending = false;
>>>>>     		spin_unlock_irq(&out->composer_lock);
>>>>>     	}
>>>>>     
>>>>>     	/*
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>> new file mode 100644
>>>>> index 000000000000..931a61405d6a
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>> @@ -0,0 +1,151 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>>> +
>>>>> +#include <drm/drm_rect.h>
>>>>> +#include <linux/minmax.h>
>>>>> +
>>>>> +#include "vkms_formats.h"
>>>>> +
>>>>> +static int pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>>>>> +{
>>>>> +	return frame_info->offset + (y * frame_info->pitch)
>>>>> +				  + (x * frame_info->cpp);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
>>>>> + *
>>>>> + * @frame_info: Buffer metadata
>>>>> + * @x: The x(width) coordinate of the 2D buffer
>>>>> + * @y: The y(Heigth) coordinate of the 2D buffercan
>>>>> + *
>>>>> + * Takes the information stored in the frame_info, a pair of coordinates, and
>>>>> + * returns the address of the first color channel.
>>>>> + * This function assumes the channels are packed together, i.e. a color channel
>>>>> + * comes immediately after another in the memory. And therefore, this function
>>>>> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
>>>>> + */
>>>>> +static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>>>>> +				int x, int y)
>>>>> +{
>>>>> +	int offset = pixel_offset(frame_info, x, y);
>>>>> +
>>>>> +	return (u8 *)frame_info->map[0].vaddr + offset;
>>>>> +}
>>>>> +
>>>>> +static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
>>>>> +{
>>>>> +	int x_src = frame_info->src.x1 >> 16;
>>>>> +	int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
>>>>> +
>>>>> +	return packed_pixels_addr(frame_info, x_src, y_src);
>>>>> +}
>>>>> +
>>>>> +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
>>>>> +				 const struct vkms_frame_info *frame_info, int y)
>>>>> +{
>>>>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>>>>> +	u8 *src_pixels = get_packed_src_addr(frame_info, y);
>>>>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>> +			       stage_buffer->n_pixels);
>>>>> +
>>>>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
>>>>> +		/*
>>>>> +		 * The 257 is the "conversion ratio". This number is obtained by the
>>>>> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>>>>> +		 * the best color value in a pixel format with more possibilities.
>>>>> +		 * A similar idea applies to others RGB color conversions.
>>>>> +		 */
>>>>> +		out_pixels[x].a = (u16)src_pixels[3] * 257;
>>>>> +		out_pixels[x].r = (u16)src_pixels[2] * 257;
>>>>> +		out_pixels[x].g = (u16)src_pixels[1] * 257;
>>>>> +		out_pixels[x].b = (u16)src_pixels[0] * 257;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
>>>>> +				 const struct vkms_frame_info *frame_info, int y)
>>>>> +{
>>>>> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>>>>> +	u8 *src_pixels = get_packed_src_addr(frame_info, y);
>>>>> +	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>> +			       stage_buffer->n_pixels);
>>>>> +
>>>>> +	for (x = 0; x < x_limit; x++, src_pixels += 4) {
>>>>> +		out_pixels[x].a = (u16)0xffff;
>>>>> +		out_pixels[x].r = (u16)src_pixels[2] * 257;
>>>>> +		out_pixels[x].g = (u16)src_pixels[1] * 257;
>>>>> +		out_pixels[x].b = (u16)src_pixels[0] * 257;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * The following  functions take an line of argb_u16 pixels from the
>>>>> + * src_buffer, convert them to a specific format, and store them in the
>>>>> + * destination.
>>>>> + *
>>>>> + * They are used in the `compose_active_planes` to convert and store a line
>>>>> + * from the src_buffer to the writeback buffer.
>>>>> + */
>>>>> +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
>>>>> +				 const struct line_buffer *src_buffer, int y)
>>>>> +{
>>>>> +	int x, x_dst = frame_info->dst.x1;
>>>>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>>>>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>>>>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>> +			    src_buffer->n_pixels);
>>>>> +
>>>>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>>>>> +		/*
>>>>> +		 * This sequence below is important because the format's byte order is
>>>>> +		 * in little-endian. In the case of the ARGB8888 the memory is
>>>>> +		 * organized this way:
>>>>> +		 *
>>>>> +		 * | Addr     | = blue channel
>>>>> +		 * | Addr + 1 | = green channel
>>>>> +		 * | Addr + 2 | = Red channel
>>>>> +		 * | Addr + 3 | = Alpha channel
>>>>> +		 */
>>>>> +		dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
>>>>> +		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
>>>>> +		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
>>>>> +		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
>>>>> +				 const struct line_buffer *src_buffer, int y)
>>>>> +{
>>>>> +	int x, x_dst = frame_info->dst.x1;
>>>>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>>>>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>>>>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>> +			    src_buffer->n_pixels);
>>>>> +
>>>>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>>>>> +		dst_pixels[3] = (u8)0xff;
>>>>
>>>> When writing to XRGB, it's not necessary to ensure the X channel has
>>>> any sensible value. Anyone reading from XRGB must ignore that value
>>>> anyway. So why not write something wacky here, like 0xa1, that is far
>>>> enough from both 0x00 or 0xff to not be confused with them even
>>>> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
>>>>
>>>> Or, you could save a whole function and just use argb_u16_to_ARGBxxxx()
>>>> instead, even for XRGB destination.
>>>
>>>
>>> Right. Maybe I could just leave the channel untouched.
> 
> Untouched may not be a good idea. Leaving anything untouched always has
> the risk of leaking information through uninitialized memory. Maybe not
> in this case because the destination is allocated by userspace already,
> but nothing beats being obviously correct.

Makes sense.

> 
> Whatever you decide here, be prepared for it becoming de-facto kernel
> UABI, because it is easy for userspace to (accidentally) rely on the
> value, no matter what you pick.

I hope to make the right decision then.

> 
> 
> Thanks,
> pq
> 
> 
>>>    
>>>>   
>>>>> +		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
>>>>> +		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
>>>>> +		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>>>>> +{
>>>>> +	if (format == DRM_FORMAT_ARGB8888)
>>>>> +		return &ARGB8888_to_argb_u16;
>>>>> +	else if (format == DRM_FORMAT_XRGB8888)
>>>>> +		return &XRGB8888_to_argb_u16;
>>>>> +	else
>>>>> +		return NULL;
>>>>
>>>> This works for now, but when more formats are added, I'd think a switch
>>>> statement would look better.
>>>
>>> ok.
>>>    
>>>>   
>>>>> +}
>>>>> +
>>>>> +wb_format_transform_func get_wb_fmt_transform_function(u32 format)
>>>>> +{
>>>>> +	if (format == DRM_FORMAT_ARGB8888)
>>>>> +		return &argb_u16_to_ARGB8888;
>>>>> +	else if (format == DRM_FORMAT_XRGB8888)
>>>>> +		return &argb_u16_to_XRGB8888;
>>>>> +	else
>>>>> +		return NULL;
>>>>> +}
