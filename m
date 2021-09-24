Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1424169E3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 04:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A816EDC7;
	Fri, 24 Sep 2021 02:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7326EDC7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 02:12:29 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so11183430otb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9wWO2Fj7Y+rq8GEYNzFNCFVmSYjKusxetlpJ0ug3rY=;
 b=a7ByycBPZ0rN2m/xMXm0pQgv4CrTRXwHD+5YQzTekNvJJvXma0xLK4hgfixvXS6q/O
 urIkNYFKVUkxQ476ZQhUNUhAxIWiPtpkoRzMkIVWQN6+5uwc/exYsaMWkeNpjHSW01ER
 TWG3zNb8N1uHKexmmP80ooVu5BKcLyZ9GjOvn3pW+H2tvvxcTuOOF4xBTHu1S12IqtGD
 VNzj4Cc/9L5fmBBe7HfMKbhTyqxHonuOeVJbYVzYMf/32lPu8JABJDgUMzyYVJRMdmbf
 jqC7Mv/YgCiYq3oYA61vCxnVJ3G7vLNwDQaB459cbyfJQnbzYcFbRrU7/X11B30Qk4dU
 gA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9wWO2Fj7Y+rq8GEYNzFNCFVmSYjKusxetlpJ0ug3rY=;
 b=yiESgqydZfrYTaBYNG+U97/nmz9rcXFlDgv7UvrTxNlUu3wZA1XZn3/xhuT8dijaGb
 46ozwXY8z1I2dX1mBKwXsg7ovPlYM+x/ME8965rfTm8lPqi769mXwIsnX+J2xhG+Te4U
 NPTK1/x6liZDZBnMZhFYaEzXFryjXPR4qeOmvp6xFxxjOlZDXkW+mhNJkV/OEe0tkS9V
 lyE+Ymnp4bYXxnUqlWHHx4MOwoLBxYwINqvG25HqWpGP47JxVxI6b/m+ted9KGoegA53
 ijjrr2xxn/iUpcDlbfGTUov/NBIPrWn2QVgbsbc7cUHLzy+mFGs08RvpohlCw2ZU8awo
 Dtvg==
X-Gm-Message-State: AOAM532hN3iPAq8NLhyT3KSAJ6XOCS4QtljZ1KQc8WBPMJIYnCulffeB
 1uwhl1mLMSB3EMB10NypvGlWFA==
X-Google-Smtp-Source: ABdhPJym1JcNWMUSebimO7x3xC+u6dahm43AnWH+kc8LYavUflLPL8/YfNFVthbTLxniSgJ+MN72Jw==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr1716413otg.236.1632449548424; 
 Thu, 23 Sep 2021 19:12:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x28sm1884336ote.24.2021.09.23.19.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 19:12:27 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, Doug Anderson <dianders@google.com>
Subject: [PATCH v5 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Date: Thu, 23 Sep 2021 21:12:25 -0500
Message-Id: <20210924021225.846197-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210924021225.846197-1-bjorn.andersson@linaro.org>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
with the primary purpose of controlling the backlight of the attached
panel. Add an implementation that exposes this using the standard PWM
framework, to allow e.g. pwm-backlight to expose this to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Rebased the patch
- Turned ti_sn65dsi86_write_u16 into using regmap bulk write
- Moved pwm_refclk_freq out of the #if CONFIG_PWM, to allow removing the guard
  from ti_sn_bridge_set_refclk_freq()
- Updates "Limitations" text
- pm_runtime_put_sync() on pm_runtime_get_sync() failure
- Added parenthesis around (scale + 1) in the PWM_FREQ formula and thereby
  redid all the math
- Rewrote the comments related to the math
- Rewrote the math for calculating the backlight (duty cycle) register value
- Dropped some !! on already boolean state->enabled
- Dropped a spurious newline
- Rewrote comment in ti_sn65dsi86_probe() talking about future PWM work

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 369 +++++++++++++++++++++++++-
 1 file changed, 361 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 41d48a393e7f..857a53dc6c75 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,7 +4,9 @@
  * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
@@ -15,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -91,6 +94,13 @@
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
+#define SN_PWM_PRE_DIV_REG			0xA0
+#define SN_BACKLIGHT_SCALE_REG			0xA1
+#define  BACKLIGHT_SCALE_MAX			0xFFFF
+#define SN_BACKLIGHT_REG			0xA3
+#define SN_PWM_EN_INV_REG			0xA5
+#define  SN_PWM_INV_MASK			BIT(0)
+#define  SN_PWM_EN_MASK				BIT(1)
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
@@ -113,11 +123,14 @@
 
 #define SN_LINK_TRAINING_TRIES		10
 
+#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
+
 /**
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
  * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
+ * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -145,11 +158,17 @@
  *                bitmap so we can do atomic ops on it without an extra
  *                lock so concurrent users of our 4 GPIOs don't stomp on
  *                each other's read-modify-write.
+ *
+ * @pchip:        pwm_chip if the PWM is exposed.
+ * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
+ * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
+ * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
 	struct auxiliary_device		aux_aux;
+	struct auxiliary_device		pwm_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -172,6 +191,12 @@ struct ti_sn65dsi86 {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
+#if defined(CONFIG_PWM)
+	struct pwm_chip			pchip;
+	bool				pwm_enabled;
+	atomic_t			pwm_pin_busy;
+#endif
+	unsigned int			pwm_refclk_freq;
 };
 
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
@@ -190,11 +215,31 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+				 unsigned int reg, u16 *val)
+{
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, reg, &tmp);
+	if (ret)
+		return ret;
+	*val = tmp;
+
+	ret = regmap_read(pdata->regmap, reg + 1, &tmp);
+	if (ret)
+		return ret;
+	*val |= tmp << 8;
+
+	return 0;
+}
+
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
-	regmap_write(pdata->regmap, reg, val & 0xFF);
-	regmap_write(pdata->regmap, reg + 1, val >> 8);
+	u8 buf[2] = { val & 0xff, val >> 8 };
+
+	regmap_bulk_write(pdata->regmap, reg, &buf, ARRAY_SIZE(buf));
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
@@ -253,6 +298,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 
 	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
 			   REFCLK_FREQ(i));
+
+	/*
+	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
+	 * regardless of its actual sourcing.
+	 */
+	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
 }
 
 static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
