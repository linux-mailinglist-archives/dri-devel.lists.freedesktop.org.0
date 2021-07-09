Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F33C2ABA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B065C6EA9A;
	Fri,  9 Jul 2021 21:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296766EA92
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:38 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id r16so10107379ljk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
 b=NBfnO8ZkIO7Aj1Itk/7t8wa8TmS1ul3vPzV1MY0z1h+jwnwyQ85hPtj0C5QWXEANNZ
 Mzav2gt9bUUpcT/420r0CsIE7yx95Bu+F2UXVacjs3U7MTuhjdId4yVgsTLlvI1B0MPD
 3SRBIlET2M8P0f8adtEvG4aRsQTlCnP9nluWrEmNLTMxd9HiOPOzbBwzO1lciGbuO8uo
 9s/bJSSrxPdhG7+XfHRuCnlQoqJ9lJdDm0rkcpEweAR2TXXL0wFVB9O4WjvLUMCe8q03
 Z1HiG91Lnig8SLTxMoDuDXixlm7FQ/lO9gktHtDZMdbnH15uEVM993UFArv4rx939S5q
 4c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
 b=CnsJKZwFZQmo9v9zBlN3x1bTpS316fvFMvRRD8/S7JI1Bt+70EQ8n5KQNlK+y77se2
 FLXQK+gDT8mBRXOwJx1rzJihh6t/nNm/Rk3w5xQzIgcn5167Y6elWzzDu2mdOoLR6pyu
 CX8BqneNFyeWUQBUODqF0VdGOfkRtqJkK70ES+GXsCHQcNlx4b2eesnOXI6iu3YOuTxg
 zUqQ2IH1ylKBnXwqkOsYbABrbM0YuaUuB8L5hWOVaS18d02LcxkazuLbaPp2apCyV7H1
 uP5MqWTw8kXHxk9CHIo1J5H6odBJurnK6wNFBbyuKkdETkMCjlSMjRSGHASA408IuwJe
 4CVg==
X-Gm-Message-State: AOAM531FmCHl8d6gVs0fg01A/ySWTImkx6+xHDyrOxWilQBOWcWxhA/k
 EAy2KfBV7AT2XuXkc8II28M1tA==
X-Google-Smtp-Source: ABdhPJy0V2KQdfAmyWdLWEOI0be3277bOL6PRhs7MlAS6wZasoXD+Aid9V5BiCdcg0T4EDWRxPHFKw==
X-Received: by 2002:a2e:8295:: with SMTP id y21mr15033177ljg.482.1625864856598; 
 Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sm8250: assign DSI clock source
 parents
Date: Sat, 10 Jul 2021 00:07:26 +0300
Message-Id: <20210709210729.953114-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..69bf2e90cbce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2491,6 +2491,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2558,6 +2561,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

