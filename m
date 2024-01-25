Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAD83C4A1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 15:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6BF10F2A0;
	Thu, 25 Jan 2024 14:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453810F89C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:11:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZH-0003ZH-Nv; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZ5-002HOg-Vz; Thu, 25 Jan 2024 13:10:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZ5-007my3-2V;
 Thu, 25 Jan 2024 13:10:39 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alexander Shiyan <shc_work@mail.ru>, Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>, Michael Walle <mwalle@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH v5 000/111] pwm: Improve lifetime tracking for pwm_chips
Date: Thu, 25 Jan 2024 13:08:22 +0100
Message-ID: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13051;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=R3cZoF50NJKzunlOh4gQSXA6UZ8jBNEYYPQF8OY0BsA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk85qB6LpEI62WIAaa+6p9gziaDsmdPYpQgkm
 hsSsBAnweWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPOQAKCRCPgPtYfRL+
 Tg8iB/4lh8/Fbqosy2c6X4HqeeB+gTB8nHPoDL1gUw5DcXAGnV8Y4e1JPJIVqKfpA9IhoyerN4f
 mzg2OHpXtLKeRBXbv87htzgh4TDR0lxIiG3YkL5KFUO+edkqjeTcnWQv771OVbog4Y4xf6l/5Tm
 crUpgyqXdAXGoFiGqHslhndjIG9HSpPF6/yP+26JSi+foHm9PjxIDU3X6j14NFrj7HSGhUtLRWj
 cRTU7KlBcMR8Te8vh0SYO2Tnp6VaKJLWfh/FzFUaA7V3FFkTjSJH6JcXUiF0dr46mX7G57VAlTw
 4KeDjqr02WNjAUpp+4Vujda11AEkLWsL/dJcldbADNCsyFR7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 25 Jan 2024 14:25:33 +0000
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, asahi@lists.linux.dev,
 kernel@pengutronix.de, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this is v5 of this series. The relevant changes since v4
