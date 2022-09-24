Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D55E8A7D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333910E55F;
	Sat, 24 Sep 2022 09:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1827D10E55E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:15 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a10so2473346ljq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
 b=YnoLM0y8AhGG9ToxHsUlnsYxMNsaLZxpSlgp7WGtpNa6PZ6o3wi8hAmx+WXxKZSkSu
 lRGSMq69N61RNGainjYUAGwZsF3XhUytQzKNtq0XBuMcvNEM7xaAlRL2/bqORnlzyMJD
 RSxiz5MRxcc7taFMNG8iMXPKKtdaZGqTYpt8qG+Gee+pu+OLhpV3dvPE3h/G340a6arG
 WqxpiO87de9brfH2Y+qA0xnLOC4J+6YAOPhPz5KXQJNcOVdKgOpjcPUq2VzYRlQX3fDv
 DV2c0rZi7cduJ7k0as8lGCHDpRUjrSnTN+3G01izuN+2AWuXLTIgTPdSIORHKVTWHJcG
 kjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
 b=xelpqrTGvjeABCeSRTP1n6vQ2v20Guj7R5dBDZQ6fg4T78zIL/LUOVud0FGkUrK+3C
 AS+7jl/HOLaB+YdbRMr93SA9qTfNiaqyb82Lqe/O6xHD7PXyz8CVbOi+6Q9/P/GwnHeF
 8FYsIN/Uq/udPPa1yFpW94FSpaEGvrRMd13CHaFNG6CToJRZwK7h0HquucCuOJEEFNJY
 t8qIsA1QZpPm5IJE6wGzN0CrYwlF1P5OmNP98vE1lucy2/66BpBIADeLbothW2KdyxuA
 HmqcuvHOQD0rOq3KAMOBayn6M0gSDhefjUL7xlzfWgoJ3hNMP7069eIdzlvJ76ZpdW+J
 CINQ==
X-Gm-Message-State: ACrzQf2dUMzr9WJO/Zce7AQ+3RLlCx4DSCIPILPCpWNq+E+hgbHjADD3
 jYFz1JZuXnlkrYinSZKnR8JVTA==
X-Google-Smtp-Source: AMsMyM4fBEsoQRvqBRVpB3PfI7JBuZLag/KTlUsaqinmzb5YVo0OIT8IaaJB8tuIjyiIGtafJ+ofjw==
X-Received: by 2002:a2e:86cb:0:b0:26b:ff26:ebf3 with SMTP id
 n11-20020a2e86cb000000b0026bff26ebf3mr4076366ljj.445.1664010073478; 
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:04 +0300
Message-Id: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b82c335c25af..0002d92eb29b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3057,7 +3057,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi_phy: dsi-phy@ae94400 {
+			dsi_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-- 
2.35.1

