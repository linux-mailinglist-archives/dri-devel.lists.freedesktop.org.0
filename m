Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0F0418C38
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808506E7FA;
	Sun, 26 Sep 2021 22:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73066E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t10so68468014lfd.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
 b=VNknJybST74Zs5ogo13S7UT4QhPBQ6n0feU8GbmO2n12zlI4dIG4MwFs7eB9z5WvuW
 T9GzqUS2D12cfxEiPn1BjV+RuHcHXLTFk8JwGJktjTtF4bygTgsNVXkoNT48TrQwr80D
 wGKDpDRFCxThrmHQZiSrem+Z9hOJ0OGGIY8KapVzBsk2eh7LdAYsBMmay6iv8Yp1EoDN
 clM83oy6almyAbZ8UoOETWguygM2qtWN69csvEa/Wz1PLTTOQ+gF9bx+oOPw4gBTaDQb
 XkTUMgsBinswEUiHX9pEU6gfE37h5QlFS0s2FBC8pl87nKeUz9aPgQDsPcBHzPF2WYz6
 rWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
 b=VNcFiZfBg8rVfOyuJ3lux0n1FO57Z2ziyYP2xSpnVR5ziYWTaZbuAyqLqptIitJm/m
 54mq3651vflB116/nDlYG8JH1Jou/w46QpuXh2fFyhWrD2ybJKPo7gzMPDApt0n+tKY7
 iW+F+JCmHktjteecDvxxHcpmcxTA08IaEJfqoaBVzy6YzF9s3nlFsAFa00GkJz9Zae57
 UzSDMkjHN1yuMj0Cupyp5s5Cgk4nWvE/LuWn0AKUJv/K1C6hVzZz3vug922SOlLN/pCK
 vN7SYyJaME1CWFSUVWiY82IPPnopMwjUDsXqwf+tCXpMcXNYjpsrjY4LD+rSMHuA2H81
 ZSnQ==
X-Gm-Message-State: AOAM533jXYgi8GWXLonOCpvNryD5XyPB1VqrbjQsGB0zk1NrMM//VPtV
 fNKWfw1TruhkIMckBlzv0q4=
X-Google-Smtp-Source: ABdhPJxdXkcZUtIX1j1DsAQ4Pk7T+M6IkKFVVwrjJUngjoqtV0WTrAmKs2rEQZMYmy4Zq0h7LMRZxQ==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr24852549lji.483.1632696177972; 
 Sun, 26 Sep 2021 15:42:57 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 27/35] soc/tegra: regulators: Prepare for suspend
Date: Mon, 27 Sep 2021 01:40:50 +0300
Message-Id: <20210926224058.1252-28-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Depending on hardware version, Tegra SoC may require a higher voltages
during resume from system suspend, otherwise hardware will crash. Set
SoC voltages to a nominal levels during suspend.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c |  99 ++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 122 +++++++++++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index b8ce9fd0650d..6a2f90ab9d3e 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -16,7 +16,9 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
+#include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
 struct tegra_regulator_coupler {
@@ -25,9 +27,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *cpu_rdev;
 	struct regulator_dev *rtc_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -105,6 +110,28 @@ static int tegra20_core_rtc_max_spread(struct regulator_dev *core_rdev,
 	return 150000;
 }
 
+static int tegra20_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1100000;
+	case 1:
+		return 1025000;
+	default:
+		return 1125000;
+	}
+}
+
+static int tegra20_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	default:
+		return 1225000;
+	case 2:
+		return 1300000;
+	}
+}
+
 static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 				   struct regulator_dev *core_rdev,
 				   struct regulator_dev *rtc_rdev,
@@ -144,6 +171,11 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra20_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -279,6 +311,11 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra20_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -320,6 +357,7 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
@@ -334,6 +372,63 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	return -EPERM;
 }
 
+static int tegra20_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->rtc_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra20_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra20_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra20_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra20_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -444,6 +539,7 @@ static struct tegra_regulator_coupler tegra20_coupler = {
 		.balance_voltage = tegra20_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra20_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra20_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -456,6 +552,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra20_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra20_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra20_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index e74bbc9c7859..8fd43c689134 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
@@ -25,9 +26,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -113,6 +117,52 @@ static int tegra30_core_cpu_limit(int cpu_uV)
 	return -EINVAL;
 }
 
+static int tegra30_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.cpu_speedo_id) {
+	case 10 ... 11:
+		return  850000;
+
+	case 9:
+		return  912000;
+
+	case 1 ...  3:
+	case 7 ...  8:
+		return 1050000;
+
+	default:
+		return 1125000;
+
+	case  4 ...  6:
+	case 12 ... 13:
+		return 1237000;
+	}
+}
+
+static int tegra30_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1200000;
+
+	case 1:
+		if (tegra_sku_info.cpu_speedo_id != 7 &&
+		    tegra_sku_info.cpu_speedo_id != 8)
+			return 1200000;
+
+		fallthrough;
+
+	case 2:
+		if (tegra_sku_info.cpu_speedo_id != 13)
+			return 1300000;
+
+		return 1350000;
+
+	default:
+		return 1250000;
+	}
+}
+
 static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 				  struct regulator_dev *cpu_rdev,
 				  struct regulator_dev *core_rdev)
@@ -168,6 +218,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra30_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -223,6 +278,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra30_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -292,10 +352,68 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
 }
 
+static int tegra30_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra30_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra30_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra30_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra30_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -395,6 +513,7 @@ static struct tegra_regulator_coupler tegra30_coupler = {
 		.balance_voltage = tegra30_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra30_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra30_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -407,6 +526,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra30_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra30_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra30_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
-- 
2.32.0

