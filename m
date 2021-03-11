Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D22C337D9F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5C36EBA3;
	Thu, 11 Mar 2021 19:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E006EBA8;
 Thu, 11 Mar 2021 19:21:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x4so34936580lfu.7;
 Thu, 11 Mar 2021 11:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqKfei5o+p1LDmMPic3/GGcfRGKV9mArN/Kd0be+sRk=;
 b=iiXXfpB1C+gnbK0/DeT43KLI/fORWdk2wUnK2WbfXh1yfxR6laQU0kdWW9RB9j/u2B
 +iWWZnNjK92tl5VaWjTwR6B44ECS+loZ74TlWriWfCEo4x34cX20+DAK0Z1yWbk04E1f
 ykCJ56ZNamFlTXptrAN+d6XLxlaJZKnYdg7Ap3ee/6prcStBNurIfldD+vWg56ijpX+h
 vWzU8iilkhQqhmL6p8UuEdQphJl4t6wFggy8TATlvH+3hnBz4aZ+NLBzVi03+lB3FFAY
 xIlmwo/13YpOTDAip7ZeKkJj7mb+NA5I3J4+5/nfz956+QWxhOOatqRWDWgV5TlGblul
 FPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqKfei5o+p1LDmMPic3/GGcfRGKV9mArN/Kd0be+sRk=;
 b=sRquOkpiQgwoXlcHcUZOUVTPXVxZla+RjUtD3l0HU4TCoxB1CSIC8cjILUH1hyrpe0
 ntFwqkAo+HjcKLyJWwuBd63J5ZrvVcQEkc1HyKsviqkUHV1F93XN7EJGz3J7G+1o7eNT
 ws8zin4KisyjiE/ACZVLgXXfBx3tMWkaJWBAVf9Wgn2BzzYay/Xh9QjGKtA3NM90gJg0
 FzTZLpe//lu7VII5PWOhGx2DEKdcsP+1NPTKrK3QUJO26cXCPZphximQmQn3se1y1rOx
 bXGUlea9S1V4YEa/sWFiTswROA+wKJELgD6Rz2yHNMUmgs+lnwFWOWh67KqkbsF0tZE8
 Bd0w==
X-Gm-Message-State: AOAM530LKwDkkbYKu5TBTAeadhWjOWzlkE8U1rXZjKayWxtx4wEWThLG
 1rbvPINcjzchcj85fsMbKB4=
X-Google-Smtp-Source: ABdhPJxHhzSO5qkov352chgUZ1noI4EztWWaTwMtjW0L+gOi4Y6lGvXdtI/aQNvF79jf49rIBHoPxQ==
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr3233341lfr.102.1615490514041; 
 Thu, 11 Mar 2021 11:21:54 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:53 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 14/14] memory: samsung: exynos5422-dmc: Convert to use
 resource-managed OPP API
Date: Thu, 11 Mar 2021 22:21:05 +0300
Message-Id: <20210311192105.14998-15-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 1dabb509dec3..56f6e65d40cd 100644
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
@@ -354,7 +354,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	dmc->opp = devm_kmalloc_array(dmc->dev, dmc->opp_count,
 				      sizeof(struct dmc_opp_table), GFP_KERNEL);
 	if (!dmc->opp)
-		goto err_opp;
+		return -ENOMEM;
 
 	idx = dmc->opp_count - 1;
 	for (i = 0, freq = ULONG_MAX; i < dmc->opp_count; i++, freq--) {
@@ -362,7 +362,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 
 		opp = dev_pm_opp_find_freq_floor(dmc->dev, &freq);
 		if (IS_ERR(opp))
-			goto err_opp;
+			return PTR_ERR(opp);
 
 		dmc->opp[idx - i].freq_hz = freq;
 		dmc->opp[idx - i].volt_uv = dev_pm_opp_get_voltage(opp);
@@ -371,11 +371,6 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	}
 
 	return 0;
-
-err_opp:
-	dev_pm_opp_of_remove_table(dmc->dev);
-
-	return -EINVAL;
 }
 
 /**
@@ -1567,8 +1562,6 @@ static int exynos5_dmc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dmc->mout_bpll);
 	clk_disable_unprepare(dmc->fout_bpll);
 
-	dev_pm_opp_remove_table(dmc->dev);
-
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
