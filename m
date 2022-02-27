Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A74C5BEA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 15:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601C10E358;
	Sun, 27 Feb 2022 14:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBB210E358
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 14:20:16 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g6so15461362ybe.12
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 06:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdnhlIljl4nS7vtdvRCjIgegJ4cHtyLhAmS0UugArTE=;
 b=F57DC30N/Qn/HjwpxaEWWrzqkMdIqPpYWxy+iwY5fcqk2xUIUtq8iF4qFmS82kFt4k
 AraihgEwUnKC6/LR4vq2bKwUIVDBOBER3E3UhyfqkyrgBgXOC7iBUhzDMgxGeZM3iw2c
 QtT+u1pCJ1ipb73qOI7AnViQtKuZVY5NTsgzLjL5DRnVKtJZ6lCdn33/GoJYvdHjOwv4
 zquZ6IkeQJHF8nAnAmDDRtSPl1kdK8xEN4u82+mevAPbziybNMLVxg6Xt6D2RvsrG92i
 qyPHvQRPyQ7eRenqDEX1aD8785G1K8YG8eR4X3Hc1PuQ8umSuxN4ehtdo0Of+NAT3Kz7
 YleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdnhlIljl4nS7vtdvRCjIgegJ4cHtyLhAmS0UugArTE=;
 b=0B0h1R8NjINwuBfEhphoo2k9BD3kcpfSdDkkbCf6ydxy7W/iW6HnCzQbmU5NzYeaIJ
 eOzvZdm4+x3ENcwpqQ+FCkToW5TkmseoF/aDVwYhDcAAx1PjJS0tLBmgCTVUU/S1EHrG
 +EP+KB7wnu+CvGQ8ofrYIaNs33KZiZsh2KXa4vlH1PoeYx3p+ZkgjhP6EbwiLni4ejCs
 8a1x7FEtura6A73RgKCyDYOHrFEBByxcuZEoziUKfE502o6WEk+FR1+EZeBtXOgQLOlZ
 xP9C8RSO0P+O2x7l0oTO92YVW1ECTgyeRTeGTM+4WOd2b/NjpMurUHvnnxZ5wsNI2C2W
 iD+Q==
X-Gm-Message-State: AOAM531Y0CQPK2xfSPAGixqYS+XeRZn2ehJBCKSSwPJsYBSc2FtACZKM
 svZH5LntAMeTFnG9F1f+Pl0MCYiIoE42fzfWiQw=
X-Google-Smtp-Source: ABdhPJzx7AIiTAdxuJauIhJwcFSrNLeKTDSsW/v++N7/FPI1JhyfCXApzv0ZWrRZq3fgfwR4ZC4D73fcZpaouxA6hBY=
X-Received: by 2002:a25:3d06:0:b0:624:784f:461c with SMTP id
 k6-20020a253d06000000b00624784f461cmr15044920yba.258.1645971615559; Sun, 27
 Feb 2022 06:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220210113757.77b0a994@eldfell>
 <CAOA8r4Gv9v9YtAq+vOHZX1DJJrgmajY8cAoYs1sfpOa243gxfQ@mail.gmail.com>
 <20220225113827.09204373@eldfell>
