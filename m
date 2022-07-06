Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF865680F0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9410F40F;
	Wed,  6 Jul 2022 08:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A725810EFD6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:18:58 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso9231511pjc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqXzjmPYyKxRNJu+3EE3ctlFFdR9chxtKAJZd/jje28=;
 b=bWOaqY+oD2MoE3bAUV542QSF69+/YjuH0KSMBb93mlMaBM9SkSmw4M/Eww9Etumq5w
 EOz3wwH/DGCSmEMW8iBWuf6FNTZ5/Vg7Xyn1l5OCy3/kPWAjkm0f5TNUF9drdXooTFnN
 3cY3fZIlG0yoD7TV4lcYVrGkY5FHaz0brIDCRxm8Tw7TOtmIQznTH0n745mku1l4xq1N
 W+DRfuLqtIaM+4SSZA96/icF6VqKypcjJbRe7pEe6DluRxl4nFz35WQ0r6u6qgnyb+ZM
 TWW/sNIMvXN2gqStPI8Cr/1LpN6CA9PWIfEB3EYHy5DTP/kVF3sBKRylLRrm0gtE3dx9
 f0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqXzjmPYyKxRNJu+3EE3ctlFFdR9chxtKAJZd/jje28=;
 b=x8RCFkYqYGdsBCXC1W3yIM1W3c0WS+cv4G9zSSKwmAZ++SXoUFmajy8nBrFxkaLXeB
 stcLejO1YqkjEoi+8DoRc4JgH1j1q9KBHtnjMGzcOlwtYOEizFx1gXOYjd+pzIC2SDGG
 PPlgYrGs6D8eg+ZRVICoZ1c7jxCy8A+8/H6Y/2GJ0iHKL2HH36+zbPqLrbWoQh8UrbcH
 UtneUogvPBTfFFjpffSrw8bLr+qI2WjFTlmwS/CdDl8UUrfXXyt9wHVEuZYJ2tzplHhn
 TIP+q6V80k7VxxWfqTvGpvnT95Z1mHJxCSdO4h7d8usjGSFyeFmyM3MvtE47GnH/EonP
 kxrw==
X-Gm-Message-State: AJIora/u7OBsNEoMY/35Rka6BMC8mdW0UrGdzenu8Qub5E3Z0OKHwEqZ
 Tonluno7vjKRuQQkSv0kgFR73g==
X-Google-Smtp-Source: AGRyM1vt9yUrP6MoG5193YDPSXa0cl6x1FFMtkPhXDvjGRGTz4KSpoNBOFHZ2yK8hfpclXRzbZO0qA==
X-Received: by 2002:a17:90b:1bc5:b0:1ee:9563:2fca with SMTP id
 oa5-20020a17090b1bc500b001ee95632fcamr46186864pjb.87.1657095538233; 
 Wed, 06 Jul 2022 01:18:58 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 k8-20020a170902c40800b0016bf2dc1724sm3158688plk.247.2022.07.06.01.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:18:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH V3.1 02/20] OPP: Make dev_pm_opp_set_regulators() accept NULL
 terminated list
Date: Wed,  6 Jul 2022 13:48:51 +0530
Message-Id: <bcabb1a90a5158628ee1633c10f8886544723fb9.1657095331.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
References: <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make dev_pm_opp_set_regulators() accept a NULL terminated list of names
instead of making the callers keep the two parameters in sync, which
creates an opportunity for bugs to get in.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V3->V3.1:
- Update panfrost_drv.c to include the NULL element.

 drivers/cpufreq/cpufreq-dt.c                |  9 ++++-----
 drivers/cpufreq/ti-cpufreq.c                |  7 +++----
 drivers/devfreq/exynos-bus.c                |  4 ++--
 drivers/gpu/drm/lima/lima_devfreq.c         |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  3 +--
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 15 ++++++++++-----
 drivers/opp/core.c                          | 18 ++++++++++++------
 drivers/soc/tegra/pmc.c                     |  4 ++--
 include/linux/pm_opp.h                      |  9 ++++-----
 9 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 8fcaba541539..be0c19b3ffa5 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -193,7 +193,7 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
 	struct private_data *priv;
 	struct device *cpu_dev;
 	bool fallback = false;
