Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AFBE2816
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B929310E9A2;
	Thu, 16 Oct 2025 09:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="TJki4VKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C2310E9A2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:50:59 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-339d53f4960so546303a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1760608259; x=1761213059; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFs3EGtGlK6OwlG3/AgKjm9aiJuGxxNuTS0QmzI5toQ=;
 b=TJki4VKob/DLiO30GaoeiU87bJV8EnHtVSVTu67JqrFJVQYFz5smDxdkG1wyiUD2N+
 Niij/3HJCBtlh/bTFWh/LFwApg8th8gBgraAnZ45szH7V6TF6N9KJxeWRbc7taCFrmv2
 zLgxvDYQyY86kxCkqv8R8sMTxkSlqHTcpovw1aXaYKzAEtWoR+jHCTXwb/sydF+nQCzC
 0VZrruqMmj3S94nUJGySTxj0FSoQKj3q/CbmhArIGx2jS67dbTHW1A3Tp2GSke85a6cf
 rOw+j9cua7rDInIJ9z3zG/rP/nXLGusWedjcRHaWOR/m8+6iTSha3FUaKSMaBeeKlP8n
 eWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760608259; x=1761213059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFs3EGtGlK6OwlG3/AgKjm9aiJuGxxNuTS0QmzI5toQ=;
 b=Wt6pdRN8cofx8OnwRc7eXrd9UFhJn+2H9UmTDMWeNjT1xONllnQhHZJFdGH1CFIAvh
 5cZKe/pE+saE8C2pQc7B+wV9OyhbtEyV1my5m4gVDUH0bNc4ypOdXDHhIl12QHQZUi1P
 eDk22ka+nXVD1g3I/vy/g+EzRHLfheqpLL+mwgoRH1BFRbBxSwal16sE0qVwvmeNLcsx
 l+s7krqlEp3chRmT2qRKP8hrp2V2rREJ0jjFNcqVCXrcKYDw4K4bKYc4RfKiUvfKNFYH
 odDO1GTVjeXc4ikPmCenNaiqhzvIdjhK7Jg53Rpl6migGnZATAEbHWAXPF/zM/ufDa3T
 gaMA==
X-Gm-Message-State: AOJu0YxW13f2NUYI8z7XhI6x1OHmuqQaMM0tMnvR7+rO/0lNdzuH8pmT
 rduyKOAxgjUpjptO1UkIYwVcl3s5mDN6CSly0BUvxfgX3kqKgCKquVJfh5y4RYFSuUg3jrI3q+g
 gLdLa
X-Gm-Gg: ASbGnctJLFvhZ74vntlCoSHvKtwE04p5yAhUhUYv6xEhJn/t9aD3HjLoOllHQHWVrzK
 BygYjb8Wljf9PxQk0gF9DMt6d+mJv3pdNFoKXhS8DV0WbozVxhS4oBZD0xg97/agXJE4VHl7f+0
 Ls01FgCAceumZX/ijbrigP0Hde6sEuf9WhmuyjIc20zFdorLrUaH//yESmrEX6nmwUhYIC6ozHu
 jqyIKCdLkiJowLJhDWNmtij2VEBWmOjWx3WZeQMi9REzuj+KSPKHT0DIYlKf5SmyugVU+IWQgKL
 Nu80B6f3gXGozhDfAbwepDgvRW3znAaujrmUysn+hH1oXD6sv4Y9MenHC3qwCPT0ps4Tp8nOTLA
 WA7d9VAcJmQU1isT1NtT5iIjK8p7tVhfYuSWTTYm0cnqB6n/PT3f8Cu8u1ncTyxuMJrBWOx4/WQ
 aUVVIfchD83X/npPl+UVBaluLZLD+Y++triaCWNQNZIhrmDoR6byu5iY4aog==
X-Google-Smtp-Source: AGHT+IE1EUi1+7BD9Qmr9q3KVeE2U3k6HZTCCxGbpg+g2pzJT8BF4zuNi1u/SE9s6oHhJCVragcTew==
X-Received: by 2002:a17:90b:4a0b:b0:330:6f16:c4e0 with SMTP id
 98e67ed59e1d1-33b5116a4b1mr45144549a91.12.1760608258877; 
 Thu, 16 Oct 2025 02:50:58 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33bb6519421sm1272402a91.1.2025.10.16.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 02:50:58 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/2] drm/panel: Add driver for Ilitek IL79900A-based panels
Date: Thu, 16 Oct 2025 17:50:43 +0800
Message-Id: <20251016095043.1694736-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
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

