Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3377B2B8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0710E136;
	Mon, 14 Aug 2023 07:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3F110E136
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 07:41:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe1a17f983so36191145e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691998886; x=1692603686;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
 b=c2ibWsrtxlpOl2l93H8I7dwO30O1xssdh4p/RrE2q8N2J8sUQOiLfPy4jrHUDNecWQ
 B9Xl7UbuevI0/fpeC3Cqz4JjJBdAc1fM3Sx+NRxxOWZwKyMRK3wSy1FRjBCN1vRcCJ3V
 iNaGpXWAcpuPTu7ilq8+T4iAp1Du1dTft6ZdWvtZ4YteQjS4RMAl8rEkUzkK3U48fPQ3
 Ta+6PDHsz/O7Bxk8FyAYZKsv9wLW0hBYeG+zmWBSRbPB9cFQZwP3sWc7W4O0II/GdFDH
 XLs0zYerpdo1H3GjEXSiYzl+d1vN7CnfVNDwP6MnTibEClBZjnwlup1Vh8wpi7JEvqyE
 zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691998886; x=1692603686;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
 b=MbHdbFPpleoykV/1khnIKHsZz7oaSeFwER8FhBn013qXuTN9Wc1LGRhgTtN54gTA7s
 hKYcIlmXpNkELrzTLmN1BHv0/PmLW6HvFS+7KTOK27c9YRTk7Qy48oCXUlIyCSRIVQ00
 7Rtr+Ex/DYxhKhPdEWs0tBxhCgzAvLTlNoU9zM4lXAdN6UH1FWUyo9LKpmeNDaEOg18d
 Xr1fD3uemUbLzacT1nbU7n8kmcDaqB/z6mFiwqKkXp+xPpFT7fnWKL5Av8BfwtlioubU
 EG9qgZCVIxcGcC1p2SrPejpYcO6mQMrlUmcso34mNOJ4qc08ox2SW9Q122hgy1uF4zOQ
 hTVQ==
X-Gm-Message-State: AOJu0Ywo9xvFl2+zrtdaVVw4HsvUblSgs7vasAjTqaU7kFUNXlEMVzYn
 BevtRLWOvxVrAEL1CAKmFoRvJQ==
X-Google-Smtp-Source: AGHT+IFYfAjXxtZPBAO6xzW1e3FH1h7mkoQ3yNtVsbL8sLdvSW5eTgH/X76mW18QMBp5iOQDIcXGqw==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id
 b7-20020adfee87000000b003175e0dc249mr6776837wro.35.1691998885785; 
 Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6283000000b00317643a93f4sm13507243wru.96.2023.08.14.00.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Message-ID: <81500a13-0fed-e9d4-7f51-552b888a98e1@linaro.org>
Date: Mon, 14 Aug 2023 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Johan Hovold <johan@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Luca Weiss <luca@z3ntu.xyz>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Michael Walle <michael@walle.cc>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2023 16:27, Uwe Kleine-König wrote:
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> 
> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpio/gpio-mvebu.c             |  1 -
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>   drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
>   drivers/pwm/core.c                    | 24 ++++++++++++++----------
>   drivers/pwm/pwm-ab8500.c              |  1 -
>   drivers/pwm/pwm-apple.c               |  1 -
>   drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
>   drivers/pwm/pwm-atmel-tcb.c           |  1 -
>   drivers/pwm/pwm-atmel.c               |  1 -
>   drivers/pwm/pwm-bcm-iproc.c           |  1 -
>   drivers/pwm/pwm-bcm-kona.c            |  1 -
>   drivers/pwm/pwm-bcm2835.c             |  1 -
>   drivers/pwm/pwm-berlin.c              |  1 -
>   drivers/pwm/pwm-brcmstb.c             |  1 -
>   drivers/pwm/pwm-clk.c                 |  1 -
>   drivers/pwm/pwm-clps711x.c            |  1 -
>   drivers/pwm/pwm-cros-ec.c             |  1 -
>   drivers/pwm/pwm-dwc.c                 |  1 -
>   drivers/pwm/pwm-ep93xx.c              |  1 -
>   drivers/pwm/pwm-fsl-ftm.c             |  1 -
>   drivers/pwm/pwm-hibvt.c               |  1 -
>   drivers/pwm/pwm-img.c                 |  1 -
>   drivers/pwm/pwm-imx-tpm.c             |  1 -
>   drivers/pwm/pwm-imx1.c                |  1 -
>   drivers/pwm/pwm-imx27.c               |  1 -
>   drivers/pwm/pwm-intel-lgm.c           |  1 -
>   drivers/pwm/pwm-iqs620a.c             |  1 -
>   drivers/pwm/pwm-jz4740.c              |  1 -
>   drivers/pwm/pwm-keembay.c             |  1 -
>   drivers/pwm/pwm-lp3943.c              |  1 -
>   drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
>   drivers/pwm/pwm-lpc32xx.c             |  1 -
>   drivers/pwm/pwm-lpss.c                |  1 -
>   drivers/pwm/pwm-mediatek.c            |  1 -
>   drivers/pwm/pwm-meson.c               |  1 -

