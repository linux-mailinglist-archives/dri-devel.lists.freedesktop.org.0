Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF934FD2A9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11110E78E;
	Tue, 12 Apr 2022 07:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A162B10E78E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:31:22 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z19so18527509qtw.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPZwLQHFGbE+YddKPiwbAMBD+8+olRhnFPT9yzLHixE=;
 b=IgmFf5jVWjM4pSz5t2GAJJkA81SHpSHf94lmR0DncoyPIzkbni+JlQTNtgT/RnYHzc
 j+w9lmSvJucJ3MwE2l8QWL5zDmdsh1BlkNk8Ts3AOP+DWR3HhO8Uieuc1REXe+w2fsOC
 cUfFlrMjxUPsmks0orWZ0h0KRP51OhfuiQlcc237jTDDWWxh9xTvhbwN/lt/L8CBRyXz
 igDBxY+9En3qvkLlUSzZz5p5YnxoAgq22i1UrYDcJJTlFWrombJJhDp93objnTryKc4i
 /kZ5cHc6DIOovlegNK0zwBowhVaA+/0PmF9GH1zQndDVlXO66o+jcP1dkAVI3x939bBW
 blGw==
X-Gm-Message-State: AOAM533sbzenMJJFpypJ3og8kYn0+ZgfWmmIOa+uSFo38OPXIZvjYtH7
 pipfpC4tR7M2tI1EUn/i8iuvBmVyD/jcMWP5
X-Google-Smtp-Source: ABdhPJznQQZGuBTFsCX5uNuDJAW6LoVuI+Awk0nfsJZgUsn7e9Z5Jt4suelUICkP4y2kU6BAj0oV7A==
X-Received: by 2002:ac8:7c55:0:b0:2e1:d535:d881 with SMTP id
 o21-20020ac87c55000000b002e1d535d881mr2307373qtv.188.1649748681602; 
 Tue, 12 Apr 2022 00:31:21 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm28020958qtd.44.2022.04.12.00.31.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:31:21 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so132986177b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:31:21 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr8100148ywb.256.1649748680829; Tue, 12
 Apr 2022 00:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-6-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-6-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:31:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsmtBdcV=LL4yqprtbum4f9cSu8orjoPACECa5QENmsg@mail.gmail.com>
Message-ID: <CAMuHMdWsmtBdcV=LL4yqprtbum4f9cSu8orjoPACECa5QENmsg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/solomon: Add SSD130x OLED displays SPI support
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

On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
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

> +static struct gpio_desc *ssd130x_spi_get_dc(struct device *dev)
> +{
> +       struct gpio_desc *dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> +
> +       if (IS_ERR(dc))
> +               return ERR_PTR(dev_err_probe(dev, PTR_ERR(dc), "Failed to get dc gpio\n"));
> +
> +       return dc;
> +}
> +
> +static int ssd130x_spi_probe(struct spi_device *spi)
> +{
> +       struct ssd130x_spi_transport *t;
> +       struct ssd130x_device *ssd130x;
> +       struct regmap *regmap;
> +       struct device *dev = &spi->dev;
> +
> +       t = devm_kzalloc(dev, sizeof(*t), GFP_KERNEL);
> +       if (!t)
> +               return dev_err_probe(dev, -ENOMEM,
> +                                    "Failed to allocate SPI transport data\n");
> +
> +       t->spi = spi;
> +
> +       t->dc = ssd130x_spi_get_dc(&spi->dev);
> +       if (IS_ERR(t->dc))
> +               return PTR_ERR(t->dc);

This can be simplified (no need for the PTR_ERR(ERR_PTR(...) dance)
by open-coding ssd130x_spi_get_dc() here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
