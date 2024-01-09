Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDEE828EF4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 22:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4217510E505;
	Tue,  9 Jan 2024 21:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F8210E500
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 21:35:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rNJkD-0006cp-6D; Tue, 09 Jan 2024 22:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rNJkB-001Z2C-GH; Tue, 09 Jan 2024 22:34:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rNJkB-00667w-1H;
 Tue, 09 Jan 2024 22:34:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/5] pwm: Drop useless member .of_pwm_n_cells of struct
 pwm_chip
Date: Tue,  9 Jan 2024 22:34:32 +0100
Message-ID: <53d8c545aa8f79a920358be9e72e382b3981bdc4.1704835845.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
References: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5203;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=GJ0QtTqjWHKutYbvp2zQTs/Phsuql2QUxQ8yJz35gAI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlnbvrhTT7y69ES64JrD+RrccwPuJTtkKJygiSm
 Ib3qp9QMJ6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZZ276wAKCRCPgPtYfRL+
 Tr3HCACFpOQpAlmiIB6gDwhfqub+Og4pnYAbOzF4PJ2YCxccK/gZciaqUudnsp5w0RRaOeU+ff+
 WeBIldrVZ5lRQocQKX9qtV835zLJb9JXBRrFQuf0EWgQuBVUE5Rg6o2Gi5JYgAZeNsQMdv9krS5
 kD6J/hQe11lAcHqtTkNrsJo8VQUZlaAwkvym+M7C5Etu3wL0f1HljxFTk3fOX2rrv74rIQuSDe2
 5q56LeQ2/n2c/5mdHh83xUYTyCQ90yaJuVCpyRuppNBUoEWVahX95fVi11/MqIohHSLQKXd69O+
 L89MtSMdfG0C/ghykbapH2IcDu+wlwjhgJ8fW+Jq7BL4p3rF
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alexander Shiyan <shc_work@mail.ru>,
 Jonas Karlman <jonas@kwiboo.se>, Benson Leung <bleung@chromium.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, chrome-platform@lists.linux.dev,
 linux-pwm@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apart from the two of_xlate implementations this member is write-only.
In the of_xlate functions of_pwm_xlate_with_flags() and
of_pwm_single_xlate() it's more sensible to check for args->args_count
because this is what is actually used in the device tree.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
 drivers/pwm/core.c                    | 22 +++-------------------
 drivers/pwm/pwm-clps711x.c            |  1 -
 drivers/pwm/pwm-cros-ec.c             |  1 -
 drivers/pwm/pwm-pxa.c                 |  4 +---
 include/linux/pwm.h                   |  2 --
 6 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c45c07840f64..02d9449956e5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1591,7 +1591,6 @@ static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 	pdata->pchip.ops = &ti_sn_pwm_ops;
 	pdata->pchip.npwm = 1;
 	pdata->pchip.of_xlate = of_pwm_single_xlate;
-	pdata->pchip.of_pwm_n_cells = 1;
 
 	return pwmchip_add(&pdata->pchip);
 }
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index f2728ee787d7..31f210872a07 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -107,9 +107,6 @@ of_pwm_xlate_with_flags(struct pwm_chip *chip, const struct of_phandle_args *arg
 {
 	struct pwm_device *pwm;
 
-	if (chip->of_pwm_n_cells < 2)
-		return ERR_PTR(-EINVAL);
-
 	/* flags in the third cell are optional */
 	if (args->args_count < 2)
 		return ERR_PTR(-EINVAL);
@@ -124,10 +121,8 @@ of_pwm_xlate_with_flags(struct pwm_chip *chip, const struct of_phandle_args *arg
 	pwm->args.period = args->args[1];
 	pwm->args.polarity = PWM_POLARITY_NORMAL;
 
-	if (chip->of_pwm_n_cells >= 3) {
-		if (args->args_count > 2 && args->args[2] & PWM_POLARITY_INVERTED)
-			pwm->args.polarity = PWM_POLARITY_INVERSED;
-	}
+	if (args->args_count > 2 && args->args[2] & PWM_POLARITY_INVERTED)
+		pwm->args.polarity = PWM_POLARITY_INVERSED;
 
 	return pwm;
 }
@@ -138,9 +133,6 @@ of_pwm_single_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
 {
 	struct pwm_device *pwm;
 
-	if (chip->of_pwm_n_cells < 1)
-		return ERR_PTR(-EINVAL);
-
 	/* validate that one cell is specified, optionally with flags */
 	if (args->args_count != 1 && args->args_count != 2)
 		return ERR_PTR(-EINVAL);
@@ -164,16 +156,8 @@ static void of_pwmchip_add(struct pwm_chip *chip)
 	if (!chip->dev || !chip->dev->of_node)
 		return;
 
-	if (!chip->of_xlate) {
-		u32 pwm_cells;
-
-		if (of_property_read_u32(chip->dev->of_node, "#pwm-cells",
-					 &pwm_cells))
-			pwm_cells = 2;
-
+	if (!chip->of_xlate)
 		chip->of_xlate = of_pwm_xlate_with_flags;
-		chip->of_pwm_n_cells = pwm_cells;
-	}
 
 	of_node_get(chip->dev->of_node);
 }
diff --git a/drivers/pwm/pwm-clps711x.c b/drivers/pwm/pwm-clps711x.c
index 42179b3f7ec3..06562d4bb963 100644
--- a/drivers/pwm/pwm-clps711x.c
+++ b/drivers/pwm/pwm-clps711x.c
@@ -103,7 +103,6 @@ static int clps711x_pwm_probe(struct platform_device *pdev)
 	priv->chip.dev = &pdev->dev;
 	priv->chip.npwm = 2;
 	priv->chip.of_xlate = clps711x_pwm_xlate;
-	priv->chip.of_pwm_n_cells = 1;
 
 	spin_lock_init(&priv->lock);
 
diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 5fe303b8656d..339cedf3a7b1 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -279,7 +279,6 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
 	chip->dev = dev;
 	chip->ops = &cros_ec_pwm_ops;
 	chip->of_xlate = cros_ec_pwm_xlate;
-	chip->of_pwm_n_cells = 1;
 
 	if (ec_pwm->use_pwm_type) {
 		chip->npwm = CROS_EC_PWM_DT_COUNT;
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 76685f926c75..61b74fa1d348 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -180,10 +180,8 @@ static int pwm_probe(struct platform_device *pdev)
 	pc->chip.ops = &pxa_pwm_ops;
 	pc->chip.npwm = (id->driver_data & HAS_SECONDARY_PWM) ? 2 : 1;
 
-	if (IS_ENABLED(CONFIG_OF)) {
+	if (IS_ENABLED(CONFIG_OF))
 		pc->chip.of_xlate = of_pwm_single_xlate;
-		pc->chip.of_pwm_n_cells = 1;
-	}
 
 	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio_base))
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index fcc2c4496f73..8ffe9ae7a23a 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -271,7 +271,6 @@ struct pwm_ops {
  * @id: unique number of this PWM chip
  * @npwm: number of PWMs controlled by this chip
  * @of_xlate: request a PWM device given a device tree PWM specifier
- * @of_pwm_n_cells: number of cells expected in the device tree PWM specifier
  * @atomic: can the driver's ->apply() be called in atomic context
  * @pwms: array of PWM devices allocated by the framework
  */
@@ -284,7 +283,6 @@ struct pwm_chip {
 
 	struct pwm_device * (*of_xlate)(struct pwm_chip *chip,
 					const struct of_phandle_args *args);
-	unsigned int of_pwm_n_cells;
 	bool atomic;
 
 	/* only used internally by the PWM framework */
-- 
2.43.0