In-Reply-To: <20220225113827.09204373@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Sun, 27 Feb 2022 10:19:49 -0400
Message-ID: <CAOA8r4HYzCxP8eH6rJ-LJDko-sYWquQviXsE-MOJ+THaCKNsZA@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 ~lkcamp/patches@lists.sr.ht, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 2/25/22 05:38, Pekka Paalanen wrote:
> On Thu, 24 Feb 2022 21:43:01 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
>> Hi Pekka,
>>
>> On 2/10/22 06:37, Pekka Paalanen wrote:
>>> On Fri, 21 Jan 2022 18:38:29 -0300
>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>
>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>>>> as a color input.
>>>>
>>>> This patch refactors all the functions related to the plane composition
>>>> to overcome this limitation.
>>>>
>>>> A new internal format(`struct pixel`) is introduced to deal with all
>>>> possible inputs. It consists of 16 bits fields that represent each of
>>>> the channels.
>>>>
>>>> The pixels blend is done using this internal format. And new handlers
>>>> are being added to convert a specific format to/from this internal format.
>>>>
>>>> So the blend operation depends on these handlers to convert to this common
>>>> format. The blended result, if necessary, is converted to the writeback
>>>> buffer format.
>>>>
>>>> This patch introduces three major differences to the blend function.
>>>> 1 - All the planes are blended at once.
>>>> 2 - The blend calculus is done as per line instead of per pixel.
>>>> 3 - It is responsible to calculates the CRC and writing the writeback
>>>>       buffer(if necessary).
>>>>
>>>> These changes allow us to allocate way less memory in the intermediate
>>>> buffer to compute these operations. Because now we don't need to
>>>> have the entire intermediate image lines at once, just one line is
>>>> enough.
>>>>
>>>> | Memory consumption (output dimensions) |
>>>> |:--------------------------------------:|
>>>> |       Current      |     This patch    |
>>>> |:------------------:|:-----------------:|
>>>> |   Width * Heigth   |     2 * Width     |
>>>>
>>>> Beyond memory, we also have a minor performance benefit from all
>>>> these changes. Results running the IGT tests `*kms_cursor_crc*`:
>>>>
>>>> |                 Frametime                  |
>>>> |:------------------------------------------:|
>>>> |  Implementation |  Current  |  This commit |
>>>> |:---------------:|:---------:|:------------:|
>>>> | frametime range |  8~22 ms  |    5~18 ms   |
>>>> |     Average     |  10.0 ms  |    7.3 ms    |
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>> ---
>>>> V2: Improves the performance drastically, by perfoming the operations
>>>>       per-line and not per-pixel(Pekka Paalanen).
>>>>       Minor improvements(Pekka Paalanen).
>>>>
>>>> V3: Changes the code to blend the planes all at once. This improves
>>>>       performance, memory consumption, and removes much of the weirdness
>>>>       of the V2(Pekka Paalanen and me).
>>>>       Minor improvements(Pekka Paalanen and me).
>>>>
>>>> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
>>>> ---
>>>>    drivers/gpu/drm/vkms/Makefile        |   1 +
>>>>    drivers/gpu/drm/vkms/vkms_composer.c | 335 +++++++++++++--------------
>>>>    drivers/gpu/drm/vkms/vkms_formats.c  | 138 +++++++++++
>>>>    drivers/gpu/drm/vkms/vkms_formats.h  |  31 +++
>>>>    4 files changed, 333 insertions(+), 172 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>>>
>>> Hi Igor,
>>>
>>> I'm really happy to see this, thanks!
>>>
>>> I still have some security/robustness and other comments below.
>>>
>>> I've deleted all the minus lines from the patch to make the new code
>>> more clear.
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
>>>> index 72f779cbfedd..1b28a6a32948 100644
>>>> --- a/drivers/gpu/drm/vkms/Makefile
>>>> +++ b/drivers/gpu/drm/vkms/Makefile
>>>> @@ -3,6 +3,7 @@ vkms-y := \
>>>>       vkms_drv.o \
>>>>       vkms_plane.o \
>>>>       vkms_output.o \
>>>> +    vkms_formats.o \
>>>>       vkms_crtc.o \
>>>>       vkms_composer.o \
>>>>       vkms_writeback.o
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> index 95029d2ebcac..9f70fcf84fb9 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> @@ -9,202 +9,210 @@
>>>>    #include <drm/drm_vblank.h>
>>>>
>>>>    #include "vkms_drv.h"
>>>> +#include "vkms_formats.h"
>>>>
>>>> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>>>    {
>>>> +    u32 new_color;
>>>>
>>>> +    new_color = (src * 0xffff + dst * (0xffff - alpha));
>>>>
>>>> +    return DIV_ROUND_UP(new_color, 0xffff);
>>>
>>> Why round-up rather than the usual mathematical rounding?
>>
>> AFAIK, this is the only round that's present in the kernel. And if I
>> understood correctly it is the round toward positive infinity that we are
>> all used to use.
>
> Should be pretty easy to round-up from 0.5 and round-down otherwise.
> Just add a different offset than DIV_ROUND_UP does.
>
> Not having a ready-made macro and habits are not good
> justifications. The justification needs to be mathematical.

Actually, I wasn't trying to argue about anything. Sorry if it sounded
that way.

Also, I had some confusion and I have to correct what I said. The
DIV_ROUND_UP isn't the usual mathematical rounding, it's more
like a round and ceiling.

I don't know why I thought that was the usual rounding.

>
> The problem with DIV_ROUND_UP that I see, is that 0x00000001 gets
> rounded to 0x0001, and anything that is even slightly above 0xfffe0000
> gets rounded to 0xffff. So it seems to me that this adds a bias to the
> result.
>
> Is my intuition right or wrong, I'm not sure. I do know that
>
> 0xffff * 0xffff = 0xfffe0001
>
> so values greater than 0xfffe0001 cannot occur.
>
> That seems to mean that there is exactly one 32-bit value that
> DIV_ROUND_UPs to 0x0000 and exactly one 32-bit value that DIV_ROUND_UPs
> to 0xffff. That doesn't feel right to me.
>
> Would need to compare to how the blending with real numbers would work.

Yeah, I agree, it makes sense to me.

I will change that, thanks!

>
>
>>>>     */
>>>> +static void blend(struct vkms_frame_info *wb_frame_info,
>>>
>>> Using "wb" as short for writeback is... well, it's hard for the me
>>> remember at least. Could this not be named simply "writeback"?
>>
>> IMHO it's better to use wb instead of writeback for consistency. Given that wb
>> is used throughout the vkms code.
>
> Right, so that's a problem for me.
>
> Is any other driver using wb for writeback?

Apparently, yes.

rcar_du_writeback.c:24:struct rcar_du_wb_conn_state {
rcar_du_writeback.c:29:#define to_rcar_wb_conn_state
rcar_du_writeback.c:219:        struct rcar_du_wb_job *rjob; q1
komeda_wb_connector.c:111:komeda_wb_connector_detect(...)
komeda_wb_connector.c:78:static const struct drm_encoder_helper_funcs
komeda_wb_encoder_helper_funcs = {qq
amdgpu_device.c:1095:static void amdgpu_device_wb_fini(...)

>
> I don't mind using wb in local variables, but in type names I would
> personally prefer more descriptive names.
>
>
>>>> +    int h_dst = drm_rect_height(&primary_plane_info->dst);
>>>>       int y_limit = y_src + h_dst;
>>>> +    int y, i;
>>>
>>> It took me a while to understand that all these y-coordinates are CRTC
>>> coordinates. Maybe call them crtc_y, crtc_y_begin, crtc_y_end,
>>> crtc_y_height, etc.
>>>
>>>> +
>>>> +    for (y = y_src; y < y_limit; y++) {
>>>> +            plane_fmt_func[0](primary_plane_info, y, output_buffer);
>>>
>>> This is initializing output_buffer, right? So why do you have the TODO
>>> comment about clearing the primary plane above?
>>>
>>> Is it because the primary plane may not cover the CRTC exactly, the
>>> destination rectangle might be bigger or smaller?
>>>
>>> The output_buffer length should be the CRTC width, right?
>>>
>>> Maybe the special-casing the primary plane in this code is wrong.
>>> crtc_y needs to iterate over the CRTC height starting from zero. Then,
>>> you explicitly clear output_buffer to opaque background color, and
>>> primary plane becomes just another plane in the array of active planes
>>> with no special handling here.
>>>
>>> That will allow you to support overlay planes *below* the primary plane
>>> (as is fairly common in non-PC hardware), and you can even support the
>>> background color KMS property.
>>
>> I thought that the primary would always cover the entire screen exactly.
>
> Nope. Maybe PC hardware has such limitations, but I'm quite sure there
> are display controllers that do not require this. Therefore VKMS should
> support the more generic case, and possible offer a configuration knob
> to reject atomic state where primary plane is not active or not
> covering the whole CRTC in order to be able to test userspace against
> such driver behaviour.
>
> After all, background color KMS property exists.

Ok, makes sense.

>
>>
>> So yeah, my patch code assumes that CRTC is the same size as the primary plane.
>> (and if I'm not mistaken the current version also assumes it).
>>
>> But If this is not the case, where are the CRTC dimensions?
>> Are they in the CRTC properties? drm_mode_config?
>>
>> I couldn't find them.
>
> It's the active area of the current video mode, I believe. How that
> translated to DRM code, I don't know.

I will try to find it.

>
>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> new file mode 100644
>>>> index 000000000000..0d1838d1b835
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> @@ -0,0 +1,138 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +
>>>> +#include <drm/drm_rect.h>
>>>> +#include "vkms_formats.h"
>>>> +
>>>> +format_transform_func get_fmt_transform_function(u32 format)
>>>> +{
>>>> +    if (format == DRM_FORMAT_ARGB8888)
>>>> +            return &ARGB8888_to_ARGB16161616;
>>>> +    else
>>>> +            return &XRGB8888_to_ARGB16161616;
>>>
>>> In functions like this you should prepare for caller errors. Use a
>>> switch, and fail any attempt to use a pixel format it doesn't support.
>>> Failing is much better than silently producing garbage or worse: buffer
>>> overruns when bytes-per-pixel is not what you expected.
>>>
>>> What to do on failure depends on whether the failure here is never
>>> supposed to happen (follow the kernel style) e.g. malicious userspace
>>> cannot trigger it, or if you actually use this function to define the
>>> supported for pixel formats.
>>
>> No, I don't use this function to define supported formats, It's defined:
>> - vkms_writeback.c:15
>> - vkms_plane.c:14 and 22
>>
>> And if I'm not mistaken the DRM framework takes care of validation.
>
> Then someone else comes, adds a new pixel format to those files, and
> does not even realize get_fmt_transform_function() exists.
>
> If you know that something must already ensure you cannot get
> unsupported pixel formats in this function, then I guess some kind of
> kernel panic here if you do get an unsupported pixel format would be
> appropriate? Or an oops.
>
> That would tell loud and clear to that other person they overlooked
> something. Assuming they test the code the new format.

Ok, got it. I will change it.

>
>>
>>>
>>> The latter means you'd have a list of all DRM pixel formats and then
>>> you'd ask for each one if this function knows it, and if yes, you add
>>> the format to the list of supported formats advertised to userspace. I
>>> don't know if that would be fine by DRM coding style.
>>>
>>>> +}
>>>> +
>>>> +format_transform_func get_wb_fmt_transform_function(u32 format)
>>>> +{
>>>> +    if (format == DRM_FORMAT_ARGB8888)
>>>> +            return &convert_to_ARGB8888;
>>>> +    else
>>>> +            return &convert_to_XRGB8888;
>>>> +}
>>>
>>> I think you could move the above getter functions to the bottom of the
>>> .c file, and make all the four *_to_* functions static, and remove them
>>> from the header.
>>
>> OK. I will do that.
>>
>> Question, what's the benefits of using static functions?
>
> Making code more contained. When people see that a function is static,
> they know it won't be directly referenced from any other file. This
> makes understanding easier. It's hygiene too: make everything static
> that could be static.
>
> Sometimes it can also have other benefits, like the compiler
> automatically inlining the whole thing, and not even emitting the
> independent function code. It might also speed up linking, as a static
> function cannot be a target.
>
>>>
>>>> +
>>>> +static int pixel_offset(struct vkms_frame_info *frame_info, int x, int y)
>>>> +{
>>>> +    return frame_info->offset + (y * frame_info->pitch)
>>>> +                              + (x * frame_info->cpp);
>>>> +}
>>>> +
>>>> +/*
>>>> + * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
>>>> + *
>>>> + * @frame_info: Buffer metadata
>>>> + * @x: The x(width) coordinate of the 2D buffer
>>>> + * @y: The y(Heigth) coordinate of the 2D buffer
>>>> + *
>>>> + * Takes the information stored in the frame_info, a pair of coordinates, and
>>>> + * returns the address of the first color channel.
>>>> + * This function assumes the channels are packed together, i.e. a color channel
>>>> + * comes immediately after another in the memory. And therefore, this function
>>>> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
>>>> + */
>>>> +static void *packed_pixels_addr(struct vkms_frame_info *frame_info, int x, int y)
>>>> +{
>>>> +    int offset = pixel_offset(frame_info, x, y);
>>>> +
>>>> +    return (u8 *)frame_info->map[0].vaddr + offset;
>>>> +}
>>>> +
>>>> +static void *get_packed_src_addr(struct vkms_frame_info *frame_info, int y)
>>>> +{
>>>> +    int x_src = frame_info->src.x1 >> 16;
>>>> +    int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
>>>> +
>>>> +    return packed_pixels_addr(frame_info, x_src, y_src);
>>>> +}
>>>> +
>>>> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
>>>> +                          struct line_buffer *stage_buffer)
>>>
>>> I'm fairly sure that DRM will one day add exactly ARGB16161616 format.
>
> Oops, I think the format already exists.
>
>>> But that will not be the format you use here (or it might be, but
>>> purely accidentally and depending on machine endianess and whatnot), so
>>> I would suggest inventing a new name. Also use the same name for the
>>> struct to hold a single pixel.
>>>
>>> E.g. struct pixel_argb_u16
>>
>> I'm terrible with names of variables, functions, etc. I will end-up with
>> ARGB8888_to_argb_u16.
>
> Sounds fine.
>
>>
>> I have a patch with the implementation of nv12 and YUV420 formats, but
>> I don't know how to test it because the ".*kms_plane@pixel-format*" igt test
>> doesn't support these formats (And also it isn't working anymore with my hack).
>>
>> Do you know how to test it?
>
> I think the best way would be to teach IGT to test it. Then everyone
> will automatically benefit from it.
>
> I don't really know anything about IGT code.
>
> FWIW, Weston has some YUV testing code I wrote in
> tests/yuv-buffer-test.c for the color conversions, but it's very
> limited scope (only BT.601, only limited range, and ignores chroma
> siting).

Right. I will do it later, As this patch series is already big enough.

Best Regards,
---
Igor Torrente

>
>
> Thanks,
> pq
