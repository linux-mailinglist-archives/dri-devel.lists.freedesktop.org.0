Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4A44D7D2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 15:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BF89FD1;
	Thu, 11 Nov 2021 14:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EAE89E63
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 14:07:50 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id d10so15406961ybe.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 06:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xC5rKdwXxCYtftYhhGRRs+JcBs05P8vMQisg8MdmaQ=;
 b=O8MzyZFGVm6+pO1aa0qeak3hYS5Yj0QnnqcTPXyen+BXbYq3Y9HbRdu04Z9rv4A74b
 12iTr0GZ173I8MY2Yka7fIFkDnn2aJ5zj1Nc34C4iXkwAwhk+6HbBFIPAeG69p1Mp8+a
 ZmqUSIkVQ5M5FaEU4VDpzyzGMKqvQ0LGPsbkRknhmk2BtPJ0jOB6GLclFs8jjU2JFoH2
 lWV2okHrdxPWi1Z1NIL920w9oUS1JhG6E2FoHjNDlvTsQqozYqKnSVhWf7jsF6hUDxUD
 Q30m6J0kjiLfhL4quWkV5s1/cRvJTftEQ5vWlfzU/zRnu2oiLwhnFUDTueW87EUJhw3R
 y0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xC5rKdwXxCYtftYhhGRRs+JcBs05P8vMQisg8MdmaQ=;
 b=xn7rfJkbT1sC7HWsQFL8eDqWBs5XyzYdSDalgo28B/FpjggJrTCzCrAnEnLxjMZi8u
 VYVx2FYMJtOwuMs1RARj/IrxLq0oQOfg5twhPd7lx13+dif4fEc/gPZdxgpKRS2/SvdY
 KAo/+OKZYNC1n0am9AGygJ03Dnmix7GF5WVeEo/akJFIeJJm/kgEGFMgPvSbJA5xJ/Z1
 XMGBHk9zitCs3HsPzEWGG0+GZgST6NY2P276BqsObZexrSmVMg9XWwQxJ+mQZWfnDKb/
 yKDGUdxEumzcVTnRuWcuWQxsbCk2Uu7Ne4VH4TEaNW539Z/jGer6xlou+SMUaythCIAa
 Rh1Q==
X-Gm-Message-State: AOAM533TsKxkd7x9/WowKE3Wb4xga+R1NChvC6WLkxKCEIAEFH675LAq
 eafshJjOcfrwhoQHsj58csS+9JkKU0Yt8mMjeWU=
X-Google-Smtp-Source: ABdhPJzIAElWR3UQkJ4jWc5AJoO+LDtb4FY/4yhEscT0Ba0+Eq+Nq+dDupCfZJiqnCpGAmRwUfIqQuzG5qxZAKRSdrc=
X-Received: by 2002:a25:6e41:: with SMTP id j62mr7637434ybc.92.1636639669428; 
 Thu, 11 Nov 2021 06:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-7-igormtorrente@gmail.com>
 <20211109134017.09e71c77@eldfell>
 <CAOA8r4FHpmu0ZPjTj+qM0rV5jyQ2vt467uX1vhnqUbmBUMm3dA@mail.gmail.com>
 <20211111113337.0fd68f75@eldfell>
