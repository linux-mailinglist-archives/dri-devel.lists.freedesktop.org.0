Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749B4C3A6E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E266D10E159;
	Fri, 25 Feb 2022 00:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666010E159
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 00:43:29 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07c4a0d06so16787487b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E1+NFtaUTch0bpm9xIKRWTnp08xiBPVGJc8lA9iAl38=;
 b=bMD6X32W48R4cXWIFYVzW24r8cqtmrd5y97ERYwMJY0b9PT4NaX3xIzPM3eGHa/JAh
 UolU/SuLs+rMfMUP+M9qhyJcXKhnjjKmFeoY3ZJXVtk5ZAuX69ageRpAwimzfMFqAIV8
 Rpd5egh/AfEaEgbuFldxcWGpj6kiJVQMlViHLqDa2Tp6O3R+8Nme5buOtCbqFAJoq4Oc
 I1thawSAhDd5gzBnM4qhj0uCRcv3NfMrak5b4ZDuF3nRvSBlf/SnL6UflUhmEpKiTwtl
 VmXhULyDJHn5BpB5Poqutk7dD5KJjRJvpjX6pUiCyqnQm+bhmWDL2HTaY0ux9hSVws2y
 8rmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1+NFtaUTch0bpm9xIKRWTnp08xiBPVGJc8lA9iAl38=;
 b=gb2UUAqjNDOdTvMnO8UnhLYpZYC5pkIC+CO0yjMISQkscwqvIJzyWNMMOd+G+mGd2c
 XbiQxPN/hP/ps03Pos9/IlE+5kpEKr6XBb4bXApdmso72SDHV7J0JUbwWsT2PaNIcei+
 N4s+CSvKWFAFEofnGTuRK1kF+VH+0ozB3XFOMhVct4XvEeLRfmYw9+xqF3LgC9SqKXTv
 83ngr8KG71X0s/GmhEb2JsB+l8Cp3VYVgf8+R+rRf4OY0Hkk9SX7MLjqdfZayLl763gh
 3DvK/BKSm9f0dUF8HSo3KQsTeD9bUkR8qywgB4Nlp9MxS8kVgTPvNUSMaDsKzI3OjJud
 8BZQ==
X-Gm-Message-State: AOAM533HCVYgKUl2ISh18UuKjnb9GcqoFmy+gFmj7NytpZJxoycMyXOP
 r8QGp9oIN2mskFxJVvSOyNBzU7uHsYrpixg0hL7g17/nD1g=
X-Google-Smtp-Source: ABdhPJzyiSziSJ4cp+zArjM8DGkFjDx53HetNvkleYaSUXSqCGbbaXy2dn3y3htj3ukJT3zZGYsJLAXp9Lok9HQbUTg=
X-Received: by 2002:a81:3e25:0:b0:2d7:931:a5ce with SMTP id
 l37-20020a813e25000000b002d70931a5cemr5263059ywa.302.1645749808021; Thu, 24
 Feb 2022 16:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220210113757.77b0a994@eldfell>
In-Reply-To: <20220210113757.77b0a994@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Thu, 24 Feb 2022 21:43:01 -0300
Message-ID: <CAOA8r4Gv9v9YtAq+vOHZX1DJJrgmajY8cAoYs1sfpOa243gxfQ@mail.gmail.com>
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

