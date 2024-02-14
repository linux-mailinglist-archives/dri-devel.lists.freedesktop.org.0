Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0336854649
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFFF10E238;
	Wed, 14 Feb 2024 09:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCC510E702
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 09:35:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBeq-0004Mq-MG; Wed, 14 Feb 2024 10:34:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBej-000f6N-Rr; Wed, 14 Feb 2024 10:34:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBej-004XzU-27;
 Wed, 14 Feb 2024 10:34:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 James Clark <james.clark@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-doc@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-rpi-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
Date: Wed, 14 Feb 2024 10:30:47 +0100
Message-ID: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=18154;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=CNGsevl9ChWzSniQBjaArvHLd39E05H62NLiz3DIWx8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIhKJRx+A4qhMZUwqGztxruImTZ3uBdvqjamF
 FBPi1WKtnWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyISgAKCRCPgPtYfRL+
 TtlEB/0c/mjNEQL/08ZIteWRqppCG3//b5DlLDDtir/+ZOvPpIS2Bneq0yyKtwxVhnGfqLvcmKE
 vd7H2ucRljiA4C+JGLWtGhG0FC7e4QZVz7YhgUyerZIrr2zlx/GbWDZcJhFbMsqwc/tAKwTXoib
 IohkAa+CaOcYrsexxoNcZmTMFpHSySI2vH7MTmGmw0Vu+05nvPZvpA795ukWgC5jRaTsMunS4uE
 vEbhrf/xiYxq40U8/MdZkeOvNOVcGmEkXOmlgwc6+XIvzBnWQMgcP7ruq2ByKqWoqpPyA6MKqjY
 irweyasxqBWPP2d3ruiBIJFSin314rvzQC6yVjE9jFnOxdLo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 14 Feb 2024 09:41:04 +0000
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

Hello,

this is v6 of the series introducing better lifetime tracking for
pwmchips that addresses (for now theoretic) lifetime issues of pwm
chips. Addressing these is a necessary precondition to introduce chardev
support for PWMs.

Locking got more complicated due to non-sleeping chips, so I dropped
the character device patch because it got still more incomplete now.
Also I'm not yet entirely sure about patches #162 and #163 and I expect
them to change before they can go in. My plan for the next merge window
is to get the patches in up to #160. After that the addition of chardev
support (including correct locking) can continue without having to touch
the lowlevel driver. So the idea of this series is to get the driver
adaptions out of the way as this requires some cross-tree coordination.

The patches that touch files outside of drivers/pwm include:

 - gpio: mvebu: Make use of devm_pwmchip_alloc() function
   It already has an Ack by Linus Walleij.

 - drm/bridge: ti-sn65dsi86: Make use of pwmchip_parent() accessor
 - drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
   The 2nd already has an Ack by Douglas Anderson which I tend to assume
   good enough to merge this via my pwm tree, too. An Ack for the first
   patch would be nice.

 - leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
   Already has an Ack by Lee Jones.

 - staging: greybus: pwm: Change prototype of helpers to prepare further changes
 - staging: greybus: pwm: Make use of pwmchip_parent() accessor
 - staging: greybus: pwm: Rely on pwm framework to pass a valid hwpwm
 - staging: greybus: pwm: Drop unused gb_connection_set_data()
 - staging: greybus: pwm: Rework how the number of PWM lines is determined
 - staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
   The greybus patches already got an Ack by Greg Kroah-Hartman in an
   earlier series, but I dropped it as the patches changed considerably.

For the patches that already have an Ack by the respective maintainers
I'll assume this is good enough to merge the patches via the pwm tree.
Please object if you don't agree.  For the others an Ack with that
semantic would be nice. If you want to merge via your tree, that would
need some coordination. The adaptions depend on patches #1 - #3, so this
would involve an immutable branch or waiting until these patches reached
your tree via the mainline tree. The series rebases fine on today's
next, so at least for now there are no conflicts that git cannot resolve
automatically.

The biggest changes compared to v5 are:

 - Make pwmchip_parent's parameter const
 - Use pwmchip_parent also in drivers/pwm/sysfs.c and drivers/pwm/core.c
 - Several bug fixes in the conversions I found during the rework
 - Provide a non-devm pwmchip_alloc() function earlier (for the greybus
   pwm driver)
 - Increase alignment of driver private data to ARCH_DMA_MINALIGN bytes
 - Split several patches to make the easier reviewable

The series is available via git at

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking

