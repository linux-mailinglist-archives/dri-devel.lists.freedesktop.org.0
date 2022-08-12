Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693E591144
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066AB2FE8;
	Fri, 12 Aug 2022 13:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DF1B2FB7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:19:13 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id f28so714512qkl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3HLPBVRse5OcNJxEM0wXkaB5QH7QwzyC6KEnOhyPoPY=;
 b=5KnXbRO1PmbqVO21579TkkUabdPHQOvTDUUNKm4qU2VHWiZNZ5qehKkLFHgLgDGjRc
 vwJblXCEB2TYInegWy4O/vVCuZGSWqLEH6P40JvaBHoUBFioM3Qm1cT8I/T27K5n8zgz
 9d126R6Qihv5/vCM8z4ojw2v+65cTfLSg2tPEUyR2aw87A0DBkdCo9JYn5KBG/D+F7hk
 ZtbGJkiStT326Pq7e3j4OuRbbCtHzYh+XcvCT8wVBCohhsgmpz/Fiq/BhhMUtAPJ135/
 9s61jEy5n+rSYk2j88RQMc9Ws3RlU+sYw0o91dUTex254U/UKtAnadj10EGw68i6qRsJ
 vidw==
X-Gm-Message-State: ACgBeo0C9WZ3jsPPDshtExcI+PfnqyiT2OZBWponkxU6bgq+8yNfhGSq
 TA6KCqDY+5fNgdxbFkU6T7Jo339HTrzY3Q==
X-Google-Smtp-Source: AA6agR7mAuTcekJ+t8KCchbZfgZKuL3tfGe7ybIaXM3aIY+MXxk3t1HnJ0gRByycW9YTuvzygX1NWg==
X-Received: by 2002:a05:620a:258b:b0:6ab:91fc:68d7 with SMTP id
 x11-20020a05620a258b00b006ab91fc68d7mr2756960qko.384.1660310352018; 
 Fri, 12 Aug 2022 06:19:12 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 x16-20020ac85f10000000b003434f911f78sm1667874qta.33.2022.08.12.06.19.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 06:19:11 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-32269d60830so9749837b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:19:10 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr3771794yws.47.1660310350262; Fri, 12 Aug
 2022 06:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:18:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
Message-ID: <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for your patch!

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> modes in the drivers.

Nit: strictly speaking these are not analog modes, but the digital
variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
13.5 MHz sampling frequency for pixels.

In analog modes, the only discrete values are the number of lines, and
the frame/field rate (fixing the horizontal sync rate when combined).

The number of (in)visible pixels per line depends on the available
bandwidth.  In a digital variant (which is anything generated by a
digital computer system), the latter depends on the pixel clock, which
can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).

So I think we probably need some way to generate a PAL/NTSC-compatible
mode based not only on resolution, but also on pixel clock.

>
> Since those modes are fairly standards, and that we'll need to use them in
> more places in the future, let's move the meson definition into the
> framework.
>
> The meson one was chosen because vc4's isn't accurate and doesn't amount to
> 525 and 625 lines.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -48,6 +48,24 @@
>
>  #include "drm_crtc_internal.h"
>
> +const struct drm_display_mode drm_mode_480i = {
> +       DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
> +                720, 739, 801, 858, 0,
> +                480, 488, 494, 525, 0,
> +                DRM_MODE_FLAG_INTERLACE),
> +       .picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_480i);
> +
> +const struct drm_display_mode drm_mode_576i = {
> +       DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
> +                720, 732, 795, 864, 0,
> +                576, 580, 586, 625, 0,
> +                DRM_MODE_FLAG_INTERLACE),
> +       .picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_576i);
> +
>  /**

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
