Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF02DDFE8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258A46E027;
	Fri, 18 Dec 2020 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1228B6E1F2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o17so56899275lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UVBePDvj8+JPmPnd9lky7oATp5P2thSWicPxP1xnR8=;
 b=aJbEbbQC/He+JGwsqe9/kWlEHU6l6eJbWVOB+YDfBF2TKFMQVztNRBn7FxxkGhbddC
 ev33yPj1MSIMzyO+TFiwew5f4KfWulf7oFRaBTCyv3TgOFe4ujYEo+I+Z7tTL1KNM9jb
 L13m6ejsc71Ofyfwl85z3HfWqR+upQ0tPHMikLcTSLd2xpjYhAO714ZZLJjjJnGvqT4l
 ZJNGw47xKKIA1sXCEKL2oXmxaJWoioML4IYpvBFET5w2EnSIPfL+gc3dMvbdCqforTUn
 zZEu2tnDe+CPvHNGmkMFDxfxv13NlKEVcT6f5P2yfM4ci6lqceo5M9extORpjM92O5sn
 CBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UVBePDvj8+JPmPnd9lky7oATp5P2thSWicPxP1xnR8=;
 b=HE5DcNQ/kEackqR9LkvBVz9iAArr+wZKJGZ+AJvjPguc2j7eFp6f2K1fWkemZTWqfG
 HIG149EcuTeLtXGlaR4mIEvLcjf6SKJgZR2oZ4BrWxAEGBadDB+Do410TUy2d46C/xBE
 WKwz8IyAsEZXn35svvXdufZIhVRAFRNpWz55D+xcr8zaedtN6uHdNH4679rCHJ3eyPaK
 Nbp5t1vFkhyEO1hI0qSF7HtN3waWWQx/NKAXZ2oRPRh/E/MgAtfGsK1ReD8Gok1NPTAZ
 iP+hfyaD7BWXIFPmFCjR9xJ4Ymkwkb3BYBT4lUKd8vzOInU8uQ1W3Fc8r/YGtG0mWilP
 ik6w==
X-Gm-Message-State: AOAM5313bD4BHnUvsKAv9wvYI6muOhSKZ5iQH3DM3nakvNdnW/vIVOyo
 6nAmg4HHSXZ8jSAm7XhifH4=
X-Google-Smtp-Source: ABdhPJxdOm63SmKECVhD/Ri1mq2T3tx66jApca+i51NwPxJdgmqEwm5XIsXzuInwJ0NSw6phFVcb5Q==
X-Received: by 2002:a05:6512:3054:: with SMTP id
 b20mr15125654lfb.45.1608228451555; 
 Thu, 17 Dec 2020 10:07:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 10/48] opp: Add dev_pm_opp_set_voltage()
Date: Thu, 17 Dec 2020 21:06:00 +0300
Message-Id: <20201217180638.22748-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dev_pm_opp_set_voltage() which allows OPP table users to set voltage
in accordance to a given OPP. In particular this is needed for driving
voltage of a generic power domain which uses OPPs and doesn't have a
clock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 52 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h | 11 +++++----
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 500d6c716283..eab37b3a27bb 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2541,3 +2541,55 @@ int dev_pm_opp_sync_regulators(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
+
+/**
+ * dev_pm_opp_set_voltage() - Change voltage of regulators
+ * @dev:	device for which we do this operation
+ * @opp:	opp based on which the voltages are to be configured
+ *
+ * Change voltage of the OPP table regulators.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *opp)
+{
+	struct opp_table *opp_table;
+	struct regulator *reg;
+	int ret = 0;
+
+	/* Device may not have OPP table */
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return 0;
+
+	/* Regulator may not be required for the device */
+	if (!opp_table->regulators)
+		goto put_table;
+
+	/* This function only supports single regulator per device */
+	if (WARN_ON(opp_table->regulator_count > 1)) {
+		dev_err(dev, "multiple regulators are not supported\n");
+		ret = -EINVAL;
+		goto put_table;
+	}
+
+	reg = opp_table->regulators[0];
+	ret = _set_opp_voltage(dev, reg, opp->supplies);
+
+	if (!opp_table->enabled) {
+		ret = regulator_enable(reg);
+		if (ret < 0) {
+			dev_warn(dev, "Failed to enable regulator: %d", ret);
+			goto put_table;
+		}
+
+		opp_table->enabled = true;
+	}
+
+put_table:
+	/* Drop reference taken by _find_opp_table() */
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_set_voltage);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 4c79faa2025e..f311a8b2ca04 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -157,6 +157,7 @@ int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
 void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_sync_regulators(struct device *dev);
+int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *opp);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -372,6 +373,11 @@ static inline int dev_pm_opp_sync_regulators(struct device *dev)
 	return -ENOTSUPP;
 }
 
+static inline int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *opp)
+{
+	return -ENOTSUPP;
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)
@@ -448,11 +454,6 @@ static inline int dev_pm_opp_of_find_icc_paths(struct device *dev, struct opp_ta
 {
 	return -ENOTSUPP;
 }
-
-static inline int dev_pm_opp_sync_regulators(struct device *dev)
-{
-	return -ENOTSUPP;
-}
 #endif
 
 #endif		/* __LINUX_OPP_H__ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
