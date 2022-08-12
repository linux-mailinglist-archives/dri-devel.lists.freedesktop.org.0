Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC55911A4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AC4B3A3A;
	Fri, 12 Aug 2022 13:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128ECB39FE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:39:08 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id i24so745036qkg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6vlKlfYZ8UUr42Z0Ey6Sidm4mVEyWELk9h2eYr+jvz0=;
 b=e1wVlpzZUDMICfFnZAZZ71k63mxeuHO3yt/aiw66EMOueAw9Fpii+3uu6ogFL6+8ya
 yxYT0hF0AjVaTU3jgwxvE8QosEMmYnw5Wi8aufbImnd96dzHDVbEQWAVwmtC0H0al6P4
 lQgMQVEXGUvkGbqaSwpZIXp4QmliZRB2rEV/XCLTO/wU41Njjhnmqwrxw1cYYzawpQBn
 yV/J9uPRodX4C60nMIhhFgs/54muUfxnuSC/VlT7ek83zVrBhL9bLAcDq8OhhYD0WPsL
 c74WJSBD428E1mJOeUjSg4JGReKcX7uD0e7e6UCDTgyPRYVazo2XQeHcDKDsWNR+pQAe
 84lg==
X-Gm-Message-State: ACgBeo1oRV2Q4yv70G1z+Qt5FjSds/8Pb7z+8qAIOWatuq2G7vB1d3lU
 bJApxJMDnZEW0RfJwn/rad7aOMAnGkCzIw==
X-Google-Smtp-Source: AA6agR7nN0G/J9+C2iCSeZQKCw3NmuuX8YyP3JCCZT4/ORGY8vtwcDRPKDqP0d66vydwMjhXnvnILQ==
X-Received: by 2002:a05:620a:c50:b0:6b9:6e6:428d with SMTP id
 u16-20020a05620a0c5000b006b906e6428dmr2847070qki.280.1660311546969; 
 Fri, 12 Aug 2022 06:39:06 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 ck11-20020a05622a230b00b0034035e73be0sm1810456qtb.4.2022.08.12.06.39.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 06:39:06 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y127so1511902yby.8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:39:06 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr3814535yws.47.1660311090509; Fri, 12 Aug
 2022 06:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:31:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
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

On Fri, Jul 29, 2022 at 6:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Our new tv mode option allows to specify the TV mode from a property.
> However, it can still be useful, for example to avoid any boot time
> artifact, to set that property directly from the kernel command line.
>
> Let's add some code to allow it, and some unit tests to exercise that code.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1677,6 +1677,80 @@ static int drm_mode_parse_panel_orientation(const char *delim,
>         return 0;
>  }
>
> +#define TV_OPTION_EQUAL(value, len, option) \
> +       ((strlen(option) == len) && !strncmp(value, option, len))
> +
> +static int drm_mode_parse_tv_mode(const char *delim,
> +                                 struct drm_cmdline_mode *mode)
> +{
> +       const char *value;
> +       unsigned int len;
> +
> +       if (*delim != '=')
> +               return -EINVAL;
> +
> +       value = delim + 1;
> +       delim = strchr(value, ',');
> +       if (!delim)
> +               delim = value + strlen(value);
> +
> +       len = delim - value;
> +       if (TV_OPTION_EQUAL(value, len, "NTSC-443"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_443;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-J"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_J;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-M"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_M;

[...]

You already have the array tv_norm_values[] from "[PATCH v1 05/35]
drm/connector: Add TV standard property". Can't you export that, and
loop over that array instead?

> +       else if (TV_OPTION_EQUAL(value, len, "HD480I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD480P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD720P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD720P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD1080I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD1080I;

The names in tv_norm_values[] use lower-case, while you use upper-case
here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
