Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B18A63EAD0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4510E55B;
	Thu,  1 Dec 2022 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 01 Dec 2022 01:22:39 UTC
Received: from out30-7.freemail.mail.aliyun.com
 (out30-7.freemail.mail.aliyun.com [115.124.30.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AB510E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 01:22:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=57; SR=0;
 TI=SMTPD_---0VW5-8b9_1669857445; 
Received: from 30.97.48.64(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VW5-8b9_1669857445) by smtp.aliyun-inc.com;
 Thu, 01 Dec 2022 09:17:29 +0800
Message-ID: <a7e61ce5-b5e6-384a-3c89-ebde63340678@linux.alibaba.com>
Date: Thu, 1 Dec 2022 09:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Dec 2022 08:06:25 +0000
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



On 11/30/2022 11:21 PM, Uwe Kleine-König wrote:
> diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
> index 7004f55bbf11..bda8bc5af976 100644
> --- a/drivers/pwm/pwm-sprd.c
> +++ b/drivers/pwm/pwm-sprd.c
> @@ -65,8 +65,8 @@ static void sprd_pwm_write(struct sprd_pwm_chip *spc, u32 hwid,
>   	writel_relaxed(val, spc->base + offset);
>   }
>   
> -static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> -			       struct pwm_state *state)
> +static int sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +			      struct pwm_state *state)
>   {
>   	struct sprd_pwm_chip *spc =
>   		container_of(chip, struct sprd_pwm_chip, chip);
> @@ -83,7 +83,7 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (ret) {
>   		dev_err(spc->dev, "failed to enable pwm%u clocks\n",
>   			pwm->hwpwm);
> -		return;
> +		return 0;
>   	}
>   
>   	val = sprd_pwm_read(spc, pwm->hwpwm, SPRD_PWM_ENABLE);
> @@ -113,6 +113,8 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	/* Disable PWM clocks if the PWM channel is not in enable state. */
>   	if (!state->enabled)
>   		clk_bulk_disable_unprepare(SPRD_PWM_CHN_CLKS_NUM, chn->clks);
> +
> +	return 0;
>   }
>   
>   static int sprd_pwm_config(struct sprd_pwm_chip *spc, struct pwm_device *pwm,

For sprd pwm parts:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
