Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E52E91E4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405B489C2C;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0183089BBE;
 Fri,  1 Jan 2021 16:59:48 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id w1so3612759pjc.0;
 Fri, 01 Jan 2021 08:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z6qbj8dgzROgh85miZBetCRcFsAMjj4rAUBFqdmQKAI=;
 b=tzzmbhnLanGifpkaEEuhMbq9nyVrZwGiezeyUg07DWbmSZBnrgr1HBe8d81xxwHD6i
 knswbUeHIFzwDFLdQ1euU3vIrCOW7O3Lf1Vu9ARrKIBTln9nU3g+tW3tzfBodrhf54Fi
 JmQRUdnEzTVeqeQofJI3pcqe4UkQ9S0EoMl7OcnNuD+yreAIgJF7RZ+Rk1dKrTUWWnle
 B6FPquXJVU2OsZqToQJtG7YVZkyPmGvN8Nvo3+Y2AvketrSmeP/DKIEMj5ZzB8+vXCX1
 EuCR1SM9D0RjyHf3aAvEQM+/orr9w0z4fuphU2WonoZxfLlH0+g67Qrc8oF+jVZI9M4r
 ctMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z6qbj8dgzROgh85miZBetCRcFsAMjj4rAUBFqdmQKAI=;
 b=MzLODeZEI71dhhKTPOWYWs+B1ilDf65bWS3U6951T3LJ4+L8Ykn1q6VitEUWlS/0/x
 FHJpJVJHadJ5KxDpaR2fRoDfPf7TraTqg87+kElFCH3yi8/zMfPfwAGDebIG7Haiz8uU
 R+riq1CSLKWShYbVr29SyCGtPp6f8IvjfNRE3bLPf4Yi3bS7wGBvPZ9tgvuFYYVK06o9
 P4XH4JZPCdJ/z6VTmo5ifdwcRHzKkSAyf7ZhzKzNiVIe3aREwr3G4Q5GlVEH3HALUc3S
 I1RSTsESlNRJITq6+Tw2slNB6da77r/HYUXRRN4fh6YHqsBKJAKljDIlgyURHXOHZbQ5
 lRtw==
X-Gm-Message-State: AOAM532imb6Gp9Iz2Zb6oVWB0k1lIXVELj+24jgbQUI4ANmCkH/q2pNx
 +mFXfU/9ddDKf5xndinFrhk=
X-Google-Smtp-Source: ABdhPJzvKvhyQq+Adj8RaWYu975XY7J6amI//R0xez2m/CCUIqLkUExovMVLZ9HW3tr1oS8YMg71WQ==
X-Received: by 2002:a17:902:eb0c:b029:db:c0d6:6289 with SMTP id
 l12-20020a170902eb0cb02900dbc0d66289mr62277763plb.12.1609520388641; 
 Fri, 01 Jan 2021 08:59:48 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:59:47 -0800 (PST)
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
Subject: [PATCH 20/31] media: venus: fix error check in core_get_v4()
Date: Fri,  1 Jan 2021 16:54:56 +0000
Message-Id: <20210101165507.19486-21-tiny.windzz@gmail.com>
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

Don't call dev_pm_opp_put_clkname() when got invalid OPP table
in device tree, since we do this in core_put_v4().

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a3850261d697..59cbd6c39450 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -881,8 +881,9 @@ static int core_get_v4(struct device *dev)
 			core->has_opp_table = true;
 		} else if (ret != -ENODEV) {
 			dev_err(dev, "invalid OPP table in device tree\n");
-			dev_pm_opp_put_clkname(core->opp_table);
 			return ret;
+		} else {
+			dev_pm_opp_put_clkname(core->opp_table);
 		}
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
