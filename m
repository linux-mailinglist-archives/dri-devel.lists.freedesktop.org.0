Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEE773A65
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 15:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F8210E3DD;
	Tue,  8 Aug 2023 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9E610E3DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 13:18:42 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d44c2ca78ceso5548772276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691500721; x=1692105521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
 b=iy7zswmtYx6ZYNzYmCG5rqHRjdv+HqB8GrEKYccjle/8dJ9x1OShHO9OgMow0zFYho
 RJhCC40wkFuTTf25ecgjND4T7pSlTzynELSybpF4Tq9lm0vpF/1WhH9PVjPDo3D92r0t
 vE0MwfGWmp5O6GeDRRPpN190ezwOTKyeDzoh+6spHPvGNcXvDC15NYX5Fh6AdODwNh9i
 u+xgCMzltAjprgtTTXUMnRSMUGU88rU5hQybpWcAAj9weIpW1fiVIhA90pqCkvmL6npO
 3XYinfPiJb8jbNTnaImLtOznhk/zT3v7clUSSq2VXwojFDvEIz4Ap+Wto2wlmlxEy3FT
 jTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691500721; x=1692105521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
 b=ZIo/7cI0nHnCwTg90XozmcqA8vile1NCeS2kSAI2m8nVUxIoae8uq31gkNp/G5QrkG
 QzShC0yQitRmcQAHpbrME+664g3aEIOSEFn6erMWuw7CV2+0nNcWrzBLpN47HGVMV4t4
 xfTDZb8KT8jql0DM1cBnij5XrYN0AbSVRlgcrglHt2fvvntOsibQPxEATkyEAKg6aDJn
 mLVE2Sr60OX5Ou0U+pXSMmF7PZRM+XNgb8WO7mkSfX1YoZeeNe30EpFuh8j6LKg/9Hsk
 CAv1CCgjaY4YqKcGu222fTeljLlq6ELBINsy2ZJ9SttiwRp2A8OMvh8GYMkbkSm/s6gq
 RT0Q==
X-Gm-Message-State: AOJu0YxObXP2zh4NZRHdbE551KFhV9CtBuhpKELqvEdFO5300cyJKIiI
 mbdNGMokDBY6lWOuITWFW4N5zD+C0uj4QUJBL/ibGg==
X-Google-Smtp-Source: AGHT+IGCQegfute4wq8vuctRCNyh2F9D25HtOrYRCxA1KPyHbK9gB5btAs+lYOVd+Us7kHls2/CFh6KxK9tgT70dyU8=
X-Received: by 2002:a25:d14e:0:b0:cee:80e:23af with SMTP id
 i75-20020a25d14e000000b00cee080e23afmr3349036ybg.11.1691500721596; Tue, 08
 Aug 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Aug 2023 15:18:30 +0200
Message-ID: <CACRpkdZ4OqLywBhCkDmA6bEkf3rfHpCODba9Rhx36fuP8ywt6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Pavel Machek <pavel@ucw.cz>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Shevchenko <andy@kernel.org>,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, greybus-dev@lists.linaro.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>,
 Sven Peter <sven@svenpeter.dev>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 4:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> (implicit) v1 of this series can be found at
> https://lore.kernel.org/linux-pwm/20230803140633.138165-1-u.kleine-koenig=
@pengutronix.de .
>
> Changes since then only affect documentation that I missed to adapt befor=
e.
> Thanks to Laurent for catching that
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (2):
>   pwm: Manage owner assignment implicitly for drivers
>   pwm: crc: Allow compilation as module and with COMPILE_TEST

Clearly the right thing to do! Nice patches.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