On 2/10/22 06:37, Pekka Paalanen wrote:
> On Fri, 21 Jan 2022 18:38:29 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>> as a color input.
>>
>> This patch refactors all the functions related to the plane composition
>> to overcome this limitation.
>>
>> A new internal format(`struct pixel`) is introduced to deal with all
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
>>      buffer(if necessary).
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
>> these changes. Results running the IGT tests `*kms_cursor_crc*`:
>>
>> |                 Frametime                  |
>> |:------------------------------------------:|
>> |  Implementation |  Current  |  This commit |
>> |:---------------:|:---------:|:------------:|
>> | frametime range |  8~22 ms  |    5~18 ms   |
>> |     Average     |  10.0 ms  |    7.3 ms    |
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>> V2: Improves the performance drastically, by perfoming the operations
>>      per-line and not per-pixel(Pekka Paalanen).
>>      Minor improvements(Pekka Paalanen).
>>
>> V3: Changes the code to blend the planes all at once. This improves
>>      performance, memory consumption, and removes much of the weirdness
>>      of the V2(Pekka Paalanen and me).
>>      Minor improvements(Pekka Paalanen and me).
>>
>> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
>> ---
>>   drivers/gpu/drm/vkms/Makefile        |   1 +
>>   drivers/gpu/drm/vkms/vkms_composer.c | 335 +++++++++++++--------------
>>   drivers/gpu/drm/vkms/vkms_formats.c  | 138 +++++++++++
>>   drivers/gpu/drm/vkms/vkms_formats.h  |  31 +++
>>   4 files changed, 333 insertions(+), 172 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>
> Hi Igor,
>
> I'm really happy to see this, thanks!
>
> I still have some security/robustness and other comments below.
>
> I've deleted all the minus lines from the patch to make the new code
> more clear.
>
>>
>> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
>> index 72f779cbfedd..1b28a6a32948 100644
>> --- a/drivers/gpu/drm/vkms/Makefile
>> +++ b/drivers/gpu/drm/vkms/Makefile
>> @@ -3,6 +3,7 @@ vkms-y := \
>>      vkms_drv.o \
>>      vkms_plane.o \
>>      vkms_output.o \
>> +    vkms_formats.o \
>>      vkms_crtc.o \
>>      vkms_composer.o \
>>      vkms_writeback.o
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 95029d2ebcac..9f70fcf84fb9 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -9,202 +9,210 @@
>>   #include <drm/drm_vblank.h>
>>
>>   #include "vkms_drv.h"
>> +#include "vkms_formats.h"
>>
>> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>> +    u32 new_color;
>>
>> +    new_color = (src * 0xffff + dst * (0xffff - alpha));
>>
>> +    return DIV_ROUND_UP(new_color, 0xffff);
>
> Why round-up rather than the usual mathematical rounding?

