Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAD2AEA6F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C8D89E5B;
	Wed, 11 Nov 2020 07:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5CF89D61
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so747669wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fyu/TRO5yWpBbQQ0dTrByo3SnRiUtLscyENKkMxzI64=;
 b=TuenlxOlgQMKeVdC1fXwNuNOwbZY0XCdF44y8OROIBuEb5jOSLndWxohPt4/ZeL26w
 z3c9uSIcdUaN5Z0QeZKkhMU+MFd4iIwPSWnDhdbNEJ/+PaRJf1OqJWAmN3y9/IpgYNOm
 sgvJnLOR5ZF+QZFJ0lCRypdanpM5xsBHbItJrlNUCEH9g1J2uBsv1Hn1fzoCL86dcumv
 a1V3eKEiH4o83PUH4gMwP0lSdmZhgVAqvdBtrbxB4X7vIBzMYeB95BYEbCOtNzr6X2F1
 B1TDWGfGhEe6Da6USBAXp6//8nI3KLuTUNTFBCTJt5J2iEzaU2gL6uiSCbloPpMGSfaJ
 hdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyu/TRO5yWpBbQQ0dTrByo3SnRiUtLscyENKkMxzI64=;
 b=nsguvfCWYjT7IwzIxKMkWRaSaBdDSnBqyGfsg3o0AbdamLEp1L7vJ/2cyZ70FPmJCd
 P08jrCpt4VSBQ2hUzAoIChq8vS2jdZPQnIvccNjTpgQ88syrmxb/Ki5o3XiEB01L6Kco
 AY4BtU/TJANhpitMs2x2BDe1xyW7vBg71JUUENVZCY04/5+Aj9FdVTH7Lp8uV8YWkFXK
 NQtGLbftbN4JOU7/XR63I4PktB2rN+yTwoV8PC4VxWMTOLV5aNFfNcNGH7gntuqYJWeM
 G3F6t0e+r5HuvPVVg9eKfWtl5B1qaWuE0AdVzu/KnuaCFPLd+7JoQY7TygTHpI4rJMz7
 vJNg==
X-Gm-Message-State: AOAM532WMXu9tOtgNiFwIUVuuWYNjkeNLFEyDwWz5bGTmBkDVu/bkb7e
 RdTlbIV2JTsDd7p9C1qkag0=
X-Google-Smtp-Source: ABdhPJw4wDgLBVIYiU/vXdLuuIS/i2yBD21T0D7MBVqlG5B36sFE29nf56BchuMNs4ai+gb6a1jG+g==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr11217777wrn.277.1605057322702; 
 Tue, 10 Nov 2020 17:15:22 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:22 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 08/26] memory: tegra30-emc: Continue probing if timings are
 missing in device-tree
Date: Wed, 11 Nov 2020 04:14:38 +0300
Message-Id: <20201111011456.7875-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

EMC driver will become mandatory after turning it into interconnect
provider because interconnect users, like display controller driver, will
fail to probe using newer device-trees that have interconnect properties.
Thus make EMC driver to probe even if timings are missing in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index d0926088360a..3488786da03b 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -988,6 +988,11 @@ static struct device_node *emc_find_node_by_ram_code(struct device *dev)
 	u32 value, ram_code;
 	int err;
 
+	if (of_get_child_count(dev->of_node) == 0) {
+		dev_info(dev, "device-tree doesn't have memory timings\n");
+		return NULL;
+	}
+
 	ram_code = tegra_read_ram_code();
 
 	for_each_child_of_node(dev->of_node, np) {
@@ -1057,6 +1062,9 @@ static long emc_round_rate(unsigned long rate,
 	struct tegra_emc *emc = arg;
 	unsigned int i;
 
+	if (!emc->num_timings)
+		return clk_get_rate(emc->clk);
+
 	min_rate = min(min_rate, emc->timings[emc->num_timings - 1].rate);
 
 	for (i = 0; i < emc->num_timings; i++) {
@@ -1262,16 +1270,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct tegra_emc *emc;
 	int err;
 
-	if (of_get_child_count(pdev->dev.of_node) == 0) {
-		dev_info(&pdev->dev,
-			 "device-tree node doesn't have memory timings\n");
-		return -ENODEV;
-	}
-
-	np = emc_find_node_by_ram_code(&pdev->dev);
-	if (!np)
-		return -EINVAL;
-
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
 	if (!emc) {
 		of_node_put(np);
@@ -1285,10 +1283,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-	err = emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
+	np = emc_find_node_by_ram_code(&pdev->dev);
+	if (np) {
+		err = emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	}
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
