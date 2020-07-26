Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ADB22DFE8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FA189F0A;
	Sun, 26 Jul 2020 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4805C894DD;
 Sun, 26 Jul 2020 11:14:23 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id y10so14266961eje.1;
 Sun, 26 Jul 2020 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37BF1UwxVP7CixpP1U6Ina051uTwRlG/juDBdj9kXV4=;
 b=YXAZG2TJKcydz5dEyEcSkHS1L5TwH6/lU+Vvf6qFl3eFLWq0tk6ftDpI3RM0Y6WZZC
 Ic0APMwNKBbIwG24yj7aEonzyJCMqIMYPKgE68dPyC5DKROwn/CtRTu2dW2YsPWaPmJR
 ImUyqE+J+bXk4CMa/bAMkI3jNdbEWeg7tEqs2zzuFmmfUEZEYoeDkZfY87joNawLu0g/
 fCIgQ8pUlg979SghIRlS1hF4c7jHZws+9rP221oy/7xDgSpBI3V+SmENpT16dbrcBXfn
 AWgI7zF8WRS8Y1e02nxyrO0S32sHoBqsn6jZOBZ+AqpeVH9vhA0MqUvtRWyk6UlMYR2V
 5PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37BF1UwxVP7CixpP1U6Ina051uTwRlG/juDBdj9kXV4=;
 b=BisZaKYx23dgBoopbrV/2Dzc4dUqWayFIWrXMQKWCsam6+jRcUYm0xgDPvcM6SKXU2
 JRlJXicddQHcx92PJIoB0tlFfwy+d9/VbBsTDf5VzSs7bvtUregIxorWEEWTzS7VWP4/
 +hw4/NwG04nLG4IV4oaR1tY19mXlWTsJAXotVoYuSrdvjZSwrfN0iPE61aTz6t60N3IR
 b4dnBBv/dabge+vjXZ5lEkr6mlAqk909RVaLN82ys9tvzpdLikn2LvZbwi5JlJedqSg3
 IAKJCODUM0o9OMSkdRVu7fwkk09dquRm6qU3Q43WGbLnqnyQsIbikeDyfyiqXP6yV1Ab
 a61Q==
X-Gm-Message-State: AOAM5338T9bP7wxKIBKy5Rkn25nlGRDuuaImj+Jp+Mv+ZXunyqjtJI5y
 HTWvzA0a6OU6THX8mkLsDTM=
X-Google-Smtp-Source: ABdhPJwTeEEQ2ZXZVpgawfqhB50ZrkrMpC5+cmMg9MzlJgq+tYGn96zmWoVuMYZ86Q5HRvZmLGQ2bw==
X-Received: by 2002:a17:906:8489:: with SMTP id
 m9mr14318876ejx.94.1595762061902; 
 Sun, 26 Jul 2020 04:14:21 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:14:21 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 6/9] drm/msm/dsi: Add DSI configuration for SDM660
Date: Sun, 26 Jul 2020 13:12:03 +0200
Message-Id: <20200726111215.22361-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This also applies to sdm630/636 and their SDA
counterparts.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 813d69deb5e8..f892f2cbe8bb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -149,6 +149,25 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const char * const dsi_sdm660_bus_clk_names[] = {
+	"iface", "bus", "core", "core_mmss",
+};
+
+static const struct msm_dsi_config sdm660_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 2,
+		.regs = {
+			{"vdd", 73400, 32 },	/* 0.9 V */
+			{"vdda", 12560, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_sdm660_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
+	.io_start = { 0xc994000, 0xc996000 },
+	.num_dsi = 2,
+};
+
 static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
@@ -240,6 +259,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_2,
 		&msm8976_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_1_0,
+		&sdm660_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 217e24a65178..efd469d1db45 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -18,6 +18,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
 #define MSM_DSI_6G_VER_MINOR_V1_4_2	0x10040002
+#define MSM_DSI_6G_VER_MINOR_V2_1_0	0x20010000
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
