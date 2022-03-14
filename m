Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C44D861E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7910EB6F;
	Mon, 14 Mar 2022 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8B110EB73
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:40:17 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id im7so12529311qvb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWUj/v7KabELU72fthxfijtXtCwC8AT21SzbTAGRY78=;
 b=MD6ORgUKxUA91QACKqKbzNm0nWDeLakh5pfAdQaUxYfxXjLEUqCGOQdSukvR8a5ul+
 JFixdd6buuaVjrx2+0YhkVJN3ejyrw7Nxm3QWAVghf3sko9fy9uEbtoR9EiM1xlQQIqk
 fVm/er2/vembiJaNpuhT7PLXolPlYfDA9ppI50Go3mG4D9ZtV9KEWD/1CAcMdr6rNfIO
 8yBVjE5zfboCGtqYEYScis+Ve6EX93FqysWGrOhOSFqjtGRfVhNt0o0VMmePHyHBA3M3
 EF6EQ8T8YA97UVYkvGq9tLXjjIF0T1Yz8E2hT85aKNNd9zDQF0G25lMQbcJW2Ks5aadx
 l/LQ==
X-Gm-Message-State: AOAM53028SK5gMd8tuqMjmwgHxyXYMhC7kC20jB0Q8e3AWFp/uyosyUy
 A5qM3kB2canxOouO2jgYvwqCn5XzL+nIgw==
X-Google-Smtp-Source: ABdhPJyl3lvwAKV7qYDdGY4F6P2anxBzDYHoaiP8CqOuVmSS5As5qPIH4+edzh9aCoWlkDNstYz3lQ==
X-Received: by 2002:a05:6214:5297:b0:435:7a09:1eb9 with SMTP id
 kj23-20020a056214529700b004357a091eb9mr17270266qvb.127.1647265216128; 
 Mon, 14 Mar 2022 06:40:16 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 f2-20020ac87f02000000b002e1de387882sm108595qtk.53.2022.03.14.06.40.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:40:14 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id x200so30812735ybe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:40:14 -0700 (PDT)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr17526653ybg.613.1647265213864; Mon, 14
 Mar 2022 06:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-3-javierm@redhat.com>
In-Reply-To: <20220131201225.2324984-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 14:40:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPQrErbMZ4wJPgROY7XOnKGvimNFg8JpiyuWqz2a3Gzw@mail.gmail.com>
Message-ID: <CAMuHMdWPQrErbMZ4wJPgROY7XOnKGvimNFg8JpiyuWqz2a3Gzw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Jan 31, 2022 at 9:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Add support to convert 8-bit grayscale to reversed monochrome for drivers
> that control monochromatic displays, that only have 1 bit per pixel depth.
>
> This helper function was based on repaper_gray8_to_mono_reversed() from
> the drivers/gpu/drm/tiny/repaper.c driver.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -584,3 +584,38 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>         return -EINVAL;
>  }
>  EXPORT_SYMBOL(drm_fb_blit_toio);
> +
> +/**
> + * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monochrome
> + * @dst: reversed monochrome destination buffer

What's the meaning of "reversed"?
During the last few days, I've been balancing between (a) "reverse
video" and (b) "reverse bit order", but none of them seems to be true.

(a) The code maps 0-127 to 0 and 8-255 to 1, which just reduces from
    256 to 2 grayscale levels, without inversion. The result is also
    white-on-black on my ssd130x OLED.
(b) On little-endian, the CFB drawops use little-endian bit order,
    which is what ends up in "byte" in the code below.

> + * @src: 8-bit grayscale source buffer
> + * @clip: Clip rectangle area to copy
> + *
> + * DRM doesn't have native monochrome or grayscale support.
> + * Such drivers can announce the commonly supported XR24 format to userspace
> + * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
> + * helper function to convert to the native format.
> + */
> +void drm_fb_gray8_to_mono_reversed(void *dst, void *src, const struct drm_rect *clip)
> +{
> +       size_t width = drm_rect_width(clip);
> +       size_t height = drm_rect_width(clip);
> +
> +       u8 *mono = dst, *gray8 = src;
> +       unsigned int y, xb, i;
> +
> +       for (y = 0; y < height; y++)
> +               for (xb = 0; xb < width / 8; xb++) {
> +                       u8 byte = 0x00;
> +
> +                       for (i = 0; i < 8; i++) {
> +                               int x = xb * 8 + i;
> +
> +                               byte >>= 1;
> +                               if (gray8[y * width + x] >> 7)
> +                                       byte |= BIT(7);
> +                       }
> +                       *mono++ = byte;
> +               }
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
