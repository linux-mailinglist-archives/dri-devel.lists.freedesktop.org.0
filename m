Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2059291D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 07:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936314B0CB;
	Mon, 15 Aug 2022 05:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951B92588
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 05:36:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j1so7891708wrw.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=iwr7XkJX8s+Vxxl+k0pY94n0/ODkYyQntmhI8k+Qn6I=;
 b=ochcn0nAwaI+uZle8oxq2CMwsp35gCjwnpn4Q/BbMfX+/bVmddN92C70y9YQzJ8bk9
 3YnkpIGDwNf+olWm8vc3x9RrD+G5wgQGS3MAgJZcxU6YZX1yYOG1exd2hYIaokrfH956
 Doh55Xz+oDkE4li+WV9kkAnFw41V9U+30TY0TOjXQoGYbM69sLBEpzhqTwYI8mV5fLKW
 WJRd6GNgOx87Afp83QtX5xz3iCja+EjwBtPFavqCbaH5k75Sbn9DsjVz5fWlEyx4T2Ao
 CVtuCECiSvCTC8jfwK39UjB58B9BqZ+H5cqPn+MwyU9fzgAhXzV+uxTye3AslKkCpQPX
 fj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=iwr7XkJX8s+Vxxl+k0pY94n0/ODkYyQntmhI8k+Qn6I=;
 b=ZGcx2fp8HkqMAmJqI/4H7ofiTxHFmeaiK3E6zjsSESW5jvH7UHOclGiN78wghrttiw
 Cu8jXSa9bY3T8Q/PHQ9Gr2lZtv2GYMSnnhG5Q2CMDLl6DUjqFsxWC4fvYRjrwuZgi251
 r/dOGkYtnJT58bruvoYzG6FzYucriCFLi7tmDSoQnsBmFMZluEl4sbXX6UIYQbU60hAn
 N0IA8NO/0Asuw3ieMCxGpGOxIbBX5bMKEsvo/dGCztUDYZq2jWaPcTqDbtQ6N3oLkEAA
 H6hj3BqMMIAdjQSsZbW/V+JTLTd9z1L+uXUOiz+SYAEgGo1DdBbdkeJbTtTpSyU+5H+O
 0D4w==
X-Gm-Message-State: ACgBeo2k//yG8e71BKtiKTRDRAP5zubMVclFLOVFudiN7Y9Pub4nh8eT
 mB8iAlAz0vAF1hXIZxDIwl5nv9C2rlyJZBevD2E=
X-Google-Smtp-Source: AA6agR6zEn89cFvufHE8chEgz2jlIkGasvC8tMwTtwMNFTMfHDOM1OkMTmoUyaytKEWPYis+Q6YeOgEF0rN7lxUcm98=
X-Received: by 2002:a05:6000:178f:b0:221:7dcb:7cbf with SMTP id
 e15-20020a056000178f00b002217dcb7cbfmr7791842wrg.58.1660541811221; Sun, 14
 Aug 2022 22:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-11-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-11-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 15 Aug 2022 08:36:39 +0300
Message-ID: <CANhJrGOmFiC42_F+vX9zxg0uP_wdjQbBCPyn6+Zy3DkBycnaGw@mail.gmail.com>
Subject: Re: [PATCH v7 10/13] power: supply: mt6370: Add MediaTek MT6370
 charger driver
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
Cc: linux-fbdev@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 chunfeng.yun@mediatek.com, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, szunichen@gmail.com,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi ChiaEn,

pe 5. elok. 2022 klo 10.09 ChiaEn Wu (peterwu.pub@gmail.com) kirjoitti:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add a support for the MediaTek MT6370 Charger driver. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.
>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>
> +
> +#define MT6370_CHG_LINEAR_RANGE(_rfd, _min, _min_sel, _max_sel, _step) \
> +[_rfd] = {                                                             \
> +       .min = _min,                                                    \
> +       .min_sel = _min_sel,                                            \
> +       .max_sel = _max_sel,                                            \
> +       .step = _step,                                                  \
> +}

Just a minor thing but I think this macro could be useful also for
other drivers. Do you think you could rename it to LINEAR_RANGE_IDX()
(or some such) and move it to the linear_range.h? That would allow
also other drivers to use it instead of reinventing the wheel :)

Best Regards
  -- Matti Vaittinen



---

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
