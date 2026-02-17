Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DexDaWxk2kK7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:09:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32A14835D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB010E412;
	Tue, 17 Feb 2026 00:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcFqRaHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A222210E412
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:09:05 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-506984b6d83so33667921cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771286945; x=1771891745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZSyqzJsc7mwiDZ+ttivOXehqly7aCETswTJzVmvER4=;
 b=hcFqRaHmRH1l7XONE3NqQ71kqveCDOgM5BaY7Hv5GKaODcAx/6F9Du0ryYeuJGRUue
 IJq9aT45pzPdkAv9dXLMUgMZJObSSNsO5ZVWmfPDRK8NiPJUwXfodd2JXM+MMUTUx2hO
 TTYYf+M1bB6WVEhC4dvtVbagDE1MsjSvfSZ6jHDkMx1STzYeWPpgWJJ2j+4Ye8597Q3m
 dztepNaB5/Ude6zkcq9ZtUlZx1cPkTK9noAMb6C/5NoxRzIGEHJvEyQZ6pe962c31fIy
 6gvj1zwrAfwbZsqvlM4g0KvfkzT5UQmw+NFfjYeM+ShQpIqtyDE5Dqgqp7LAwjnVrIas
 HHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771286945; x=1771891745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fZSyqzJsc7mwiDZ+ttivOXehqly7aCETswTJzVmvER4=;
 b=GyVwwc6+4H+LmCA0vrOTkAQE9xoN6uQpOjbkNSOP4gGiBaxCuhOXkNFjslKJ//k6Cs
 J4AIZu38CVMMksOu6ReOLygqDtmPbqgDRjRkM+JkNEMMa8Ru9MG41xyZ6ihC74fU+0A6
 DRmJ3La65yWYsvsODu7cR0ySP+RXX7GzVlNbA6yAaH4/+hKe2DhRHHjYODu9XIvI204X
 rroEIReT1x4oykGVU/DZGvVnkrvD2s7B/gwPfLWnoFi6HNlL7ndrCkL0W3kBs3EllVof
 ghK/cOUUQO6HGcI9CpU6cKRs5iq30Az04mroqszyFJYdcXuHboFtqMZbN7YO04u7/mKb
 M24g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmK4Et7dPKflWUmt4D05CqP5oneOjCrcYHnbkjKQJIQL7pmgbP8H9da6NRuC302msZ1+WG7GzP+l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu/XrwfoFUnfaz7tDB59c2/E21DRgpJa9f+E2REoHy+bJ1I91I
 Aiq5ebs5K+ua+R5gTVgOnRSH//dCGJvRmImujC2wanQUY+JVaQJvhFAP
X-Gm-Gg: AZuq6aIa4bzLS1yaT1ZQ9GM7EIwBlJwOuh+glgo2gQgZ8qERqQSi654Jkyvw3IkqxCf
 INUztDH9AGQBoOaCUnnIqW+3vWhVZF3aEMxwL4huZy9vR6soB2Q3EJvKVc+/BTYRWiFGv5foMGq
 wGWN8xj8k1pCSC5/4va/tCGjC0WHgHTNmNKfhVq/aaAHdeZwVbHYanjztoJ8UtcCdqZyE9W0gEQ
 JDXYLtrGyhhN49vOLe3gGtZNu0r1M0mbzLo0nrg6JjoxPDkfKB1GXJq13G+M7XJdSQ/k51tUo+a
 pYUgfv7f4SQznQaAE2KpQ/+Pb8FcEy/ZHCKqRCzzrKjWKj9yD22epX971zS2wm2nuhvd3Tuui8z
 J8zOtWgk+QP15HoESdYtkUN9wAluF4dUNGmCXTk1ZhDxiZ1Odf9Z7QVpNhbaW1kWzX/5Y/HlAPC
 DLHOtCMBkjwLRV6+ix+h8U/I1epPSovQ==
