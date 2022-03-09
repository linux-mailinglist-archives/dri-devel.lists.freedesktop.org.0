Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248AD4D3AC5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 21:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88710E3E4;
	Wed,  9 Mar 2022 20:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0693110E3E4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 20:04:18 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id x3so2887425qvd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 12:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l/Y0orG9IQYI6xXeORs6dX5FqeH3cCXmO8RJhBrMe4c=;
 b=LNBuoh3W+478dD3Wo66hEE/UF3ueZ+oIQ17T+hWe2xkJpUf5UIumdnYGqH+HEn0lT6
 dQktsdUtR+8iCJqaBLJcRZrAlDn+AT5YBm+Ujshh19DZx3bAmgvBqp1CZ/mndXGEogkO
 s9/my7oWaagJd30Zpy0I16yL5+aHRQolhC69MdEIARLPR1HTs1+tkjRgVSQ6sLQWSs43
 Wcbb3ALbXs50QrCsaSJMkinLNzwogkCB8NqRgHHXAYV0VvNCRmn1woUX8ytpUKHu8j3E
 trDQrnJqj6E8VCarXs/azxlHppNqCniRUjOCgHJHR7HqiJdHvUa2UbyM1FkwCYQ7igsj
 A5vg==
X-Gm-Message-State: AOAM532sTkS4CASxtmi57LD5zX64kgzW5gPMMZj9h69yeX5ZqCMkgF7B
 d7oPEMjfBi3jtJWDCjrMk8FfPJ7sAf9JJw==
X-Google-Smtp-Source: ABdhPJwSubPXOR68eH93AJOPJFAL2Byi2Y2ior9UxseW5ARIlRZZVH4WgkL00Np2QjYm9yd0TVGjrA==
X-Received: by 2002:a0c:edd2:0:b0:432:3a49:79ba with SMTP id
 i18-20020a0cedd2000000b004323a4979bamr1194569qvr.21.1646856256096; 
 Wed, 09 Mar 2022 12:04:16 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 188-20020a3709c5000000b0067b147584c2sm1313345qkj.102.2022.03.09.12.04.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:04:15 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so36015317b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 12:04:15 -0800 (PST)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr1323277ywb.132.1646856254887; Wed, 09
 Mar 2022 12:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
In-Reply-To: <20220214133710.3278506-4-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Mar 2022 21:04:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuTAsqpx4=WnosfyjLo-t9ryQPQMaE1OeMBk4Ws9DTpQ@mail.gmail.com>
Message-ID: <CAMuHMdUuTAsqpx4=WnosfyjLo-t9ryQPQMaE1OeMBk4Ws9DTpQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Feb 14, 2022 at 2:37 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> OLED display controllers.
>
> It's only the core part of the driver and a bus specific driver is needed
> for each transport interface supported by the display controllers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

> +static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
> +                              struct drm_rect *rect)
> +{
> +       unsigned int x = rect->x1;
> +       unsigned int y = rect->y1;
> +       unsigned int width = drm_rect_width(rect);
> +       unsigned int height = drm_rect_height(rect);
> +       unsigned int line_length = DIV_ROUND_UP(width, 8);
> +       unsigned int pages = DIV_ROUND_UP(y % 8 + height, 8);
> +       u32 array_idx = 0;
> +       int ret, i, j, k;
> +       u8 *data_array = NULL;
> +
> +       data_array = kcalloc(width, pages, GFP_KERNEL);
> +       if (!data_array)
> +               return -ENOMEM;
> +
> +       /*
> +        * The screen is divided in pages, each having a height of 8
> +        * pixels, and the width of the screen. When sending a byte of
> +        * data to the controller, it gives the 8 bits for the current
> +        * column. I.e, the first byte are the 8 bits of the first
> +        * column, then the 8 bits for the second column, etc.
> +        *
> +        *
> +        * Representation of the screen, assuming it is 5 bits
> +        * wide. Each letter-number combination is a bit that controls
> +        * one pixel.
> +        *
> +        * A0 A1 A2 A3 A4
> +        * B0 B1 B2 B3 B4
> +        * C0 C1 C2 C3 C4
> +        * D0 D1 D2 D3 D4
> +        * E0 E1 E2 E3 E4
> +        * F0 F1 F2 F3 F4
> +        * G0 G1 G2 G3 G4
> +        * H0 H1 H2 H3 H4
> +        *
> +        * If you want to update this screen, you need to send 5 bytes:
> +        *  (1) A0 B0 C0 D0 E0 F0 G0 H0
> +        *  (2) A1 B1 C1 D1 E1 F1 G1 H1
> +        *  (3) A2 B2 C2 D2 E2 F2 G2 H2
> +        *  (4) A3 B3 C3 D3 E3 F3 G3 H3
> +        *  (5) A4 B4 C4 D4 E4 F4 G4 H4
> +        */
> +
> +       ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
> +       if (ret < 0)
> +               goto out_free;
> +
> +       ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
> +       if (ret < 0)
> +               goto out_free;
> +
> +       for (i = y / 8; i < y / 8 + pages; i++) {
> +               int m = 8;
> +
> +               /* Last page may be partial */
> +               if (8 * (i + 1) > ssd130x->height)
> +                       m = ssd130x->height % 8;
> +               for (j = x; j < x + width; j++) {
> +                       u8 data = 0;
> +
> +                       for (k = 0; k < m; k++) {
> +                               u8 byte = buf[(8 * i + k) * line_length + j / 8];

As buf does not point to (0, 0), the above is not correct if rect.x1 !=
0 or rect.y1 != 0.  After fixing that, writing more than one text line
to the console works, but I still see an issue with updates where the
rectangle size and/or position are not aligned to 8 pixels horizontally.
Will do more investigation, and send fixes...

> +                               u8 bit = (byte >> (j % 8)) & 1;
> +
> +                               data |= bit << k;
> +                       }
> +                       data_array[array_idx++] = data;
> +               }
> +       }
> +
> +       ret = ssd130x_write_data(ssd130x, data_array, width * pages);
> +
> +out_free:
> +       kfree(data_array);
> +       return ret;
> +}
> +
> +static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
> +{
> +       u8 *buf = NULL;
> +       struct drm_rect fullscreen = {
> +               .x1 = 0,
> +               .x2 = ssd130x->width,
> +               .y1 = 0,
> +               .y2 = ssd130x->height,
> +       };
> +
> +       buf = kcalloc(ssd130x->width, ssd130x->height, GFP_KERNEL);

This buffer is larger than needed. Will send a fix.

> +       if (!buf)
> +               return;
> +
> +       ssd130x_update_rect(ssd130x, buf, &fullscreen);
> +
> +       kfree(buf);
> +}
> +
> +static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
> +                               struct drm_rect *rect)
> +{
> +       struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> +       void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> +       int ret = 0;
> +       u8 *buf = NULL;
> +
> +       buf = kcalloc(fb->width, fb->height, GFP_KERNEL);

This buffer is much larger than needed. Will send a fix.

> +       if (!buf)
> +               return -ENOMEM;
> +
> +       drm_fb_xrgb8888_to_mono_reversed(buf, 0, vmap, fb, rect);
> +
> +       ssd130x_update_rect(ssd130x, buf, rect);
> +
> +       kfree(buf);
> +
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
