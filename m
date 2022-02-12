Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412434B3620
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 16:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F3C10E450;
	Sat, 12 Feb 2022 15:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8010E450
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 15:54:59 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id w207so6161966vkd.2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 07:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9MAkIW4ew1KSxPxGSDwKOj26B+ub0fwkAp4ZOf7U70=;
 b=AMjRK7ClkKFgp4qRvIAAWAgi81/cyZmEjG77wrhPyCrVkzfVZXfOmYGdFk2lcfzzjk
 2kAeg1oIWhpdgQ1iOw5o12Kv68I+K9Zx+D2s7lpg4olrXBt8j4/BOq8JUhH87anGpcpO
 2hliOrrHkowHloBla2bb1fCaGd5OAYCbaPtL0CWiZllzlYdcCioxXGJZyNm3hR03ifh0
 yAKI/qDAH1TvxiB+JUneTnodCJ8CPkm9FHE7Wvlgxcs5EKvP8MVm72BVRgfSGBWJ6Cit
 6axfDw3rhJl7kKgWG3oT0Levk1nqXHQLiLX1OrWRuEGr2CWLqvhgQEfviygRQ759UGX/
 aWPQ==
X-Gm-Message-State: AOAM531hPd/divPDM3Bl6n2ZzHxm3QXePLl+JLijh4HU86vtngb0sr7x
 EK0SbRpl3nabtrKrFCWlfu5aU6/mlsxbww==
X-Google-Smtp-Source: ABdhPJy8W+qDATaAzvEimjOeYFwPbQR4XZtg8BfSGap1jIZSXRZfnT7W4gEcdOURbq9S7kU++6U2TQ==
X-Received: by 2002:a1f:eec1:: with SMTP id m184mr375702vkh.23.1644681298112; 
 Sat, 12 Feb 2022 07:54:58 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id v30sm643268vsi.19.2022.02.12.07.54.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 07:54:57 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id w18so5953403uar.8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 07:54:57 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr1820269uaw.122.1644681296996; 
 Sat, 12 Feb 2022 07:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-3-javierm@redhat.com>
In-Reply-To: <20220211143358.3112958-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 12 Feb 2022 16:54:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeqXs2PeV9s8+edPpOGodRT=it3g+fOTB7DuTuW2J9ZA@mail.gmail.com>
Message-ID: <CAMuHMdUeqXs2PeV9s8+edPpOGodRT=it3g+fOTB7DuTuW2J9ZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/format-helper: Add
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

On Fri, Feb 11, 2022 at 3:34 PM Javier Martinez Canillas
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

Thanks for your patch!

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

    x = xb * 8;
    for (i = start; i < end; i++) {
            byte >>= 1;
            byte |= src[x + i] & BIT(7);
    }

> +               *dst++ = byte;
> +       }
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
> +
> +       drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
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

The cast can be removed if src32 is changed to "void *".
For symmetry, gray8 and mono can be changed to "void *", too.

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
