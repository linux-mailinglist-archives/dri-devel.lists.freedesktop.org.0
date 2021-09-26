Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6F418C21
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB936E5CF;
	Sun, 26 Sep 2021 22:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335E46E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u8so67671414lff.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkm6XIjMcFvBv/Q8SMVuuUrOs216TrQ7UEhmgPQFIpc=;
 b=SHxTucNWPFKt5awnTcKFilyfHzzToTizn2CZHO8A4OcDAp+cCP1/j398MjE0YVP4fY
 9wO/xO+NEvv0chnef0cD2lgXgWQn9i3mkrgxJDUth+tIpF9nS4Nfc/D/BTUQbgLaIraw
 XGoBfLM50xiPb27dfyaBS1BBj9cjFJioyHKffcHH84ZdcGd23mSQ4gs95XV4czk4BzGc
 kcHkq7YGdF687ddXj8fi33DtZnUsKylTBAz9t2E07grnPE3HqxhYpsUlKLYh+BBUcEIZ
 61bgxwTy30bMwB7VsmMfVMAcFHXphs+CoR5oE88oUzf2/Q1NYHdf2UVlbCvyhPeY50zL
 qNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkm6XIjMcFvBv/Q8SMVuuUrOs216TrQ7UEhmgPQFIpc=;
 b=zyrR+xM0IWajeeRx0b1iUD/IsUbnaqiB8LINzLkyrUVYTvsNiVmd3NivTv84ImOHio
 Vzfnf4921KqOvcft4vfj314Lgxf/0Svvca7h8Ahsi3S1ddeHuFBo3Ta58ii/bfVQa+Fv
 o0wRoQeMm8i3YvyloQ2h+46Ohky/11aupKSstAWNuRYMX374wODxjP88kKsFR1j0ftS1
 wFofmREv7+SkMLEAzQmcb9AkpfM5QNblSpWenik9m/W3iljtkArbcL6Ly9EeFR19PuYh
 uDm00Gr0YUwpxg8FPMHZev+ykCjskQwLY4ORx5f5P19aibS4fCTeMP4oQiWJdT6TxOJx
 Bq0Q==
X-Gm-Message-State: AOAM533qkh3jDuds9qYZdLltVLKs2kXmeniStOTWVeeE3WFNMt8vvuJF
 7VkyPCSE0QajB++2YhXkYiU=
X-Google-Smtp-Source: ABdhPJwvUm6MjdrRh5hgoX9T7ABa4JG88RKRaIjoh6nBitfFf5bf70xYPhAj6dzaMj8FlyWk378Ljw==
X-Received: by 2002:ac2:555d:: with SMTP id l29mr20600704lfk.638.1632696175552; 
 Sun, 26 Sep 2021 15:42:55 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:55 -0700 (PDT)
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
Subject: [PATCH v13 25/35] soc/tegra: fuse: Reset hardware
Date: Mon, 27 Sep 2021 01:40:48 +0300
Message-Id: <20210926224058.1252-26-digetx@gmail.com>
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
2.32.0