if you want to give it a test. I'll keep this branch updated for the
feedback I get here.

Best regards
Uwe

Uwe Kleine-König (164):
  pwm: Provide an inline function to get the parent device of a given
    chip
  pwm: Provide wrappers for storing and getting driver private data
  pwm: Provide pwmchip_alloc() function and a devm variant of it
  pwm: ab8500: Make use of pwmchip_parent() accessor
  pwm: ab8500: Introduce a local pwm_chip variable in .probe()
  pwm: ab8500: Make use of devm_pwmchip_alloc() function
  pwm: apple: Make use of devm_pwmchip_alloc() function
  pwm: atmel: Change prototype of a helper to prepare further changes
  pwm: atmel: Make use of pwmchip_parent() accessor
  pwm: atmel: Make use of devm_pwmchip_alloc() function
  pwm: atmel-hlcdc: Prepare removing pwm_chip from driver data
  pwm: atmel-hlcdc: Make use of devm_pwmchip_alloc() function
  pwm: atmel-tcb: Make use of pwmchip_parent() accessor
  pwm: atmel-tcb: Prepare removing pwm_chip from driver data
  pwm: atmel-tcb: Make use of devm_pwmchip_alloc() function
  pwm: bcm2835: Make use of devm_pwmchip_alloc() function
  pwm: bcm-iproc: Make use of devm_pwmchip_alloc() function
  pwm: bcm-kona: Make use of pwmchip_parent() accessor
  pwm: bcm-kona: Make use of devm_pwmchip_alloc() function
  pwm: berlin: Prepare removing pwm_chip from driver data
  pwm: berlin: Make use of devm_pwmchip_alloc() function
  pwm: brcmstb: Make use of devm_pwmchip_alloc() function
  pwm: clk: Prepare removing pwm_chip from driver data
  pwm: clk: Make use of devm_pwmchip_alloc() function
  pwm: clps711x: Make use of devm_pwmchip_alloc() function
  pwm: crc: Simplify code to determine the pwmchip's parent device
  pwm: crc: Make use of pwmchip_parent() accessor
  pwm: crc: Make use of devm_pwmchip_alloc() function
  pwm: cros-ec: Change prototype of helpers to prepare further changes
  pwm: cros-ec: Make use of pwmchip_parent() accessor
  pwm: cros-ec: Make use of devm_pwmchip_alloc() function
  pwm: dwc: Prepare removing pwm_chip from driver data
  pwm: dwc: Make use of devm_pwmchip_alloc() function
  pwm: dwc-core: Make use of pwmchip_parent() accessor
  pwm: ep93xx: Make use of pwmchip_parent() accessor
  pwm: ep93xx: Make use of devm_pwmchip_alloc() function
  pwm: fsl-ftm: Change prototype of a helper to prepare further changes
  pwm: fsl-ftm: Make use of pwmchip_parent() accessor
  pwm: fsl-ftm: Prepare removing pwm_chip from driver data
  pwm: fsl-ftm: Make use of devm_pwmchip_alloc() function
  pwm: hibvt: Consistently name driver data hi_pwm_chip
  pwm: hibvt: Make use of devm_pwmchip_alloc() function
  pwm: img: Drop write-only variable from driver private data
  pwm: img: Make use of pwmchip_parent() accessor
  pwm: img: Prepare removing pwm_chip from driver data
  pwm: img: Make use of devm_pwmchip_alloc() function
  pwm: imx1: Make use of devm_pwmchip_alloc() function
  pwm: imx27: Make use of pwmchip_parent() accessor
  pwm: imx27: Make use of devm_pwmchip_alloc() function
  pwm: imx-tpm: Make use of devm_pwmchip_alloc() function
  pwm: intel-lgm: Make use of devm_pwmchip_alloc() function
  pwm: iqs620a: Create a wrapper for converting a pwm_chip to driver
    data
  pwm: iqs620a: Prepare removing pwm_chip from driver data
  pwm: iqs620a: Make use of devm_pwmchip_alloc() function
  pwm: jz4740: Change prototype of a helper to prepare further changes
  pwm: jz4740: Make use of pwmchip_parent() accessor
  pwm: jz4740: Make use of devm_pwmchip_alloc() function
  pwm: keembay: Make use of devm_pwmchip_alloc() function
  pwm: lp3943: Make use of devm_pwmchip_alloc() function
  pwm: lpc18xx-sct: Drop hardly used member from driver private data
  pwm: lpc18xx-sct: Make use of pwmchip_parent() accessor
  pwm: lpc18xx-sct: Prepare removing pwm_chip from driver data
  pwm: lpc18xx-sct: Make use of devm_pwmchip_alloc() function
  pwm: lpc32xx: Make use of devm_pwmchip_alloc() function
  pwm: lpss: Make use of pwmchip_parent() accessor
  pwm: lpss: Don't set driver data
  pwm: lpss-*: Make use of devm_pwmchip_alloc() function
  pwm: mediatek: Make use of pwmchip_parent() accessor
  pwm: mediatek: Make use of devm_pwmchip_alloc() function
  pwm: meson: Change prototype of a few helpers to prepare further
    changes
  pwm: meson: Make use of pwmchip_parent() accessor
  pwm: meson: Make use of devm_pwmchip_alloc() function
  pwm: microchip-core: Make use of devm_pwmchip_alloc() function
  pwm: mtk-disp: Make use of pwmchip_parent() accessor
  pwm: mtk-disp: Make use of devm_pwmchip_alloc() function
  pwm: mxs: Make use of devm_pwmchip_alloc() function
  pwm: ntxec: Make use of devm_pwmchip_alloc() function
  pwm: omap-dmtimer: Make use of pwmchip_parent() accessor
  pwm: omap-dmtimer: Prepare removing pwm_chip from driver data
  pwm: omap-dmtimer: Make use of devm_pwmchip_alloc() function
  pwm: pca9685: Prepare removing pwm_chip from driver data
  pwm: pca9685: Make use of pwmchip_parent() accessor
  pwm: pca9685: Make use of devm_pwmchip_alloc() function
  pwm: pxa: Make use of devm_pwmchip_alloc() function
  pwm: raspberrypi-poe: Make use of pwmchip_parent() accessor
  pwm: raspberrypi-poe: Make use of devm_pwmchip_alloc() function
  pwm: rcar: Make use of pwmchip_parent() accessor
  pwm: rcar: Prepare removing pwm_chip from driver data
  pwm: rcar: Make use of devm_pwmchip_alloc() function
  pwm: renesas-tpu: Make use of devm_pwmchip_alloc() function
  pwm: rochchip: Prepare removing pwm_chip from driver data
  pwm: rockchip: Make use of devm_pwmchip_alloc() function
  pwm: rz-mtu3: Make use of pwmchip_parent() accessor
  pwm: rz-mtu3: Prepare removing pwm_chip from driver data
  pwm: rz-mtu3: Make use of devm_pwmchip_alloc() function
  pwm: samsung: Simplify code to determine the pwmchip's parent device
  pwm: samsung: Change prototype of helpers to prepare further changes
  pwm: samsung: Make use of pwmchip_parent() accessor
  pwm: samsung: Simplify by using devm functions in probe
  pwm: samsung: Simplify using dev_err_probe()
  pwm: samsung: Make use of devm_pwmchip_alloc() function
  pwm: sifive: Simplify code to determine the pwmchip's parent device
  pwm: sifive: Prepare removing pwm_chip from driver data
  pwm: sifive: Make use of pwmchip_parent() accessor
  pwm: sifive: Make use of devm_pwmchip_alloc() function
  pwm: sl28cpld: Make use of devm_pwmchip_alloc() function
  pwm: spear: Make use of devm_pwmchip_alloc() function
  pwm: sprd: Rework how the available channels are counted
  pwm: sprd: Drop duplicated tracking of the parent device
  pwm: sprd: Make use of devm_pwmchip_alloc() function
  pwm: sti: Prepare removing pwm_chip from driver data
  pwm: sti: Make use of devm_pwmchip_alloc() function
  pwm: stm32: Simplify code to determine the pwmchip's parent device
  pwm: stm32: Change prototype of a helper to prepare further changes
  pwm: stm32: Prepare removing pwm_chip from driver data
  pwm: stm32: Change prototype of helper that detects npwm to prepare
    further changes
  pwm: stm32: Make use of devm_pwmchip_alloc() function
  pwm: stm32-lp: Simplify code to determine the pwmchip's parent device
  pwm: stm32-lp: Prepare removing pwm_chip from driver data
  pwm: stm32-lp: Make use of pwmchip_parent() accessor
  pwm: stm32-lp: Make use of devm_pwmchip_alloc() function
  pwm: stmpe: Make use of pwmchip_parent() accessor
  pwm: stmpe: Make use of devm_pwmchip_alloc() function
  pwm: sun4i: Make use of pwmchip_parent() accessor
  pwm: sun4i: Prepare removing pwm_chip from driver data
  pwm: sun4i: Consistently name driver data sun4ichip
  pwm: sun4i: Make use of devm_pwmchip_alloc() function
  pwm: sunplus: Make use of devm_pwmchip_alloc() function
  pwm: tegra: Drop duplicated tracking of the parent device
  pwm: tegra: Prepare removing pwm_chip from driver data
  pwm: tegra: Make use of devm_pwmchip_alloc() function
  pwm: tiecap: Simplify code to determine the pwmchip's parent device
  pwm: tiecap: Change prototype of helpers to prepare further changes
  pwm: tiecap: Make use of pwmchip_parent() accessor
  pwm: tiecap: Make use of devm_pwmchip_alloc() function
  pwm: tiehrpwm: Simplify code to determine the pwmchip's parent device
  pwm: tiehrpwm: Change prototype of helpers to prepare further changes
  pwm: tiehrpwm: Make use of pwmchip_parent() accessor
  pwm: tiehrpwm: Make use of devm_pwmchip_alloc() function
  pwm: twl: Make use of pwmchip_parent() accessor
  pwm: twl: Make use of devm_pwmchip_alloc() function
  pwm: twl-led: Make use of pwmchip_parent() accessor
  pwm: twl-led: Make use of devm_pwmchip_alloc() function
  pwm: visconti: Make use of devm_pwmchip_alloc() function
  pwm: vt8500: Change prototype of a helper to prepare further changes
  pwm: vt8500: Introduce a local pwm_chip variable in .probe()
  pwm: vt8500: Make use of pwmchip_parent() accessor
  pwm: vt8500: Make use of devm_pwmchip_alloc() function
  pwm: xilinx: Prepare removing pwm_chip from driver data
  pwm: xilinx: Make use of devm_pwmchip_alloc() function
  gpio: mvebu: Make use of devm_pwmchip_alloc() function
  drm/bridge: ti-sn65dsi86: Make use of pwmchip_parent() accessor
  drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
  leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
  staging: greybus: pwm: Change prototype of helpers to prepare further
    changes
  staging: greybus: pwm: Make use of pwmchip_parent() accessor
  staging: greybus: pwm: Rely on pwm framework to pass a valid hwpwm
  staging: greybus: pwm: Drop unused gb_connection_set_data()
  staging: greybus: pwm: Rework how the number of PWM lines is
    determined
  staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
  pwm: Ensure that pwm_chips are allocated using pwmchip_alloc()
  pwm: Ensure a struct pwm has the same lifetime as its pwm_chip
  pwm: Ensure the memory backing a PWM chip isn't freed while used
  pwm: Make pwmchip_[sg]et_drvdata() a wrapper around dev_set_drvdata()

 .../driver-api/driver-model/devres.rst        |   1 +
 Documentation/driver-api/pwm.rst              |  11 +-
 drivers/gpio/gpio-mvebu.c                     |  18 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  31 +--
 drivers/leds/rgb/leds-qcom-lpg.c              |  16 +-
 drivers/pinctrl/intel/pinctrl-intel.c         |   6 +-
 drivers/pwm/Kconfig                           |   4 -
 drivers/pwm/Makefile                          |   3 +-
 drivers/pwm/core.c                            | 184 +++++++++++++-----
 drivers/pwm/pwm-ab8500.c                      |  36 ++--
 drivers/pwm/pwm-apple.c                       |  18 +-
 drivers/pwm/pwm-atmel-hlcdc.c                 |  37 ++--
 drivers/pwm/pwm-atmel-tcb.c                   |  32 +--
 drivers/pwm/pwm-atmel.c                       |  34 ++--
 drivers/pwm/pwm-bcm-iproc.c                   |  19 +-
 drivers/pwm/pwm-bcm-kona.c                    |  23 ++-
 drivers/pwm/pwm-bcm2835.c                     |  19 +-
 drivers/pwm/pwm-berlin.c                      |  29 +--
 drivers/pwm/pwm-brcmstb.c                     |  17 +-
 drivers/pwm/pwm-clk.c                         |  27 +--
 drivers/pwm/pwm-clps711x.c                    |  17 +-
 drivers/pwm/pwm-crc.c                         |  22 +--
 drivers/pwm/pwm-cros-ec.c                     |  58 +++---
 drivers/pwm/pwm-dwc-core.c                    |  26 +--
 drivers/pwm/pwm-dwc.c                         |  17 +-
 drivers/pwm/pwm-dwc.h                         |   9 +-
 drivers/pwm/pwm-ep93xx.c                      |  21 +-
 drivers/pwm/pwm-fsl-ftm.c                     |  49 ++---
 drivers/pwm/pwm-hibvt.c                       |  70 ++++---
 drivers/pwm/pwm-img.c                         |  60 +++---
 drivers/pwm/pwm-imx-tpm.c                     |  34 ++--
 drivers/pwm/pwm-imx1.c                        |  20 +-
 drivers/pwm/pwm-imx27.c                       |  26 +--
 drivers/pwm/pwm-intel-lgm.c                   |  17 +-
 drivers/pwm/pwm-iqs620a.c                     |  30 +--
 drivers/pwm/pwm-jz4740.c                      |  36 ++--
 drivers/pwm/pwm-keembay.c                     |  17 +-
 drivers/pwm/pwm-lp3943.c                      |  17 +-
 drivers/pwm/pwm-lpc18xx-sct.c                 |  34 ++--
 drivers/pwm/pwm-lpc32xx.c                     |  21 +-
 drivers/pwm/pwm-lpss-pci.c                    |  10 +-
 drivers/pwm/pwm-lpss-platform.c               |  10 +-
 drivers/pwm/pwm-lpss.c                        |  34 ++--
 drivers/pwm/pwm-lpss.h                        |   1 -
 drivers/pwm/pwm-mediatek.c                    |  29 +--
 drivers/pwm/pwm-meson.c                       |  57 +++---
 drivers/pwm/pwm-microchip-core.c              |  17 +-
 drivers/pwm/pwm-mtk-disp.c                    |  25 ++-
 drivers/pwm/pwm-mxs.c                         |  32 +--
 drivers/pwm/pwm-ntxec.c                       |  14 +-
 drivers/pwm/pwm-omap-dmtimer.c                |  47 +++--
 drivers/pwm/pwm-pca9685.c                     | 161 +++++++--------
 drivers/pwm/pwm-pxa.c                         |  21 +-
 drivers/pwm/pwm-raspberrypi-poe.c             |  20 +-
 drivers/pwm/pwm-rcar.c                        |  27 ++-
 drivers/pwm/pwm-renesas-tpu.c                 |  20 +-
 drivers/pwm/pwm-rockchip.c                    |  24 +--
 drivers/pwm/pwm-rz-mtu3.c                     |  60 +++---
 drivers/pwm/pwm-samsung.c                     |  94 ++++-----
 drivers/pwm/pwm-sifive.c                      |  30 +--
 drivers/pwm/pwm-sl28cpld.c                    |  13 +-
 drivers/pwm/pwm-spear.c                       |  18 +-
 drivers/pwm/pwm-sprd.c                        |  58 +++---
 drivers/pwm/pwm-sti.c                         |  61 +++---
 drivers/pwm/pwm-stm32-lp.c                    |  31 ++-
 drivers/pwm/pwm-stm32.c                       |  56 +++---
 drivers/pwm/pwm-stmpe.c                       |  58 +++---
 drivers/pwm/pwm-sun4i.c                       | 100 +++++-----
 drivers/pwm/pwm-sunplus.c                     |  17 +-
 drivers/pwm/pwm-tegra.c                       |  50 ++---
 drivers/pwm/pwm-tiecap.c                      |  55 +++---
 drivers/pwm/pwm-tiehrpwm.c                    |  72 +++----
 drivers/pwm/pwm-twl-led.c                     |  55 +++---
 drivers/pwm/pwm-twl.c                         |  50 +++--
 drivers/pwm/pwm-visconti.c                    |  17 +-
 drivers/pwm/pwm-vt8500.c                      |  43 ++--
 drivers/pwm/pwm-xilinx.c                      |  34 ++--
 drivers/pwm/sysfs.c                           |  45 +----
 drivers/staging/greybus/pwm.c                 | 133 ++++++-------
 include/linux/platform_data/x86/pwm-lpss.h    |   4 +-
 include/linux/pwm.h                           |  56 ++++--
 81 files changed, 1502 insertions(+), 1423 deletions(-)


base-commit: ab105bfee27776dd946f8003d1e895fbf7674a3f
-- 
2.43.0