(https://lore.kernel.org/linux-pwm/cover.1701860672.git.u.kleine-koenig@pengutronix.de):

 - New first patch to reshuffle functions in core.c. This is a
   preparation for the later changes which brings functions in a better
   order to not need declarations.
 - Fix kernel docs in several drivers
 - Added a few ack and review tags received for v4
 - non-trivially rebased to current pwm/for-next
   (the changes to drivers/gpu/drm/bridge/ti-sn65dsi86.c were intrusive
   enough to not add the ack tag by Robert Foss I got).

Handling got a bit more complicated with the recent addition of
pwm_apply_atomic/pwm_apply_might_sleep the locking got more complicated.
I didn't work out all the necessary details. So this series won't work
as is. However as there is probably some more coordination needed to get
the patches in that touch files outside of drivers/pwm and I'm confident
they can stay as is, I want to get the biggest part of this series in
(up to patch #106) during the next merge window and get them into next
soon. After that I can spend the time necessary to fix the locking maybe
to get the remaining bits in during the following merge window.

There are patches touching drivers/gpu/drm/bridge/ti-sn65dsi86.c (#37
and #104), drivers/staging/greybus/pwm.c (#38 and #106),
drivers/gpio/gpio-mvebu.c (#103) and drivers/leds/rgb/leds-qcom-lpg.c
(#105). These depend on earlier patches in this series (#3, #39 and #40)
The patches touching staging/greybus and leds-qcom-lpg already have a
maintainer ack, so I'd merge them via my tree. For the other two it
would be nice to get an ack to merge via my tree, too. But if you want
to merge via your own tree, please tell, so we can coordinate
accordingly.

Best regards
Uwe

Uwe Kleine-König (111):
  pwm: Reorder symbols in core.c
  pwm: cros-ec: Change prototype of helpers to prepare further changes
  pwm: Provide a macro to get the parent device of a given chip
  pwm: ab8500: Make use of pwmchip_parent() macro
  pwm: atmel: Make use of pwmchip_parent() macro
  pwm: atmel-tcb: Make use of pwmchip_parent() macro
  pwm: bcm-kona: Make use of pwmchip_parent() macro
  pwm: crc: Make use of pwmchip_parent() macro
  pwm: cros-ec: Make use of pwmchip_parent() macro
  pwm: dwc: Make use of pwmchip_parent() macro
  pwm: ep93xx: Make use of pwmchip_parent() macro
  pwm: fsl-ftm: Make use of pwmchip_parent() macro
  pwm: img: Make use of parent device pointer in driver data
  pwm: imx27: Make use of pwmchip_parent() macro
  pwm: jz4740: Make use of pwmchip_parent() macro
  pwm: lpc18xx-sct: Make use of parent device pointer in driver data
  pwm: lpss: Make use of pwmchip_parent() macro
  pwm: mediatek: Make use of pwmchip_parent() macro
  pwm: meson: Make use of pwmchip_parent() macro
  pwm: mtk-disp: Make use of pwmchip_parent() macro
  pwm: omap: Make use of pwmchip_parent() macro
  pwm: pca9685: Store parent device in driver data
  pwm: raspberrypi-poe: Make use of pwmchip_parent() macro
  pwm: rcar: Make use of pwmchip_parent() macro
  pwm: rz-mtu3: Make use of pwmchip_parent() macro
  pwm: samsung: Make use of pwmchip_parent() macro
  pwm: sifive: Make use of pwmchip_parent() macro
  pwm: stm32-lp: Make use of pwmchip_parent() macro
  pwm: stm32: Make use of pwmchip_parent() macro
  pwm: stmpe: Make use of pwmchip_parent() macro
  pwm: sun4i: Make use of pwmchip_parent() macro
  pwm: tiecap: Make use of pwmchip_parent() macro
  pwm: tiehrpwm: Make use of pwmchip_parent() macro
  pwm: twl-led: Make use of pwmchip_parent() macro
  pwm: twl: Make use of pwmchip_parent() macro
  pwm: vt8500: Make use of pwmchip_parent() macro
  drm/bridge: ti-sn65dsi86: Make use of pwmchip_parent() macro
  staging: greybus: pwm: Make use of pwmchip_parent() macro
  pwm: Provide wrappers for storing and getting driver private data
  pwm: Provide devm_pwmchip_alloc() function
  pwm: ab8500: Make use of devm_pwmchip_alloc() function
  pwm: apple: Make use of devm_pwmchip_alloc() function
  pwm: atmel-hlcdc: Make use of devm_pwmchip_alloc() function
  pwm: atmel: Make use of devm_pwmchip_alloc() function
  pwm: atmel-tcb: Make use of devm_pwmchip_alloc() function
  pwm: bcm2835: Make use of devm_pwmchip_alloc() function
  pwm: bcm-iproc: Make use of devm_pwmchip_alloc() function
  pwm: bcm-kona: Make use of devm_pwmchip_alloc() function
  pwm: berlin: Make use of devm_pwmchip_alloc() function
  pwm: brcmstb: Make use of devm_pwmchip_alloc() function
  pwm: clk: Make use of devm_pwmchip_alloc() function
  pwm: clps711x: Make use of devm_pwmchip_alloc() function
  pwm: crc: Make use of devm_pwmchip_alloc() function
  pwm: cros-ec: Make use of devm_pwmchip_alloc() function
  pwm: dwc: Make use of devm_pwmchip_alloc() function
  pwm: ep93xx: Make use of devm_pwmchip_alloc() function
  pwm: fsl-ftm: Make use of devm_pwmchip_alloc() function
  pwm: hibvt: Make use of devm_pwmchip_alloc() function
  pwm: img: Make use of devm_pwmchip_alloc() function
  pwm: imx1: Make use of devm_pwmchip_alloc() function
  pwm: imx27: Make use of devm_pwmchip_alloc() function
  pwm: imx-tpm: Make use of devm_pwmchip_alloc() function
  pwm: intel-lgm: Make use of devm_pwmchip_alloc() function
  pwm: iqs620a: Make use of devm_pwmchip_alloc() function
  pwm: jz4740: Make use of devm_pwmchip_alloc() function
  pwm: keembay: Make use of devm_pwmchip_alloc() function
  pwm: lp3943: Make use of devm_pwmchip_alloc() function
  pwm: lpc18xx-sct: Make use of devm_pwmchip_alloc() function
  pwm: lpc32xx: Make use of devm_pwmchip_alloc() function
  pwm: lpss-*: Make use of devm_pwmchip_alloc() function
  pwm: mediatek: Make use of devm_pwmchip_alloc() function
  pwm: meson: Make use of devm_pwmchip_alloc() function
  pwm: microchip-core: Make use of devm_pwmchip_alloc() function
  pwm: mtk-disp: Make use of devm_pwmchip_alloc() function
  pwm: mxs: Make use of devm_pwmchip_alloc() function
  pwm: ntxec: Make use of devm_pwmchip_alloc() function
  pwm: omap-dmtimer: Make use of devm_pwmchip_alloc() function
  pwm: pca9685: Make use of devm_pwmchip_alloc() function
  pwm: pxa: Make use of devm_pwmchip_alloc() function
  pwm: raspberrypi-poe: Make use of devm_pwmchip_alloc() function
  pwm: rcar: Make use of devm_pwmchip_alloc() function
  pwm: renesas-tpu: Make use of devm_pwmchip_alloc() function
  pwm: rockchip: Make use of devm_pwmchip_alloc() function
  pwm: rz-mtu3: Make use of devm_pwmchip_alloc() function
  pwm: samsung: Make use of devm_pwmchip_alloc() function
  pwm: sifive: Make use of devm_pwmchip_alloc() function
  pwm: sl28cpld: Make use of devm_pwmchip_alloc() function
  pwm: spear: Make use of devm_pwmchip_alloc() function
  pwm: sprd: Make use of devm_pwmchip_alloc() function
  pwm: sti: Make use of devm_pwmchip_alloc() function
  pwm: stm32-lp: Make use of devm_pwmchip_alloc() function
  pwm: stm32: Make use of devm_pwmchip_alloc() function
  pwm: stmpe: Make use of devm_pwmchip_alloc() function
  pwm: sun4i: Make use of devm_pwmchip_alloc() function
  pwm: sunplus: Make use of devm_pwmchip_alloc() function
  pwm: tegra: Make use of devm_pwmchip_alloc() function
  pwm: tiecap: Make use of devm_pwmchip_alloc() function
  pwm: twl-led: Make use of devm_pwmchip_alloc() function
  pwm: twl: Make use of devm_pwmchip_alloc() function
  pwm: visconti: Make use of devm_pwmchip_alloc() function
  pwm: vt8500: Make use of devm_pwmchip_alloc() function
  pwm: xilinx: Make use of devm_pwmchip_alloc() function
  gpio: mvebu: Make use of devm_pwmchip_alloc() function
  drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
  leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
  staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
  pwm: Ensure that pwm_chips are allocated using pwmchip_alloc()
  pwm: Ensure a struct pwm has the same lifetime as its pwm_chip
  pwm: Ensure the memory backing a PWM chip isn't freed while used
  pwm: Make pwmchip_[sg]et_drvdata() a wrapper around dev_set_drvdata()
  WIP: pwm: Add support for pwmchip devices for faster and easier
    userspace access

 .../driver-api/driver-model/devres.rst        |   1 +
 Documentation/driver-api/pwm.rst              |  10 +-
 drivers/gpio/gpio-mvebu.c                     |  18 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  31 +-
 drivers/leds/rgb/leds-qcom-lpg.c              |  16 +-
 drivers/pwm/Kconfig                           |   4 -
 drivers/pwm/Makefile                          |   3 +-
 drivers/pwm/core.c                            | 958 ++++++++++++------
 drivers/pwm/pwm-ab8500.c                      |  36 +-
 drivers/pwm/pwm-apple.c                       |  18 +-
 drivers/pwm/pwm-atmel-hlcdc.c                 |  35 +-
 drivers/pwm/pwm-atmel-tcb.c                   |  26 +-
 drivers/pwm/pwm-atmel.c                       |  37 +-
 drivers/pwm/pwm-bcm-iproc.c                   |  19 +-
 drivers/pwm/pwm-bcm-kona.c                    |  21 +-
 drivers/pwm/pwm-bcm2835.c                     |  19 +-
 drivers/pwm/pwm-berlin.c                      |  29 +-
 drivers/pwm/pwm-brcmstb.c                     |  17 +-
 drivers/pwm/pwm-clk.c                         |  27 +-
 drivers/pwm/pwm-clps711x.c                    |  17 +-
 drivers/pwm/pwm-crc.c                         |  22 +-
 drivers/pwm/pwm-cros-ec.c                     |  58 +-
 drivers/pwm/pwm-dwc-core.c                    |  25 +-
 drivers/pwm/pwm-dwc.c                         |  18 +-
 drivers/pwm/pwm-dwc.h                         |   9 +-
 drivers/pwm/pwm-ep93xx.c                      |  21 +-
 drivers/pwm/pwm-fsl-ftm.c                     |  48 +-
 drivers/pwm/pwm-hibvt.c                       |  25 +-
 drivers/pwm/pwm-img.c                         |  51 +-
 drivers/pwm/pwm-imx-tpm.c                     |  34 +-
 drivers/pwm/pwm-imx1.c                        |  20 +-
 drivers/pwm/pwm-imx27.c                       |  26 +-
 drivers/pwm/pwm-intel-lgm.c                   |  17 +-
 drivers/pwm/pwm-iqs620a.c                     |  37 +-
 drivers/pwm/pwm-jz4740.c                      |  36 +-
 drivers/pwm/pwm-keembay.c                     |  17 +-
 drivers/pwm/pwm-lp3943.c                      |  17 +-
 drivers/pwm/pwm-lpc18xx-sct.c                 |  35 +-
 drivers/pwm/pwm-lpc32xx.c                     |  21 +-
 drivers/pwm/pwm-lpss-pci.c                    |  10 +-
 drivers/pwm/pwm-lpss-platform.c               |  10 +-
 drivers/pwm/pwm-lpss.c                        |  34 +-
 drivers/pwm/pwm-lpss.h                        |   1 -
 drivers/pwm/pwm-mediatek.c                    |  29 +-
 drivers/pwm/pwm-meson.c                       |  57 +-
 drivers/pwm/pwm-microchip-core.c              |  17 +-
 drivers/pwm/pwm-mtk-disp.c                    |  25 +-
 drivers/pwm/pwm-mxs.c                         |  32 +-
 drivers/pwm/pwm-ntxec.c                       |  30 +-
 drivers/pwm/pwm-omap-dmtimer.c                |  47 +-
 drivers/pwm/pwm-pca9685.c                     |  98 +-
 drivers/pwm/pwm-pxa.c                         |  19 +-
 drivers/pwm/pwm-raspberrypi-poe.c             |  20 +-
 drivers/pwm/pwm-rcar.c                        |  25 +-
 drivers/pwm/pwm-renesas-tpu.c                 |  18 +-
 drivers/pwm/pwm-rockchip.c                    |  24 +-
 drivers/pwm/pwm-rz-mtu3.c                     |  39 +-
 drivers/pwm/pwm-samsung.c                     |  57 +-
 drivers/pwm/pwm-sifive.c                      |  30 +-
 drivers/pwm/pwm-sl28cpld.c                    |  13 +-
 drivers/pwm/pwm-spear.c                       |  18 +-
 drivers/pwm/pwm-sprd.c                        |  50 +-
 drivers/pwm/pwm-sti.c                         |  34 +-
 drivers/pwm/pwm-stm32-lp.c                    |  29 +-
 drivers/pwm/pwm-stm32.c                       |  53 +-
 drivers/pwm/pwm-stmpe.c                       |  58 +-
 drivers/pwm/pwm-sun4i.c                       |  38 +-
 drivers/pwm/pwm-sunplus.c                     |  17 +-
 drivers/pwm/pwm-tegra.c                       |  27 +-
 drivers/pwm/pwm-tiecap.c                      |  55 +-
 drivers/pwm/pwm-tiehrpwm.c                    |  72 +-
 drivers/pwm/pwm-twl-led.c                     |  58 +-
 drivers/pwm/pwm-twl.c                         |  50 +-
 drivers/pwm/pwm-visconti.c                    |  17 +-
 drivers/pwm/pwm-vt8500.c                      |  41 +-
 drivers/pwm/pwm-xilinx.c                      |  34 +-
 drivers/pwm/sysfs.c                           |  64 +-
 drivers/staging/greybus/pwm.c                 | 130 +--
 include/linux/platform_data/x86/pwm-lpss.h    |   4 +-
 include/linux/pwm.h                           |  39 +-
 include/uapi/linux/pwm.h                      |  23 +
 81 files changed, 1870 insertions(+), 1555 deletions(-)
 create mode 100644 include/uapi/linux/pwm.h


base-commit: 6530623212338fc0902e211ea624e790aacb00ef
-- 
2.43.0

