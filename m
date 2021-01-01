Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1D2E91D8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD1789CF4;
	Mon,  4 Jan 2021 08:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4389C0D;
 Fri,  1 Jan 2021 17:00:26 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id v1so6300056pjr.2;
 Fri, 01 Jan 2021 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v2+TLusBTUAkCwnVOgtXWni7Et/Yf7vXjE1+hsx5ZzU=;
 b=EX0OcKQpOXnzIRVe8wS4dyV6/9iw4J4GOJklKxVuY2Swsy+JGLGDJrw7W7VF8dRKH4
 6Pklp2ygY8zH0utPLUcfY03nuzzpd13KO5KU9kJoao5nX1TkoQyDCYYhfLiolmeXPjhu
 fojBaAdxdqpzDHp/ndl+CSe13lK/qByA3/O2NJCtcIbg0diztt7IH0Nsr/xePjKENQ2k
 c5JWhqxLn0S9u3tJrZ7H469ZdE8gFMrmpf99NSca3H7PwWUSponNsno53N4/FpTBHylK
 SRr0tNT42xjJjA0M9/NHZcQgcINOkkErcxWUPwg42oqUuPiE07eHI93J3FNaeCvGJjFa
 bKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v2+TLusBTUAkCwnVOgtXWni7Et/Yf7vXjE1+hsx5ZzU=;
 b=d4Pi04KxNF6E8SB515U3MNuzrq53X1layvY9tmnW/w70ou2xMBqFFksQ51e4ljCXff
 IINTvnuEBMdsqapfipPItCGTL1ehLsFYGm593wti8SN68CM1CnBKsEEJ813htXc5Q2mX
 a2LC1b6cb9y13y07hIrY2VYLF21l+pST1HcMZvvnxM5C4839RaR7rYcAUZAdMHJLmFF3
 TLl5dYHKG/dERRsGnWYUce4+5jAt9jNO0MB9yFo+0FAP4f/MNZNpfXsccjyVze5Lbrp6
 WT2/VTvpzlST0WrKQNd+xJXuRYEduCAPUDPbQtA9peZ4aoU3qo82DMBIQRJL1iZGatY+
 ASZQ==
X-Gm-Message-State: AOAM530XZa4AsAAzEvVo6W2Tauo3XDm8o2jPM5aDorz4SxX51ZL7Qh9p
 k/ucxg4z5wyl8NqU7AFlZpA=
X-Google-Smtp-Source: ABdhPJy7PrQB1FjN4FKGKenm0RoL4HL0rwa3UBT4fLvIdB/kvaM8JvdYCMxhiT8dThkTf6l+zrQNng==
X-Received: by 2002:a17:902:599d:b029:da:fcfd:7088 with SMTP id
 p29-20020a170902599db02900dafcfd7088mr61666853pli.68.1609520426227; 
 Fri, 01 Jan 2021 09:00:26 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 09:00:25 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 23/31] memory: samsung: exynos5422-dmc: convert to use
 devm_pm_opp_* API
Date: Fri,  1 Jan 2021 16:54:59 +0000
Message-Id: <20210101165507.19486-24-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_pm_opp_* API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 62a83633f837..cab9fd74322b 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -343,7 +343,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	int idx;
 	unsigned long freq;
 
-	ret = dev_pm_opp_of_add_table(dmc->dev);
+	ret = devm_pm_opp_of_add_table(dmc->dev);
 	if (ret < 0) {
 		dev_err(dmc->dev, "Failed to get OPP table\n");
 		return ret;
@@ -353,20 +353,16 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 
 	dmc->opp = devm_kmalloc_array(dmc->dev, dmc->opp_count,
 				      sizeof(struct dmc_opp_table), GFP_KERNEL);
-	if (!dmc->opp) {
-		ret = -ENOMEM;
-		goto err_opp;
-	}
+	if (!dmc->opp)
+		return -ENOMEM;
 
 	idx = dmc->opp_count - 1;
 	for (i = 0, freq = ULONG_MAX; i < dmc->opp_count; i++, freq--) {
 		struct dev_pm_opp *opp;
 
 		opp = dev_pm_opp_find_freq_floor(dmc->dev, &freq);
-		if (IS_ERR(opp)) {
-			ret = PTR_ERR(opp);
-			goto err_opp;
-		}
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
 
 		dmc->opp[idx - i].freq_hz = freq;
 		dmc->opp[idx - i].volt_uv = dev_pm_opp_get_voltage(opp);
@@ -375,11 +371,6 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	}
 
 	return 0;
-
-err_opp:
-	dev_pm_opp_of_remove_table(dmc->dev);
-
-	return ret;
 }
 
 /**
@@ -1571,8 +1562,6 @@ static int exynos5_dmc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dmc->mout_bpll);
 	clk_disable_unprepare(dmc->fout_bpll);
 
-	dev_pm_opp_remove_table(dmc->dev);
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
