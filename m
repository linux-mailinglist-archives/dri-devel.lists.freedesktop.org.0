Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A482D43A78D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B606E3D3;
	Mon, 25 Oct 2021 22:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04316E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:12 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q16so12205215ljg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0CiXiCgdAf7V0lL5IR2r/8ROuTZxmoZVkGc0FfQhBU=;
 b=R8xw42jJPC/nZlTh96fip2LUlB7X8ag1mdDfAb+xZm92uSpxOhkrnKOTV6Vibynjxp
 QIL8kuID5lNIBsdk9jziNglv8mXqkqlusjl5lPkehEM+4SH9tlUJOapT2HOE7AXHf2UZ
 N4HgHnTnR84SrLObUTuG57D3rAZxE1esK2MyecGj3wh0FzFrnXwpbwE2Dx0luRlraoRY
 d0KhAbA0VbtAQ7qIVSkmAf7ZPrBnI/BhSnxpELlHQJ2tZdLfW3KNizm3iiTjYlwLTkya
 BnelVNq2RsZQOgIacv7BwEylvZbmrCQlpTKrybm9rGGQkyzzqQ4oZzTNJklcFlYR1dl0
 zcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0CiXiCgdAf7V0lL5IR2r/8ROuTZxmoZVkGc0FfQhBU=;
 b=Uj/W+Sxb8+gs8Nhz9+243qzgCfhnnQv1dRItX9TglviADIDZPD6XpqWmyTDbBhKtsM
 zozTpCpvG6tnoORfyIQRKuhPoJlOafZmvjoMUw7NvnmEPiRvw3TlniWao4I8Es/ObVGE
 7/U6mehqcprems2jRIPDSNowREKAkP3mugraFFYbiMlDLT5ZyW9t61W7uBsXQKBl96Zz
 za9yvB/Ltz5/H/gFWYhpKpj5f6nTGjxwVd8m2X0DGTBkURnZhZ+gJ7y11SbXmpoEKeZu
 MhYRIMRrUAj8hxCWdOh7ZOlcTHN5TaUUXynU8usfluGKgWve6knV9hameyY9n21y+pN1
 FUyA==
X-Gm-Message-State: AOAM531kUpjanpQHmeqaiOt7kUB4wWPQscaqF5bNY3Bc4pJ0RQCrShir
 hRACM2n1Y60meXXDBZQ/x98=
X-Google-Smtp-Source: ABdhPJyu68X54r68x9sMK6kFrngVo1ABGEkqpbluzyUNtkPSxX9NOIZVlt6ut2/CeIpId7gtQXJHiA==
X-Received: by 2002:a2e:969a:: with SMTP id q26mr15421975lji.325.1635201971086; 
 Mon, 25 Oct 2021 15:46:11 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:10 -0700 (PDT)
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
Subject: [PATCH v14 27/39] soc/tegra: fuse: Reset hardware
Date: Tue, 26 Oct 2021 01:40:20 +0300
Message-Id: <20211025224032.21012-28-digetx@gmail.com>
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

The FUSE controller is enabled at a boot time. Reset it in order to put
hardware and clock into clean and disabled state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 25 +++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h       |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index f2151815db58..cc032729a143 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -14,6 +14,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -243,6 +244,30 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		goto restore;
 	}
 
+	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
+	if (IS_ERR(fuse->rst)) {
+		err = PTR_ERR(fuse->rst);
+		dev_err(&pdev->dev, "failed to get FUSE reset: %pe\n",
+			fuse->rst);
+		goto restore;
+	}
+
+	/*
+	 * FUSE clock is enabled at a boot time, hence this resume/suspend
+	 * disables the clock besides the h/w resetting.
+	 */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto restore;
+
+	err = reset_control_reset(fuse->rst);
+	pm_runtime_put(&pdev->dev);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to reset FUSE: %d\n", err);
+		goto restore;
+	}
+
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index de58feba0435..1b719d85bd04 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -43,6 +43,7 @@ struct tegra_fuse {
 	void __iomem *base;
 	phys_addr_t phys;
 	struct clk *clk;
+	struct reset_control *rst;
 
 	u32 (*read_early)(struct tegra_fuse *fuse, unsigned int offset);
 	u32 (*read)(struct tegra_fuse *fuse, unsigned int offset);
-- 
2.33.1

