Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24E6711C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866010E651;
	Wed, 18 Jan 2023 03:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72BB10E651
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:20:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kt14so21192333ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
 b=Vrxm+BaKUW7drwnQMkZl0L5zgktqfdhc5QBgrqW4OhcWixP8Oa34SJU3K7L/ob7SGX
 ivySSdkdp6unYI9GRyCLh/AMyR57Aw1Nkr7eDZMSHB6yje+uGyz3A7DYbsCNmoiUT24z
 BaPaP3sb3tBI2VEyrehlMaGvlBd9/7cQzKfTK7NG/oH7sxk1tzWN7/uT4xKoAG2dk05u
 YdN0v3nNRXYLv+5rMQLCL+f7DaeU3NOLUCyt0uhXBoGPCiUE1wW43M3E/Z7KcAFXO+Om
 whnT0nXMUFIqY8aCBvCgZbqKUeEB2Xy0bZLwtVgqNGt4HiIHnN0gYn+JP2FP2iEvexLS
 ts+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
 b=Hi+fHjUZiDuPmX+9S6LsHwVCb7VP5Q0aXB0zpfBHY8ukkUEspaFGczwzt/5yw38JOd
 v/e3inwHfhL1gQIqFaTiqJnGKuGghHg80br9KnGEnjx6D7+u+xWIOrfSe6EfM1VZVK2a
 CsPNXi8D/h3JL70Xu4JN+FyFW0Zy7I8AHtuwB2Q2Lty92AmXlHH3E0AuXM1mZPFlWRH4
 XQlsA7LBdM+fiwVP9/eniB7hxtz1qeSkY5XmhgLdxE39LbIwpGsWlubWii8CXYzS38Zd
 iji7zocMXoRAosvV/5j+/sdov8PShtdGrplY3nLpbtMfc7sdSiVmVw4xFluZ7kuav0Hx
 4jFw==
X-Gm-Message-State: AFqh2kp6wgu2XDFKENJtv0G0FenLEmfdy5GJryk+eaaMKn38MS1lM8O+
 glicLdLfYqbLjX58lko6JUoOQQ==
X-Google-Smtp-Source: AMrXdXsPlqnmJSh/9i3ssUfdZIrIq/56AHP8tZA7qU5AK5epPxuuKnYq5TUQHuvBHjMl8efcGuCF1Q==
X-Received: by 2002:a17:906:6a27:b0:872:8c97:db27 with SMTP id
 qw39-20020a1709066a2700b008728c97db27mr5499157ejc.69.1674012026448; 
 Tue, 17 Jan 2023 19:20:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hu16-20020a170907a09000b0086ffe8a00fdsm3766670ejc.84.2023.01.17.19.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:20:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8350: use qcom,
 sm8350-dsi-ctrl compatibles
Date: Wed, 18 Jan 2023 05:20:24 +0200
Message-Id: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
to follow the pending DSI bindings changes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 703ba3d81e82..a066566b6ea9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2883,7 +2883,7 @@ dpu_intf1_out: endpoint {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -2978,7 +2978,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

