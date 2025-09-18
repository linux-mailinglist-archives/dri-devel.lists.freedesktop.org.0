Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EBAB25D1D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305CA10E801;
	Thu, 14 Aug 2025 07:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QCJ48aON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Wed, 13 Aug 2025 16:22:39 UTC
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0826F10E739
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=8r/LCX9rzyog3y
 rylwFjwRMpIaemTxzslMXi3Wwcda8=; b=QCJ48aONHnHPI67IOJ/3D8OQB3Cd/k
 va3dqQAxVecMFTPLNQfZkeRCBnr21f5AP85A+ko/Co2kn3d1vUsGdjjGnQSoqHT/
 XhtDURAzo7LNMG2Hw6aJkJP1nHKCJDt/I4UFOhqYSkFA3npSGKStA4S5hsN3gfb8
 C8iP/CLkf5T/WRnlry5E/M4rY/ikuUABioRBeFix0sZAgPzikWKDzZXwcrM/PlZn
 9QF5GBzn0iIdqib/tI3qtiZXmnTMTK2djC7YMTKPNRHBv7OXt7TeyHMZFzQFHHD9
 4yuXLJeM/fwFHXJlvGUnp8QGyn4bljRJZaBZSVKQgiNlixK49bkom2HA==
Received: (qmail 694422 invoked from network); 13 Aug 2025 18:15:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 Aug 2025 18:15:54 +0200
X-UD-Smtp-Session: l3s3148p1@6vOVeEE8NodtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Shevchenko <andy@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Avi Fishman <avifishman70@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 David Airlie <airlied@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Drew Fustini <fustini@kernel.org>, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-actions@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Liu Ying <victor.liu@nxp.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Nancy Yuen <yuenn@google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
 Patrick Venture <venture@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomer Maimon <tmaimon77@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 00/21] treewide: remove unneeded 'fast_io' parameter in
 regmap_config
Date: Wed, 13 Aug 2025 18:14:46 +0200
Message-ID: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:25:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on a driver using regmap with MMIO, I wondered if I need
to set 'fast_io' in the config. Turned out I don't need to, so I added
documentation for it with commit ffc72771ff6e ("regmap: Annotate that
MMIO implies fast IO").

This series fixes the existing users in the tree which needlessly set
the flag. They have been found using this coccinelle script:

===

@ match @
expression dev, clk, regs;
identifier config;
@@

(
	regmap_init_mmio(dev, regs, &config)
|
	devm_regmap_init_mmio(dev, regs, &config)
|
	regmap_init_mmio_clk(dev, clk, regs, &config)
|
	devm_regmap_init_mmio_clk(dev, clk, regs, &config)
)

@ fix depends on match @
identifier match.config;
@@

	struct regmap_config config = {
-	.fast_io = true,
	};

===

It misses occasions where 'config' is an expression and not an
identifier. These are rare, though, I can fix them manually later. The
advantage of this approach is that it produces no false positives to the
best of my knowledge.

Please apply individually per subsystem. There are no dependencies and
buildbot is happy. Patches are based on 6.17-rc1

Happy hacking,

   Wolfram


Wolfram Sang (21):
  bus: remove unneeded 'fast_io' parameter in regmap_config
  clk: remove unneeded 'fast_io' parameter in regmap_config
  gpio: remove unneeded 'fast_io' parameter in regmap_config
  drm: remove unneeded 'fast_io' parameter in regmap_config
  iio: remove unneeded 'fast_io' parameter in regmap_config
  Input: remove unneeded 'fast_io' parameter in regmap_config
  mailbox: remove unneeded 'fast_io' parameter in regmap_config
  media: remove unneeded 'fast_io' parameter in regmap_config
  mfd: remove unneeded 'fast_io' parameter in regmap_config
  mmc: remove unneeded 'fast_io' parameter in regmap_config
  peci: remove unneeded 'fast_io' parameter in regmap_config
  phy: remove unneeded 'fast_io' parameter in regmap_config
  pinctrl: remove unneeded 'fast_io' parameter in regmap_config
  pmdomain: remove unneeded 'fast_io' parameter in regmap_config
  regulator: remove unneeded 'fast_io' parameter in regmap_config
  reset: remove unneeded 'fast_io' parameter in regmap_config
  rtc: remove unneeded 'fast_io' parameter in regmap_config
  soc: remove unneeded 'fast_io' parameter in regmap_config
  spi: remove unneeded 'fast_io' parameter in regmap_config
  thermal: remove unneeded 'fast_io' parameter in regmap_config
  ASoC: remove unneeded 'fast_io' parameter in regmap_config

 drivers/bus/bt1-apb.c                             | 1 -
 drivers/clk/actions/owl-common.c                  | 1 -
 drivers/clk/clk-axm5516.c                         | 1 -
 drivers/clk/nxp/clk-lpc32xx.c                     | 1 -
 drivers/clk/qcom/a53-pll.c                        | 1 -
 drivers/clk/qcom/a7-pll.c                         | 1 -
 drivers/clk/qcom/apss-ipq-pll.c                   | 1 -
 drivers/clk/qcom/clk-cbf-8996.c                   | 1 -
 drivers/clk/qcom/clk-cpu-8996.c                   | 1 -
 drivers/clk/qcom/hfpll.c                          | 1 -
 drivers/clk/qcom/ipq-cmn-pll.c                    | 1 -
 drivers/clk/thead/clk-th1520-ap.c                 | 1 -
 drivers/gpio/gpio-mvebu.c                         | 1 -
 drivers/gpio/gpio-sifive.c                        | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1 -
 drivers/gpu/drm/imx/dc/dc-cf.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c                    | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c               | 2 --
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  | 1 -
 drivers/iio/adc/sun4i-gpadc-iio.c                 | 1 -
 drivers/input/touchscreen/fsl-imx25-tcq.c         | 1 -
 drivers/mailbox/qcom-apcs-ipc-mailbox.c           | 1 -
 drivers/media/cec/platform/stm32/stm32-cec.c      | 1 -
 drivers/mfd/exynos-lpass.c                        | 1 -
 drivers/mfd/fsl-imx25-tsadc.c                     | 1 -
 drivers/mfd/stm32-lptimer.c                       | 1 -
 drivers/mfd/sun4i-gpadc.c                         | 1 -
 drivers/mmc/host/sdhci_am654.c                    | 1 -
 drivers/peci/controller/peci-npcm.c               | 1 -
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c         | 1 -
 drivers/phy/ti/phy-am654-serdes.c                 | 1 -
 drivers/phy/ti/phy-j721e-wiz.c                    | 1 -
 drivers/pinctrl/pinctrl-rp1.c                     | 1 -
 drivers/pmdomain/imx/gpc.c                        | 1 -
 drivers/regulator/qcom-refgen-regulator.c         | 1 -
 drivers/reset/reset-intel-gw.c                    | 1 -
 drivers/reset/reset-qcom-pdc.c                    | 1 -
 drivers/reset/reset-th1520.c                      | 1 -
 drivers/rtc/rtc-meson.c                           | 1 -
 drivers/soc/qcom/llcc-qcom.c                      | 1 -
 drivers/soc/qcom/ramp_controller.c                | 1 -
 drivers/spi/spi-altera-platform.c                 | 1 -
 drivers/thermal/armada_thermal.c                  | 1 -
 drivers/thermal/sun8i_thermal.c                   | 1 -
 sound/soc/fsl/fsl_sai.c                           | 1 -
 53 files changed, 57 deletions(-)

-- 
2.47.2

