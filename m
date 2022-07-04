Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D01565E92
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5CF11B5FB;
	Mon,  4 Jul 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF20D11B315
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:36:26 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id l11so18498357ybu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7pfQddT00wwybN55WXtE8jeGfJuRCDhkTs8A9N9Avc=;
 b=juo7rzkgyOnogzMhLYCktRvFpSFkP3vvhbMY8Uk0vJKYeWueIKW+lWdoXP3yLwbds6
 vcrr5NUqPVbQnT0hwWaYs4EEj2Nkh5SCjrFrs18UN6hZAi3OYtxjuCQlEQvAQUlc9Dpv
 J7v71ibaYThmJdJsc986feiZcZN+aEpDukUNqgPRhJF8LMCaE4eeOYQA30SWbqQhe9N9
 uD2O3yv/dhvIOAfc/Yh+JrL6jYRzMb9TGUOPIk36TgGFoLO92g7jiweWYexkxNNBIGdE
 16csuxysxq+iUAOhEZmurW/lnrwSZZbdImIhQoMrVi+ukTjz9HsWjjHwlR4I1VW1mjTI
 xbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7pfQddT00wwybN55WXtE8jeGfJuRCDhkTs8A9N9Avc=;
 b=5BFE/YWTjg3tvZbgo5M4HWRM+kIzu8r+4tju44fKyiMyloTyFlfPaOyRm+G/I+q/S3
 AwoMlNvl5OejTMTx6kr0aC5u/fn5u14IGve03DDmDSpn9INbbTGlgaYIVP78I7sODM2B
 lubUnazkh0pjo3MmrH9Elreo8I/UR36GXEf26Rx2VWJobsw0+iNYvFNq1KvDo6F4TJKI
 A68DCNEYUDdKjJwr3G+AYXa1ol33wrpWA8UL/hxXJ2TRk3tw4xv464ogYlfV0A7klEAT
 r0B/12jIfO5bmxOsHLarCdQnN1LfzQ1oKEVdXTr/dHr4Z8PEkAWVeaYETmnjVyHq/5gX
 kV1g==
X-Gm-Message-State: AJIora8GEpZcY2SiZCK8A2jlrSevgpwEhXve9ahpSesaxbiOhhmW7vbN
 OaI04gr3CitNyJ7VzyMouLWcQmM00L8XuwhBpIQ=
X-Google-Smtp-Source: AGRyM1u/kp8kfUd0nPXCHFP2i3Eix2PxxDcpp8y9ipLkrPPb23jLPB36f0GfOZtN0YbNTf6oiGSAGugY2K6v9bhH1+c=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8583937ybq.570.1656966985988; Mon, 04
 Jul 2022 13:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-10-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:35:47 +0200
Message-ID: <CAHp75Ve+-ht6J5PZXS1jO1qfxn6Nfd2wDfuW-NsigR_k7iRJGg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] iio: adc: mt6370: Add Mediatek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 ADC support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-adc.ko".

No ".ko" part.

...

> +#define ADC_CONV_TIME_US               35000

Since it's actually MS, drop this and use MS * 1000 whenever it's needed.


> +#define ADC_CONV_TIME_MS               (ADC_CONV_TIME_US / 1000)

...

> +static int mt6370_adc_read_label(struct iio_dev *iio_dev,
> +                                struct iio_chan_spec const *chan, char *label)
> +{
> +       return snprintf(label, PAGE_SIZE, "%s\n",
> +                       mt6370_channel_labels[chan->channel]);

sysfs_emit()

> +}

...

> +static int mt6370_adc_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct mt6370_adc_data *priv;
> +       struct regmap *regmap;
> +       struct iio_dev *indio_dev;

Per all your patches, use reversed xmas tree ordering ("longest line
first" rule).
Also it may be good to have a temporary variable for struct device pointer.

> +}

...

> +MODULE_DESCRIPTION("MT6370 ADC Drvier");

Driver. Spell check your patches.

-- 
With Best Regards,
Andy Shevchenko