Acked-by: Neil Armstrong <neil.armstrong@linaro.org> # pwm-meson

>   drivers/pwm/pwm-microchip-core.c      |  1 -
>   drivers/pwm/pwm-mtk-disp.c            |  1 -
>   drivers/pwm/pwm-mxs.c                 |  1 -
>   drivers/pwm/pwm-ntxec.c               |  1 -
>   drivers/pwm/pwm-omap-dmtimer.c        |  1 -
>   drivers/pwm/pwm-pca9685.c             |  1 -
>   drivers/pwm/pwm-pxa.c                 |  1 -
>   drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
>   drivers/pwm/pwm-rcar.c                |  1 -
>   drivers/pwm/pwm-renesas-tpu.c         |  1 -
>   drivers/pwm/pwm-rockchip.c            |  1 -
>   drivers/pwm/pwm-rz-mtu3.c             |  1 -
>   drivers/pwm/pwm-samsung.c             |  1 -
>   drivers/pwm/pwm-sifive.c              |  1 -
>   drivers/pwm/pwm-sl28cpld.c            |  1 -
>   drivers/pwm/pwm-spear.c               |  1 -
>   drivers/pwm/pwm-sprd.c                |  1 -
>   drivers/pwm/pwm-sti.c                 |  1 -
>   drivers/pwm/pwm-stm32-lp.c            |  1 -
>   drivers/pwm/pwm-stm32.c               |  1 -
>   drivers/pwm/pwm-stmpe.c               |  1 -
>   drivers/pwm/pwm-sun4i.c               |  1 -
>   drivers/pwm/pwm-sunplus.c             |  1 -
>   drivers/pwm/pwm-tegra.c               |  1 -
>   drivers/pwm/pwm-tiecap.c              |  1 -
>   drivers/pwm/pwm-tiehrpwm.c            |  1 -
>   drivers/pwm/pwm-twl-led.c             |  2 --
>   drivers/pwm/pwm-twl.c                 |  2 --
>   drivers/pwm/pwm-visconti.c            |  1 -
>   drivers/pwm/pwm-vt8500.c              |  1 -
>   drivers/pwm/pwm-xilinx.c              |  1 -
>   drivers/staging/greybus/pwm.c         |  1 -
>   include/linux/pwm.h                   | 10 ++++++----
>   68 files changed, 20 insertions(+), 82 deletions(-)
> 

<snip>

> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 25519cddc2a9..5bea53243ed2 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -335,7 +335,6 @@ static const struct pwm_ops meson_pwm_ops = {
>   	.free = meson_pwm_free,
>   	.apply = meson_pwm_apply,
>   	.get_state = meson_pwm_get_state,
> -	.owner = THIS_MODULE,
>   };
>   
>   static const char * const pwm_meson8b_parent_names[] = {

<snip>

