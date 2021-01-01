Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6562E91DE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF1689DA3;
	Mon,  4 Jan 2021 08:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DC889B96;
 Fri,  1 Jan 2021 16:58:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id t22so12672520pfl.3;
 Fri, 01 Jan 2021 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U36W0smHOpfrbDvJ1LTZufZA8+bqUZFQOq+xGSvEz0Q=;
 b=gKaKzWCjoMrxvhanzaf7tyCsDC/hfSnueuE8JW5m51OOp9Z6WvwF/9vPAZN7rMzBge
 URiLDqq57o/V3sk4oFnTbpTF6dTUDM071vmfcj+39aaweZske2Hmg7/xz6Agpup5MvhE
 VCTOBGdMDYWKKT3SSRBBBqzcBStN4t36/GnqgKjx7dpq6RneL6FgqY9pO5wzwvrNKhqy
 FN0LMPSXoDbAUhapYneJJIH2yRgbV0fyIKNjmx0yEVcyCFbUAQaUPi14s3gI9TzG7kbr
 5XkvuyB4qXKyvKfKF1Gw8IdLeTgbKRYYCaCx3fxt/AMk6UGti0Lm20Ll/jIh7L2BebN+
 jesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U36W0smHOpfrbDvJ1LTZufZA8+bqUZFQOq+xGSvEz0Q=;
 b=RYIwSIz8TD714cnzqv7bjtsq2EJLsTu7N4IN9vj9r0Ie5LYnuJ56VM/DYMS0J/TPig
 kk7e76YtKZ0wHqWqNKlMkBPXKPapgCBNk1v4Jqa8fxSMrOHt1GUTRKZB6gsnEqRdIi3G
 O0G/LLLrVXfRsKBcz6JuE11TSWYZGJ5V1ecjT4aXpaDV0Q594TH/WT04xPoJ8AY5k2ct
 dITKC2IqB7pNL3WTl5Qa/LgDfRtS6tUTzzNu1OXjj227rOxrK/psH1yD1ov0xmv9D2bd
 9yPXwVbKZV+xlJn7Ov1ZMa1z7zYfPHAvtnfMxjQIQ2N6U2Z+QG4l3yzVunpureW9zPgs
 dFrw==
X-Gm-Message-State: AOAM532CJ2nGv+nMbHHDgUzNh5by+vEXtBFxH891gbTewuWFY8NvP3n9
 WkWYxeleRzUbbKzaoSOSfpE=
X-Google-Smtp-Source: ABdhPJzx00BSeoHxNsLlnYUTpYihiZKk22bXxnJ8w2R+GCGYn3Ld1jNT8zpXeyfnV8iIpkFNwzyFcw==
X-Received: by 2002:aa7:9a07:0:b029:1a6:5f93:a19f with SMTP id
 w7-20020aa79a070000b02901a65f93a19fmr35843925pfj.21.1609520326359; 
 Fri, 01 Jan 2021 08:58:46 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:58:45 -0800 (PST)
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
Subject: [PATCH 15/31] drm/msm: fix potential mem leak
Date: Fri,  1 Jan 2021 16:54:51 +0000
Message-Id: <20210101165507.19486-16-tiny.windzz@gmail.com>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 ++++++----
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 +++++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 374b0e8471e6..6f19dfcb4965 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1093,9 +1093,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(dpu_kms->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		goto put_clkname;
+	if (ret) {
+		dev_pm_opp_put_clkname(dpu_kms->opp_table);
+		if (ret != -ENODEV) {
+			dev_err(dev, "invalid OPP table in device tree\n");
+			return ret;
+		}
 	}
 
 	mp = &dpu_kms->mp;
@@ -1122,7 +1125,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	return ret;
 err:
 	dev_pm_opp_of_remove_table(dev);
-put_clkname:
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..a282307f2799 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1891,10 +1891,12 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return PTR_ERR(msm_host->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+	if (ret) {
 		dev_pm_opp_put_clkname(msm_host->opp_table);
-		return ret;
+		if (ret != -ENODEV) {
+			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+			return ret;
+		}
 	}
 
 	init_completion(&msm_host->dma_comp);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
