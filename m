Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233459A96D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76C310E38A;
	Fri, 19 Aug 2022 23:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4C910E730
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:27:52 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id k2so5893790vsk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=S5hEEHWwiNg2k4v549E4aszQCunYEI4sx3nLM1GzVyw=;
 b=Xo91q4wHdMEv6mkWdK1iVOirDjLT9n3Hl7r1ukV7j2UkFCo69Rc+cAHQMIr1eD12OJ
 FScZar+W3DjhY6S+6le54/2QZIsoh/afIDT24EA6uTWEczNr8RscpQWFedIKwWpqg996
 1J+uRNjyLWZLyH7ziBd3dPGeQnVjPAK7nrs6YF7pv0iK4twegX2QCKjsuRaKZUb5Iizt
 EFAU7Abe29FkXsO5iccQWa0/Yp1yl1y8xl5g6tia4xHtwIff/+MbReupf82asEusb+CF
 UQu54CzuidnIGK99Fb5PihHw8JHX24b9cSoHnjXW6rYAqHfizVxmfwXK3bXSVc4vpdGM
 nxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=S5hEEHWwiNg2k4v549E4aszQCunYEI4sx3nLM1GzVyw=;
 b=H7wwm9yJsZR7SJTxlOsc6mEmo2xsr5wZSALhnHMUhC2W4kzRzUW3fvdfUrQhZWgHvg
 BOZfX+y3s3mZmLHTI2L89E5/b+UF/jB3E3ExDwfMDxhnOlueGcudjeVE1POYLsxJSYYr
 6jcB5FzSDClJwGtA9SYERamKbaEhbhDPgB2zHyrswAoSkHbc3oo6a/pxh+3AozVrEvTz
 +qbMl9n9QBLTvQUNBKipZ4SlUsA86yr0CSjN0D6Bdxl2uj3OIOn1ILbaCDNEG8fSjbwp
 /o7eflt78oq2YpDctHq1Grzwjq7dEb/nFTOp4KdSvrbpun0i/ynlkCm1hFFB/9plGWFX
 2GCA==
X-Gm-Message-State: ACgBeo1wCA2PHClUGFmqktB/6eNd/mROvq6wzL9s76llccjOMOIJfW74
 bAFMddAAoR+kT71TZoOrIsT/4rQcA14AHk9JvR4=
X-Google-Smtp-Source: AA6agR4aZOaEro5daSKUdeT2RJVo7AImgpeqXvvIo0V84bpkcQrdEfkHLqcHycEYpUgzgMskEPDS+gA/3V8uYDpz4MQ=
X-Received: by 2002:a67:e050:0:b0:390:3963:eb5b with SMTP id
 n16-20020a67e050000000b003903963eb5bmr1017980vsl.7.1660951671566; Fri, 19 Aug
 2022 16:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660934107.git.mazziesaccount@gmail.com>
In-Reply-To: <cover.1660934107.git.mazziesaccount@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Aug 2022 02:27:14 +0300
Message-ID: <CAHp75VfZ+aoo9btTk+8kmOak4PN0Pc7L7RBQMv2SNC2agMbpsg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Use devm helpers for regulator get and enable
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Xiang wangx <wangxiang@cdjrlc.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk <linux-clk@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, Alexandru Lazar <alazar@startmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 10:20 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> Use devm helpers for regulator get and enable
>
> NOTE: The series depends on commit
> ee94aff2628b ("Devm helpers for regulator get and enable")
> which currently sits in Mark's regulator/for-next
>
> A few* drivers seem to pattern demonstrated by pseudocode:
>
> - devm_regulator_get()
> - regulator_enable()
> - devm_add_action_or_reset(regulator_disable())
>
> devm helpers for this pattern were added to remove bunch of code from

remove a bunch

> drivers. Typically following:
>
> - replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
>   devm_add_action_or_reset()) with just one
>   (devm_regulator_get_enable[_optional]()).
> - drop disable callback.
>
> I believe this simplifies things by removing some dublicated code.

duplicated

> This series reowrks a few drivers. There is still plenty of fish in the

reworks

> sea for people who like to improve the code (or count the beans ;]).
>
> Finally - most of the converted drivers have not been tested (other than
> compile-tested) due to lack of HW. All reviews and testing is _highly_
> appreciated (as always!).

...

>   docs: devres: regulator: Add new get_enable functions to devres.rst
>   clk: cdce925: simplify using devm_regulator_get_enable()
>   gpu: drm: simplify drivers using devm_regulator_*get_enable*()
>   hwmon: lm90: simplify using devm_regulator_get_enable()
>   hwmon: adm1177: simplify using devm_regulator_get_enable()

hwmon uses a different pattern for the Subject line.

-- 
With Best Regards,
Andy Shevchenko
