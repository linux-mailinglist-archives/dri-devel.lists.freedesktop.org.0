Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D602A78F3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC2F6E9CA;
	Thu,  5 Nov 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86F6E864
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:07 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h6so183490lfj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8io/AuwE9hSBV+UikMlwrOCtvobyeL+cVj0iobaBFjY=;
 b=RYHHskPJkgL8RbvQMCrIVAd/fnOIhkTQ7wgOEfNNTfAdG5lHXkftQLRxy5hk4POBGp
 a7fJhZFX1tG1CyGd12dsPam7clbL5rpBMlgr9SnrNFcKFT1attyKsxu5dSt2CxGxGgt9
 0/rI5A9TWa6bvDJqQO/RT5IfF1TXpDigjhYZ1a2vbIwVfPJVBKN2cntipdDXzs0d3JLY
 C2E7CZ00Ow0Ewuq8AhJagmHq7ZQ+QpMYocFnngpmju4+fhIN0de+/bbrctY7MyBOeYmy
 4t3RRE5LSW6sgjWbEyw9zUFePUAedZjPr0YLF1ysQRvJWsBvoQMGZTvL9yGxNO3F2iQ6
 JTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8io/AuwE9hSBV+UikMlwrOCtvobyeL+cVj0iobaBFjY=;
 b=ZivoX1YuMk3hPP+DT3l4A/F+NdsId8By3ZtFvL5qilSFx/nNfQgFzQoowgm7FTBccV
 fiEyhFVrFgaOsUNSxDU6qxQxoOioIXYGP06CSwEcQXK89G4cSjW2Aq4PnY4qA1lI31Rz
 WWMc0fyrrm0QcTUHfSXsaONXAueYkRzedSE9kJcjgpg86oY65AmXHSqGO/5btBWMYhRM
 LcReRJko7o/0L+EdkL22/0x4CeYQkQUHjh7L2Ye+kvDksU9Nkdotbhj1ozjQEhXzYrGR
 93JZuP/pSVAvsD5L/rxSbMUCIYAIW5Fw1ILTlTi1ItBBTdchRNlNYXmCanpx4UD+xviV
 Lxrg==
X-Gm-Message-State: AOAM532l2FgeqqVwWQNnvkUx3Z9YUd0+3nMJDQitnk16gq98nfyWxlQN
 RI1RX++K29wsAhDPt9NQrdA=
X-Google-Smtp-Source: ABdhPJzlkxK6JlDq7/JyguBWUauzapYlz0OXSjqbTR9Fc6MhZ6ofAqWYcl08mCtkPyVFyjp3Fqzsfw==
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr37374lfs.433.1604533505864; 
 Wed, 04 Nov 2020 15:45:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:05 -0800 (PST)
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
Subject: [PATCH v1 07/30] soc/tegra: Add sync state API
Date: Thu,  5 Nov 2020 02:44:04 +0300
Message-Id: <20201104234427.26477-8-digetx@gmail.com>
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

Introduce sync state API that will be used by Tegra device drivers. This
new API is primarily needed for syncing state of SoC devices that are left
ON after bootloader or permanently enabled. All these devices belong to a
shared CORE voltage domain, and thus, we needed to bring all the devices
into expected state before the voltage scaling could be performed.

All drivers of DVFS-critical devices shall sync theirs the state before
Tegra's voltage regulator coupler will be allowed to perform a system-wide
voltage scaling.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 152 ++++++++++++++++++++++++++++++++++++-
 include/soc/tegra/common.h |  22 ++++++
 2 files changed, 170 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 3dc54f59cafe..f9b2b6f57887 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -3,13 +3,52 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#define dev_fmt(fmt)	"%s: " fmt, __func__
+#define pr_fmt(fmt)	"%s: " fmt, __func__
+
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <soc/tegra/common.h>
 
