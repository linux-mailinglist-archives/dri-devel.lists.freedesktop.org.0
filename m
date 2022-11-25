Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F730638A43
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0D10E761;
	Fri, 25 Nov 2022 12:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1E110E751
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id v7so3371543wmn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
 b=jQ6Zd7GyZIgl/JY44Vp2h+1APXR5T6P4Kf0y0vEo9HUPL9nTB/TV5heH9EKYPYL+Sz
 lzws6Vz3Y8Q6ZFfnK6Xya74aiexAZ/TrJLfW9tKffNBEwOewRK+POhu51QrxJ2HQjTPt
 SwV2JDLZuI+3CVXCoUKmjoTwA0aFqUnPJI+FeHmVHun3/ou9HYOK7ZbE/QlH85rVxrG7
 tcu5soKz3zJgtKDj2HV7wqB2gy0JQQo5lJ1T9jk/ocnGegzbTx+Ohh7KisWDX1hzntcr
 TJ/1Dp02dlvDYpq/wqHbj/m6XLt56kDa9+SgTORGoB8PgvZdY6rHey1HhODZrddJ+NCh
 GMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
 b=Be+JSG4EPfq0GB8uTLrIzkCIL4QFA2OWXbsM/4b0NNEPIIl8wxlfMtVmyl3M0oT/Va
 yg6z0tnHaveFF2MORwxmO4SfuuuLsU1rAdcmg3Lo3MupGykPobFuSy3BIphChgnFwlFs
 dtB+FfTDEKDRLb7qd+MMqPWkae0qJiHImffHHi/5Dce97UMHrQ3OpHxs1wjvKGky9llM
 ylWoC+DbaM+R/prOmxYLVAl+eAIZs4I65B4LtA4QRymPtHoRGTJOfGU10OolB0SUIhom
 qKD9QNkUG5M4yXYs99V00+oCRILuaqQvLVDRjw71hfaurC6qpV3d2ChApH0y/wHwk6be
 5Yrw==
X-Gm-Message-State: ANoB5pldIhjXvL5+7VyAulV0qQlFNfncanmobzSspENjKH1m9xIq2K5B
 xGMzhJZatwhXJG20f6GAM/G6VQ==
X-Google-Smtp-Source: AA0mqf4giw5RG8Q/UzlwLRZ1kyrijQNXVYA+s9uBtjUGeAdawHL1V0fytg/2MVZEqDg9+4Ck722HxQ==
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr30754573wmp.67.1669379814001; 
 Fri, 25 Nov 2022 04:36:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:53 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 10/18] ARM: dts: qcom: msm8974: Add compat qcom,
 msm8974-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:30 +0000
Message-Id: <20221125123638.823261-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8974 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 21d943d4b02d7..b4361f4318ece 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1545,7 +1545,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

