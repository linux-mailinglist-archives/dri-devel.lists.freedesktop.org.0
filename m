Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DEE50664F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53D910E1FE;
	Tue, 19 Apr 2022 07:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A672E10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:52:22 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id ay11so56355qtb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 00:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VpM1PtiHq5rdtdF2Z1pptR1cVQG3GJl0J2jHpx0HNOE=;
 b=LpE5YUz6ZGfZhG82bzJSKaZA6C+YWoj0TvIm4hJuZrhPhe/eCF7aD1Skswfr33prY2
 pKlBL4jbhPWp5qWV0Lx9OUjTmw12dKlPCf4J2xV3vSJVFP+Cn0VYVaOWc8dgqn/SNBNN
 emfoI4451NxfM/tzORn3OAGA6vBjeozw2ym1I9e5Z/QriVAPixwwwtewcGx8t+/GBT6+
 esETLxfpZZIQNWhMgoRRAw7QcVLKhTkdAucZpU0syhlbZRLUuMJ1flwHJO6nvlIrZeve
 4Cg/NT/NvxLL63vRgXXYpGt6us1RTroiz6f31/+7jncNgwg2gtH75I0Tqpz6QTpjLKn9
 7dew==
X-Gm-Message-State: AOAM532FHMXX47zmT7l5n0/sBbj2Stm4PkcvBHXQNFxSXIG6Rnk+ma8H
 XBUJjDtP23K+Czl9i9vOu9OYk3qysdmOjg==
X-Google-Smtp-Source: ABdhPJzDWCw/wadm0D6Q18Xmq0RGMGLCb5DJOo+fZkrj+V4mkYbpEABxvDcEvxAWJtZ84rNcwKMMXw==
X-Received: by 2002:ac8:5c10:0:b0:2e1:dbee:9ee6 with SMTP id
 i16-20020ac85c10000000b002e1dbee9ee6mr9417561qti.25.1650354741304; 
 Tue, 19 Apr 2022 00:52:21 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a12eb00b0069c88d15b6asm6833566qkl.68.2022.04.19.00.52.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 00:52:20 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id x200so29500755ybe.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 00:52:20 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr13514790ybk.207.1650354739846; Tue, 19
 Apr 2022 00:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-6-javierm@redhat.com>
In-Reply-To: <20220413162359.325021-6-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Apr 2022 09:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_myNcA1eG=-qOHhtCEMnnV_eMjQF3dWakd7O6JbXskQ@mail.gmail.com>
Message-ID: <CAMuHMdX_myNcA1eG=-qOHhtCEMnnV_eMjQF3dWakd7O6JbXskQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/solomon: Add SSD130x OLED displays SPI support
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Apr 13, 2022 at 6:24 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over SPI.
>
> There is a difference in the communication protocol when using 4-wire SPI
> instead of I2C. For the latter, a control byte that contains a D/C# field
> has to be sent. This field tells the controller whether the data has to be
> written to the command register or to the graphics display data memory.
>
> But for 4-wire SPI that control byte is not used, instead a real D/C# line
> must be pulled HIGH for commands data and LOW for graphics display data.
>
> For this reason the standard SPI regmap can't be used and a custom .write
> bus handler is needed.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c

> +/*
> + * The regmap bus .write handler, it is just a wrapper around spi_write()
> + * but toggling the Data/Command control pin (D/C#). Since for 4-wire SPI
> + * a D/C# pin is used, in contrast with I2C where a control byte is sent,
> + * prior to every data byte, that contains a bit with the D/C# value.
> + *
> + * These control bytes are considered registers by the ssd130x core driver
> + * and can be used by the ssd130x SPI driver to determine if the data sent
> + * is for a command register or for the Graphic Display Data RAM (GDDRAM).
> + */
> +static int ssd130x_spi_write(void *context, const void *data, size_t count)
> +{
> +       struct ssd130x_spi_transport *t = context;
> +       struct spi_device *spi = t->spi;
> +       const u8 *reg = data;
> +
> +       if (*reg == SSD130X_COMMAND)
> +               gpiod_set_value_cansleep(t->dc, 0);
> +
> +       if (*reg == SSD130X_DATA)
> +               gpiod_set_value_cansleep(t->dc, 1);
> +
> +       /* Remove the control byte since is not used by the 4-wire SPI */
> +       return spi_write(spi, ((u8 *)data) + 1, count - 1);

As I don't like casts, perhaps

    spi_write(spi, reg + 1, count - 1);

? But this is up to you.

> +/*
> + * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
> + * if the device was registered via OF. This means that the module will not be
> + * auto loaded, unless it contains an alias that matches the MODALIAS reported.
> + *
> + * To workaround this issue, add a SPI device ID table. Even when this should
> + * not be needed for this driver to match the registered SPI devices.
> + */
> +static const struct spi_device_id ssd130x_spi_table[] = {
> +       { "sh1106",  SH1106_ID },
> +       { "ssd1305", SSD1305_ID },
> +       { "ssd1306", SSD1306_ID },
> +       { "ssd1307", SSD1307_ID },
> +       { "ssd1309", SSD1309_ID },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);

I'm not sure about the need for this part, but as Mark provided his
Ac-ed--by, I assume it's correct.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
