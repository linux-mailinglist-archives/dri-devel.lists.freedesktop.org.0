Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D1463ED98
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC1910E5AB;
	Thu,  1 Dec 2022 10:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3393E10E5AB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:23:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175C1D6E;
 Thu,  1 Dec 2022 02:23:09 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DF93F67D;
 Thu,  1 Dec 2022 02:22:55 -0800 (PST)
Date: Thu, 1 Dec 2022 10:22:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an
 error code
Message-ID: <20221201102252.52ace284@donnerap.cambridge.arm.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 16:21:38 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

Hi,

> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>=20
> This patch was created using coccinelle and the following semantic patch:
>=20
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>=20
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>=20
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>=20
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)
>=20

[ ... ]
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..37d75e252d4e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct sun4i_pwm_=
chip *chip,
>  	writel(val, chip->base + offset);
>  }
> =20
> -static void sun4i_pwm_get_state(struct pwm_chip *chip,
> -				struct pwm_device *pwm,
> -				struct pwm_state *state)
> +static int sun4i_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm,
> +			       struct pwm_state *state)
>  {
>  	struct sun4i_pwm_chip *sun4i_pwm =3D to_sun4i_pwm_chip(chip);
>  	u64 clk_rate, tmp;
> @@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period, 2);
>  		state->polarity =3D PWM_POLARITY_NORMAL;
>  		state->enabled =3D true;
> -		return;
> +		return 0;
>  	}
> =20
>  	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm->hwpwm)];
> =20
>  	if (prescaler =3D=3D 0)
> -		return;
> +		return 0;
> =20
>  	if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
>  		state->polarity =3D PWM_POLARITY_NORMAL;
> @@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
> =20
>  	tmp =3D (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
>  	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
> +
> +	return 0;
>  }
> =20
>  static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,

For sunxi:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Just one comment: I don't see a sunxi specific patch later in the series,
though it seems we have at least one error error exit (see prescaler =3D=3D=
 0
above). Plus potentially another exit if clk_get_rate() (at the very
beginning) fails.
Shall I send a patch for that?

Cheers,
Andre.


