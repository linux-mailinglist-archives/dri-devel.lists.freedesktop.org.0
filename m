Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50569A9A646
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE910E76D;
	Thu, 24 Apr 2025 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD7510E769
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:38:49 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-5259327a93bso310488e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483927; x=1746088727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NXX4mFHnm6kuIK55cjNxrp5WN6Ftx90SWsXCFruZ40w=;
 b=v3iDf0+rXnSUO8iqMBn1EjXsJQiBOME5/JU8c6QBhi6nZgqOmGmqpphuMQIP3Sdt/o
 u3v0aiBT6H7L5jmgQE/sC98pcZRcZcPcpo2lpVxlqzcOBXifGix0gwrlq2Ti64fxye1w
 jApwwWPLOfR5QjtHkUENwtpHPpI0Z7ZFjiwXHbllU3LABOi0KO8kPLsub68OC2qaZLvg
 V6wrBzf+0tAmkTid9X8Q1ciYqOlKPwiv5EbqZswRNJrxr72qeVEzpmBVcnSYlachbmxB
 KR1yIa+hBT9hbqGaeLWnBdb/REbqpUWvO+SZDFJwkCg2/8XPPih78Eum3tIb0nAbW3UY
 i/zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcZqtQ6ozsiHoXqHZVMLbv2zEorfeX27xJFU0oYjkarYpL8FOGnSjZToqmabAy3LK59kOFmy4sQLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH0Jc/qZeLc03xGpbsbKd9+2JPr0EELbSXPDsctcE0SL8Zm6s9
 oVbSrRkOzRMvEA4P8eEukl8TJWB7LDf5Av9rAgPyMPe1d6+xhUNLwc3LUGk/
X-Gm-Gg: ASbGncv+uATlnSQSSRSu4bDs5b/kdxAfXR5MUaedkl07f5aLTg6iquRsPq/8mcHd4Sd
 0OwoDNLGar9LP8EcdCAIZYCcBmvn1/5rOZMYltedpO9rbapxAxIuMCWABEizEP022AJNjaRtvFb
 S7E3SGmprW8CsP7K1i1o5Bzum9EkDwd24cA0eM+xW6kwEAkArgc7/7gnrEPiBxpvhGo6Kz8hq/a
 IzJCmskadPhmmnOaLn6u9/lBy/HSrzZ/l5PNFPf1roxHG+izxw/QtslwgMp7jkMVmx2Kdj0acF5
 xyUNgdXJeZTfpUl18bw0LxajIvksKTFe0naNVkPwIZ1Q2MzLEhtH14lEhkIa6PoZqX3ZxuazIQ0
 TVpJ8sE8ouSBGDmdHIw==
X-Google-Smtp-Source: AGHT+IHqcP399UcdSZdpTpr1VejB7CnmcMp2gSHcuk0SekJNnwF+wzYNPbI+zqP0+LoSInxE8ganPQ==
X-Received: by 2002:a05:6122:8ce:b0:526:720:704 with SMTP id
 71dfb90a1353d-52a783963d4mr899105e0c.7.1745483926975; 
 Thu, 24 Apr 2025 01:38:46 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52a79f958b7sm163778e0c.23.2025.04.24.01.38.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 01:38:46 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-528ce9731dbso282026e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:38:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfAEVbl6sGTKOgx2yAa5LsKTENzGqZIgkwtRvVmFA0/85P5OBb0VBuj5fniNG+XY4Fa5m2EumnV8g=@lists.freedesktop.org
X-Received: by 2002:a05:6102:dcf:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4d38cb318ddmr1379456137.2.1745483925657; Thu, 24 Apr 2025
 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 10:38:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
X-Gm-Features: ATxdqUF2fRyGRvlnt9SP-qLlayAWLqGWTfteEXH26oVsrKfobO2Jdb0dn21RKE0
Message-ID: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcus,

On Wed, 23 Apr 2025 at 21:04, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Thanks for your patch, which is now commit 4b35f0f41ee29505
("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
in drm-misc-next.

> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c

> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{
> +       struct st7571_device *st7571 = drm_to_st7571(fb->dev);
> +       u32 format = fb->format->format;
> +       char *row = st7571->row;
> +       int x1;
> +       int x2;
> +
> +       /* Align y to display page boundaries */
> +       rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
> +       rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
> +
> +       switch (format) {
> +       case DRM_FORMAT_XRGB8888:
> +               /* Threated as monochrome (R1) */
> +               fallthrough;
> +       case DRM_FORMAT_R1:
> +               x1 = rect->x1;
> +               x2 = rect->x2;
> +               break;
> +       case DRM_FORMAT_R2:
> +               x1 = rect->x1 * 2;
> +               x2 = rect->x2 * 2;
> +               break;
> +       }
> +
> +       for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
> +               for (int x = x1; x < x2; x++)
> +                       row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
> +
> +               st7571_set_position(st7571, rect->x1, y);
> +
> +               /* TODO: Investige why we can't write multiple bytes at once */
> +               for (int x = x1; x < x2; x++) {
> +                       regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +
> +                       /*
> +                        * As the display supports grayscale, all pixels must be written as two bits
> +                        * even if the format is monochrome.
> +                        *
> +                        * The bit values maps to the following grayscale:
> +                        * 0 0 = White
> +                        * 0 1 = Light gray
> +                        * 1 0 = Dark gray
> +                        * 1 1 = Black

That is not R2, but D2?
include/uapi/drm/drm_fourcc.h:

    /* 2 bpp Red (direct relationship between channel value and brightness) */
    #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
/* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */

    /* 2 bpp Darkness (inverse relationship between channel value and
brightness) */
    #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
/* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */

So the driver actually supports D1 and D2, and XRGB8888 should be
inverted while converting to monochrome (and grayscale, which is not
yet implemented).

> +                        *
> +                        * For monochrome formats, write the same value twice to get
> +                        * either a black or white pixel.
> +                        */
> +                       if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
> +                               regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +               }
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
