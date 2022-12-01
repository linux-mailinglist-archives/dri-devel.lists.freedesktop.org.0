Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A00663EAC7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19B510E54B;
	Thu,  1 Dec 2022 08:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A70D10E54B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:03:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h11so1328969wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 00:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RAIQbbxtK2nJ1NbUghrZ93yJMEm2LyReQuktQwQ+yXw=;
 b=Lo8p+aDFlKlZfG6pP0n7RZNEjwZK+wrouNetRK3rZv63MbeCUctT1ieDjkKZxl3LvQ
 1IUxcYuylIWjoy7vKgfrNL5bEmzdei5+43ayKtzqRIyOjWYlsoDieQD7IgspPDeYN4Rg
 g0Tg2r6urLUhUddkFA8F1g+Y6MZ6LYzNVPQKNUdc62bCqGXALe+tEuJdy6U6nHFQ1VTs
 pd9A/smgMPI5kbQN+yqEnGZNPKCbNRwE4VhlqdS4p01McAPr9GKRJDIzQjVNyphai7am
 M+pt/qh8ja70rWDWaq5xcHGdzPkZEr0JVoVeIN0FLdIf+5vnAZEi/TDzF6dIxj4puvKU
 V1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAIQbbxtK2nJ1NbUghrZ93yJMEm2LyReQuktQwQ+yXw=;
 b=SqQrxA78Aj04zyLox3IHHQJv/wkXe6MwUGBeuzFqNp13ANVFZPQ3kqXk7loBnub0SR
 Ac7Q3nmEP8Z0ndOBEm/SLUvIr4jBa+Vqpt0QzpANyW3LeQJiaU/adWNdFXTwF92vFN6P
 sjGR6bR+jDDvrb9g1UvB9jbUjlzsgGfjGQYwspZF6VuK3aZpzp53jW6KlKnDZwdm6u00
 u9dZj7Vd3cBzuMOPxFUR3XbSbU8/H5V5Z2w+qsh/SsmbKZ2Ibpt7b4RekPsKTjFCk6Vm
 4aYp4f0LwivCWaN1LMsWWLnHHeGXVp+iwvcDhC6iIKBZBYGVgxL1Lv07/RBDz47HR2GH
 WE1w==
X-Gm-Message-State: ANoB5pmD5xHW44OJcc0kLQ/WI7eq5L5Po/THrnZOlWjqMayHziqK2UEn
 Re4jiqbKrepIaZmh+iC05Qf0VQ==
X-Google-Smtp-Source: AA0mqf54lvafHdVKKM2CGBzb3Ly91fbeS37TZTU/o75hgaix+kcG2rGxchFiaWC/vEjl7eP4KzxYJQ==
X-Received: by 2002:a05:6000:1d92:b0:241:6e0a:bfe6 with SMTP id
 bk18-20020a0560001d9200b002416e0abfe6mr31726074wrb.34.1669881828568; 
 Thu, 01 Dec 2022 00:03:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f?
 ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
 by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b003cf78aafdd7sm4517313wmb.39.2022.12.01.00.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 00:03:48 -0800 (PST)
Message-ID: <b19c4956-3f92-f6be-7d61-9b826e5d6fe1@linaro.org>
Date: Thu, 1 Dec 2022 09:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 16:21, Uwe Kleine-König wrote:
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
> 
> This patch was created using coccinelle and the following semantic patch:
> 
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>   struct pwm_ops driver = {
>          ...,
>          .get_state = getstatefunc
>          ,...
>   };
> 
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>   getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_state *state)
>   {
>     ...
> -  return;
> +  return 0;
>     ...
>   }
> 
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
> 
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>   drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>   drivers/pwm/pwm-atmel.c               |  6 ++++--
>   drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>   drivers/pwm/pwm-crc.c                 | 10 ++++++----
>   drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>   drivers/pwm/pwm-dwc.c                 |  6 ++++--
>   drivers/pwm/pwm-hibvt.c               |  6 ++++--
>   drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>   drivers/pwm/pwm-imx27.c               |  8 +++++---
>   drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>   drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>   drivers/pwm/pwm-keembay.c             |  6 ++++--
>   drivers/pwm/pwm-lpss.c                |  6 ++++--
>   drivers/pwm/pwm-meson.c               |  8 +++++---
>   drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>   drivers/pwm/pwm-pca9685.c             |  8 +++++---
>   drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>   drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>   drivers/pwm/pwm-sifive.c              |  6 ++++--
>   drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>   drivers/pwm/pwm-sprd.c                |  8 +++++---
>   drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>   drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>   drivers/pwm/pwm-sunplus.c             |  6 ++++--
>   drivers/pwm/pwm-visconti.c            |  6 ++++--
>   drivers/pwm/pwm-xilinx.c              |  8 +++++---
>   include/linux/pwm.h                   |  4 ++--
>   29 files changed, 146 insertions(+), 89 deletions(-)
> 

<snip>

> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 57112f438c6d..16d79ca5d8f5 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -318,8 +318,8 @@ static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
>   	return cnt * fin_ns * (channel->pre_div + 1);
>   }
>   
> -static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> -				struct pwm_state *state)
> +static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +			       struct pwm_state *state)
>   {
>   	struct meson_pwm *meson = to_meson_pwm(chip);
>   	struct meson_pwm_channel_data *channel_data;
> @@ -327,7 +327,7 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	u32 value, tmp;
>   
>   	if (!state)
> -		return;
> +		return 0;
>   
>   	channel = &meson->channels[pwm->hwpwm];
>   	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
> @@ -357,6 +357,8 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   		state->period = 0;
>   		state->duty_cycle = 0;
>   	}
> +
> +	return 0;
>   }
>   
>   static const struct pwm_ops meson_pwm_ops = {

<snip>

For pwm-meson:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

