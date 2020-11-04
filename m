Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6E2A78E8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A606EA03;
	Thu,  5 Nov 2020 08:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AF16E8FC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o13so282067ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgpC9O7p/OAbvh12N5zLQDhJcy20uIqx4wfuP8pHu74=;
 b=ghbtZSMEyXcmLVB3hLpNnX5/udQFezvG/2hSl1wmkaCE3ebcGcvcSojmt2uCoR5gkT
 nXNSJesVEBCqcR7j9rDF/7IRD5BXGLxC6r6i0a9/l9IoCV78c6W9ahrYAQQaDq8AUKQ8
 mSAA1G0RputJJmFKqqHTKOKFlyCGOx6zK5kcZehKi8tGvx87G59fw9no+H91R0P+WOsS
 Dxg9Mm5ZtB9BVHzsE0hjR4RUN0Kuxjyu1hia/dVcDBx7jbnDgbEpVnXmLHTlHg5FKNED
 zbXuhDkgiic8O6NBhvHxVT0SaHnKF/Jg6AcW9fYaOyOYtj6g2kx1C/d23xvmU2TogHgj
 Psyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgpC9O7p/OAbvh12N5zLQDhJcy20uIqx4wfuP8pHu74=;
 b=TBlbBq2/gZ+1b31HkUyfI30mGtbQuAJB3EXfIgN1MFV7yvfK7K7VVHPRbRntELk2ze
 T2CjEQFBcp4fOT4afQ4QXMpDcewX5eALRRYaQFilivGuSHs9jXG5mVJyXCvAMV7lCI34
 wI3KYGtrIQ5rSt3YNx/q3Hzbp9dU4X1KqX+AWHjQ21jg0+fTMMOZZnPOzSJ5rHXsqlLo
 /vzG0kljVY5yrvXlDpsbem7aNwZ8dMTlDgBYQIKa+0eGFeaPAFam8KynqEXbDShOh9Lb
 dXs8CSA5rbKNdBtoNtlbqcdTYk0jmFtLU92k5pmyKh6UC3BvDXd/3KjwGGILVQBVScUB
 j7bg==
X-Gm-Message-State: AOAM533GN4EihKFNy0fynZ0rPjnMNerYbpdOVtVIb3RvYQKUIzplNEYU
 Q3ix9dizUb4jL52vnongf5I=
X-Google-Smtp-Source: ABdhPJy08/f9Nhc8TmMhOuQfKj8d3M/5mqEeMTx5szZf2O3+2Ayf51uokSeK1yXKThLP7IivwNirNA==
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr126990lji.67.1604533514181;
 Wed, 04 Nov 2020 15:45:14 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:13 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 13/30] drm/tegra: gr2d: Support OPP and SoC core voltage
 scaling
Date: Thu,  5 Nov 2020 02:44:10 +0300
Message-Id: <20201104234427.26477-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP and SoC core voltage scaling support to the GR2D driver.
This is required for enabling system-wide DVFS on Tegra SoCs.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 136 +++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index f30aa86e4c9f..6d8f9419d908 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -7,6 +7,9 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
+
+#include <soc/tegra/fuse.h>
 
 #include "drm.h"
 #include "gem.h"
@@ -185,6 +188,135 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_VA_BASE_ADDR_SB,
 };
 
+static int gr2d_init_opp_state(struct device *dev, struct gr2d *gr2d)
+{
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+	int err;
+
+	/*
+	 * If voltage regulator presents, then we could select the fastest
+	 * clock rate, but driver doesn't support power management and
+	 * frequency scaling yet, hence the top freq OPP will vote for a
+	 * very high voltage that will produce lot's of heat.  Let's select
+	 * OPP for the current/default rate for now.
+	 *
+	 * Clock rate should be pre-initialized (i.e. it's non-zero) either
+	 * by clock driver or by assigned clocks in a device-tree.
+	 */
+	rate = clk_get_rate(gr2d->clk);
+
+	/* find suitable OPP for the clock rate supportable by SoC speedo ID */
+	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
+
+	/*
+	 * dev_pm_opp_set_rate() doesn't search for a floor clock rate and it
+	 * will error out if default clock rate is too high, i.e. unsupported
+	 * by a SoC hardware version.  Hence will find floor rate by ourselves.
+	 */
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dev, &rate);
+
+	err = PTR_ERR_OR_ZERO(opp);
+	if (err) {
+		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
+			rate, err);
+		return err;
+	}
+
+	dev_pm_opp_put(opp);
+
+	/*
+	 * First dummy rate-set initializes voltage vote by setting voltage
+	 * in accordance to the clock rate.  We need to do this because GR2D
+	 * currently doesn't support power management and clock is permanently
+	 * enabled.
+	 */
+	err = dev_pm_opp_set_rate(dev, rate);
+	if (err) {
+		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void gr2d_deinit_opp_table(void *data)
+{
+	struct device *dev = data;
+	struct opp_table *opp_table;
+
+	opp_table = dev_pm_opp_get_opp_table(dev);
+	dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_supported_hw(opp_table);
+	dev_pm_opp_put_regulators(opp_table);
+	dev_pm_opp_put_opp_table(opp_table);
+}
+
+static int devm_gr2d_init_opp_table(struct device *dev, struct gr2d *gr2d)
+{
+	struct opp_table *opp_table, *hw_opp_table;
+	const char *rname = "core";
+	u32 hw_version;
+	int err;
+
+	/* voltage scaling is optional */
+	if (device_property_present(dev, "core-supply"))
+		opp_table = dev_pm_opp_set_regulators(dev, &rname, 1);
+	else
+		opp_table = dev_pm_opp_get_opp_table(dev);
+
+	if (IS_ERR(opp_table))
+		return dev_err_probe(dev, PTR_ERR(opp_table),
+				     "failed to prepare OPP table\n");
+
+	if (gr2d->soc->version == 0x20)
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	hw_opp_table = dev_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(hw_opp_table);
+	if (err) {
+		dev_err(dev, "failed to set supported HW: %d\n", err);
+		goto put_table;
+	}
+
+	/*
+	 * OPP table presence is optional and we want the set_rate() of OPP
+	 * API to work similarly to clk_set_rate() if table is missing in a
+	 * device-tree.  The add_table() errors out if OPP is missing in DT.
+	 */
+	if (device_property_present(dev, "operating-points-v2")) {
+		err = dev_pm_opp_of_add_table(dev);
+		if (err) {
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+			goto put_hw;
+		}
+
+		err = gr2d_init_opp_state(dev, gr2d);
+		if (err)
+			goto remove_table;
+	}
+
+	err = devm_add_action(dev, gr2d_deinit_opp_table, dev);
+	if (err)
+		goto remove_table;
+
+	dev_info(dev, "OPP HW ver. 0x%x\n", hw_version);
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(dev);
+put_hw:
+	dev_pm_opp_put_supported_hw(opp_table);
+put_table:
+	dev_pm_opp_put_regulators(opp_table);
+
+	return err;
+}
+
 static int gr2d_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -209,6 +341,10 @@ static int gr2d_probe(struct platform_device *pdev)
 		return PTR_ERR(gr2d->clk);
 	}
 
+	err = devm_gr2d_init_opp_table(dev, gr2d);
+	if (err)
+		return dev_err_probe(dev, err, "failed to initialize OPP\n");
+
 	err = clk_prepare_enable(gr2d->clk);
 	if (err) {
 		dev_err(dev, "cannot turn on clock\n");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