@@ -1259,9 +1310,283 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
 };
 
 /* -----------------------------------------------------------------------------
- * GPIO Controller
+ * PWM Controller
+ */
+#if defined(CONFIG_PWM)
+static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
+{
+	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
+}
+
+static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
+{
+	atomic_set(&pdata->pwm_pin_busy, 0);
+}
+
+static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ti_sn65dsi86, pchip);
+}
+
+static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	return ti_sn_pwm_pin_request(pdata);
+}
+
+static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	ti_sn_pwm_pin_release(pdata);
+}
+
+/*
+ * Limitations:
+ * - The PWM signal is not driven when the chip is powered down, or in its
+ *   reset state and the driver does not implement the "suspend state"
+ *   described in the documentation. In order to save power, state->enabled is
+ *   interpreted as denoting if the signal is expected to be valid, and is used
+ *   to determine if the chip needs to be kept powered.
+ * - Changing both period and duty_cycle is not done atomically, neither is the
+ *   multi-byte register updates, so the output might briefly be undefined
+ *   during update.
  */
+static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			   const struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int backlight;
+	unsigned int pre_div;
+	unsigned int scale;
+	u64 period_max;
+	u64 period;
+	int ret;
+
+	if (!pdata->pwm_enabled) {
+		ret = pm_runtime_get_sync(pdata->dev);
+		if (ret < 0) {
+			pm_runtime_put_sync(pdata->dev);
+			return ret;
+		}
+	}
+
+	if (state->enabled) {
+		if (!pdata->pwm_enabled) {
+			/*
+			 * The chip might have been powered down while we
+			 * didn't hold a PM runtime reference, so mux in the
+			 * PWM function on the GPIO pin again.
+			 */
+			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
+						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
+			if (ret) {
+				dev_err(pdata->dev, "failed to mux in PWM function\n");
+				goto out;
+			}
+		}
+
+		/*
+		 * Per the datasheet the PWM frequency is given by:
+		 *
+		 *                          REFCLK_FREQ
+		 *   PWM_FREQ = -----------------------------------
+		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
+		 *
+		 * Unfortunately the math becomes overly complex unless we
+		 * assume that this formula is missing parenthesis around
+		 * BACKLIGHT_SCALE + 1.
+		 * With that the formula can be written:
+		 *
+		 *   T_pwm * REFCLK_FREQ = PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
+		 *
+		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
+		 * PWM_PRE_DIV must be:
+		 *
+		 *                     T_pwm * REFCLK_FREQ
+		 *   PWM_PRE_DIV >= -------------------------
+		 *                   BACKLIGHT_SCALE_MAX + 1
+		 *
+		 * To simplify the search and optimize the resolution of the
+		 * PWM, the lowest possible PWM_PRE_DIV is used. Finally the
+		 * scale is calculated as:
+		 *
+		 *                      T_pwm * REFCLK_FREQ
+		 *   BACKLIGHT_SCALE = ---------------------- - 1
+		 *                          PWM_PRE_DIV
+		 *
+		 * Here T_pwm is represented in seconds, so appropriate scaling
+		 * to nanoseconds is necessary.
+		 */
+
+		/* Minimum T_pwm is (0 * 1) / REFCLK_FREQ */
+		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
+		 * Limit period to this to avoid overflows
+		 */
+		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1), pdata->pwm_refclk_freq);
+		if (period > period_max)
+			period = period_max;
+		else
+			period = state->period;
+
+		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
+					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
+		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
+
+		/*
+		 * The documentation has the duty ratio given as:
+		 *
+		 *     duty          BACKLIGHT
+		 *   ------- = ---------------------
+		 *    period    BACKLIGHT_SCALE + 1
+		 *
+		 * Solve for BACKLIGHT, substituting BACKLIGHT_SCALE according
+		 * to definition above and adjusting for nanosecond
+		 * representation of duty cycle gives us:
+		 */
+		backlight = div64_u64(state->duty_cycle * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div);
+		if (backlight > scale)
+			backlight = scale;
+
+		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
+		if (ret) {
+			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			goto out;
+		}
 
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
+	}
+
+	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
+		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
+	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
+	if (ret) {
+		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		goto out;
+	}
+
+	pdata->pwm_enabled = state->enabled;
+out:
+
+	if (!pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+
+	return ret;
+}
+
+static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int pre_div;
+	u16 backlight;
+	u16 scale;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
+	if (ret)
+		return;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
+	if (ret)
+		return;
+
+	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
+	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
+	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
+					 pdata->pwm_refclk_freq);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
+					     pdata->pwm_refclk_freq);
+}
+
+static const struct pwm_ops ti_sn_pwm_ops = {
+	.request = ti_sn_pwm_request,
+	.free = ti_sn_pwm_free,
+	.apply = ti_sn_pwm_apply,
+	.get_state = ti_sn_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int ti_sn_pwm_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.ops = &ti_sn_pwm_ops;
+	pdata->pchip.npwm = 1;
+	pdata->pchip.of_xlate = of_pwm_single_xlate;
+	pdata->pchip.of_pwm_n_cells = 1;
+
+	return pwmchip_add(&pdata->pchip);
+}
+
+static void ti_sn_pwm_remove(struct auxiliary_device *adev)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pwmchip_remove(&pdata->pchip);
+
+	if (pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+}
+
+static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
+	{ .name = "ti_sn65dsi86.pwm", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_pwm_driver = {
+	.name = "pwm",
+	.probe = ti_sn_pwm_probe,
+	.remove = ti_sn_pwm_remove,
+	.id_table = ti_sn_pwm_id_table,
+};
+
+static int __init ti_sn_pwm_register(void)
+{
+	return auxiliary_driver_register(&ti_sn_pwm_driver);
+}
+
+static void ti_sn_pwm_unregister(void)
+{
+	auxiliary_driver_unregister(&ti_sn_pwm_driver);
+}
+
+#else
+static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
+static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
+
+static inline int ti_sn_pwm_register(void) { return 0; }
+static inline void ti_sn_pwm_unregister(void) {}
+#endif
+
+/* -----------------------------------------------------------------------------
+ * GPIO Controller
+ */
 #if defined(CONFIG_OF_GPIO)
 
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
@@ -1394,10 +1719,25 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 	return ret;
 }
 
