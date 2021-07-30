Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5A3DBC98
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 17:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF089FE6;
	Fri, 30 Jul 2021 15:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C746F467
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 15:46:51 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j1so15769097pjv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJD7zLGj9G92TEZ66S1vXIej3eJbyh+F8KK+STRB8wc=;
 b=FhyAXSCSw2obJi7hGW2x16pP5ChUaedH1wnKHvlZbjJMNxVJ2b1miNHuzxjxRK1HA1
 dfBAmpHwSU0kjo6VznppVYCzHfiy2etNi2nm0Sf/IzvTQDJ0O2E20F3FuIJA8URgbjSX
 MPI7PknWAib2vvI0xu/S+m4c//1Arocw6cnq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJD7zLGj9G92TEZ66S1vXIej3eJbyh+F8KK+STRB8wc=;
 b=ZaXCw+YVe7+1+luR+esOwkWTg8Njy6pfx9sE4euNtlX6j2nRgFeh2BWNe2MD1hiI6Q
 6/Vlmeb8M18XrojbX6FbOkTKJGWbrQGL/++ThMZxzfaHRLid0rrAWpwEzmTANSZIpz1E
 0O21coeTqK6MpIGssxe90EmP9UIjTlISA0dscs2Xm1hXEPZRqcNPlA8QrEjJcATKIvQw
 ezjRIdlvTDXb3Jgowfu7RdiYnIdeVj9xiGeRfDGAq+Lf/Vw3OqEZRgX/+eDA+WG4IA2P
 +2KEzb6mkLorPFJrUBIKzbfsUwEUdm71CSdnhZfncQA9jCM7aCdDmLVDsf2Oax38W1cL
 mXcQ==
X-Gm-Message-State: AOAM532b/hSHEm8YUrpvT7+WhGQ84CYyEFtrTJpo+G6VhxUo40+qG9Af
 D//bTU7Fm+ImArg2e8+mkCKrZoFlFxHfNjOn
X-Google-Smtp-Source: ABdhPJwAXsUdugmbJ2wc85ZJ4dJ3GbSRqgXm4qoje3a/AUBJ2J86YCfb+ZLLT87SCNOpIi495sCxQg==
X-Received: by 2002:aa7:8550:0:b029:32b:963f:f53b with SMTP id
 y16-20020aa785500000b029032b963ff53bmr3587724pfn.0.1627660010564; 
 Fri, 30 Jul 2021 08:46:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3424:e0ac:5a92:d061])
 by smtp.gmail.com with ESMTPSA id u188sm3175621pfc.115.2021.07.30.08.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:46:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, steev@kali.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, airlied@linux.ie, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
 sam@ravnborg.org, jonas@kwiboo.se, mripard@kernel.org,
 thierry.reding@gmail.com, lyude@redhat.com, linus.walleij@linaro.org,
 rajeevny@codeaurora.org, linux-arm-msm@vger.kernel.org,
 a.hajda@samsung.com, tzimmermann@suse.de, narmstrong@baylibre.com,
 Douglas Anderson <dianders@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/panel: atna33xc20: Introduce the Samsung
 ATNA33XC20 panel
Date: Fri, 30 Jul 2021 08:46:05 -0700
Message-Id: <20210730084534.v2.6.I3a2900080f8749d2bb4baf49ca902db4b0e1df7d@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730154605.2843418-1-dianders@chromium.org>
References: <20210730154605.2843418-1-dianders@chromium.org>
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

The Samsung ATNA33XC20 panel is an AMOLED eDP panel that has backlight
control over the DP AUX channel.

This panel is _almost_ able to be controlled in a "simple" way (and it
originally was implemented in panel-simple.c), but it's really
impossible to get the backlight semantics right there without adding
wacky special-case code to panel-simple. Let's give up and clone the
parts of panel-simple that we need and implement the power sequence
that this panel needs.

