Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424D41223B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F036E5D3;
	Mon, 20 Sep 2021 18:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AF16E5CC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y28so69651763lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
 b=mSz7uU/bRRInYFwuM8f6B84EvUoksh7ddPhtlASBvZ85dgMc6wSlwy9SyUr71eh6Fl
 8aF/ejqZiLi8ozfYp9/gUV4vYRxtIvgQjgPnZXtQL7Y+v9G9Y+cAaoQ21eYKgU3RZGA1
 UOWbjyklkTrEUyaLSLrxbDkrvqYVMR0YBcW59uTVr7/Ot83fYGy4c+QiJj/Xy92xKSgB
 EfV5X85nt0Citt1qMKvG2qkwPH6VuQN5kOywq4zIlYwPZtXGr+a27VopPVnjFYxmMedy
 4bzfzsT9EaigD80tFXxFOEytgM+rMwHIS7FkhnwqO0rdhVONYqcKyeIkWnAmXAWihsxB
 g4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
 b=cPb6MTjV3qWFHNFw4/uO8xu5czSFE+pJkuCWBqpyD+sP38Viad2o0U0VS9mvbHQyj9
 RRmmDkZBE+O9Ja27cngjGUG2QHJFsfRfho6uh4eIM5yjZmLGOdTZ64bBtpP2WglB5dZR
 TfA3clEi8/2+SPSeY/2iObkdzchRWv1ux2gvFl/aw8QzxQKSDEItRZZRhK7dleigbUg8
 ZmhXx8UzdiNlvFWS/OxH4oz9fUuGoASTKWWR3hBkKRFqSoWkCuyD1zxrU//Io2nQpRJ1
 5AoVhMpnZsML4CIlwHcJd10el8QxDSO6MPCTI38aA4P3Q6lwZ3liUk7pwGWRQkk1+zCc
 AYKA==
X-Gm-Message-State: AOAM530wAEtozeC1d7105mv227x4pApCgedQTaHshqM7mOhMvbiKtUGZ
 GmR+1Brnxur6WWsIJqN71Y8=
X-Google-Smtp-Source: ABdhPJyyop5T5u9zSJ7UMIl5EYQj77IA6sm5fQ8onwEgRAuSRlsCeH7gqEyvDQr6Gg0QHhoOer317g==
X-Received: by 2002:a05:6512:3a82:: with SMTP id
 q2mr20094513lfu.543.1632161520309; 
 Mon, 20 Sep 2021 11:12:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:00 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v12 02/35] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_common()
Date: Mon, 20 Sep 2021 21:11:12 +0300
Message-Id: <20210920181145.19543-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Only couple drivers need to get the -ENODEV error code and majority of
drivers need to explicitly initialize the performance state. Add new
common helper which sets up OPP table for these drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..5b4a042f60fb 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,28 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+/*
+ * This function should be invoked with the enabled runtime PM of the device
+ * in order to initialize performance state properly. Most of Tegra devices
+ * are assumed to be suspended at a probe time and GENPD require RPM to be
+ * enabled to set up the rpm-resume state, otherwise device is active and
+ * performance state is applied immediately. Note that it will initialize
+ * OPP bandwidth if it's wired in a device-tree for this device, which is
+ * undesirable for a suspended device.
+ */
+static inline int
+devm_tegra_core_dev_init_opp_table_common(struct device *dev)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.32.0