In-Reply-To: <20211111113337.0fd68f75@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Thu, 11 Nov 2021 11:07:21 -0300
Message-ID: <CAOA8r4H-=NAxuMzJumDDHxgq2_opg6509sJN-W7EM3+LNsey2g@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept
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
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Nov 11, 2021 at 6:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 10 Nov 2021 13:56:54 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
> > On Tue, Nov 9, 2021 at 8:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > Hi Igor,
> > >
> > > again, that is a really nice speed-up. Unfortunately, I find the code
> > > rather messy and hard to follow. I hope my comments below help with
> > > re-designing it to be easier to understand.
> > >
> > >
> > > On Tue, 26 Oct 2021 08:34:06 -0300
> > > Igor Torrente <igormtorrente@gmail.com> wrote:
> > >
> > > > Currently the blend function only accepts XRGB_8888 and ARGB_8888
> > > > as a color input.
> > > >
> > > > This patch refactors all the functions related to the plane composition
> > > > to overcome this limitation.
> > > >
> > > > Now the blend function receives a struct `vkms_pixel_composition_functions`
> > > > containing two handlers.
> > > >
> > > > One will generate a buffer of each line of the frame with the pixels
> > > > converted to ARGB16161616. And the other will take this line buffer,
> > > > do some computation on it, and store the pixels in the destination.
> > > >
> > > > Both the handlers have the same signature. They receive a pointer to
> > > > the pixels that will be processed(`pixels_addr`), the number of pixels
> > > > that will be treated(`length`), and the intermediate buffer of the size
> > > > of a frame line (`line_buffer`).
> > > >
> > > > The first function has been totally described previously.
> > >
> > > What does this sentence mean?
> >
> > In the sentence "One will generate...", I give an overview of the two types of
> > handlers. And the overview of the first handler describes the full behavior of
> > it.
> >
> > But it doesn't look clear enough, I will improve it in the future.
> >
> > >
> > > >
> > > > The second is more interesting, as it has to perform two roles depending
> > > > on where it is called in the code.
> > > >
> > > > The first is to convert(if necessary) the data received in the
> > > > `line_buffer` and write in the memory pointed by `pixels_addr`.
> > > >
> > > > The second role is to perform the `alpha_blend`. So, it takes the pixels
> > > > in the `line_buffer` and `pixels_addr`, executes the blend, and stores
> > > > the result back to the `pixels_addr`.
> > > >
> > > > The per-line implementation was chosen for performance reasons.
> > > > The per-pixel functions were having performance issues due to indirect
> > > > function call overhead.
> > > >
> > > > The per-line code trades off memory for execution time. The `line_buffer`
> > > > allows us to diminish the number of function calls.
> > > >
> > > > Results in the IGT test `kms_cursor_crc`:
> > > >
> > > > |                     Frametime                       |
> > > > |:---------------:|:---------:|:----------:|:--------:|
> > > > |  implmentation  |  Current  |  Per-pixel | Per-line |
> > > > | frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
> > > > |     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > > ---
> > > > V2: Improves the performance drastically, by perfoming the operations
> > > >     per-line and not per-pixel(Pekka Paalanen).
> > > >     Minor improvements(Pekka Paalanen).
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++-----------
> > > >  drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
> > > >  2 files changed, 342 insertions(+), 134 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > index 383ca657ddf7..69fe3a89bdc9 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > @@ -9,18 +9,26 @@
> > > >  #include <drm/drm_vblank.h>
> > > >
> > > >  #include "vkms_drv.h"
> > > > -
> > > > -static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > > > -                              const struct vkms_composer *composer)
> > > > -{
> > > > -     u32 pixel;
> > > > -     int src_offset = composer->offset + (y * composer->pitch)
> > > > -                                   + (x * composer->cpp);
> > > > -
> > > > -     pixel = *(u32 *)&buffer[src_offset];
> > > > -
> > > > -     return pixel;
> > > > -}
> > > > +#include "vkms_formats.h"
> > > > +
> > > > +#define get_output_vkms_composer(buffer_pointer, composer)           \
> > > > +     ((struct vkms_composer) {                                       \
> > > > +             .fb = &(struct drm_framebuffer) {                       \
> > > > +                     .format = &(struct drm_format_info) {           \
> > > > +                             .format = DRM_FORMAT_ARGB16161616,      \
> > > > +                     },                                              \
> > >
> > > Is that really how one can initialize a drm_format_info? Does that
> > > struct not have a lot more fields? Shouldn't you call a function to
> > > look up the proper struct with all fields populated?
> >
> > I did this macro to just fill the necessary fields, and add more of them
> > as necessary.
> >
> > I was implementing something very similar to the algorithm that
> > you described below. So this macro will not exist in the next version.
> >
> > >
> > > > +             },                                                      \
> > > > +             .map[0].vaddr = (buffer_pointer),                       \
> > > > +             .src = (composer)->src,                                 \
> > > > +             .dst = (composer)->dst,                                 \
> > > > +             .cpp = sizeof(u64),                                     \
> > > > +             .pitch = drm_rect_width(&(composer)->dst) * sizeof(u64) \
> > > > +     })
> > >
> > > Why is this a macro rather than a function?
> >
> > I don't have a good answer for that. I'm just more used to these kinds of
> > initializations using macro instead of function.
> >
> > >
> > > > +
> > > > +struct vkms_pixel_composition_functions {
> > > > +     void (*get_src_line)(void *pixels_addr, int length, u64 *line_buffer);
> > > > +     void (*set_output_line)(void *pixels_addr, int length, u64 *line_buffer);
> > >
> > > I would be a little more comfortable if instead of u64 *line_buffer you
> > > would have something like
> > >
> > > struct line_buffer {
> > >         u16 *row;
> > >         size_t nelem;
> > > }
> > >
> > > so that the functions to be plugged into these function pointers could
> > > assert that you do not accidentally overflow the array (which would
> > > imply a code bug in kernel).
> > >
> > > One could perhaps go even for:
> > >
> > > struct line_pixel {
> > >         u16 r, g, b, a;
> > > };
> > >
> > > struct line_buffer {
> > >         struct line_pixel *row;
> > >         size_t npixels;
> > > };
> >
> > If we decide to follow this representation, would it be possible
> > to calculate the crc in the similar way that is being done currently?
> >
> > Something like that:
> >
> > crc = crc32_le(crc, line_buffer.row, w * sizeof(line_pixel));
>
> Hi Igor,
>
> yes. I think the CRC calculated does not need to be reproducible in
> userspace, so you can very well compute it from the internal
> intermediate representation. It also does not need to be portable
> between architectures, AFAIU.

Great! This will make things easier.

>
> > I mean, If the compiler can decide to put a padding somewhere, it
> > would mess with the crc value. Right?
>
> Padding could mess it up, yes. However, I think in kernel it is a
> convention to define structs (especially UAPI structs but this is not
> one) such that there is no implicit padding. So there must be some
> recommended practises on how to achieve and ensure that.
>
> The size of struct line_pixel as defined above is 8 bytes which is a
> "very round" number, and every field has the same type, so there won't
> be gaps between fields either. So I think the struct should already be
> fine and have no padding, but how to make sure it is, I'm not sure what
> you would do in kernel land.
>
> In userspace I would put a static assert to ensure that
> sizeof(struct line_pixel) = 8. That would be enough, because sizeof
> counts not just internal implicit padding but also the needed size
> extension for alignment in an array of those. The accumulated size of
> the fields individually is 8 bytes, so if the struct size is 8, there
> cannot be padding.
>

Apparently the kernel uses a compiler extension in a macro to do this
kind of struct packing.

include/linux/compiler_attributes.h
265:#define __packed                        __attribute__((__packed__))

> > >
> > > Because as I mention further down, there is no need for the line buffer
> > > to use an existing DRM pixel format at all.
> > >
> >
> > All this is fine for me. I will change that to the next patch version.
> >
> > > > +};
> > > >
> > > >  /**
> > > >   * compute_crc - Compute CRC value on output frame
> > > > @@ -31,179 +39,222 @@ static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > > >   * returns CRC value computed using crc32 on the visible portion of
> > > >   * the final framebuffer at vaddr_out
> > > >   */
> > > > -static uint32_t compute_crc(const u8 *vaddr,
> > > > +static uint32_t compute_crc(const __le64 *vaddr,
> > > >                           const struct vkms_composer *composer)
> > > >  {
> > > > -     int x, y;
> > > > -     u32 crc = 0, pixel = 0;
> > > > -     int x_src = composer->src.x1 >> 16;
> > > > -     int y_src = composer->src.y1 >> 16;
> > > > -     int h_src = drm_rect_height(&composer->src) >> 16;
> > > > -     int w_src = drm_rect_width(&composer->src) >> 16;
> > > > -
> > > > -     for (y = y_src; y < y_src + h_src; ++y) {
> > > > -             for (x = x_src; x < x_src + w_src; ++x) {
> > > > -                     pixel = get_pixel_from_buffer(x, y, vaddr, composer);
> > > > -                     crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
> > > > -             }
> > > > -     }
> > > > +     int h = drm_rect_height(&composer->dst);
> > > > +     int w = drm_rect_width(&composer->dst);
> > > >
> > > > -     return crc;
> > > > +     return crc32_le(0, (void *)vaddr, w * h * sizeof(u64));
> > > >  }
> > > >
> > > > -static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> > > > +static __le16 blend_channel(u16 src, u16 dst, u16 alpha)
> > >
> > > This function is doing the OVER operation (Porter-Duff classification)
> > > assuming pre-multiplied alpha. I think the function name should reflect
> > > that. At the very least it should somehow note pre-multiplied alpha,
> > > because KMS property "pixel blend mode" can change that.
> >
> > The closest that it has is a comment in the alpha_blend function.
> >
> > But, aside from that, `pre_mul_channel_blend` look good to you?
>
> That would be fine, or just 'blend_premult'.
>
> Later it could get two siblings, blend_none and blend_coverage, to
> match "pixel blend mode" property.

OK.

>
> > >
> > > 'alpha' should be named 'src_alpha'.
> > >
> > > >  {
> > > > -     u32 pre_blend;
> > > > -     u8 new_color;
> > > > +     u64 pre_blend;
> > >
> > > I'm not quite sure if u32 would suffice... max value for src is
> > > 0xffff * src_alpha / 0xffff = src_alpha. Max value for dst is 0xffff.
> >
> > I didn't understand this division. What does the second 0xffff represent?
>
> src_alpha is u16, so the divisor is the normalising factor.
>
> Channel value and src_alpha are u16 which means they are essentially
> 0.16 fixed point format. If you multiply the two together as u16, the
> result would be a 0.32 fixed point format in u32. To get back to 0.16
> format, you divide by 0xffff.
>
> Actually, this should be obvious, I was just thinking about it too
> complicated.
>
> Since src is pre-multiplied, it follows that src <= src_alpha. If you
> think in real numbers [0.0, 1.0], it should be easy to see. If
> src > src_alpha, then it would mean that the original straight color value
> was out of range (greater than 1.0).
>

Ohh. Got it.

> >
> > >
> > > So we have at max
> > >
> > > src_alpha * 0xffff + 0xffff * (0xffff - src_alpha)
> > >
> > > Each multiplication independently will fit in u32.
> > >
> > > Rearranging we get
> > >
> > > src_alpha * 0xffff + 0xffff * 0xffff - 0xffff * src_alpha
> > >
> > > which equals
> > >
> > > 0xffff * 0xffff
> > >
> > > which fits in u32 and does not depend on src_alpha.
> > >
> > > So unless I made a mistake, looks like u32 should be enough. On 32-bit
> > > CPUs it should have speed benefits compared to u64.
> > >
> > > > +     u16 new_color;
> > > >
> > > > -     pre_blend = (src * 255 + dst * (255 - alpha));
> > > > +     pre_blend = (src * 0xffff + dst * (0xffff - alpha));
> > >
> > > 'pre_blend' means "before blending" so maybe a better name here as the
> > > blending is already done.
> > >
> >
> > I don't have a good name right now, but I will think of something.
> >
> > > >
> > > > -     /* Faster div by 255 */
> > > > -     new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> > > > +     new_color = DIV_ROUND_UP(pre_blend, 0xffff);
> > > >
> > > > -     return new_color;
> > > > +     return cpu_to_le16(new_color);
> > >
> > > What's the thing with cpu_to_le16 here?
> > >
> > > I think the temporary line buffers could just be using the cpu-native
> > > u16 type. There is no DRM format code for that, but we don't need one
> > > either. This format is not for interoperation with anything else, it's
> > > just internal here, and the main goals with it are precision and speed.
> > >
> > > As such, the temporary line buffers could be simply u16 arrays, so you
> > > don't need to consider the channel packing into a u64.
> > >
> >
> > This wouldn't cause a problem to calculate the crc in BE machines?
>
> I don't think so, because userspace cannot expect CRC values to be
> portable between machines, drivers or display chips.
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#display-crc-support
>
> Thanks to Simon Ser for finding that piece of doc.

I will drop the `cpu_to_le16` then. Thanks.

>
> > > >  }
> > > >
> > >
> > >
> > >
> > > From here on, I will be removing the diff minus lines from the quoted
> > > code, because these functions are completely new.
> > >
> > > >  /**
> > > >   * alpha_blend - alpha blending equation
> > >
> > > This is specifically the pre-multiplied alpha blending, so reflect that
> > > in the function name.
> > >
> >
> > OK, I will use `pre_mul_alpha_blend`. Or something similar.
> >
> > > > + * @src_composer: source framebuffer's metadata
> > > > + * @dst_composer: destination framebuffer's metadata
> > > > + * @y: The y coodinate(heigth) of the line that will be processed
> > > > + * @line_buffer: The line with the pixels from src_compositor
> > > >   *
> > > >   * blend pixels using premultiplied blend formula. The current DRM assumption
> > > >   * is that pixel color values have been already pre-multiplied with the alpha
> > > >   * channel values. See more drm_plane_create_blend_mode_property(). Also, this
> > > >   * formula assumes a completely opaque background.
> > > > + *
> > > > + * For performance reasons this function also fetches the pixels from the
> > > > + * destination of the frame line y.
> > > > + * We use the information that one of the source pixels are in the output
> > > > + * buffer to fetch it here instead of separate function. And because the
> > > > + * output format is ARGB16161616, we know that they don't need to be
> > > > + * converted.
> > > > + * This save us a indirect function call for each line.
> > >
> > > I think this paragraph should be obvious from the type of 'line_buffer'
> > > parameter and that you are blending src into dst.
> > >
> > > >   */
> > > > +static void alpha_blend(void *pixels_addr, int length, u64 *line_buffer)
> > > >  {
> > > > +     __le16 *output_pixel = pixels_addr;
> > >
> > > Aren't you supposed to be writing into line_buffer, not into src?
> > >
> > > There is something very strange with the logic here.
> > >
> > > In fact, the function signature of the blending function is unexpected.
> > > A blending function should operate on two line_buffers, not what looks
> > > like arbitrary buffer pixels.
> > >
> > > I think you should forget the old code and design these from scratch.
> > > You would have three different kinds of functions:
> > >
> > > - loading: fetch a row from an image and convert into a line buffer
> > > - blending: take two line buffers and blend them into one of the line
> > >   buffers
> > > - storing: convert a line buffer and write it into an image row
> > >
> > > I would not coerce these three different operations into less than
> > > three function pointer types.
> > >
> > > To actually run a blending operation between source and destination
> > > images, you would need four function pointers:
> > > - loader for source (by pixel format)
> > > - loader for destination (by pixel format)
> > > - blender (by chosen blending operation)
> > > - storing for destination (by pixel format)
> > >
> > > Function parameter types should make it obvious whether something is an
> > > image or row in arbitrary format, or a line buffer in the special
> > > internal format.
> > >
> > > Then the algorithm would work roughly like this:
> > >
> > > for each plane:
> > >         for each row:
> > >                 load source into lb1
> > >                 load destination into lb2
> > >                 blend lb1 into lb2
> > >                 store lb2 into destination
> > >
> > > This is not optimal, you see how destination is repeatedly loaded and
> > > stored for each plane. So you could swap the loops:
> > >
> > > allocate lb1, lb2 with destination width
> > > for each destination row:
> > >         load destination into lb2
> > >
> > >         for each plane:
> > >                 load source into lb1
> > >                 blend lb1 into lb2
> > >
> > >         store lb2 into destination
> >
> > I'm doing something very similar right now, based on comments from the
> > previous emails. It looks very similar to your pseudocode.
> >
> > And this solves several weirdnesses of my code that you commented
> > throughout this review.
> >
> > But I made a decision that I would like to hear your thoughts about it.
> >
> > Using your variables, instead of storing the lb2 in the destination,
> > I'm using it to calculate the CRC in the middle of the compositing loop.
> > And if necessary, storing/converting the lb2 into the wb buffer.
> >
> > So the pseudocode looks like that:
> >
> > allocate lb1, lb2 with destination width
> > for each destination row:
> >         load destination into lb2
> >
> >         for each plane:
> >                 load source into lb1
> >                 blend lb1 into lb2
> >
> >         compute crc of lb2
> >
> >         if wb pending
> >                  convert and store ib2 to wb buffer
> >
> > return crc
> >
> > With that we avoid the allocation of the full image buffer.
>
> Yes, exactly. Sounds good.
>
>
> > >
> > > Inside the loop over plane, you need to check if the plane overlaps the
> > > current destination row at all. If not, continue on the next plane. If
> > > yes, load source into lb1 and compute the offset into lb2 where it
> > > needs to be blended.
> >
> > Thanks for this tip, this is an optimization that, currently, my code doesn't
> > have.
> >
> > >
> > > Since we don't support scaling yet, lb1 length will never exceed
> > > destination width, because there is no need to load plane buffer pixels
> > > we would not be writing out.
> > >
> > > Also "load destination into lb2" could be replaced with just "clear
> > > lb2" is the old destination contents are to be discarded. Then you also
> > > don't need the function pointer for "loader for destination".
> > >
> > > I think you already had all these ideas, just the execution in code got
> > > really messy somehow.
> > >
> > > > +     int i;
> > > >
> > > > +     for (i = 0; i < length; i++) {
> > > > +             u16 src1_a = line_buffer[i] >> 48;
> > > > +             u16 src1_r = (line_buffer[i] >> 32) & 0xffff;
> > > > +             u16 src1_g = (line_buffer[i] >> 16) & 0xffff;
> > > > +             u16 src1_b = line_buffer[i] & 0xffff;
> > >
> > > If you used native u16 array for line buffers, all this arithmetic
> > > would be unnecessary.
> > >
> > > >
> > > > +             u16 src2_r = le16_to_cpu(output_pixel[2]);
> > > > +             u16 src2_g = le16_to_cpu(output_pixel[1]);
> > > > +             u16 src2_b = le16_to_cpu(output_pixel[0]);
> > > > +
> > > > +             output_pixel[0] = blend_channel(src1_b, src2_b, src1_a);
> > > > +             output_pixel[1] = blend_channel(src1_g, src2_g, src1_a);
> > > > +             output_pixel[2] = blend_channel(src1_r, src2_r, src1_a);
> > > > +             output_pixel[3] = 0xffff;
> > > > +
> > > > +             output_pixel += 4;
> > > > +     }
> > > >  }
> > > >
> > > >  /**
> > > >   * @src_composer: source framebuffer's metadata
> > > > + * @dst_composer: destiny framebuffer's metadata
> > > > + * @funcs: A struct containing all the composition functions(get_src_line,
> > > > + *         and set_output_pixel)
> > > > + * @line_buffer: The line with the pixels from src_compositor
> > > >   *
> > > > + * Using the pixel_blend function passed as parameter, this function blends
> > > > + * all pixels from src plane into a output buffer (with a blend function
> > > > + * passed as parameter).
> > > > + * Information of the output buffer is in the dst_composer parameter
> > > > + * and the source plane in the src_composer.
> > > > + * The get_src_line will use the src_composer to get the respective line,
> > > > + * convert, and return it as ARGB_16161616.
> > > > + * And finally, the blend function will receive the dst_composer, dst_composer,
> > > > + * the line y coodinate, and the line buffer. Blend all pixels, and store the
> > > > + * result in the output.
> > > >   *
> > > >   * TODO: completely clear the primary plane (a = 0xff) before starting to blend
> > > >   * pixel color values
> > > >   */
> > > > +static void blend(struct vkms_composer *src_composer,
> > > >                 struct vkms_composer *dst_composer,
> > > > +               struct vkms_pixel_composition_functions *funcs,
> > > > +               u64 *line_buffer)
> > > >  {
> > > > +     int i, i_dst;
> > > >
> > > >       int x_src = src_composer->src.x1 >> 16;
> > > >       int y_src = src_composer->src.y1 >> 16;
> > > >
> > > >       int x_dst = src_composer->dst.x1;
> > > >       int y_dst = src_composer->dst.y1;
> > > > +
> > > >       int h_dst = drm_rect_height(&src_composer->dst);
> > > > +     int length = drm_rect_width(&src_composer->dst);
> > > >
> > > >       int y_limit = y_src + h_dst;
> > > > +
> > > > +     u8 *src_pixels = packed_pixels_addr(src_composer, x_src, y_src);
> > > > +     u8 *dst_pixels = packed_pixels_addr(dst_composer, x_dst, y_dst);
> > > > +
> > > > +     int src_next_line_offset = src_composer->pitch;
> > > > +     int dst_next_line_offset = dst_composer->pitch;
> > > > +
> > > > +     for (i = y_src, i_dst = y_dst; i < y_limit; ++i, i_dst++) {
> > > > +             funcs->get_src_line(src_pixels, length, line_buffer);
> > > > +             funcs->set_output_line(dst_pixels, length, line_buffer);
> > > > +             src_pixels += src_next_line_offset;
> > > > +             dst_pixels += dst_next_line_offset;
> > > >       }
> > > >  }
> > > >
> > > > +static void ((*get_line_fmt_transform_function(u32 format))
> > > > +         (void *pixels_addr, int length, u64 *line_buffer))
> > > >  {
> > > > +     if (format == DRM_FORMAT_ARGB8888)
> > > > +             return &ARGB8888_to_ARGB16161616;
> > > > +     else if (format == DRM_FORMAT_ARGB16161616)
> > > > +             return &get_ARGB16161616;
> > > > +     else
> > > > +             return &XRGB8888_to_ARGB16161616;
> > > > +}
> > > >
> > > > +static void ((*get_output_line_function(u32 format))
> > > > +          (void *pixels_addr, int length, u64 *line_buffer))
> > > > +{
> > > > +     if (format == DRM_FORMAT_ARGB8888)
> > > > +             return &convert_to_ARGB8888;
> > > > +     else if (format == DRM_FORMAT_ARGB16161616)
> > > > +             return &convert_to_ARGB16161616;
> > > > +     else
> > > > +             return &convert_to_XRGB8888;
> > > > +}
> > > >
> > > > +static void compose_plane(struct vkms_composer *src_composer,
> > > > +                       struct vkms_composer *dst_composer,
> > >
> > > I'm confused by the vkms_composer concept. If there is a separate thing
> > > for source and destination and they are used together, then I don't
> > > think that thing is a "composer" but some kind of... image structure?
> >
> > I didn't create this struct, but I think this is exactly what it represents.
> >
> > > "Composer" is what compose_active_planes() does.
> >
> > Do you think this struct needs a rename?
>
> In the long run, yes.
>
> > >
> > > > +                       struct vkms_pixel_composition_functions *funcs,
> > > > +                       u64 *line_buffer)
> > > > +{
> > > > +     u32 src_format = src_composer->fb->format->format;
> > > >
> > > > +     funcs->get_src_line = get_line_fmt_transform_function(src_format);
> > > >
> > > > +     blend(src_composer, dst_composer, funcs, line_buffer);
> > >
> > > This function is confusing. You get 'funcs' as argument, but you
> > > overwrite one field and then trust that the other field was already set
> > > by the caller. The policy of how 'funcs' argument here works is too
> > > complicated to me.
> > >
> > > If you need just one function pointer as argument, then do exactly
> > > that, and construct the vfunc struct inside this function.
> >
> > I think this will be totally solved with the code redesign.
>
> I think so too.
>
> ...
>
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > > > new file mode 100644
> > > > index 000000000000..5b850fce69f3
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > > > @@ -0,0 +1,155 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +
> > > > +#ifndef _VKMS_FORMATS_H_
> > > > +#define _VKMS_FORMATS_H_
> > > > +
> > > > +#include <drm/drm_rect.h>
> > > > +
> > > > +#define pixel_offset(composer, x, y) \
> > > > +     ((composer)->offset + ((y) * (composer)->pitch) + ((x) * (composer)->cpp))
> > >
> > > Why macro instead of a static inline function?
> >
> > Again, I don't have a good answer for that :(
>
> I would recommend to use a static inline function always when possible,
> and macros only when an inline function cannot work. The reason is that
> an inline function has types in its signature so you get some type
> safety, and it cannot accidentally mess up other variables in the call
> sites. A function also cannot "secretly" use variables from the call
> site like a macro can, so the reader can be sure that the function call
> will not access anything not listed in the parameters.

That makes sense to me. I will follow this guideline in my future code.
Thanks!

>
>
> > > > +
> > > > +/*
> > > > + * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
> > > > + *
> > > > + * @composer: Buffer metadata
> > > > + * @x: The x(width) coordinate of the 2D buffer
> > > > + * @y: The y(Heigth) coordinate of the 2D buffer
> > > > + *
> > > > + * Takes the information stored in the composer, a pair of coordinates, and
> > > > + * returns the address of the first color channel.
> > > > + * This function assumes the channels are packed together, i.e. a color channel
> > > > + * comes immediately after another. And therefore, this function doesn't work
> > > > + * for YUV with chroma subsampling (e.g. YUV420 and NV21).
> > > > + */
> > > > +static void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
> > >
> > > Is it normal in the kernel to have non-inline functions in headers?
> > >
> > > Actually this file does not look like a header at all, it should
> > > probably be a .c file and not #included.
> >
> > Oops. This should not be that way. I will fix it.
>
> While you do that, I wonder if it makes sense to put the functions like
> get_line_fmt_transform_function() in this file as well, so you only
> need to expose the getters, and the implementations can remain static
> functions.

This makes sense for me at least. Considering that the vkms_formats
handles everything related to formats.

And it will be one less file to modify while adding a new format.

>
>
> Thanks,
> pq