-	const char *reg_name;
+	const char *reg_name[] = { NULL, NULL };
 	int ret;
 
 	/* Check if this CPU is already covered by some other policy */
@@ -218,10 +218,9 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
 	 * OPP layer will be taking care of regulators now, but it needs to know
 	 * the name of the regulator first.
 	 */
-	reg_name = find_supply_name(cpu_dev);
-	if (reg_name) {
-		priv->opp_table = dev_pm_opp_set_regulators(cpu_dev, &reg_name,
-							    1);
+	reg_name[0] = find_supply_name(cpu_dev);
+	if (reg_name[0]) {
+		priv->opp_table = dev_pm_opp_set_regulators(cpu_dev, reg_name);
 		if (IS_ERR(priv->opp_table)) {
 			ret = PTR_ERR(priv->opp_table);
 			if (ret != -EPROBE_DEFER)
diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 8f9fdd864391..560d67a6bef1 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -173,7 +173,7 @@ static struct ti_cpufreq_soc_data omap34xx_soc_data = {
  *    seems to always read as 0).
  */
 
-static const char * const omap3_reg_names[] = {"cpu0", "vbb"};
+static const char * const omap3_reg_names[] = {"cpu0", "vbb", NULL};
 
 static struct ti_cpufreq_soc_data omap36xx_soc_data = {
 	.reg_names = omap3_reg_names,
@@ -326,7 +326,7 @@ static int ti_cpufreq_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct opp_table *ti_opp_table;
 	struct ti_cpufreq_data *opp_data;
-	const char * const default_reg_names[] = {"vdd", "vbb"};
+	const char * const default_reg_names[] = {"vdd", "vbb", NULL};
 	int ret;
 
 	match = dev_get_platdata(&pdev->dev);
@@ -387,8 +387,7 @@ static int ti_cpufreq_probe(struct platform_device *pdev)
 		if (opp_data->soc_data->reg_names)
 			reg_names = opp_data->soc_data->reg_names;
 		ti_opp_table = dev_pm_opp_set_regulators(opp_data->cpu_dev,
-							 reg_names,
-							 ARRAY_SIZE(default_reg_names));
+							 reg_names);
 		if (IS_ERR(ti_opp_table)) {
 			dev_pm_opp_put_supported_hw(opp_data->opp_table);
 			ret =  PTR_ERR(ti_opp_table);
diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index e689101abc93..541baff93ee8 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -180,10 +180,10 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 {
 	struct device *dev = bus->dev;
 	struct opp_table *opp_table;
-	const char *vdd = "vdd";
+	const char *supplies[] = { "vdd", NULL };
 	int i, ret, count, size;
 
-	opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
+	opp_table = dev_pm_opp_set_regulators(dev, supplies);
 	if (IS_ERR(opp_table)) {
 		ret = PTR_ERR(opp_table);
 		dev_err(dev, "failed to set regulators %d\n", ret);
diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8989e215dfc9..dc83c5421125 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -111,6 +111,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	int ret;
+	const char *regulator_names[] = { "mali", NULL };
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -122,7 +123,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_opp_set_regulators(dev, (const char *[]){ "mali" }, 1);
+	ret = devm_pm_opp_set_regulators(dev, regulator_names);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 194af7f607a6..5110cd9b2425 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -101,8 +101,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return 0;
 	}
 
-	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
-					 pfdev->comp->num_supplies);
+	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7fcbc2a5b6cd..8a4bef65d38c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -625,24 +625,29 @@ static int panfrost_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const char * const default_supplies[] = { "mali" };
+/*
+ * The OPP core wants the supply names to be NULL terminated, but we need the
+ * correct num_supplies value for regulator core. Hence, we NULL terminate here
+ * and then initialize num_supplies with ARRAY_SIZE - 1.
+ */
+static const char * const default_supplies[] = { "mali", NULL };
 static const struct panfrost_compatible default_data = {
-	.num_supplies = ARRAY_SIZE(default_supplies),
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
 	.num_pm_domains = 1, /* optional */
 	.pm_domain_names = NULL,
 };
 
 static const struct panfrost_compatible amlogic_data = {
-	.num_supplies = ARRAY_SIZE(default_supplies),
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
-static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
 static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
 	.supply_names = mediatek_mt8183_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index e166bfe5fc90..4e4593957ec5 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2105,13 +2105,20 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_put_prop_name);
  * This must be called before any OPPs are initialized for the device.
  */
 struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
-					    const char * const names[],
-					    unsigned int count)
+					    const char * const names[])
 {
 	struct dev_pm_opp_supply *supplies;
+	const char * const *temp = names;
 	struct opp_table *opp_table;
 	struct regulator *reg;
-	int ret, i;
+	int count = 0, ret, i;
+
+	/* Count number of regulators */
+	while (*temp++)
+		count++;
+
+	if (!count)
+		return ERR_PTR(-EINVAL);
 
 	opp_table = _add_opp_table(dev, false);
 	if (IS_ERR(opp_table))
@@ -2236,12 +2243,11 @@ static void devm_pm_opp_regulators_release(void *data)
  * Return: 0 on success and errorno otherwise.
  */
 int devm_pm_opp_set_regulators(struct device *dev,
-			       const char * const names[],
-			       unsigned int count)
+			       const char * const names[])
 {
 	struct opp_table *opp_table;
 
-	opp_table = dev_pm_opp_set_regulators(dev, names, count);
+	opp_table = dev_pm_opp_set_regulators(dev, names);
 	if (IS_ERR(opp_table))
 		return PTR_ERR(opp_table);
 
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5611d14d3ba2..6a4b8f7e7948 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1384,7 +1384,7 @@ tegra_pmc_core_pd_opp_to_performance_state(struct generic_pm_domain *genpd,
 static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 {
 	struct generic_pm_domain *genpd;
-	const char *rname = "core";
+	const char *rname[] = { "core", NULL};
 	int err;
 
 	genpd = devm_kzalloc(pmc->dev, sizeof(*genpd), GFP_KERNEL);
@@ -1395,7 +1395,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-	err = devm_pm_opp_set_regulators(pmc->dev, &rname, 1);
+	err = devm_pm_opp_set_regulators(pmc->dev, rname);
 	if (err)
 		return dev_err_probe(pmc->dev, err,
 				     "failed to set core OPP regulator\n");
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 6708b4ec244d..4c490865d574 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -159,9 +159,9 @@ void dev_pm_opp_put_supported_hw(struct opp_table *opp_table);
 int devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
 struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name);
 void dev_pm_opp_put_prop_name(struct opp_table *opp_table);
-struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
+struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[]);
 void dev_pm_opp_put_regulators(struct opp_table *opp_table);
-int devm_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
+int devm_pm_opp_set_regulators(struct device *dev, const char * const names[]);
 struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
 void dev_pm_opp_put_clkname(struct opp_table *opp_table);
 int devm_pm_opp_set_clkname(struct device *dev, const char *name);
@@ -379,7 +379,7 @@ static inline struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, con
 
 static inline void dev_pm_opp_put_prop_name(struct opp_table *opp_table) {}
 
-static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count)
+static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[])
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
@@ -387,8 +387,7 @@ static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, co
 static inline void dev_pm_opp_put_regulators(struct opp_table *opp_table) {}
 
 static inline int devm_pm_opp_set_regulators(struct device *dev,
-					     const char * const names[],
-					     unsigned int count)
+					     const char * const names[])
 {
 	return -EOPNOTSUPP;
 }
-- 
2.31.1.272.g89b43f80a514

