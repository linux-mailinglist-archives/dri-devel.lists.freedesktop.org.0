Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D058B6711B4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE310E6A2;
	Wed, 18 Jan 2023 03:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AEF10E663
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:17:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tz11so15679294ejc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxuWlUI/PcZStTas2G6sOrezS1sqVdlcznrK0ab6Pgo=;
 b=ViRt+oxiXo/beRGmqh2R7Vt++z4Ji56XtaeVEfunsPZdfelpwHdtKML7eKpPrHmkl6
 4RHsud7MW8TPXi49/7jKgw+8O/iqWZc8e0RaplhIpVBBL6q2wJeWeWpVYcwEA4WICyZr
 yCkYLGXSiWWejwRfp+NQKgqASvfyOXK97z3okpNoaKZnCgDZJMX+v5d7AgZQBPmyjh7W
 WOb/AvzaKMdoJZEjJx1Gm73IjNfRnoXHmlgKrjpKoclx3nihVQzoiwniaPN14HW970uU
 I5d/0q0zSvvcL5kC2Sw6Wdmk9rRP+Q49CW9TzBYqqXPNYSrpQa56z7fWdvYAImJLFlIG
 7tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxuWlUI/PcZStTas2G6sOrezS1sqVdlcznrK0ab6Pgo=;
 b=eOcor94GEiW42KgUgi9oD5I+J/YgmW/tW/btis54pkuE59A5ReDvR+wBGGQBvEtUGy
 F/AhJT5FGgqQ2Q6drh9dO0JjAdA9H6AbBApqzW1qIKpwUsB8qvia5iHdxsLiyIHFiIuT
 rPa91ckPpQrvgQ833Q+UzYrNlOdlXRe+P8IZmiEm8T/cfKR34dOMZVhiP+cGnthktZKM
 rfpG7jrIQ32W9lfDtnYqsIB1MCqj7xeQjpjL7ZgTVDQ9LgX2+jfcxn+yFr/z2akt7BIk
 L4eDB9Edwc7NatJAtSRgoozBrEMLteM5Tu14oHKbKHWpWg2IbGExgv1QL/5+OsvroCwq
 XRKg==
X-Gm-Message-State: AFqh2koSMIIk0XqFHggO8ZIZ/HTVlzgDhzlAoZYBrIlvzNej6XhKmpFl
 UjKgkhfr3Ssb1HW5fmdxWxRqTQ==
X-Google-Smtp-Source: AMrXdXtBtKIdExTwOXf4FveFWN9yH+Z1q36Rfnh+ukpilSiCiS1HU+9ZMx8dngkQH3OIX3AMMd1z7w==
X-Received: by 2002:a17:907:6e05:b0:871:dd2:4afb with SMTP id
 sd5-20020a1709076e0500b008710dd24afbmr10953246ejc.42.1674011843554; 
 Tue, 17 Jan 2023 19:17:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:17:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp: add p1 register blocks to DP
 nodes
Date: Wed, 18 Jan 2023 05:17:18 +0200
Message-Id: <20230118031718.1714861-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per DT bindings add p1 register blocks to all DP controllers on SC8280XP
platform.

Fixes: 6f299ae7f96d ("arm64: dts: qcom: sc8280xp: add p1 register blocks to DP nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ea2c8ad37ccb..ed11fb89cdc7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2448,7 +2448,8 @@ mdss0_dp2: displayport-controller@ae9a000 {
 				reg = <0 0xae9a000 0 0x200>,
 				      <0 0xae9a200 0 0x200>,
 				      <0 0xae9a400 0 0x600>,
-				      <0 0xae9b000 0 0x400>;
+				      <0 0xae9b000 0 0x400>,
+				      <0 0xae9b400 0 0x400>;
 
 				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
@@ -2519,7 +2520,8 @@ mdss0_dp3: displayport-controller@aea0000 {
 				reg = <0 0xaea0000 0 0x200>,
 				      <0 0xaea0200 0 0x200>,
 				      <0 0xaea0400 0 0x600>,
-				      <0 0xaea1000 0 0x400>;
+				      <0 0xaea1000 0 0x400>,
+				      <0 0xaea1400 0 0x400>;
 
 				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
@@ -3394,7 +3396,8 @@ mdss1_dp0: displayport-controller@22090000 {
 				reg = <0 0x22090000 0 0x200>,
 				      <0 0x22090200 0 0x200>,
 				      <0 0x22090400 0 0x600>,
-				      <0 0x22091000 0 0x400>;
+				      <0 0x22091000 0 0x400>,
+				      <0 0x22091400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
@@ -3466,7 +3469,8 @@ mdss1_dp1: displayport-controller@22098000 {
 				reg = <0 0x22098000 0 0x200>,
 				      <0 0x22098200 0 0x200>,
 				      <0 0x22098400 0 0x600>,
-				      <0 0x22099000 0 0x400>;
+				      <0 0x22099000 0 0x400>,
+				      <0 0x22099400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
@@ -3537,7 +3541,8 @@ mdss1_dp2: displayport-controller@2209a000 {
 				reg = <0 0x2209a000 0 0x200>,
 				      <0 0x2209a200 0 0x200>,
 				      <0 0x2209a400 0 0x600>,
-				      <0 0x2209b000 0 0x400>;
+				      <0 0x2209b000 0 0x400>,
+				      <0 0x2209b400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
@@ -3608,7 +3613,8 @@ mdss1_dp3: displayport-controller@220a0000 {
 				reg = <0 0x220a0000 0 0x200>,
 				      <0 0x220a0200 0 0x200>,
 				      <0 0x220a0400 0 0x600>,
-				      <0 0x220a1000 0 0x400>;
+				      <0 0x220a1000 0 0x400>,
+				      <0 0x220a1400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
-- 
2.39.0

