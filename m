Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554D891C1C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 14:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27990112723;
	Fri, 29 Mar 2024 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A68E112723
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 13:41:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rqCRX-0003CJ-Rk; Fri, 29 Mar 2024 14:38:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rqCRW-009Can-VF; Fri, 29 Mar 2024 14:38:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rqCRW-00DQHv-2b;
 Fri, 29 Mar 2024 14:38:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] backlight: lp8788: Drop support for platform data
Date: Fri, 29 Mar 2024 14:38:39 +0100
Message-ID: <20240329133839.550065-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10244;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BssDkFQRXUuNNckQrQ1EzIrE7Q1qFrFG/pxn8v9Jde0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBsRgCA8Mn6XGSkAm+eZGdDGUEnSJX0iCB1Gr1
 cWmKuWR+0CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgbEYAAKCRCPgPtYfRL+
 Tp0uB/9RqIhHh48blh1fbRI6iMqSzs0/HOHNitbTuP1S+3Su3HbC4Pt5cvq7tKosmhEhw4Ks4Cw
 UIszeTqyj7ia3OA1CLBetu7BhgZn398abHD97vYKPHFeL3x+xPI/ERC4BwclvDYYLzHbkORULPr
 rejAW6hwjAoDcEtSSCMK901IsqUBtnmHtxAVFTmxVrtiwZAiL4hnswvNRe31942q6MKvsRb7R/T
 2syO8nDZh9ztkxDZRnyOoa93w71eKyw7ePhHuOGh4wKCPzbLm4RN2LysBiWfK5wjSTZLxVFcM/2
 vF3KuqpDEH5broRowWX+FFmR6xCkFz8qRK0LDfXFe/MQDpbg
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backlight driver supports getting passed platform data. However this
isn't used. This allows to remove quite some dead code from the driver
because bl->pdata is always NULL, and so bl->mode is always
LP8788_BL_REGISTER_ONLY.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Link: https://lore.kernel.org/r/20240314113529.923708-2-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since v2:

 - Rebase to v6.9-rc1

On Wed, Mar 27, 2024 at 02:47:33PM +0000, Lee Jones wrote:
> Does not apply.
> 
> Please rebase onto v6.9-rc1 or for-backlight-next.

I don't know how you apply patches, but b4 am -3 worked for me just fine
on top ov v6.9-rc1.

Best regards
Uwe

 drivers/video/backlight/lp8788_bl.c | 151 ++--------------------------
 include/linux/mfd/lp8788.h          |  36 -------
 2 files changed, 8 insertions(+), 179 deletions(-)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index 31f97230ee50..0b7663519fa5 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -12,7 +12,6 @@
 #include <linux/mfd/lp8788.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pwm.h>
 #include <linux/slab.h>
 
 /* Register address */
@@ -31,149 +30,40 @@
 #define MAX_BRIGHTNESS			127
 #define DEFAULT_BL_NAME			"lcd-backlight"
 
-struct lp8788_bl_config {
-	enum lp8788_bl_ctrl_mode bl_mode;
-	enum lp8788_bl_dim_mode dim_mode;
-	enum lp8788_bl_full_scale_current full_scale;
-	enum lp8788_bl_ramp_step rise_time;
-	enum lp8788_bl_ramp_step fall_time;
-	enum pwm_polarity pwm_pol;
-};
-
 struct lp8788_bl {
 	struct lp8788 *lp;
 	struct backlight_device *bl_dev;
-	struct lp8788_backlight_platform_data *pdata;
-	enum lp8788_bl_ctrl_mode mode;
-	struct pwm_device *pwm;
 };
 
