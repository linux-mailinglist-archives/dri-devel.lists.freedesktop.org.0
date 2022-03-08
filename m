Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BE4D1CEB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7910E31C;
	Tue,  8 Mar 2022 16:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DCD10E31C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:13:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id v15so1187699qkg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbmDfuUW6oAHjPTcZ3JNsr9CL4G+BTHO+raMIW3ftzU=;
 b=c+lLPZ/awu1Z/3m6eZpukhiw6S/AyMGO5fnyQsPqLHXpHF3A80Rcn1NnHn+Euw02lT
 xsXNDOfXZOxczRRlb7eHNTHkMyp8S4y4v23fCe2XV6bTRnCrRUiATHAa+Xb4o60eZrDS
 irj4zWjob8WfVs9l3uZbE5o9C+bbzN7wlHacLu4Zc9U8RAT3A6AoF+qm3AnHDCf1FteN
 8wGCs1pTN3ElQ9m6tLRi3wD3s03xomeXBXi8eD71DVKjGrYepajn+UJ9RV37Fn6Od3O2
 UvhDrmYkVRy0J29DVNr8Y+YnUGIHJyBTf7bNyMi2ZxhfL6Fgwv6E+WNcv6Cq6x/opfle
 VUrg==
X-Gm-Message-State: AOAM533LOkdYtdGpioR+TtaYzUZVNzS2GaAhlqpxRlSvmwne8Mb/J8vr
 NnY/akwTSVs5oB9Dr+X7XGTEZl8ZHUpuDA==
X-Google-Smtp-Source: ABdhPJz2aVCcR4scLttzyIR0Y+m2vUvLQKEZxwgeNKAtuqfTA3gW+z+K5ltxvbypFxIJzp19c7L3Lg==
X-Received: by 2002:a05:620a:284d:b0:5ff:320d:c0a5 with SMTP id
 h13-20020a05620a284d00b005ff320dc0a5mr10888097qkp.681.1646756032390; 
 Tue, 08 Mar 2022 08:13:52 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05622a018700b002dfed15c9edsm11031984qtw.74.2022.03.08.08.13.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 08:13:51 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id u10so18930996ybd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:13:51 -0800 (PST)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr10980528ybg.613.1646756030721; Tue, 08
 Mar 2022 08:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-3-javierm@redhat.com>
In-Reply-To: <20220214133710.3278506-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Mar 2022 17:13:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZHBVwaLDi-B=PrVOfcHxGLxwgDBisvexE94x72qvdJg@mail.gmail.com>
Message-ID: <CAMuHMdWZHBVwaLDi-B=PrVOfcHxGLxwgDBisvexE94x72qvdJg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Feb 14, 2022 at 2:37 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Add support to convert from XR24 to reversed monochrome for drivers that
> control monochromatic display panels, that only have 1 bit per pixel.
>
> The function does a line-by-line conversion doing an intermediate step
> first from XR24 to 8-bit grayscale and then to reversed monochrome.
>
> The drm_fb_gray8_to_mono_reversed_line() helper was based on code from
> drivers/gpu/drm/tiny/repaper.c driver.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch, which is now commit bcf8b616deb87941
("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
in drm/drm-next.

> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -12,9 +12,11 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>
> +#include <drm/drm_device.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>
>  static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
> @@ -591,3 +593,111 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>         return -EINVAL;
>  }
>  EXPORT_SYMBOL(drm_fb_blit_toio);
> +
> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,

"pixels" is not the number of pixels to process, but the number of
bytes in the monochrome destination buffer.

> +                                              unsigned int start_offset, unsigned int end_len)
> +{
> +       unsigned int xb, i;
> +
> +       for (xb = 0; xb < pixels; xb++) {
> +               unsigned int start = 0, end = 8;
> +               u8 byte = 0x00;
> +
> +               if (xb == 0 && start_offset)
> +                       start = start_offset;
> +
> +               if (xb == pixels - 1 && end_len)
> +                       end = end_len;
> +
> +               for (i = start; i < end; i++) {
> +                       unsigned int x = xb * 8 + i;
> +
> +                       byte >>= 1;
> +                       if (src[x] >> 7)
> +                               byte |= BIT(7);
> +               }
> +               *dst++ = byte;
> +       }

The above is IMHO very hard to read.
I think it can be made simpler by passing the total number of pixels
to process instead of "pixels" (which is bytes) and "end_len".

> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
> + * @dst: reversed monochrome destination buffer
> + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> + * @src: XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * DRM doesn't have native monochrome support.
> + * Such drivers can announce the commonly supported XR24 format to userspace
> + * and use this function to convert to the native format.
> + *
> + * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
> + * then the result is converted from grayscale to reversed monohrome.
> + */
> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
> +                                     const struct drm_framebuffer *fb, const struct drm_rect *clip)
> +{
> +       unsigned int linepixels = drm_rect_width(clip);
> +       unsigned int lines = clip->y2 - clip->y1;

drm_rect_height(clip)?

> +       unsigned int cpp = fb->format->cpp[0];
> +       unsigned int len_src32 = linepixels * cpp;
> +       struct drm_device *dev = fb->dev;
> +       unsigned int start_offset, end_len;
> +       unsigned int y;
> +       u8 *mono = dst, *gray8;
> +       u32 *src32;
> +
> +       if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
> +               return;
> +
> +       /*
> +        * The reversed mono destination buffer contains 1 bit per pixel
> +        * and destination scanlines have to be in multiple of 8 pixels.
> +        */
> +       if (!dst_pitch)
> +               dst_pitch = DIV_ROUND_UP(linepixels, 8);

This is not correct when clip->x1 is not a multiple of 8 pixels.
Should be:

    DIV_ROUND_UP(linepixels + clip->x1 % 8, 8);

> +
> +       drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");

This triggers for me: dst_pitch = 1.
Which is perfectly fine, when flashing an 8-pixel wide cursor ;-)

> +
> +       /*
> +        * The cma memory is write-combined so reads are uncached.
> +        * Speed up by fetching one line at a time.
> +        *
> +        * Also, format conversion from XR24 to reversed monochrome
> +        * are done line-by-line but are converted to 8-bit grayscale
> +        * as an intermediate step.
> +        *
> +        * Allocate a buffer to be used for both copying from the cma
> +        * memory and to store the intermediate grayscale line pixels.
> +        */
> +       src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
> +       if (!src32)
> +               return;
> +
> +       gray8 = (u8 *)src32 + len_src32;
> +
> +       /*
> +        * For damage handling, it is possible that only parts of the source
> +        * buffer is copied and this could lead to start and end pixels that
> +        * are not aligned to multiple of 8.
> +        *
> +        * Calculate if the start and end pixels are not aligned and set the
> +        * offsets for the reversed mono line conversion function to adjust.
> +        */
> +       start_offset = clip->x1 % 8;
> +       end_len = clip->x2 % 8;
> +
> +       vaddr += clip_offset(clip, fb->pitches[0], cpp);
> +       for (y = 0; y < lines; y++) {
> +               src32 = memcpy(src32, vaddr, len_src32);
> +               drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
> +               drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
> +                                                  start_offset, end_len);
> +               vaddr += fb->pitches[0];
> +               mono += dst_pitch;
> +       }
> +
> +       kfree(src32);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
