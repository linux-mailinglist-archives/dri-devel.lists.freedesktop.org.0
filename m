Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB32E91F3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D35E89DA7;
	Mon,  4 Jan 2021 08:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCAD89BBE;
 Fri,  1 Jan 2021 16:58:21 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id v19so14708145pgj.12;
 Fri, 01 Jan 2021 08:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EU47YshFMQ8A+mGEaPyqmbVPBnHFsI5ipdwKtLiSz4s=;
 b=JufK/luBOCo/s5ncql0W3V2XyvhEB592ZNBUn2W/RkDG9Me7l06Y0x54pfiJYOiA9L
 +1STzuc/0vuxMjdPmEg7VWuyXUQ/1Kbp92ii/iTyrEjTH0jFh/7/dSiC5a2VYP9163JY
 u1j9ImuwwUpQiF/JuO8OJg75aMAWfphxIhNiyZuh5tkmOy3YG4GADymLHnzgbmN3oB5z
 9pqGK5SaSEXtZx18hZaKT3W812sqmmAM4nuUwhekWoztYibraXxVbkPdE8TxvSIa/JBh
 G92dtdDhZ++SjZQSX9dd1bwbRtIRvrFqO0e22jc4+L7xneOb0zYNnihbOmhnnw9lBReU
 lGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EU47YshFMQ8A+mGEaPyqmbVPBnHFsI5ipdwKtLiSz4s=;
 b=qox+86SY5LuMOUX9Gkglu+2f3MDh0ZLQ6AkN0iI31VlkfJbpnfAvyulUtw5xTrRLMJ
 JpNutS5sImQRuZ+WbAYPXbBR19YGjhP68lCeGcyEza5Y9XNNgESV0JKMdXZ3YlZNlBA2
 vNp6vj/nZzeknNWDqICOB2SHihy2UmVwz7Uapd52K0Ez94G01Y2A7BY/dkYhLiMcwAoV
 8/BdoJZtvoTo1ZXhWXm7Xdgz4EuyefX5J8f7OzR0snwQzN9Hgd8GQuG1mAU51pS45rJw
 kk7xqKR2GZdTTzwcI0o2L42b0sABDrzIAsC0B3/rdofEAiLJpLxFrVJzvzLvEHXzeIcg
 Inpg==
X-Gm-Message-State: AOAM531KY4dPg9ysivTGTxkEiyYJ3Bo+DxNzxFNVTtTEL+bFJ8U8SXNI
 7REt3H1bibKVGN+fCTjXCGU=
X-Google-Smtp-Source: ABdhPJxkWvPaC3TTqrNU9bq91jdUwLxITK1x75Ku00AykTLvX4miBL1IQVS5J7ATWj9I5ZVs2YXyRg==
X-Received: by 2002:a63:3d47:: with SMTP id k68mr59317193pga.218.1609520301362; 
 Fri, 01 Jan 2021 08:58:21 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:58:20 -0800 (PST)
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
Subject: [PATCH 13/31] spi: spi-qcom-qspi: fix potential mem leak in
 qcom_qspi_probe()
Date: Fri,  1 Jan 2021 16:54:49 +0000
Message-Id: <20210101165507.19486-14-tiny.windzz@gmail.com>
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

We should use dev_pm_opp_put_clkname() to free opp table each time
dev_pm_opp_of_add_table() got error.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/spi/spi-qcom-qspi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 8863be370884..915ae115d8c1 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -536,9 +536,12 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return PTR_ERR(ctrl->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto exit_probe_put_clkname;
+	if (ret) {
+		dev_pm_opp_put_clkname(ctrl->opp_table);
+		if (ret != -ENODEV) {
+			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+			return ret;
+		}
 	}
 
 	pm_runtime_use_autosuspend(dev);
@@ -551,8 +554,6 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_disable(dev);
 	dev_pm_opp_of_remove_table(&pdev->dev);
-
-exit_probe_put_clkname:
 	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