AFAIK, this is the only round that's present in the kernel. And if I
understood correctly it is the round toward positive infinity that we are
all used to use.

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
>> +                            struct line_buffer *stage_buffer,
>> +                            struct line_buffer *output_buffer)
>>   {
>> +    int x, x_dst = frame_info->dst.x1;
>> +    int x_limit = drm_rect_width(&frame_info->dst);
>> +    struct line_buffer *out = output_buffer + x_dst;
>> +    struct line_buffer *in = stage_buffer;
>
> Here you would check that you don't overrun any of the arrays. At this
> point, I believe an overrun would indicate a bug in VKMS, so handle it
> according to the kernel conventions. I have suggestions below
> how to make that check possible. In other places, I'll just say "check
> for overruns" for short.
>
>> +
>> +    for (x = 0; x < x_limit; x++) {
>> +            out[x].a = (u16)0xffff;
>> +            out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
>> +            out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
>> +            out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
>>      }
>>   }
>>
>> +static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
>>   {
>> +    if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
>> +            return true;
>>
>> +    return false;
>>   }
>>
>>   /**
>> + * @wb_frame_info: The writeback frame buffer metadata
>> + * @wb_fmt_func: The format tranformatio function to the wb buffer
>> + * @crtc_state: The crtc state
>> + * @plane_fmt_func: A format tranformation function to each plane
>
> Is it not *from* each plane?
>
> Each plane... does this mean that all planes must have the same pixel
> format?
>
> Oh wait, it's a pointer, so an array, isn't it? You're passing in an
> array without passing in the array size. That seems quite risky to me.
> Think of someone else needing to patch something here without fully
> understanding how this all works, they'd easily introduce a subtle bug.
>
> Looks like the array must be number of "active planes" long. So it's
> not even a constant, and the size of the array is not documented here.

I didn't think about it. But it makes a lot of sense to me.

>
> What if the fmt_func was a field in struct vkms_frame_info? So you
> could set it when creating a vkms_frame_info. Wouldn't that simplify
> the code in blend() and its callers?

This is a great idea! I will change it to the next version.

>
>> + * @crc32: The crc output of the final frame
>> + * @output_buffer: A buffer of a row that will receive the result of the blend(s)
>> + * @stage_buffer: The line with the pixels from src_compositor
>
> I don't see src_compositor?

Oops.

>
>>    *
>> + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>> + * from all planes, calculates the crc32 of the output from the former step,
>> + * and, if necessary, convert and store the output to the writeback buffer.
>>    *
>>    * TODO: completely clear the primary plane (a = 0xff) before starting to blend
>>    * pixel color values
>
> Mm, you only need to clear output_buffer, not the whole writeback FB.
> output_buffer will unconditionally and totally overwrite the writeback
> FB, right?

Right. If I understand it correctly, this was necessary to be implemented
because of the way the previous code handles the alpha channel.

>
>>    */
>> +static void blend(struct vkms_frame_info *wb_frame_info,
>
> Using "wb" as short for writeback is... well, it's hard for the me
> remember at least. Could this not be named simply "writeback"?

IMHO it's better to use wb instead of writeback for consistency. Given that wb
is used throughout the vkms code.

>
>> +              format_transform_func wb_fmt_func,
>
> "writeback_func"
>
>> +              struct vkms_crtc_state *crtc_state,
>> +              format_transform_func *plane_fmt_func,
>> +              u32 *crc32, struct line_buffer *stage_buffer,
>> +              struct line_buffer *output_buffer, s64 row_size)
>>   {
>> +    struct vkms_plane_state **plane = crtc_state->active_planes;
>> +    struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
>> +    u32 n_active_planes = crtc_state->num_active_planes;
>>
>> +    int y_src = primary_plane_info->dst.y1;
>
> Shouldn't this be called y_dst instead?

Yes, it should. And will for v5.

>
>> +    int h_dst = drm_rect_height(&primary_plane_info->dst);
>>      int y_limit = y_src + h_dst;
>> +    int y, i;
>
> It took me a while to understand that all these y-coordinates are CRTC
> coordinates. Maybe call them crtc_y, crtc_y_begin, crtc_y_end,
> crtc_y_height, etc.
>
>> +
>> +    for (y = y_src; y < y_limit; y++) {
>> +            plane_fmt_func[0](primary_plane_info, y, output_buffer);
>
> This is initializing output_buffer, right? So why do you have the TODO
> comment about clearing the primary plane above?
>
> Is it because the primary plane may not cover the CRTC exactly, the
> destination rectangle might be bigger or smaller?
>
> The output_buffer length should be the CRTC width, right?
>
> Maybe the special-casing the primary plane in this code is wrong.
> crtc_y needs to iterate over the CRTC height starting from zero. Then,
> you explicitly clear output_buffer to opaque background color, and
> primary plane becomes just another plane in the array of active planes
> with no special handling here.
>
> That will allow you to support overlay planes *below* the primary plane
> (as is fairly common in non-PC hardware), and you can even support the
> background color KMS property.

I thought that the primary would always cover the entire screen exactly.

So yeah, my patch code assumes that CRTC is the same size as the primary plane.
(and if I'm not mistaken the current version also assumes it).

But If this is not the case, where are the CRTC dimensions?
Are they in the CRTC properties? drm_mode_config?

I couldn't find them.

>
>> +
>> +            /* If there are other planes besides primary, we consider the active
>> +             * planes should be in z-order and compose them associatively:
>> +             * ((primary <- overlay) <- cursor)
>> +             */
>> +            for (i = 1; i < n_active_planes; i++) {
>> +                    if (!check_y_limit(plane[i]->frame_info, y))
>> +                            continue;
>> +
>> +                    plane_fmt_func[i](plane[i]->frame_info, y, stage_buffer);
>> +                    pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>> +                                        output_buffer);
>>              }
>> +
>> +            *crc32 = crc32_le(*crc32, (void *)output_buffer, row_size);
>> +
>> +            if (wb_frame_info)
>> +                    wb_fmt_func(wb_frame_info, y, output_buffer);
>>      }
>>   }
>>
>> +static void get_format_transform_functions(struct vkms_crtc_state *crtc_state,
>> +                                       format_transform_func plane_funcs[])
>>   {
>> +    struct vkms_plane_state **active_planes = crtc_state->active_planes;
>> +    u32 n_active_planes = crtc_state->num_active_planes, s_fmt;
>> +    int i;
>>
>> +    for (i = 0; i < n_active_planes; i++) {
>> +            s_fmt = active_planes[i]->frame_info->fb->format->format;
>> +            plane_funcs[i] = get_fmt_transform_function(s_fmt);
>> +    }
>> +}
>>
>> +static bool check_planes_x_bounds(struct vkms_crtc_state *crtc_state,
>> +                              struct vkms_frame_info *wb_frame_info)
>> +{
>> +    struct vkms_plane_state **planes = crtc_state->active_planes;
>> +    struct vkms_frame_info *primary_plane_info = planes[0]->frame_info;
>> +    int line_width = drm_rect_width(&primary_plane_info->dst);
>> +    u32 n_active_planes = crtc_state->num_active_planes;
>> +    int i;
>>
>> +    for (i = 0; i < n_active_planes; i++) {
>> +            int x_dst = planes[i]->frame_info->dst.x1;
>> +            int x_src = planes[i]->frame_info->src.x1 >> 16;
>> +            int x2_src = planes[i]->frame_info->src.x2 >> 16;
>> +            int x_limit = drm_rect_width(&planes[i]->frame_info->dst);
>>
>> +            if (x_dst + x_limit > line_width)
>> +                    return false;
>> +            if (x_src + x_limit > x2_src)
>> +                    return false;
>> +    }
>
> That's interesting. Looks like you reject everything if any plane is
> not fully inside the primary plane destination rectangle. But that's
> not the right check, is it? If you want to check this, you would check
> against the CRTC dimensions.

The same wrong assumption here.

>
> Then again, I think some hardware do allow planes to reach outside of
> the CRTC dimensions. Cursor plane is probably the best example. The
> cursor can be partly off-screen. So this is something that would need
> to be supported both ways I suppose, but going with the "all plane
> destination rectangles must be strictly inside the CRTC dimensions" is
> a good start.
>
> But why only x-coordinate check? y should have the same rules, right?

My code is inconsistent in this regard.

I created this function to prevent out-of-bound memory access by checking all
the X-axis limits, but because the blend loop ends, no matter what, at
the primary
Y-limit (which until now I assumed to be exactly the CRTC dimensions),
I don't check the Y-axis because it's not possible to cause any
out-of-bound access.

So, unintentionally, we have the partial off-screen for the Y-axis but
nor the X-axis.

>
>> +
>> +    return true;
>>   }
>>
>> +static int compose_active_planes(struct vkms_frame_info *wb_frame_info,
>> +                             struct vkms_crtc_state *crtc_state,
>> +                             u32 *crc32)
>>   {
>> +    format_transform_func plane_funcs[NUM_OVERLAY_PLANES], wb_func = NULL;
>> +    int line_width, ret = 0, pixel_size = sizeof(struct line_buffer);
>> +    struct vkms_frame_info *primary_plane_info = NULL;
>> +    struct line_buffer *output_buffer, *stage_buffer;
>> +    struct vkms_plane_state *act_plane = NULL;
>> +    u32 wb_format;
>>
>> +    if (WARN_ON(pixel_size != 8))
>> +            return -EINVAL;
>> +
>> +    if (crtc_state->num_active_planes >= 1) {
>> +            act_plane = crtc_state->active_planes[0];
>> +            if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +                    primary_plane_info = act_plane->frame_info;
>>      }
>>
>> +    if (!primary_plane_info)
>> +            return -EINVAL;
>> +
>>      if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
>>              return -EINVAL;
>>
>> +    if (WARN_ON(!check_planes_x_bounds(crtc_state, wb_frame_info)))
>> +            return -EINVAL;
>>
>> +    line_width = drm_rect_width(&primary_plane_info->dst);
>
> This needs to be CRTC width, not primary plane width.
>
>>
>> +    stage_buffer = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +    if (!stage_buffer) {
>> +            DRM_ERROR("Cannot allocate memory for the output line buffer");
>> +            return -ENOMEM;
>> +    }
>>
>> +    output_buffer = kvmalloc(line_width * pixel_size, GFP_KERNEL);
>> +    if (!output_buffer) {
>> +            DRM_ERROR("Cannot allocate memory for intermediate line buffer");
>> +            ret = -ENOMEM;
>> +            goto free_stage_buffer;
>> +    }
>> +
>> +    get_format_transform_functions(crtc_state, plane_funcs);
>> +
>> +    if (wb_frame_info) {
>> +            wb_format = wb_frame_info->fb->format->format;
>> +            wb_func = get_wb_fmt_transform_function(wb_format);
>> +            wb_frame_info->src = primary_plane_info->src;
>> +            wb_frame_info->dst = primary_plane_info->dst;
>> +    }
>> +
>> +    blend(wb_frame_info, wb_func, crtc_state, plane_funcs, crc32,
>> +          stage_buffer, output_buffer, (s64)line_width * pixel_size);
>> +
>> +    kvfree(output_buffer);
>> +free_stage_buffer:
>> +    kvfree(stage_buffer);
>> +
>> +    return ret;
>>   }
>>
>>   /**
>> @@ -222,13 +230,12 @@ void vkms_composer_worker(struct work_struct *work)
>>                                              struct vkms_crtc_state,
>>                                              composer_work);
>>      struct drm_crtc *crtc = crtc_state->base.crtc;
>> +    struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
>> +    struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
>>      struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>>      bool crc_pending, wb_pending;
>>      u64 frame_start, frame_end;
>> +    u32 crc32 = 0;
>>      int ret;
>>
>>      spin_lock_irq(&out->composer_lock);
>> @@ -248,35 +255,19 @@ void vkms_composer_worker(struct work_struct *work)
>>      if (!crc_pending)
>>              return;
>>
>>      if (wb_pending)
>> +            ret = compose_active_planes(wb_frame_info, crtc_state, &crc32);
>> +    else
>> +            ret = compose_active_planes(NULL, crtc_state, &crc32);
>>
>> +    if (ret)
>>              return;
>>
>>      if (wb_pending) {
>>              drm_writeback_signal_completion(&out->wb_connector, 0);
>>              spin_lock_irq(&out->composer_lock);
>>              crtc_state->wb_pending = false;
>>              spin_unlock_irq(&out->composer_lock);
>>      }
>>
>>      /*
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> new file mode 100644
>> index 000000000000..0d1838d1b835
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -0,0 +1,138 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#include <drm/drm_rect.h>
>> +#include "vkms_formats.h"
>> +
>> +format_transform_func get_fmt_transform_function(u32 format)
>> +{
>> +    if (format == DRM_FORMAT_ARGB8888)
>> +            return &ARGB8888_to_ARGB16161616;
>> +    else
>> +            return &XRGB8888_to_ARGB16161616;
>
> In functions like this you should prepare for caller errors. Use a
> switch, and fail any attempt to use a pixel format it doesn't support.
> Failing is much better than silently producing garbage or worse: buffer
> overruns when bytes-per-pixel is not what you expected.
>
> What to do on failure depends on whether the failure here is never
> supposed to happen (follow the kernel style) e.g. malicious userspace
> cannot trigger it, or if you actually use this function to define the
> supported for pixel formats.

No, I don't use this function to define supported formats, It's defined:
- vkms_writeback.c:15
- vkms_plane.c:14 and 22

And if I'm not mistaken the DRM framework takes care of validation.

>
> The latter means you'd have a list of all DRM pixel formats and then
> you'd ask for each one if this function knows it, and if yes, you add
> the format to the list of supported formats advertised to userspace. I
> don't know if that would be fine by DRM coding style.
>
>> +}
>> +
>> +format_transform_func get_wb_fmt_transform_function(u32 format)
>> +{
>> +    if (format == DRM_FORMAT_ARGB8888)
>> +            return &convert_to_ARGB8888;
>> +    else
>> +            return &convert_to_XRGB8888;
>> +}
>
> I think you could move the above getter functions to the bottom of the
> .c file, and make all the four *_to_* functions static, and remove them
> from the header.

OK. I will do that.

Question, what's the benefits of using static functions?

>
>> +
>> +static int pixel_offset(struct vkms_frame_info *frame_info, int x, int y)
>> +{
>> +    return frame_info->offset + (y * frame_info->pitch)
>> +                              + (x * frame_info->cpp);
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
>> +static void *packed_pixels_addr(struct vkms_frame_info *frame_info, int x, int y)
>> +{
>> +    int offset = pixel_offset(frame_info, x, y);
>> +
>> +    return (u8 *)frame_info->map[0].vaddr + offset;
>> +}
>> +
>> +static void *get_packed_src_addr(struct vkms_frame_info *frame_info, int y)
>> +{
>> +    int x_src = frame_info->src.x1 >> 16;
>> +    int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
>> +
>> +    return packed_pixels_addr(frame_info, x_src, y_src);
>> +}
>> +
>> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
>> +                          struct line_buffer *stage_buffer)
>
> I'm fairly sure that DRM will one day add exactly ARGB16161616 format.
> But that will not be the format you use here (or it might be, but
> purely accidentally and depending on machine endianess and whatnot), so
> I would suggest inventing a new name. Also use the same name for the
> struct to hold a single pixel.
>
> E.g. struct pixel_argb_u16

I'm terrible with names of variables, functions, etc. I will end-up with
ARGB8888_to_argb_u16.

>
> So that it is clear it is not meant to be any specific DRM_FORMAT_* format.
>
>> +{
>> +    u8 *src_pixels = get_packed_src_addr(frame_info, y);
>> +    int x, x_limit = drm_rect_width(&frame_info->dst);
>> +
>> +    for (x = 0; x < x_limit; x++, src_pixels += 4) {
>> +            /*
>> +             * Organizes the channels in their respective positions and converts
>> +             * the 8 bits channel to 16.
>> +             * The 257 is the "conversion ratio". This number is obtained by the
>> +             * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>> +             * the best color value in a pixel format with more possibilities.
>> +             * And a similar idea applies to others RGB color conversions.
>> +             */
>> +            stage_buffer[x].a = (u16)src_pixels[3] * 257;
>> +            stage_buffer[x].r = (u16)src_pixels[2] * 257;
>> +            stage_buffer[x].g = (u16)src_pixels[1] * 257;
>> +            stage_buffer[x].b = (u16)src_pixels[0] * 257;
>> +    }
>> +}
>> +
>> +void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
>> +                          struct line_buffer *stage_buffer)
>> +{
>> +    u8 *src_pixels = get_packed_src_addr(frame_info, y);
>> +    int x, x_limit = drm_rect_width(&frame_info->dst);
>> +
>> +    for (x = 0; x < x_limit; x++, src_pixels += 4) {
>> +            stage_buffer[x].a = (u16)0xffff;
>> +            stage_buffer[x].r = (u16)src_pixels[2] * 257;
>> +            stage_buffer[x].g = (u16)src_pixels[1] * 257;
>> +            stage_buffer[x].b = (u16)src_pixels[0] * 257;
>> +    }
>> +}
>> +
>> +/*
>> + * The following  functions take an line of ARGB16161616 pixels from the
>> + * src_buffer, convert them to a specific format, and store them in the
>> + * destination.
>> + *
>> + * They are used in the `compose_active_planes` to convert and store a line
>> + * from the src_buffer to the writeback buffer.
>> + */
>> +void convert_to_ARGB8888(struct vkms_frame_info *frame_info,
>> +                     int y, struct line_buffer *src_buffer)
>
> Please, use consistent function naming style. These are using "convert"
> while the other ones are using "ARGB16161616".
>
>> +{
>> +    int x, x_dst = frame_info->dst.x1;
>> +    u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +    int x_limit = drm_rect_width(&frame_info->dst);
>> +
>> +    for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +            /*
>> +             * This sequence below is important because the format's byte order is
>> +             * in little-endian. In the case of the ARGB8888 the memory is
>> +             * organized this way:
>> +             *
>> +             * | Addr     | = blue channel
>> +             * | Addr + 1 | = green channel
>> +             * | Addr + 2 | = Red channel
>> +             * | Addr + 3 | = Alpha channel
>> +             */
>> +            dst_pixels[3] = DIV_ROUND_UP(src_buffer[x].a, 257);
>> +            dst_pixels[2] = DIV_ROUND_UP(src_buffer[x].r, 257);
>> +            dst_pixels[1] = DIV_ROUND_UP(src_buffer[x].g, 257);
>> +            dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
>> +    }
>> +}
>> +
>> +void convert_to_XRGB8888(struct vkms_frame_info *frame_info,
>> +                     int y, struct line_buffer *src_buffer)
>> +{
>> +    int x, x_dst = frame_info->dst.x1;
>> +    u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>> +    int x_limit = drm_rect_width(&frame_info->dst);
>> +
>> +    for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>> +            dst_pixels[3] = (u8)0xff;
>> +            dst_pixels[2] = DIV_ROUND_UP(src_buffer[x].r, 257);
>> +            dst_pixels[1] = DIV_ROUND_UP(src_buffer[x].g, 257);
>> +            dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
>> new file mode 100644
>> index 000000000000..817e8b2124ae
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _VKMS_FORMATS_H_
>> +#define _VKMS_FORMATS_H_
>> +
>> +#include "vkms_drv.h"
>> +
>> +struct line_buffer {
>
> As I mentioned above, this would be called pixel_argb_u16 or something
> like that.
>
>> +    u16 a, r, g, b;
>> +};
>
> I was trying to suggest that a line_buffer would actually hold a whole
> line, something like the pseudo code:
>
> struct line_buffer {
>       size_t len_pixels;
>       struct my_pixel_type pixels[];
> }
>
> or whatever the kernel style for a variable length array at the end of
> a struct is. Field names are suggestions.
>
> Then it is easy to check that you don't overflow any line_buffer when
> operating on them.

Ok. I will change it.

>
>> +
>> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
>> +                          struct line_buffer *stage_buffer);
>> +
>> +void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
>> +                          struct line_buffer *stage_buffer);
>> +
>> +void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
>> +                     struct line_buffer *src_buffer);
>> +
>> +void convert_to_XRGB8888(struct vkms_frame_info *frame_info, int y,
>> +                     struct line_buffer *src_buffer);
>
> You should only need the below functions and not the above ones in this header.
>
>> +
>> +typedef void (*format_transform_func)(struct vkms_frame_info *frame_info, int y,
>> +                                  struct line_buffer *buffer);
>
> The arguments for this function-pointer should be documented,
> especially that y is the y-coordinate in CRTC coordinate space, i.e.
> plane destination rectangle. You might even call it crtc_y.
>
> I think you should use two different function-pointer types for the two
> different kinds of functions:
> - reads arbitrary pixel format and writes to rgba_u16
> - reads rgba_u16 and writes to arbitrary pixel format
>
> This will prevent any mistakes in accidentally using the wrong kind of
> function. If you also have the argument order different between the two
> types of functions, getting them mixed up is even less likely. I
> presume the kernel uses the function(destination, source) style of
> argument ordering. You can also use 'const' on the source, that is a
> good way to document things too.
>
> The consequence of using the wrong function could be the leak of kernel
> memory content to userspace, which is pretty bad. So preventing that
> kind of problems before they happen is nice.

Okay, all of this makes a lot of sense. I will change it to the next version.

Last question for this email,

I have a patch with the implementation of nv12 and YUV420 formats, but
I don't know how to test it because the ".*kms_plane@pixel-format*" igt test
doesn't support these formats (And also it isn't working anymore with my hack).

Do you know how to test it?

Best Regards,
---
Igor Torrente

>
>> +
>> +format_transform_func get_fmt_transform_function(u32 format);
>> +
>> +format_transform_func get_wb_fmt_transform_function(u32 format);
>> +
>> +#endif /* _VKMS_FORMATS_H_ */
>
>
> Good work!
>
>
> Thanks,
> pq