NOTE: we'll still leave the devicetree bindings alone. Even though the
power-sequencing is non-standard the bindings are still "simple".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 366 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 6b3eb041182c..58430d358489 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -353,6 +353,18 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_ATNA33XC20
+	tristate "Samsung ATNA33XC20 eDP panel"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
+	select VIDEOMODE_HELPERS
+	select DRM_DP_AUX_BUS
+	help
+	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
+	  be handled by the DRM_PANEL_SIMPLE driver because its power
+	  sequencing is non-standard.
+
 config DRM_PANEL_SAMSUNG_DB7430
 	tristate "Samsung DB7430-based DPI panels"
 	depends on OF && SPI && GPIOLIB
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 08debae9b314..1b6fe2008861 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
new file mode 100644
index 000000000000..221db6512859
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2021 Google Inc.
+ *
+ * Panel driver for the Samsung ATNA33XC20 panel. This panel can't be handled
+ * by the DRM_PANEL_SIMPLE driver because its power sequencing is non-standard.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_dp_aux_bus.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_panel.h>
+
+struct atana33xc20_panel {
+	struct drm_panel base;
+	bool prepared;
+	bool enabled;
+	bool el3_was_on;
+
+	bool no_hpd;
+	struct gpio_desc *hpd_gpio;
+
+	struct regulator *supply;
+	struct gpio_desc *el_on3_gpio;
+
+	struct edid *edid;
+
+	ktime_t powered_off_time;
+	ktime_t powered_on_time;
+	ktime_t el_on3_off_time;
+};
+
+static inline struct atana33xc20_panel *to_atana33xc20(struct drm_panel *panel)
+{
+	return container_of(panel, struct atana33xc20_panel, base);
+}
+
+static void atana33xc20_wait(ktime_t start_ktime, unsigned int min_ms)
+{
+	ktime_t now_ktime, min_ktime;
+
+	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
+	now_ktime = ktime_get();
+
+	if (ktime_before(now_ktime, min_ktime))
+		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
+}
+
+static int atana33xc20_suspend(struct device *dev)
+{
+	struct atana33xc20_panel *p = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * Note 3 (Example of power off sequence in detail) in spec
+	 * specifies to wait 150 ms after deasserting EL3_ON before
+	 * powering off.
+	 */
+	if (p->el3_was_on)
+		atana33xc20_wait(p->el_on3_off_time, 150);
+
+	ret = regulator_disable(p->supply);
+	if (ret)
+		return ret;
+	p->powered_off_time = ktime_get();
+	p->el3_was_on = false;
+
+	return 0;
+}
+
+static int atana33xc20_resume(struct device *dev)
+{
+	struct atana33xc20_panel *p = dev_get_drvdata(dev);
+	bool hpd_asserted = false;
+	int ret;
+
+	/* T12 (Power off time) is min 500 ms */
+	atana33xc20_wait(p->powered_off_time, 500);
+
+	ret = regulator_enable(p->supply);
+	if (ret)
+		return ret;
+	p->powered_on_time = ktime_get();
+
+	/*
+	 * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
+	 * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
+	 * NULL. It's up to the controller driver to wait for HPD after
+	 * preparing the panel in that case.
+	 */
+	if (p->no_hpd) {
+		/* T3 VCC to HPD high is max 200 ms */
+		msleep(200);
+	} else if (p->hpd_gpio) {
+		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
+					 hpd_asserted, hpd_asserted,
+					 1000, 200000);
+		if (!hpd_asserted)
+			dev_warn(dev, "Timeout waiting for HPD\n");
+	}
+
+	return 0;
+}
+
+static int atana33xc20_disable(struct drm_panel *panel)
+{
+	struct atana33xc20_panel *p = to_atana33xc20(panel);
+
+	/* Disabling when already disabled is a no-op */
+	if (!p->enabled)
+		return 0;
+
+	gpiod_set_value_cansleep(p->el_on3_gpio, 0);
+	p->el_on3_off_time = ktime_get();
+	p->enabled = false;
+
+	/*
+	 * Keep track of the fact that EL_ON3 was on but we haven't power
+	 * cycled yet. This lets us know that "el_on3_off_time" is recent (we
+	 * don't need to worry about ktime wraparounds) and also makes it
+	 * obvious if we try to enable again without a power cycle (see the
+	 * warning in atana33xc20_enable()).
+	 */
+	p->el3_was_on = true;
+
+	/*
+	 * Sleeping 20 ms here (after setting the GPIO) avoids a glitch when
+	 * powering off.
+	 */
+	msleep(20);
+
+	return 0;
+}
+
+static int atana33xc20_enable(struct drm_panel *panel)
+{
+	struct atana33xc20_panel *p = to_atana33xc20(panel);
+
+	/* Enabling when already enabled is a no-op */
+	if (p->enabled)
+		return 0;
+
+	/*
+	 * Once EL_ON3 drops we absolutely need a power cycle before the next
+	 * enable or the backlight will never come on again. The code ensures
+	 * this because disable() is _always_ followed by unprepare() and
+	 * unprepare() forces a suspend with pm_runtime_put_sync_suspend(),
+	 * but let's track just to make sure since the requirement is so
+	 * non-obvious.
+	 */
+	if (WARN_ON(p->el3_was_on))
+		return -EIO;
+
+	/*
+	 * Note 2 (Example of power on sequence in detail) in spec specifies
+	 * to wait 400 ms after powering on before asserting EL3_on.
+	 */
+	atana33xc20_wait(p->powered_on_time, 400);
+
+	gpiod_set_value_cansleep(p->el_on3_gpio, 1);
+	p->enabled = true;
+
+	return 0;
+}
+
+static int atana33xc20_unprepare(struct drm_panel *panel)
+{
+	struct atana33xc20_panel *p = to_atana33xc20(panel);
+	int ret;
+
+	/* Unpreparing when already unprepared is a no-op */
+	if (!p->prepared)
+		return 0;
+
+	/*
+	 * Purposely do a put_sync, don't use autosuspend. The panel's tcon
+	 * seems to sometimes crash when you stop giving it data and this is
+	 * the best way to ensure it will come back.
+	 *
+	 * NOTE: we still want autosuspend for cases where we only turn on
+	 * to get the EDID or otherwise send DP AUX commands to the panel.
+	 */
+	ret = pm_runtime_put_sync_suspend(panel->dev);
+	if (ret < 0)
+		return ret;
+	p->prepared = false;
+
+	return 0;
+}
+
+static int atana33xc20_prepare(struct drm_panel *panel)
+{
+	struct atana33xc20_panel *p = to_atana33xc20(panel);
+	int ret;
+
+	/* Preparing when already prepared is a no-op */
+	if (p->prepared)
+		return 0;
+
+	ret = pm_runtime_get_sync(panel->dev);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(panel->dev);
+		return ret;
+	}
+	p->prepared = true;
+
+	return 0;
+}
+
+static int atana33xc20_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct atana33xc20_panel *p = to_atana33xc20(panel);
+	struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(panel->dev);
+	int num = 0;
+
+	pm_runtime_get_sync(panel->dev);
+
+	if (!p->edid)
+		p->edid = drm_get_edid(connector, &aux_ep->aux->ddc);
+	num = drm_add_edid_modes(connector, p->edid);
+
+	pm_runtime_mark_last_busy(panel->dev);
+	pm_runtime_put_autosuspend(panel->dev);
+
+	return num;
+}
+
+static const struct drm_panel_funcs atana33xc20_funcs = {
+	.disable = atana33xc20_disable,
+	.enable = atana33xc20_enable,
+	.unprepare = atana33xc20_unprepare,
+	.prepare = atana33xc20_prepare,
+	.get_modes = atana33xc20_get_modes,
+};
+
+static void atana33xc20_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void atana33xc20_dont_use_autosuspend(void *data)
+{
+	pm_runtime_dont_use_autosuspend(data);
+}
+
+static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
+{
+	struct atana33xc20_panel *panel;
+	struct device *dev = &aux_ep->dev;
+	int ret;
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+	dev_set_drvdata(dev, panel);
+
+	panel->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(panel->supply))
+		return dev_err_probe(dev, PTR_ERR(panel->supply),
+				     "Failed to get power supply\n");
+
+	panel->el_on3_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(panel->el_on3_gpio))
+		return dev_err_probe(dev, PTR_ERR(panel->el_on3_gpio),
+				     "Failed to get enable GPIO\n");
+
+	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
+	if (!panel->no_hpd) {
+		panel->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+		if (IS_ERR(panel->hpd_gpio))
+			return dev_err_probe(dev, PTR_ERR(panel->hpd_gpio),
+					     "Failed to get HPD GPIO\n");
+	}
+
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev,  atana33xc20_runtime_disable, dev);
+	if (ret)
+		return ret;
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_add_action_or_reset(dev,  atana33xc20_dont_use_autosuspend, dev);
+	if (ret)
+		return ret;
+
+	drm_panel_init(&panel->base, dev, &atana33xc20_funcs, DRM_MODE_CONNECTOR_eDP);
+
+	pm_runtime_get_sync(dev);
+	ret = drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register dp aux backlight\n");
+
+	drm_panel_add(&panel->base);
+
+	return 0;
+}
+
+static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
+{
+	struct device *dev = &aux_ep->dev;
+	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
+
+	drm_panel_remove(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+
+	kfree(panel->edid);
+}
+
+static void atana33xc20_shutdown(struct dp_aux_ep_device *aux_ep)
+{
+	struct device *dev = &aux_ep->dev;
+	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
+
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+}
+
+static const struct of_device_id atana33xc20_dt_match[] = {
+	{ .compatible = "samsung,atna33xc20", },
+	{ /* sentinal */ }
+};
+MODULE_DEVICE_TABLE(of, atana33xc20_dt_match);
+
+static const struct dev_pm_ops atana33xc20_pm_ops = {
+	SET_RUNTIME_PM_OPS(atana33xc20_suspend, atana33xc20_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct dp_aux_ep_driver atana33xc20_driver = {
+	.driver = {
+		.name		= "samsung_atana33xc20",
+		.of_match_table = atana33xc20_dt_match,
+		.pm		= &atana33xc20_pm_ops,
+	},
+	.probe = atana33xc20_probe,
+	.remove = atana33xc20_remove,
+	.shutdown = atana33xc20_shutdown,
+};
+
+static int __init atana33xc20_init(void)
+{
+	return dp_aux_dp_driver_register(&atana33xc20_driver);
+}
+module_init(atana33xc20_init);
+
+static void __exit atana33xc20_exit(void)
+{
+	dp_aux_dp_driver_unregister(&atana33xc20_driver);
+}
+module_exit(atana33xc20_exit);
+
+MODULE_DESCRIPTION("Samsung ATANA33XC20 Panel Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0.554.ge1b32706d8-goog

