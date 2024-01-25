Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D290E83C246
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 13:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D6D10F056;
	Thu, 25 Jan 2024 12:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210B10EE7A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:14:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZH-00048C-Nh; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZD-002HR8-To; Thu, 25 Jan 2024 13:10:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZD-007n0k-2K;
 Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
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
 Michal Simek <michal.simek@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 039/111] pwm: Provide wrappers for storing and getting
 driver private data
Date: Thu, 25 Jan 2024 13:09:01 +0100
Message-ID: <1c873808bfc93ab51f49be799334dee6e8ab398a.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=xFZHrY/7C9PRNt99L0vl8g6j3yX1l4H0eIirFXKiC6s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9naZ43cfZqRmm0PAwRVRHazfdHqUBSCmiRl
 7SkEynbJGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPZwAKCRCPgPtYfRL+
 TqyWB/0Xq9H2qxz5a4NBliO3W2OBOYrNCAIPS+YFIK+/psR+8hFCNvRcL8LkTcvrGhz+wH1p+Pb
 F64/cTSgbYddbvZjoDx1kSNtuKvpvYsZy3B/swnxRBzzhjM4qRl0nLRqI7tuxKsMoJ6KChrenmP
 ZHuoEbNaT3Jq0uJ3jCQX+OWAPfMUgSkbUr5A7m+b7JrBvE1+EcTZ0ltF9cqru7Gex1/GIk5STLR
 s4XqyNlr+QqQS2lKFYFTNPQKFohdM4YpL+GcQjYEZZG2zihg6J+r6Mx1mefplrODntBtd+WIXCL
 uGNCMjCbN1xcJ1N2Xx2QisJNxxGcBaZCqQD7Iqx5HLe1eACQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
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
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are useful to store and query driver private data a
After struct pwm_chip got its own struct device, this can make use of
dev_get_drvdata() and dev_set_drvdata() on that device.  These functions
are required already now to convert drivers to pwmchip_alloc() which
must happen before changing pwm_chip::dev.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/pwm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index d7966918f301..2c49d2fe2fe7 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -272,6 +272,7 @@ struct pwm_ops {
  * @npwm: number of PWMs controlled by this chip
  * @of_xlate: request a PWM device given a device tree PWM specifier
  * @atomic: can the driver's ->apply() be called in atomic context
+ * @driver_data: Private pointer for driver specific info
  * @pwms: array of PWM devices allocated by the framework
  */
 struct pwm_chip {
@@ -286,6 +287,7 @@ struct pwm_chip {
 	bool atomic;
 
 	/* only used internally by the PWM framework */
+	void *driver_data;
 	struct pwm_device *pwms;
 };
 
@@ -294,6 +296,24 @@ static inline struct device *pwmchip_parent(struct pwm_chip *chip)
 	return chip->dev;
 }
 
+static inline void *pwmchip_get_drvdata(struct pwm_chip *chip)
+{
+	/*
+	 * After pwm_chip got a dedicated struct device, this can be replaced by
+	 * dev_get_drvdata(&chip->dev);
+	 */
+	return chip->driver_data;
+}
+
+static inline void pwmchip_set_drvdata(struct pwm_chip *chip, void *data)
+{
+	/*
+	 * After pwm_chip got a dedicated struct device, this can be replaced by
+	 * dev_set_drvdata(&chip->dev, data);
+	 */
+	chip->driver_data = data;
+}
+
 #if IS_ENABLED(CONFIG_PWM)
 /* PWM user APIs */
 int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state);
-- 
2.43.0