Add a DRM panel driver for the Ilitek IL79900A MIPI-DSI LCD controller.

The controller is used in panels such as the Tianma TL121BVMS07-00.
It requires multiple power supplies (AVDD, AVEE, 1.8V logic), an enable
GPIO, and a backlight device.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-il79900a.c | 358 ++++++++++++++++++
 1 file changed, 358 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

diff --git a/drivers/gpu/drm/panel/panel-ilitek-il79900a.c b/drivers/gpu/drm/panel/panel-ilitek-il79900a.c
new file mode 100644
index 000000000000..22338bef5609
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-il79900a.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Panels based on the Ilitek IL79900A display controller.
+ *
+ * Based on drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+ */
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct il79900a;
+
+/*
+ * Use this descriptor struct to describe different panels using the
+ * Ilitek IL79900A display controller.
+ */
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned int bpc;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	int (*init)(struct il79900a *boe);
+	unsigned int lanes;
+};
+
+struct il79900a {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	const struct panel_desc *desc;
+
+	enum drm_panel_orientation orientation;
+	struct regulator *pp1800;
+	struct regulator *avee;
+	struct regulator *avdd;
+	struct gpio_desc *enable_gpio;
+};
+
+/* IL79900A-specific commands, add new commands as you decode them */
+#define IL79900A_DCS_SWITCH_PAGE	0xFF
+
+#define il79900a_switch_page(ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(ctx, IL79900A_DCS_SWITCH_PAGE, \
+				     0x5a, 0xa5, (page))
+
+static int tianma_il79900a_init(struct il79900a *ili)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+
+	mipi_dsi_usleep_range(&ctx, 5000, 5100);
+
+	il79900a_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
+
+	il79900a_switch_page(&ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
+
+	il79900a_switch_page(&ctx, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
+
+	il79900a_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
+
+	il79900a_switch_page(&ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+
+	mipi_dsi_msleep(&ctx, 120);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
+
+	mipi_dsi_msleep(&ctx, 80);
+
+	return 0;
+};
+
+static inline struct il79900a *to_il79900a(struct drm_panel *panel)
+{
+	return container_of(panel, struct il79900a, base);
+}
+
+static int il79900a_enter_sleep_mode(struct mipi_dsi_multi_context *ctx)
+{
+	mipi_dsi_dcs_set_display_off_multi(ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(ctx);
+	return ctx->accum_err;
+}
+
+static int il79900a_disable(struct drm_panel *panel)
+{
+	struct il79900a *ili = to_il79900a(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+	int ret;
+
+	il79900a_switch_page(&ctx, 0x00);
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
+	ret = il79900a_enter_sleep_mode(&ctx);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_msleep(&ctx, 150);
+
+	return 0;
+}
+
+static int il79900a_unprepare(struct drm_panel *panel)
+{
+	struct il79900a *ili = to_il79900a(panel);
+
+	gpiod_set_value(ili->enable_gpio, 0);
+	usleep_range(1000, 2000);
+	regulator_disable(ili->avee);
+	regulator_disable(ili->avdd);
+	usleep_range(5000, 7000);
+	regulator_disable(ili->pp1800);
+
+	return 0;
+}
+
+static int il79900a_prepare(struct drm_panel *panel)
+{
+	struct il79900a *ili = to_il79900a(panel);
+	int ret;
+
+	gpiod_set_value(ili->enable_gpio, 0);
+	usleep_range(1000, 1500);
+
+	ret = regulator_enable(ili->pp1800);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(3000, 5000);
+
+	ret = regulator_enable(ili->avdd);
+	if (ret < 0)
+		goto poweroff1v8;
+	ret = regulator_enable(ili->avee);
+	if (ret < 0)
+		goto poweroffavdd;
+
+	usleep_range(10000, 11000);
+
+	// MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high
+	ret = mipi_dsi_dcs_nop(ili->dsi);
+	if (ret < 0) {
+		dev_err(&ili->dsi->dev, "Failed to send NOP: %d\n", ret);
+		goto poweroff;
+	}
+	usleep_range(1000, 2000);
+
+	gpiod_set_value(ili->enable_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(ili->enable_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value(ili->enable_gpio, 1);
+	usleep_range(20000, 21000);
+
+	ret = ili->desc->init(ili);
+	if (ret < 0)
+		goto poweroff;
+
+	return 0;
+
+poweroff:
+	gpiod_set_value(ili->enable_gpio, 0);
+	regulator_disable(ili->avee);
+poweroffavdd:
+	regulator_disable(ili->avdd);
+poweroff1v8:
+	usleep_range(5000, 7000);
+	regulator_disable(ili->pp1800);
+
+	return ret;
+}
+
+static int il79900a_enable(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static const struct drm_display_mode tianma_il79900a_default_mode = {
+	.clock = 264355,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 20,
+	.hsync_end = 1600 + 20 + 4,
+	.htotal = 1600 + 20 + 4 + 20,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 82,
+	.vsync_end = 2560 + 82 + 2,
+	.vtotal = 2560 + 82 + 2 + 36,
+	.width_mm = 163,
+	.height_mm = 260,
+};
+
+static const struct panel_desc tianma_il79900a_desc = {
+	.modes = &tianma_il79900a_default_mode,
+	.bpc = 8,
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init = tianma_il79900a_init,
+};
+
+static int il79900a_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct il79900a *ili = to_il79900a(panel);
+	const struct drm_display_mode *m = ili->desc->modes;
+	int num_modes;
+
+	num_modes = drm_connector_helper_get_modes_fixed(connector, m);
+	if (num_modes <= 0)
+		return 0;
+
+	connector->display_info.bpc = ili->desc->bpc;
+
+	return num_modes;
+}
+
+static enum drm_panel_orientation il79900a_get_orientation(struct drm_panel *panel)
+{
+	struct il79900a *ili = to_il79900a(panel);
+
+	return ili->orientation;
+}
+
+static const struct drm_panel_funcs il79900a_funcs = {
+	.disable = il79900a_disable,
+	.unprepare = il79900a_unprepare,
+	.prepare = il79900a_prepare,
+	.enable = il79900a_enable,
+	.get_modes = il79900a_get_modes,
+	.get_orientation = il79900a_get_orientation,
+};
+
+static int il79900a_add(struct il79900a *ili)
+{
+	struct device *dev = &ili->dsi->dev;
+	int err;
+
+	ili->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(ili->avdd))
+		return PTR_ERR(ili->avdd);
+
+	ili->avee = devm_regulator_get(dev, "avee");
+	if (IS_ERR(ili->avee))
+		return PTR_ERR(ili->avee);
+
+	ili->pp1800 = devm_regulator_get(dev, "pp1800");
+	if (IS_ERR(ili->pp1800))
+		return PTR_ERR(ili->pp1800);
+
+	ili->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ili->enable_gpio)) {
+		dev_err(dev, "cannot get reset-gpios %ld\n",
+			PTR_ERR(ili->enable_gpio));
+		return PTR_ERR(ili->enable_gpio);
+	}
+
+	gpiod_set_value(ili->enable_gpio, 0);
+
+	drm_panel_init(&ili->base, dev, &il79900a_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
+	if (err < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return err;
+	}
+
+	err = drm_panel_of_backlight(&ili->base);
+	if (err)
+		return err;
+
+	ili->base.funcs = &il79900a_funcs;
+	ili->base.dev = &ili->dsi->dev;
+
+	drm_panel_add(&ili->base);
+
+	return 0;
+}
+
+static int il79900a_probe(struct mipi_dsi_device *dsi)
+{
+	struct il79900a *ili;
+	int ret;
+	const struct panel_desc *desc;
+
+	ili = devm_kzalloc(&dsi->dev, sizeof(*ili), GFP_KERNEL);
+	if (!ili)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	ili->desc = desc;
+	ili->dsi = dsi;
+	ret = il79900a_add(ili);
+	if (ret < 0)
+		return ret;
+
+	mipi_dsi_set_drvdata(dsi, ili);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&ili->base);
+
+	return ret;
+}
+
+static void il79900a_remove(struct mipi_dsi_device *dsi)
+{
+	struct il79900a *ili = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	if (ili->base.dev)
+		drm_panel_remove(&ili->base);
+}
+
+static const struct of_device_id il79900a_of_match[] = {
+	{ .compatible = "tianma,il79900a", .data = &tianma_il79900a_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, il79900a_of_match);
+
+static struct mipi_dsi_driver il79900a_driver = {
+	.driver = {
+		.name = "panel-il79900a",
+		.of_match_table = il79900a_of_match,
+	},
+	.probe = il79900a_probe,
+	.remove = il79900a_remove,
+};
+module_mipi_dsi_driver(il79900a_driver);
+
+MODULE_AUTHOR("Langyan Ye <yelangyan@huaqin.corp-partner.google.com>");
+MODULE_DESCRIPTION("Ilitek IL79900A-based panels driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

