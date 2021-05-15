Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C4381903
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4F26E159;
	Sat, 15 May 2021 13:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094736E245
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 13:12:22 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f12so1748378ljp.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
 b=LK6g4A0NilcaAHff+ttJNs/qFPnktIfTdiF89lyBfOvLftuDjoisE5gve2JJsITkfY
 VfSgKwVjizr4B1B0tgcrePgBnO5tQh2wEfG6HiFN2fvBHLHovX4T11MvrEVO1SoQWoLK
 0k/V81rmXl5cbFVQqyyvseuMY4oZ4Xr4SZ71WSX7xZLcUy0bZUfJ6iZ4rXPcZ9JgHZRK
 hE59Rs1JeIwKD07+ec4z1Luf7UFyVqcEkFC3LCk+QcICWsDzQsxmYPO4HXrxcbQ8VxrA
 CeOqh09FUaImoFFxugcxXS0WLaCCJ8XAvr6Qj+fOtEqE5/CQGnkfnepvKMkOlzhRps1/
 0ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
 b=HtXop7bqKEuAgZL8drmtLTVTjvOFtFZ9UdBgoVDRzDgXK4u2ZAxdviyhQWWWUMIZ/V
 6MiwiMo4KHvkmwoQTB0XZeP++lSyFm9xkHjL32lPfQvvZdoA3lCpzOx2kWZrx0eVAuyP
 g/J+D+Azi1vW0j/Buc0+g4BRi57fTcDJlwZsLW50BVslt5xeHyiXgkEaoMFOdgv07aLs
 JP5BTiT34Dkqp9ltAsiJWGv2ugQNmEJW4uFh/bjBtA7PdgJcZdQuiacgcigt/j3RYxHY
 UjRxL8ru97n4MinTIe0mL0Od2Syfn6GkoW04mqtSACVaFk47G206wS7Ac7gvnmzpfGyC
 /grA==
X-Gm-Message-State: AOAM532tIb0vmdhWOpMgVHUgfGG2wqa+6OsAZc99oNjiNG0p6sn2jqRa
 rSJqDyjiwOtxiLo3LJck4GqN2w==
X-Google-Smtp-Source: ABdhPJxaxa+zajdzVBlvdxIo/Ac8CmlGKHUUOZbnQCs3Jm96rjmWcTjgHXEGCnSdJmVrfaRAdukI6g==
X-Received: by 2002:a2e:a607:: with SMTP id v7mr41423565ljp.81.1621084341426; 
 Sat, 15 May 2021 06:12:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/8] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date: Sat, 15 May 2021 16:12:11 +0300
Message-Id: <20210515131217.1540412-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

