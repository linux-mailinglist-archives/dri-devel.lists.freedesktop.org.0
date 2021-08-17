Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830253EE23B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4916389A83;
	Tue, 17 Aug 2021 01:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636589A83
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z2so38240426lft.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+pDcrHtMJ3BfM+Az9yuVk7KyrEv5IezDZ4vndEOIZrQ=;
 b=c9mljDf/eNFjDgKd6lAZRYU+Sl1mj936K1QRTM3iyE/zX+e1BIkLLGB1mhFhPd7+Hk
 8PBHlZQE8QArWVeAYo7CCeEbj4E66qlF+JBkg67KAn3/wsCvbkgsJaw8cnHWtq39A7eV
 HmXwu53voVpa0MDeaC/fb+egJU5IhrqsVyTyb8G6ozaHw1HwnJsnoFGc+uQWUEAwQLoZ
 YIBRd6jE7RyINAErjUcu6PUE/1TbZf7eyhrk2BonebVjXj1+vdhtVN/V+UGaLX20DoOX
 k8OjjSU0YfqFyxkx8+FXwuY/clS/n4p8C1hTF6UEWhznMJm5iDlV+IXuGsE6dZZWvRV4
 d/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+pDcrHtMJ3BfM+Az9yuVk7KyrEv5IezDZ4vndEOIZrQ=;
 b=nwYcMUaxNG2irMp0h1nmoZpLFgs+DIL1/jkLEximFbKV2tAfOGf3PvY/m0H9bGrQZv
 4P3phdEnTL0idzXnc93E02aERA4vPniRDfad2zcUYpNCu59QFhyxGCjvMS56y8uGcPQz
 wCk49AZV/K/HD2PTq+dGeTV04gU2IplQppqo8KIKbewrdiN8s39Zg4hh1ttpw+h8Y2P4
 DUT8RnCIjPtwjLQP1HzW1/zQXN4p1+R7FUfR93xI6gO7ilENvQ3gstTG2Mjs4juf1ipa
 xMbuZBqz9h3PVOEe46wz9CakrQcfnfAmF2qDqcUNo6odA89hkyY2C4Z309VLsLmUt2TU
 3MEA==
X-Gm-Message-State: AOAM531KLrlUnLUznlCclxSoGq2BH9nJirZXxLPLYZbtdvPK2kbyQy0o
 nEFOc6JBZhYzskiIvM/cvuw=
X-Google-Smtp-Source: ABdhPJwz8UxSZOvdKUaNwcA+R7lsn7NPPjiIZX4N0ocLITK1s9++oNokkLZ+Jivbj0hSPfrQgeVN+Q==
X-Received: by 2002:ac2:428a:: with SMTP id m10mr514380lfh.636.1629163802638; 
 Mon, 16 Aug 2021 18:30:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:02 -0700 (PDT)
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
Subject: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Date: Tue, 17 Aug 2021 04:27:21 +0300
Message-Id: <20210817012754.8710-2-digetx@gmail.com>
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

Add dev_pm_opp_sync() helper which syncs OPP table with hardware state
and vice versa.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 42 +++++++++++++++++++++++++++++++++++++++---
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 5543c54dacc5..18016e49605f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -939,7 +939,8 @@ static int _set_required_opps(struct device *dev,
 	return ret;
 }
 
-static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
+static struct dev_pm_opp *
+_find_current_opp(struct device *dev, struct opp_table *opp_table)
 {
 	struct dev_pm_opp *opp = ERR_PTR(-ENODEV);
 	unsigned long freq;
@@ -961,7 +962,7 @@ static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
 		mutex_unlock(&opp_table->lock);
 	}
 
-	opp_table->current_opp = opp;
+	return opp;
 }
 
 static int _disable_opp_table(struct device *dev, struct opp_table *opp_table)
@@ -1003,7 +1004,7 @@ static int _set_opp(struct device *dev, struct opp_table *opp_table,
 
 	/* Find the currently set OPP if we don't know already */
 	if (unlikely(!opp_table->current_opp))
-		_find_current_opp(dev, opp_table);
+		opp_table->current_opp = _find_current_opp(dev, opp_table);
 
 	old_opp = opp_table->current_opp;
 
@@ -2931,3 +2932,38 @@ int dev_pm_opp_sync_regulators(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
+
+/**
+ * dev_pm_opp_sync() - Sync OPP state
+ * @dev:	device for which we do this operation
+ *
+ * Initialize OPP table accordingly to current clock rate or
+ * first available OPP if clock not available for this device.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_sync(struct device *dev)
+{
+	struct opp_table *opp_table;
+	struct dev_pm_opp *opp;
+	int ret = 0;
+
+	/* Device may not have OPP table */
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return 0;
+
+	if (!_get_opp_count(opp_table))
+		goto put_table;
+
+	opp = _find_current_opp(dev, opp_table);
+	ret = _set_opp(dev, opp_table, opp, opp->rate);
+	dev_pm_opp_put(opp);
+
+put_table:
+	/* Drop reference taken by _find_opp_table() */
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_sync);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 84150a22fd7c..686122b59935 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -168,6 +168,7 @@ int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
 void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_sync_regulators(struct device *dev);
+int dev_pm_opp_sync(struct device *dev);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -434,6 +435,11 @@ static inline int dev_pm_opp_sync_regulators(struct device *dev)
 	return -EOPNOTSUPP;
 }
 
+static inline int dev_pm_opp_sync(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)
-- 
2.32.0