X-Received: by 2002:a05:622a:1ba9:b0:4e8:838d:1992 with SMTP id
 d75a77b69052e-506a836444cmr161321341cf.63.1771286944499; 
 Mon, 16 Feb 2026 16:09:04 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cddb9efsm171494546d6.51.2026.02.16.16.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 16:09:04 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Date: Mon, 16 Feb 2026 19:08:51 -0500
Message-ID: <20260217000854.131242-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F32A14835D
X-Rspamd-Action: no action

Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
the aid of linux-mdss-dsi-panel-driver-generator.

Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Tested-by: Yifei Zhan <yifei@zhan.science>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 ++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 76f6af819037..138d617e8195 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -553,6 +553,15 @@ config DRM_PANEL_NOVATEK_NT36672E
 	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
 	  RGB per pixel.
 
+config DRM_PANEL_NOVATEK_NT37700F
+	tristate "Novatek NT37700F DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Novatek NT37700F DSI
+	  panel module. The panel has a resolution of 1080x2160.
+
 config DRM_PANEL_NOVATEK_NT37801
 	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb3..9218a7d7ff34 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
new file mode 100644
index 000000000000..e7e6343b2963
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, The Linux Foundation. All rights reserved.
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct nt37700f_tianma {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline
+struct nt37700f_tianma *to_nt37700f_tianma(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt37700f_tianma, panel);
+}
+
+static void nt37700f_tianma_reset(struct nt37700f_tianma *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int nt37700f_tianma_on(struct nt37700f_tianma *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x2b, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x04, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x01);
+
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 2160 - 1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0, 0x11, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x20);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37700f_tianma_disable(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37700f_tianma_prepare(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	nt37700f_tianma_reset(ctx);
+
+	ret = nt37700f_tianma_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nt37700f_tianma_unprepare(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	return 0;
+}
+
+static const struct drm_display_mode nt37700f_tianma_mode = {
+	.clock = (1080 + 32 + 32 + 98) * (2160 + 32 + 4 + 98) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 32,
+	.hsync_end = 1080 + 32 + 32,
+	.htotal = 1080 + 32 + 32 + 98,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 32,
+	.vsync_end = 2160 + 32 + 4,
+	.vtotal = 2160 + 32 + 4 + 98,
+	.width_mm = 69,
+	.height_mm = 137,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int nt37700f_tianma_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &nt37700f_tianma_mode);
+}
+
+static const struct drm_panel_funcs nt37700f_tianma_panel_funcs = {
+	.prepare = nt37700f_tianma_prepare,
+	.unprepare = nt37700f_tianma_unprepare,
+	.disable = nt37700f_tianma_disable,
+	.get_modes = nt37700f_tianma_get_modes,
+};
+
+static int nt37700f_tianma_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int nt37700f_tianma_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops nt37700f_tianma_bl_ops = {
+	.update_status = nt37700f_tianma_bl_update_status,
+	.get_brightness = nt37700f_tianma_bl_get_brightness,
+};
+
+static struct backlight_device *
+nt37700f_tianma_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 2047,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &nt37700f_tianma_bl_ops, &props);
+}
+
+static int nt37700f_tianma_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nt37700f_tianma *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &nt37700f_tianma_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = nt37700f_tianma_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void nt37700f_tianma_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt37700f_tianma *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id nt37700f_tianma_of_match[] = {
+	{ .compatible = "novatek,nt37700f" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nt37700f_tianma_of_match);
+
+static struct mipi_dsi_driver nt37700f_tianma_driver = {
+	.probe = nt37700f_tianma_probe,
+	.remove = nt37700f_tianma_remove,
+	.driver = {
+		.name = "panel-novatek-nt37700f",
+		.of_match_table = nt37700f_tianma_of_match,
+	},
+};
+module_mipi_dsi_driver(nt37700f_tianma_driver);
+
+MODULE_DESCRIPTION("DRM driver for nt37700f cmd mode dsi tianma panel");
+MODULE_LICENSE("GPL");
-- 
2.53.0