+#define terga_soc_for_each_device(__dev) \
+	for ((__dev) = tegra_soc_devices; (__dev) && (__dev)->compatible; \
+	     (__dev)++)
+
+struct tegra_soc_device {
+	const char *compatible;
+	const bool dvfs_critical;
+	unsigned int sync_count;
+};
+
+static DEFINE_MUTEX(tegra_soc_lock);
+static struct tegra_soc_device *tegra_soc_devices;
+
+/*
+ * DVFS-critical devices are either active at a boot time or permanently
+ * active, like EMC for example.  System-wide DVFS should be deferred until
+ * drivers of the critical devices synced theirs state.
+ */
+
+static struct tegra_soc_device tegra20_soc_devices[] = {
+	{ .compatible = "nvidia,tegra20-dc", .dvfs_critical = true, },
+	{ .compatible = "nvidia,tegra20-emc", .dvfs_critical = true, },
+	{ }
+};
+
+static struct tegra_soc_device tegra30_soc_devices[] = {
+	{ .compatible = "nvidia,tegra30-dc", .dvfs_critical = true, },
+	{ .compatible = "nvidia,tegra30-emc", .dvfs_critical = true, },
+	{ .compatible = "nvidia,tegra30-pwm", .dvfs_critical = true, },
+	{ }
+};
+
 static const struct of_device_id tegra_machine_match[] = {
-	{ .compatible = "nvidia,tegra20", },
-	{ .compatible = "nvidia,tegra30", },
+	{ .compatible = "nvidia,tegra20", .data = tegra20_soc_devices, },
+	{ .compatible = "nvidia,tegra30", .data = tegra30_soc_devices, },
 	{ .compatible = "nvidia,tegra114", },
 	{ .compatible = "nvidia,tegra124", },
 	{ .compatible = "nvidia,tegra132", },
@@ -17,7 +56,7 @@ static const struct of_device_id tegra_machine_match[] = {
 	{ }
 };
 
-bool soc_is_tegra(void)
+static const struct of_device_id *tegra_soc_of_match(void)
 {
 	const struct of_device_id *match;
 	struct device_node *root;
@@ -29,5 +68,110 @@ bool soc_is_tegra(void)
 	match = of_match_node(tegra_machine_match, root);
 	of_node_put(root);
 
-	return match != NULL;
+	return match;
+}
+
+bool soc_is_tegra(void)
+{
+	return tegra_soc_of_match() != NULL;
+}
+
+void tegra_soc_device_sync_state(struct device *dev)
+{
+	struct tegra_soc_device *soc_dev;
+
+	mutex_lock(&tegra_soc_lock);
+	terga_soc_for_each_device(soc_dev) {
+		if (!of_device_is_compatible(dev->of_node, soc_dev->compatible))
+			continue;
+
+		if (!soc_dev->sync_count) {
+			dev_err(dev, "already synced\n");
+			break;
+		}
+
+		/*
+		 * All DVFS-capable devices should have the CORE regulator
+		 * phandle.  Older device-trees don't have it, hence state
+		 * won't be synced for the older DTBs, allowing them to work
+		 * properly.
+		 */
+		if (soc_dev->dvfs_critical &&
+		    !device_property_present(dev, "core-supply")) {
+			dev_dbg(dev, "doesn't have core supply\n");
+			break;
+		}
+
+		soc_dev->sync_count--;
+		dev_dbg(dev, "sync_count=%u\n", soc_dev->sync_count);
+		break;
+	}
+	mutex_unlock(&tegra_soc_lock);
+}
+EXPORT_SYMBOL_GPL(tegra_soc_device_sync_state);
+
+bool tegra_soc_dvfs_state_synced(void)
+{
+	struct tegra_soc_device *soc_dev;
+	bool synced_state = true;
+
+	/*
+	 * CORE voltage scaling is limited until drivers of the critical
+	 * devices synced theirs state.
+	 */
+	mutex_lock(&tegra_soc_lock);
+	terga_soc_for_each_device(soc_dev) {
+		if (!soc_dev->sync_count || !soc_dev->dvfs_critical)
+			continue;
+
+		pr_debug_ratelimited("%s: sync_count=%u\n",
+				     soc_dev->compatible, soc_dev->sync_count);
+
+		synced_state = false;
+		break;
+	}
+	mutex_unlock(&tegra_soc_lock);
+
+	return synced_state;
+}
+
+static int __init tegra_soc_devices_init(void)
+{
+	struct device_node *np, *prev_np = NULL;
+	struct tegra_soc_device *soc_dev;
+	const struct of_device_id *match;
+
+	if (!soc_is_tegra())
+		return 0;
+
+	match = tegra_soc_of_match();
+	tegra_soc_devices = (void *)match->data;
+
+	/*
+	 * If device node is disabled in a device-tree, then we shouldn't
+	 * care about this device. Even if device is active during boot,
+	 * its clock will be disabled by CCF as unused.
+	 */
+	terga_soc_for_each_device(soc_dev) {
+		do {
+			/*
+			 * Devices like display controller have multiple
+			 * instances with the same compatible. Hence we need
+			 * to walk up the whole tree in order to account those
+			 * multiple instances.
+			 */
+			np = of_find_compatible_node(prev_np, NULL,
+						     soc_dev->compatible);
+			of_node_put(prev_np);
+			prev_np = np;
+
+			if (of_device_is_available(np)) {
+				pr_debug("added %s\n", soc_dev->compatible);
+				soc_dev->sync_count++;
+			}
+		} while (np);
+	}
+
+	return 0;
 }
+postcore_initcall_sync(tegra_soc_devices_init);
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 98027a76ce3d..d3ddb96d0fe2 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -6,6 +6,28 @@
 #ifndef __SOC_TEGRA_COMMON_H__
 #define __SOC_TEGRA_COMMON_H__
 
+#include <linux/types.h>
+
+struct device;
+
+#ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+void tegra_soc_device_sync_state(struct device *dev);
+bool tegra_soc_dvfs_state_synced(void);
+#else
+static inline bool soc_is_tegra(void)
+{
+	return false;
+}
+
+static inline void tegra_soc_device_sync_state(struct device *dev)
+{
+}
+
+static inline tegra_soc_dvfs_state_synced(void)
+{
+	return false;
+}
+#endif
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
