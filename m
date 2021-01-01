Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC652E91F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CA889D63;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6FD897FD;
 Fri,  1 Jan 2021 17:00:01 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id iq13so6293717pjb.3;
 Fri, 01 Jan 2021 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gGihZyqOh92saOcxzMb+6G+sCA4kX9ZoKFmltOdDOFg=;
 b=CMRVWcaayz150p7vYhdX3qwLrXhIzxGto5ot/pXKLLmmF+drLUlkAuw5XmuA+dwh6m
 vMr9OZO12RNhlCG/10iZOdAMUbzjXQBMeVGKjZqLOvM7F+mLJy8J5b9OMlnIpZeEtrSo
 xX8swDfxU9wTq8Cka4tdrD6l5Z7wijwsH0i8y+SVyp40wQ2tYDO0IyMJ22uVmfVRVEMK
 GTL7qu4a7hLmg3auykRJO4g48M0fSEIoIAyoM1BowlrcFIgYa8ebfqaufBEWzdjxZDxu
 h3MxjWceoQwx/t21MqcbDLD9P7Le8K7GFPhaHgXK5Gj2KI6hkrxVdw10L/0Ty244KWw6
 kciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gGihZyqOh92saOcxzMb+6G+sCA4kX9ZoKFmltOdDOFg=;
 b=Lcd6bTVstkVRT1dbOV7TitYMLcscVYfch1kugbh8lwdKUpEdJUyVaeKGu1cyioaR6/
 QMIV8Inem6oHtPzptmnz3Ac+vdIUzQo/bgzXWCie6KGes30BXXzTWtDzW2iq4Mm3JXVN
 NjQFiHUzEjrgIfPqA/pH+uwi7vTBYDf1Eb5Y2mxhl+1CFEIH01ymPEQywigPApD1a5FM
 Wg791vBBjnaHVUY8bC5A4ZzB09xZJRwoKGP6I7TSdq1XRnpjOSHRdzSK9Mb8XYw+M/VF
 Q3ZLg0bfqPNrYd2JHJfJeVttFIALIo3o0Rl3oyi6/35xj/ax3B+70XGRu4Wx+EE2Vgjp
 cF6w==
X-Gm-Message-State: AOAM531JUVQaq9y7c4nDtVHSqV22sfMziFujXfVBJpZSbxwmFyWKwWqd
 DJUxJjHf3QhdfwaJlP/65UA=
X-Google-Smtp-Source: ABdhPJyruF7WtOzZcIvnwPJSnIFe6z8xl0Bv6PeL8GteRuVb9pOnd6/foFP2UjLhKIEIuU1ep+PfWw==
X-Received: by 2002:a17:902:76c8:b029:dc:183d:60cf with SMTP id
 j8-20020a17090276c8b02900dc183d60cfmr41073930plt.15.1609520401060; 
 Fri, 01 Jan 2021 09:00:01 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 09:00:00 -0800 (PST)
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
Subject: [PATCH 21/31] media: venus: convert to use devm_pm_opp_* API
Date: Fri,  1 Jan 2021 16:54:57 +0000
Message-Id: <20210101165507.19486-22-tiny.windzz@gmail.com>
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
 .../media/platform/qcom/venus/pm_helpers.c    | 21 ++++---------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 59cbd6c39450..9684c25558ef 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -871,31 +871,23 @@ static int core_get_v4(struct device *dev)
 	if (legacy_binding)
 		return 0;
 
-	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
+	core->opp_table = devm_pm_opp_set_clkname(dev, "core");
 	if (IS_ERR(core->opp_table))
 		return PTR_ERR(core->opp_table);
 
 	if (core->res->opp_pmdomain) {
-		ret = dev_pm_opp_of_add_table(dev);
+		ret = devm_pm_opp_of_add_table(dev);
 		if (!ret) {
 			core->has_opp_table = true;
 		} else if (ret != -ENODEV) {
 			dev_err(dev, "invalid OPP table in device tree\n");
 			return ret;
 		} else {
-			dev_pm_opp_put_clkname(core->opp_table);
+			devm_pm_opp_put_clkname(dev, core->opp_table);
 		}
 	}
 
-	ret = vcodec_domains_get(dev);
-	if (ret) {
-		if (core->has_opp_table)
-			dev_pm_opp_of_remove_table(dev);
-		dev_pm_opp_put_clkname(core->opp_table);
-		return ret;
-	}
-
-	return 0;
+	return vcodec_domains_get(dev);
 }
 
 static void core_put_v4(struct device *dev)
@@ -906,11 +898,6 @@ static void core_put_v4(struct device *dev)
 		return;
 
 	vcodec_domains_put(dev);
-
-	if (core->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(core->opp_table);
-
 }
 
 static int core_power_v4(struct device *dev, int on)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
