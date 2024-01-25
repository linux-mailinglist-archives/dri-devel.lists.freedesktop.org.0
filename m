Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34183C4A0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 15:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90C10F160;
	Thu, 25 Jan 2024 14:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA9C10F0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:14:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZH-00049s-NK; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZE-002HRD-5b; Thu, 25 Jan 2024 13:10:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZD-007n0n-33;
 Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>,
 linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
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
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Subject: [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc() function
Date: Thu, 25 Jan 2024 13:09:02 +0100
Message-ID: <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Y70kt1S+wDMGZ2Y6dT7JBGkOh38DPB/mz0c9lW1w+go=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9o1J7Qn6pSUgc2O5FQOVH47M2tNWcGfyzpg
 KqN39khZuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPaAAKCRCPgPtYfRL+
 Tl7sCACDg65PvULF2T57x8s2GOVh8qHAOM4G2fEdFZQeFhZiTply5wW+kG5bIM1JAdU3cAiM96g
 uzfqnkdy2Mt6/lWu6ZhjqOk/xYUO80eOZ5e8cyRhQLGb4VsogRhDSOKSAf4k0fkzTYCdCM3jfwP
 QGXt5GRUeYGJVhDmUC7m1wai9vWlfWG8IXkVbSYnX3LqEAl0A40uaffDMUtp2bFtgHNqtqbGhx6
 bM/vJXjzuqiGa8jiFMTuJ50PRpeh9o/6cre0EhT+nv5GQHpRaGSKnNf/E7Q0CK0tiRGYs7M9t6g
 2w/lsv8+vxgUQ7yjIC7YwrqDMXW1+x7YTS/xwh76REfV7L9/
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
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

This function allocates a struct pwm_chip and driver data. Compared to
the status quo the split into pwm_chip and driver data is new, otherwise
it doesn't change anything relevant (yet).

The intention is that after all drivers are switched to use this
allocation function, its possible to add a struct device to struct
pwm_chip to properly track the latter's lifetime without touching all
drivers again. Proper lifetime tracking is a necessary precondition to
introduce character device support for PWMs (that implements atomic
setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
userspace support).

The new function pwmchip_priv() (obviously?) only works for chips
allocated with devm_pwmchip_alloc().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 Documentation/driver-api/pwm.rst              | 10 ++++----
 drivers/pwm/core.c                            | 25 +++++++++++++++++++
 include/linux/pwm.h                           |  2 ++
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index c5f99d834ec5..e4df72c408d2 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -420,6 +420,7 @@ POWER
   devm_reboot_mode_unregister()
 
 PWM
+  devm_pwmchip_alloc()
   devm_pwmchip_add()
   devm_pwm_get()
   devm_fwnode_pwm_get()
diff --git a/Documentation/driver-api/pwm.rst b/Documentation/driver-api/pwm.rst
index 3c28ccc4b611..cee66c7f0335 100644
--- a/Documentation/driver-api/pwm.rst
+++ b/Documentation/driver-api/pwm.rst
@@ -143,11 +143,11 @@ to implement the pwm_*() functions itself. This means that it's impossible
 to have multiple PWM drivers in the system. For this reason it's mandatory
 for new drivers to use the generic PWM framework.
 
-A new PWM controller/chip can be added using pwmchip_add() and removed
-again with pwmchip_remove(). pwmchip_add() takes a filled in struct
-pwm_chip as argument which provides a description of the PWM chip, the
-number of PWM devices provided by the chip and the chip-specific
-implementation of the supported PWM operations to the framework.
+A new PWM controller/chip can be allocated using devm_pwmchip_alloc, then added
+using pwmchip_add() and removed again with pwmchip_remove(). pwmchip_add()
+takes a filled in struct pwm_chip as argument which provides a description of
+the PWM chip, the number of PWM devices provided by the chip and the
+chip-specific implementation of the supported PWM operations to the framework.
 
 When implementing polarity support in a PWM driver, make sure to respect the
 signal conventions in the PWM framework. By definition, normal polarity
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 1b4c3d0caa82..b821a2b0b172 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -454,6 +454,31 @@ of_pwm_single_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
 }
 EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
 
+static void *pwmchip_priv(struct pwm_chip *chip)
+{
+	return (void *)chip + sizeof(*chip);
+}
+
+struct pwm_chip *devm_pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv)
+{
+	struct pwm_chip *chip;
+	size_t alloc_size;
+
+	alloc_size = size_add(sizeof(*chip), sizeof_priv);
+
+	chip = devm_kzalloc(parent, alloc_size, GFP_KERNEL);
+	if (!chip)
+		return ERR_PTR(-ENOMEM);
+
+	chip->dev = parent;
+	chip->npwm = npwm;
+
+	pwmchip_set_drvdata(chip, pwmchip_priv(chip));
+
+	return chip;
+}
+EXPORT_SYMBOL_GPL(devm_pwmchip_alloc);
+
 static void of_pwmchip_add(struct pwm_chip *chip)
 {
 	if (!chip->dev || !chip->dev->of_node)
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 2c49d2fe2fe7..8bc7504aa7d4 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -403,6 +403,8 @@ static inline bool pwm_might_sleep(struct pwm_device *pwm)
 int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
 		unsigned long timeout);
 
+struct pwm_chip *devm_pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv);
+
 int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
 #define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
 void pwmchip_remove(struct pwm_chip *chip);
-- 
2.43.0

