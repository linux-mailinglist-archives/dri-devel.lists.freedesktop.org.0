Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D01591157
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E2B3316;
	Fri, 12 Aug 2022 13:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37FB330E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:25:33 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id y11so588913qvn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aTZUDWioyW00G3FP5HrhAR/urlDDduygUMh7slAg+gU=;
 b=yHVjC3RsjChf+UnMTI/b+RO6bk+b/TJqCliLSa/vi1CImqxo5J5gtZWEiMHY44MQrg
 47Re+E4+utF6D5PI13stx5YvRm8lx9eC/Z/j+4Stg8M3TDNxb75kKMrmEnNYbMuQWyf0
 aVvzxTPrQIYgkhnPwquPGuM86pSMyoBiDcKUw8j2E115Yg4pSXdHdJsaCszneiKfnr+9
 0MxzfASlstm5Lo6ExgPmbevtWBlt6f9Bm98Vh/VuSkzmWARsgtb1hciZb8AgsnCW7AIF
 7PoEuBTao1SNi4mPZoZTwrbYMvrZUzOzEKmZQN0cZfvd0N0RlAQ8teGVaBlMXRcPOH8R
 XVMg==
X-Gm-Message-State: ACgBeo3O6aP1o2JaVdnEA3Pjgkk6GH93KQBZd3iBquduEPco42qgUTWf
 z9AGU9fQJY+oyNRaqYyZGyisWMVSyRj3Iw==
X-Google-Smtp-Source: AA6agR5nVSouMBn1Y0AdDoYeZR3JS/gEdo5oac78VHmxKeFaJ31216GKevcO3UraXCWa8+kcxviu/Q==
X-Received: by 2002:a05:6214:f01:b0:477:7bdb:a020 with SMTP id
 gw1-20020a0562140f0100b004777bdba020mr3211856qvb.67.1660310731867; 
 Fri, 12 Aug 2022 06:25:31 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 s1-20020a05620a29c100b006b9526cfe6bsm1782852qkp.80.2022.08.12.06.25.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 06:25:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-31f443e276fso9960387b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:25:29 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr3592742ywe.502.1660310729490; Fri, 12
 Aug 2022 06:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:25:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
Message-ID: <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
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

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The TV mode property has been around for a while now to select and get the
> current TV mode output on an analog TV connector.
>
> Despite that property name being generic, its content isn't and has been
> driver-specific which makes it hard to build any generic behaviour on top
> of it, both in kernel and user-space.
>
> Let's create a new bitmask tv norm property, that can contain any of the
> analog TV standards currently supported by kernel drivers. Each driver can
> then pass in a bitmask of the modes it supports.
>
> We'll then be able to phase out the older tv mode property.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>   * 0 on success or a negative error code on failure.
>   */
>  int drm_mode_create_tv_properties(struct drm_device *dev,
> +                                 unsigned int supported_tv_norms,
>                                   unsigned int num_modes,
>                                   const char * const modes[])
>  {
> +       static const struct drm_prop_enum_list tv_norm_values[] = {
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },

The above are analog standards, with a variable horizontal resolution.

> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },

The above are digital standards, with a fixed resolution.

You seem to have missed "hd1080p"?

In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
handle them through "@<refresh>".  The latter would impact "[PATCH v1
09/35] drm/modes: Move named modes parsing to a separate function", as
currently a named mode and a refresh rate can't be specified both.

As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
command-line option" uses a separate "tv_mode" option, and not the main
mode name, I think you want to add them here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
