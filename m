Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AB56CDFE
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0684411BEB4;
	Sun, 10 Jul 2022 08:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7663911BF2A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:42 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bf9so4203411lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeMCpK/TFDgQ/NFlsbZ30ylj/18M0aiLg8g2O9zei+A=;
 b=BAu/9auckXGyXAI3V7+n568uMA84XQfpQkA3uhy9UBmyWef3h/x33O9zBTS7jBvahG
 2qP/cn5UMwgyrkIbm30jHG1CFOmZHRJtWMpMN26ctD7fhHkeM5lNbLfaqMdFszO2x5qF
 SQ0eAV+t11L6m6I5koNCvUqZlrZdao+aXdJfWznZBRMrXObmCnufPpORF5myjU9H5NLC
 ThJVeC87h2XN07nVnSLQf/0Dt7l2dk/WTuC2noYNkmxP+d/yMz9hNzub8fiba+mpjlIY
 q8ZDKi8+DHE/JG/jo8fqQ6UGOllsBzSBMa6F86fHyw3jfywyhS3Ap7zRRXtL2zd0GsrT
 D6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeMCpK/TFDgQ/NFlsbZ30ylj/18M0aiLg8g2O9zei+A=;
 b=UK1LkyeoQwCeXnobRQJ3GEx0JZ+IletlzEQDm7sRI6SY0wLiR4SP4whPAn1/CHcKOZ
 6vwGNjavT/5/wVLssSUvCwX/599HVy1vV0Cmoc4agk/7WC8iavpOrqoLlzlTn1qtrwrQ
 L0keZX6bkogLdOQodKHqILgMM+m66fP3/MsqvD++RlP+WDGP/OdqfWWS7kO3W5OVGLeu
 /yIawQoW7iozhO6C8y07fZco34iRJrpIyfYRmDgPpOfXn1Dkvt0BTj49mc4htt44PhNs
 GiBiFD7SoytN9dWGvkrvD/EY1Rq3o8uDgr2onAV7z+JSX+nZJXz3AtMjR0T5NvCXfGlR
 XuyQ==
X-Gm-Message-State: AJIora8XizM0mtm41X4+zgCRkfarvyROQ/P0ekdS7LbuTkPLQgVcw3s+
 d3GV/8tBEZS5y1nmkNIL+jGYiw==
X-Google-Smtp-Source: AGRyM1vH7ZQmx5RPbbnk6oxL2Y2n2beqCk+Q/ta32NCSmrRyI1vyWjW0jXiEJNjyC4WmPgryu9w/iQ==
X-Received: by 2002:a05:6512:304c:b0:489:d0e3:2efb with SMTP id
 b12-20020a056512304c00b00489d0e32efbmr2935998lfb.34.1657442500538; 
 Sun, 10 Jul 2022 01:41:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 5/9] arm64: dts: qcom: sc7280: drop address/size-cells from
 eDP node
Date: Sun, 10 Jul 2022 11:41:29 +0300
Message-Id: <20220710084133.30976-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop #address/#size-cells from eDP device node. For eDP the panels are
not described directly under the controller node. They are either
present under aux-bus child node, or they are declared separately (e.g.
in a /soc node).

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a55e6caaaadc..13590e84772e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,9 +3740,6 @@ mdss_edp: edp@aea0000 {
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.35.1