-static struct lp8788_bl_config default_bl_config = {
-	.bl_mode    = LP8788_BL_REGISTER_ONLY,
-	.dim_mode   = LP8788_DIM_EXPONENTIAL,
-	.full_scale = LP8788_FULLSCALE_1900uA,
-	.rise_time  = LP8788_RAMP_8192us,
-	.fall_time  = LP8788_RAMP_8192us,
-	.pwm_pol    = PWM_POLARITY_NORMAL,
-};
-
-static inline bool is_brightness_ctrl_by_pwm(enum lp8788_bl_ctrl_mode mode)
-{
-	return mode == LP8788_BL_COMB_PWM_BASED;
-}
-
-static inline bool is_brightness_ctrl_by_register(enum lp8788_bl_ctrl_mode mode)
-{
-	return mode == LP8788_BL_REGISTER_ONLY ||
-		mode == LP8788_BL_COMB_REGISTER_BASED;
-}
-
 static int lp8788_backlight_configure(struct lp8788_bl *bl)
 {
-	struct lp8788_backlight_platform_data *pdata = bl->pdata;
-	struct lp8788_bl_config *cfg = &default_bl_config;
 	int ret;
 	u8 val;
 
-	/*
-	 * Update chip configuration if platform data exists,
-	 * otherwise use the default settings.
-	 */
-	if (pdata) {
-		cfg->bl_mode    = pdata->bl_mode;
-		cfg->dim_mode   = pdata->dim_mode;
-		cfg->full_scale = pdata->full_scale;
-		cfg->rise_time  = pdata->rise_time;
-		cfg->fall_time  = pdata->fall_time;
-		cfg->pwm_pol    = pdata->pwm_pol;
-	}
-
 	/* Brightness ramp up/down */
-	val = (cfg->rise_time << LP8788_BL_RAMP_RISE_SHIFT) | cfg->fall_time;
+	val = (LP8788_RAMP_8192us << LP8788_BL_RAMP_RISE_SHIFT) | LP8788_RAMP_8192us;
 	ret = lp8788_write_byte(bl->lp, LP8788_BL_RAMP, val);
 	if (ret)
 		return ret;
 
 	/* Fullscale current setting */
-	val = (cfg->full_scale << LP8788_BL_FULLSCALE_SHIFT) |
-		(cfg->dim_mode << LP8788_BL_DIM_MODE_SHIFT);
+	val = (LP8788_FULLSCALE_1900uA << LP8788_BL_FULLSCALE_SHIFT) |
+		(LP8788_DIM_EXPONENTIAL << LP8788_BL_DIM_MODE_SHIFT);
 
 	/* Brightness control mode */
-	switch (cfg->bl_mode) {
-	case LP8788_BL_REGISTER_ONLY:
-		val |= LP8788_BL_EN;
-		break;
-	case LP8788_BL_COMB_PWM_BASED:
-	case LP8788_BL_COMB_REGISTER_BASED:
-		val |= LP8788_BL_EN | LP8788_BL_PWM_INPUT_EN |
-			(cfg->pwm_pol << LP8788_BL_PWM_POLARITY_SHIFT);
-		break;
-	default:
-		dev_err(bl->lp->dev, "invalid mode: %d\n", cfg->bl_mode);
-		return -EINVAL;
-	}
-
-	bl->mode = cfg->bl_mode;
+	val |= LP8788_BL_EN;
 
 	return lp8788_write_byte(bl->lp, LP8788_BL_CONFIG, val);
 }
 
-static void lp8788_pwm_ctrl(struct lp8788_bl *bl, int br, int max_br)
-{
-	unsigned int period;
-	unsigned int duty;
-	struct device *dev;
-	struct pwm_device *pwm;
-
-	if (!bl->pdata)
-		return;
-
-	period = bl->pdata->period_ns;
-	duty = br * period / max_br;
-	dev = bl->lp->dev;
-
-	/* request PWM device with the consumer name */
-	if (!bl->pwm) {
-		pwm = devm_pwm_get(dev, LP8788_DEV_BACKLIGHT);
-		if (IS_ERR(pwm)) {
-			dev_err(dev, "can not get PWM device\n");
-			return;
-		}
-
-		bl->pwm = pwm;
-
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pwm);
-	}
-
-	pwm_config(bl->pwm, duty, period);
-	if (duty)
-		pwm_enable(bl->pwm);
-	else
-		pwm_disable(bl->pwm);
-}
-
 static int lp8788_bl_update_status(struct backlight_device *bl_dev)
 {
 	struct lp8788_bl *bl = bl_get_data(bl_dev);
-	enum lp8788_bl_ctrl_mode mode = bl->mode;
 
 	if (bl_dev->props.state & BL_CORE_SUSPENDED)
 		bl_dev->props.brightness = 0;
 
-	if (is_brightness_ctrl_by_pwm(mode)) {
-		int brt = bl_dev->props.brightness;
-		int max = bl_dev->props.max_brightness;
-
-		lp8788_pwm_ctrl(bl, brt, max);
-	} else if (is_brightness_ctrl_by_register(mode)) {
-		u8 brt = bl_dev->props.brightness;
-
-		lp8788_write_byte(bl->lp, LP8788_BL_BRIGHTNESS, brt);
-	}
+	lp8788_write_byte(bl->lp, LP8788_BL_BRIGHTNESS, bl_dev->props.brightness);
 
 	return 0;
 }