+static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		return ti_sn_pwm_pin_request(pdata);
+
+	return 0;
+}
+
 static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
 	/* We won't keep pm_runtime if we're input, so switch there on free */
 	ti_sn_bridge_gpio_direction_input(chip, offset);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		ti_sn_pwm_pin_release(pdata);
 }
 
 static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
@@ -1419,6 +1759,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
 	pdata->gchip.owner = THIS_MODULE;
 	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
 	pdata->gchip.of_gpio_n_cells = 2;
+	pdata->gchip.request = ti_sn_bridge_gpio_request;
 	pdata->gchip.free = ti_sn_bridge_gpio_free;
 	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
@@ -1545,10 +1886,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	 * ordering. The bridge wants the panel to be there when it probes.
 	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
 	 * when it probes. The panel and maybe backlight might want the DDC
-	 * bus. Soon the PWM provided by the bridge chip will have the same
-	 * problem. Having sub-devices allows the some sub devices to finish
-	 * probing even if others return -EPROBE_DEFER and gets us around the
-	 * problems.
+	 * bus or the pwm_chip. Having sub-devices allows the some sub devices
+	 * to finish probing even if others return -EPROBE_DEFER and gets us
+	 * around the problems.
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
@@ -1557,6 +1897,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
+	if (IS_ENABLED(CONFIG_PWM)) {
+		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * NOTE: At the end of the AUX channel probe we'll add the aux device
 	 * for the bridge. This is because the bridge can't be used until the
@@ -1600,10 +1946,14 @@ static int __init ti_sn65dsi86_init(void)
 	if (ret)
 		goto err_main_was_registered;
 
-	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	ret = ti_sn_pwm_register();
 	if (ret)
 		goto err_gpio_was_registered;
 
+	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	if (ret)
+		goto err_pwm_was_registered;
+
 	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
 	if (ret)
 		goto err_aux_was_registered;
@@ -1612,6 +1962,8 @@ static int __init ti_sn65dsi86_init(void)
 
 err_aux_was_registered:
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+err_pwm_was_registered:
+	ti_sn_pwm_unregister();
 err_gpio_was_registered:
 	ti_sn_gpio_unregister();
 err_main_was_registered:
@@ -1625,6 +1977,7 @@ static void __exit ti_sn65dsi86_exit(void)
 {
 	auxiliary_driver_unregister(&ti_sn_bridge_driver);
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+	ti_sn_pwm_unregister();
 	ti_sn_gpio_unregister();
 	i2c_del_driver(&ti_sn65dsi86_driver);
 }
-- 
2.32.0

