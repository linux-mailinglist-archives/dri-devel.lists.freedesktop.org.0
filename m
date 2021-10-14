Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B95A42E3BB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 23:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C006E207;
	Thu, 14 Oct 2021 21:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C636E20A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 21:42:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u21so29649155lff.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
 b=de+MsU0Qj75+aFoPTFEa8N8j4oU0lNy4gc1xqYBp9cPtS0aqFpbiS5aGWOacufpcg5
 xVE2HF6P5vnbDCG9eM1YpY/ZlT+t9GUhcp3xTcdxyRTxpJgsbIprIuJZJJ0VxVmbZClM
 4zfY1oOR0Ro51APygd+6TC1zMlclXLnnNec8kxhoIuAm/PvgJd1pEAP0XduSREhsDxaf
 S0Fig6lSuSiso7p3KFGYeVCEt8aUt7yiKDdTLMEfww8ZIXp7ZhDGZmrJ5643zOPu32RY
 vv6+gbNN3JKTzl0mlYuq9JK4YdQtg37beUr8y37oGRaY5oDcxtHn1lIsXaQHyaoYk0B4
 L4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
 b=irzoOtylcBDdjRTAwWzCOLyjf7VsnQpk3MMGKzKgrRmXlLtI2HYjrCi4t21RH9a9U0
 Xmm0tu0/LIH/NIlgXUf1yHsPLBxIWX8rfwqLokEsUt4lYA+dxBa4Rw9O3wNjlLzEpvZq
 h6+xGWw7nw1xITP9m5mgtbtPHFdDXCk8LK7PKP4s7WZ5U6yD/GPahIgA7ZS6vnTGWPfQ
 ExnI8o3N8xxqISxddZ23PFf89UHusl/RQ4b5fBDgR05+VL54B4NvHIs4K9ML9RwLicVI
 dyhMpSKfrMoERZD94UvcqsjovErlFnZgGepoO8l51NsJjXkupSEfcqwby32qacktt/zs
 ExJQ==
X-Gm-Message-State: AOAM533nTWLehjrB5BmIVvt4LwuzoBfrYqgd6bf8dmdOXhGlxOaMUgAQ
 TKHiZjPWIgodsaEulUIj5/nrtA==
X-Google-Smtp-Source: ABdhPJwXoKb13UGNSiQ8eOg0XJDg6uLdUtqzN99nvekkRjTiOtOeSq9+tsYVCxkJVH1Z3ZGS5o7QKg==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr7447165lfq.9.1634247742039;
 Thu, 14 Oct 2021 14:42:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y19sm301970lfa.123.2021.10.14.14.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
Date: Fri, 15 Oct 2021 00:42:21 +0300
Message-Id: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
device tree nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 87e5194114d5..6a51cf014994 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,9 +1420,9 @@ hdmi: hdmi-tx@4a00000 {
 			clocks = <&mmcc HDMI_APP_CLK>,
 				 <&mmcc HDMI_M_AHB_CLK>,
 				 <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "core_clk",
-				      "master_iface_clk",
-				      "slave_iface_clk";
+			clock-names = "core",
+				      "master_iface",
+				      "slave_iface";
 
 			phys = <&hdmi_phy>;
 			phy-names = "hdmi-phy";
@@ -1453,7 +1453,7 @@ hdmi_phy: hdmi-phy@4a00400 {
 				    "hdmi_pll";
 
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "slave_iface_clk";
+			clock-names = "slave_iface";
 			#phy-cells = <0>;
 		};
 
-- 
2.33.0