@@ -187,30 +77,16 @@ static int lp8788_backlight_register(struct lp8788_bl *bl)
 {
 	struct backlight_device *bl_dev;
 	struct backlight_properties props;
-	struct lp8788_backlight_platform_data *pdata = bl->pdata;
-	int init_brt;
-	char *name;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = MAX_BRIGHTNESS;
 
 	/* Initial brightness */
-	if (pdata)
-		init_brt = min_t(int, pdata->initial_brightness,
-				props.max_brightness);
-	else
-		init_brt = 0;
-
-	props.brightness = init_brt;
+	props.brightness = 0;
 
 	/* Backlight device name */
-	if (!pdata || !pdata->name)
-		name = DEFAULT_BL_NAME;
-	else
-		name = pdata->name;
-
-	bl_dev = backlight_device_register(name, bl->lp->dev, bl,
+	bl_dev = backlight_device_register(DEFAULT_BL_NAME, bl->lp->dev, bl,
 				       &lp8788_bl_ops, &props);
 	if (IS_ERR(bl_dev))
 		return PTR_ERR(bl_dev);
@@ -230,16 +106,7 @@ static void lp8788_backlight_unregister(struct lp8788_bl *bl)
 static ssize_t lp8788_get_bl_ctl_mode(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
-	struct lp8788_bl *bl = dev_get_drvdata(dev);
-	enum lp8788_bl_ctrl_mode mode = bl->mode;
-	char *strmode;
-
-	if (is_brightness_ctrl_by_pwm(mode))
-		strmode = "PWM based";
-	else if (is_brightness_ctrl_by_register(mode))
-		strmode = "Register based";
-	else
-		strmode = "Invalid mode";
+	const char *strmode = "Register based";
 
 	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
 }
@@ -266,8 +133,6 @@ static int lp8788_backlight_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	bl->lp = lp;
-	if (lp->pdata)
-		bl->pdata = lp->pdata->bl_pdata;
 
 	platform_set_drvdata(pdev, bl);
 
diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
index 51b47966a04d..fd17bec2a33e 100644
--- a/include/linux/mfd/lp8788.h
+++ b/include/linux/mfd/lp8788.h
@@ -11,7 +11,6 @@
 #define __MFD_LP8788_H__
 
 #include <linux/irqdomain.h>
-#include <linux/pwm.h>
 #include <linux/regmap.h>
 
 #define LP8788_DEV_BUCK		"lp8788-buck"
@@ -87,12 +86,6 @@ enum lp8788_charger_event {
 	CHARGER_DETECTED,
 };
 
-enum lp8788_bl_ctrl_mode {
-	LP8788_BL_REGISTER_ONLY,
-	LP8788_BL_COMB_PWM_BASED,	/* PWM + I2C, changed by PWM input */
-	LP8788_BL_COMB_REGISTER_BASED,	/* PWM + I2C, changed by I2C */
-};
-
 enum lp8788_bl_dim_mode {
 	LP8788_DIM_EXPONENTIAL,
 	LP8788_DIM_LINEAR,
@@ -201,31 +194,6 @@ struct lp8788_charger_platform_data {
 				enum lp8788_charger_event event);
 };
 
-/*
- * struct lp8788_backlight_platform_data
- * @name                  : backlight driver name. (default: "lcd-backlight")
- * @initial_brightness    : initial value of backlight brightness
- * @bl_mode               : brightness control by pwm or lp8788 register
- * @dim_mode              : dimming mode selection
- * @full_scale            : full scale current setting
- * @rise_time             : brightness ramp up step time
- * @fall_time             : brightness ramp down step time
- * @pwm_pol               : pwm polarity setting when bl_mode is pwm based
- * @period_ns             : platform specific pwm period value. unit is nano.
-			    Only valid when bl_mode is LP8788_BL_COMB_PWM_BASED
- */
-struct lp8788_backlight_platform_data {
-	char *name;
-	int initial_brightness;
-	enum lp8788_bl_ctrl_mode bl_mode;
-	enum lp8788_bl_dim_mode dim_mode;
-	enum lp8788_bl_full_scale_current full_scale;
-	enum lp8788_bl_ramp_step rise_time;
-	enum lp8788_bl_ramp_step fall_time;
-	enum pwm_polarity pwm_pol;
-	unsigned int period_ns;
-};
-
 /*
  * struct lp8788_led_platform_data
  * @name         : led driver name. (default: "keyboard-backlight")
@@ -267,7 +235,6 @@ struct lp8788_vib_platform_data {
  * @buck2_dvs    : configurations for buck2 dvs
  * @chg_pdata    : platform data for charger driver
  * @alarm_sel    : rtc alarm selection (1 or 2)
- * @bl_pdata     : configurable data for backlight driver
  * @led_pdata    : configurable data for led driver
  * @vib_pdata    : configurable data for vibrator driver
  * @adc_pdata    : iio map data for adc driver
@@ -289,9 +256,6 @@ struct lp8788_platform_data {
 	/* rtc alarm */
 	enum lp8788_alarm_sel alarm_sel;
 
-	/* backlight */
-	struct lp8788_backlight_platform_data *bl_pdata;
-
 	/* current sinks */
 	struct lp8788_led_platform_data *led_pdata;
 	struct lp8788_vib_platform_data *vib_pdata;

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.43.0

