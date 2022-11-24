Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEAA636F61
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7410E686;
	Thu, 24 Nov 2022 00:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A2610E676
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s5so269234wru.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
 b=JlbA9+8W450YbRnk4VYcS3AdEM2Va8QQwzmvPTb8phkZo5MqG61ujr+F5SSG69Cno2
 gT+l/WoqdumqULNpM6lhJ0OjoDUsE2q0lTwhFGghl6zjlw2W59ARTkvIZEDMKzuB8PlE
 sbA+1FaOJ2oj/L8puLQ6gTSfV5HMDvEFaLHZ/Rm290qPmUtxeJNTDzLRYe8FyFQIo7MB
 /FfraxLNDYUvD49gv+HXzXrLd/vsNctsoRz6CHOEgt0jPpapG7KF2rUXTRuHvqqkfHaS
 AoO8NXOQshhQ6WWpWGSTDtoU6WXrQfPFLANtBFGxQ9UoFNdgvA3tAxxcS8g+GThC0Gg6
 i3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
 b=18r7R2v+fmiBeDiYKfZBxS621xmVeE6czxJTKPUg+vBLIWRKDG8x4hhRl+9vNQFdQX
 PK3mk5bPaqATWUOZoir/DSQg9aFfjox4GGKeis4OeIkk0zq9y2fEJXx5Xa7oSHsB54Jt
 oJqrmBkvKQDQTNkaU3am3HcGj/CmS/l8c7Cboy4vPzZ8dAYDEfPzAPdK+W/hUia+GB8L
 DjainumZXumXxCZoDFsJs5gC6mZPBsnXQmHtYC5UXPzTI7vFOdJZPrKo1JM47Xy0xX9O
 Yy9tEcsKFRLXzHXs2m2Egornsb6ACeHpEnZju2+VWqcZ9ovYPOKWvagPXCGkD0X/MnD/
 q4LQ==
X-Gm-Message-State: ANoB5pkNrRX9MP8ACBQIjj30L7qDQHLiG4Yhv+lOaLN36/Aux02q6Z94
 8Z438MnynilrWPNsXUwyxNHT3w==
X-Google-Smtp-Source: AA0mqf4MZt+wx+bbi0GWwMA/YGWDOYht44nKXvQxpfQF4vjdgr98EfXiMvTzdAqTsh34jZ5BlSjkKA==
X-Received: by 2002:a05:6000:46:b0:241:bc67:c7af with SMTP id
 k6-20020a056000004600b00241bc67c7afmr13010638wrx.91.1669250901571; 
 Wed, 23 Nov 2022 16:48:21 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:21 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 14/18] arm64: dts: qcom: sc7280: Add compat qcom,
 sc7280-dsi-ctrl
Date: Thu, 24 Nov 2022 00:47:57 +0000
Message-Id: <20221124004801.361232-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a4d6e866b5999..3368531e004e8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3903,7 +3903,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

