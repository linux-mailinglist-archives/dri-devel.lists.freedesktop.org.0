Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36D3EE296
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED66E0C4;
	Tue, 17 Aug 2021 01:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22516E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f2so8517219ljn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
 b=kn4kT2Hz//hHPdVcdZ/vDzNa1AeB3fmoQ2KajKAe8K7HeAMLN9J+RLJn4O28AknXce
 O2Uwz+3Yl0HQPwUdJJ7gnzB+AAvuNYEvsVKU5gzzehu4Ot/microMtTIcN2BWF9rXCaz
 B8yn4zAA/jxH8Gy0lwR0fopTYPFhuNd2yvKwuGedIegQZfEuPz+7R7Lfy/3hj0LXXZRu
 /2zacj4fZCA9HTFFaFNhgAdlvb+Sffe0y/0KJLEluMiCSdWTI1ZcpPIFPI8Lfvx35l+v
 IjrIHeypjpz8Nd6Z+KW5WqXJWbCNUfPhk2W6I1nnjI74cdD5bp9O6HY8in4VjsotEekV
 Tl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
 b=PmaojqIo6Ax8j+pmMcyG7FBIATMPIfMOF+cSr3QjwQLc9akMlY3CHZ3YfmC5vxqZxW
 mv07D+XFyCbn9PliB0coEDAHDgTAakDGewAkbK+T3AXSfP5yORuTW1S9uCYv2aOKiX2l
 wcN6cD7lW4jq8t4PWRXPem6U+mHA/eLi0q7AjH8DfGb22PZqAzboXWcAuj8HdKbbVKq+
 wi178fxAQ+aGtnwuIhwq7XBDONKrAioi/SRjryseghIZNBS9AJ3MMCHfyEU0596D9iPB
 JEpICCkb3I3guqEemCgWotahY19a0ufsTSZMzEIPjLxQyS3dPev+n1uYiMXBJElIeeG0
 9Wtw==
X-Gm-Message-State: AOAM5307VY3D6BybwT0/dC0Nrd7wniKv2kfz0D+qQzWb5tq0shgx+AIS
 WvgFiAqlFX4qXP2+3uhM064=
X-Google-Smtp-Source: ABdhPJzs3U6yU/CHeEWumMqhudKOiOVdPxHW87EZcifX16I4zyesaHC8qzahhba2hNw8USFhBY7eAw==
X-Received: by 2002:a2e:9593:: with SMTP id w19mr836879ljh.323.1629163817004; 
 Mon, 16 Aug 2021 18:30:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 13/34] drm/tegra: hdmi: Add OPP support
Date: Tue, 17 Aug 2021 04:27:33 +0300
Message-Id: <20210817012754.8710-14-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..aa13028480f7 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -11,10 +11,13 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -1195,7 +1198,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
+	err = dev_pm_opp_set_rate(hdmi->dev, hdmi->pixel_clock);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
 			err);
@@ -1516,6 +1519,12 @@ static int tegra_hdmi_runtime_resume(struct host1x_client *client)
 		return err;
 	}
 
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		goto put_rpm;
+	}
+
 	err = clk_prepare_enable(hdmi->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable clock: %d\n", err);
@@ -1708,6 +1717,10 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_output_probe(&hdmi->output);
 	if (err < 0)
 		return err;
-- 
2.32.0

