Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB46843A6E4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8476E2C7;
	Mon, 25 Oct 2021 22:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB336E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id r6so11977670ljg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHKo9U8G+hLWY9EhoAIxvumgKe10bBXiBCDSZoonsq8=;
 b=QfDo7hKR9f1y0W42WzUitoiDe2dQwmdRrti4UPRTDFdgXbYLWLzYVGBdbyMN2l14vP
 2k2/WQdJoIWBsqg4kd+P5TCqyMpygXBiu+8+KK1ozP93q3NeZPxKZSegtI9JDk2/jXb8
 360vXgS5USACZksuTnMOdWGqPboITPUj3cobNlRkD2OZc3111rzItscq4VhjF4RwN+M4
 LGJcaqhbjUVtwuXHb2DB5aZflfWpa0tdTyvr5k0x3mauWlQt/kd7AH1W3JpaOb7923rH
 Qw1OInFLOkHS+j9JnckHCUIC1IrRYNlwHZzp0uH1fW9Shl98KCBPgLLUMh+DwzEOtBaa
 6pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHKo9U8G+hLWY9EhoAIxvumgKe10bBXiBCDSZoonsq8=;
 b=q6LGKFt8iQP1oTtBgtwt9mAp0yuhQn4UDvCO4DwJnbdrUHPRr3oG3S1x9i3eBBJS3g
 pG81TECuWsuxhgHVeNzUf68Na/NRlFrbj1cWNWCVocVmmUA0CO7WQeYcutWwzkcoi5Wt
 UenSv3K5PN3tMbEG0vQMKHkT9zLXj1EGNDeF22qGKEl6RyCiJ8GV5YUsVKeXs1nsLcx5
 cOBUo5x2pa+QxkuMf9FnzWKEccZMapzi35ucZWZ3qZ+VTQ2rOL8Hq3ltDoIib4L0Wlx3
 UpV3uR2IDXQxjdS8brKolFpGWE3DFEQMiKZjQkNw5mtTGPDaNw4WErozYcc+RYdKbieo
 fU8g==
X-Gm-Message-State: AOAM5339ntfrVu3zKGyKwkar/VaoOHwe/OlAdNfpw9DjjFS3rRNE4vYm
 u18ZmVH6mByEvkw81TwGX3U=
X-Google-Smtp-Source: ABdhPJwXtANvmUyK02F8DsRd7yaKx9hqiVWiYDN+fdBuGsFPP4+XNKGmf08wj+plJ6DP/RAXnV6Zhg==
X-Received: by 2002:a2e:a364:: with SMTP id i4mr22671083ljn.326.1635201947067; 
 Mon, 25 Oct 2021 15:45:47 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 01/39] soc/tegra: Enable runtime PM during OPP
 state-syncing
Date: Tue, 26 Oct 2021 01:39:54 +0300
Message-Id: <20211025224032.21012-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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

GENPD core now can set up domain's performance state properly while device
is RPM-suspended. Runtime PM of a device must be enabled during setup
because GENPD checks whether device is suspended and check doesn't work
while RPM is disabled. Instead of replicating the boilerplate RPM-enable
code around OPP helper for each driver, let's make OPP helper to take care
of enabling it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..d930a2b4facc 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/of.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
@@ -43,6 +44,7 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
 {
 	unsigned long rate;
 	struct clk *clk;
+	bool rpm_enabled;
 	int err;
 
 	clk = devm_clk_get(dev, NULL);
@@ -57,8 +59,22 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
 		return -EINVAL;
 	}
 
+	/*
+	 * Runtime PM of the device must be enabled in order to set up
+	 * GENPD's performance properly because GENPD core checks whether
+	 * device is suspended and this check doesn't work while RPM is
+	 * disabled.
+	 */
+	rpm_enabled = pm_runtime_enabled(dev);
+	if (!rpm_enabled)
+		pm_runtime_enable(dev);
+
 	/* first dummy rate-setting initializes voltage vote */
 	err = dev_pm_opp_set_rate(dev, rate);
+
+	if (!rpm_enabled)
+		pm_runtime_disable(dev);
+
 	if (err) {
 		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
 		return err;
-- 
2.33.1

