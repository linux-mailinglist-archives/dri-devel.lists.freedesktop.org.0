Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23F636F55
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC5B10E683;
	Thu, 24 Nov 2022 00:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F1510E67E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g12so221413wrs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=WHSkFhd8P6NIFTO/TmkR0PCswxgiWFuVrZKCSmlGOzlFxOKqt4FqfzmgP5zd6SiH2K
 GFY0S+TA573e5woPu1rXu7vCmqZQFF39GrFVEE8ZX5+LAhCE6mswoLo+pHnV26nsVILJ
 i3gaUGQigo5f2vMLA3Q/vT7gWZqyRUrwlTtPsSwRtJuI0Vz2LU7jalxB58H+4iCs8cVN
 TQT08uHcgqK61KhOFDlE2KLX5OhW8vpUDYvR28Yf/ePv1MzZz/ybLTAUnExhgLPoMjdC
 4sdZLeREEhboBAySqxUMEI0ITXQGA9OWshi6A9QotY6M41CE0zADOdsGQ8rB/RD2ofcv
 CJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=lfSTgDbYncmD6G+W2jsPmTq7g4k0upKEMjWZJfhKFBRgdofdozXOt6LVP3kJARtiNq
 QszHxMbcdffhydi329sbnPpaYR2O8oyy5qWFt8sQv1w0FmrpcUMfVQz0AhboZki7u0q3
 whJbxveSchWiI/+t3jcOTI721nyN7w7Yt0IcwU5qfNrotHpGtfmJk9FTVhY1/By9nvKW
 YyLz0cFoIJ4HsMDS/5jovv8yaJM3QVaVdozNytSdkIPDqTUHhXhWMCpVOFLJCX04yxvR
 gmenv7ohHQLDIk1zraqcS4tJtR9pc8xVwZDyEfKIeozt2i+QXe9q6LYiK3iS211vWZ3i
 KEFQ==
X-Gm-Message-State: ANoB5pn+98FuruqyIz6OqUTxGYxR1Qn6ynbLi3cZTnGZ3ExFTjBAkNjJ
 frZySoJud3RwFT84L4ASXtSLsw==
X-Google-Smtp-Source: AA0mqf7EcF6R2JOdSaf1aitN7e8H8UowckCjABWzA7rN9UnA1eNxikUdMQjWTC0QhUcL0wbki1mCTg==
X-Received: by 2002:adf:f692:0:b0:241:f918:703f with SMTP id
 v18-20020adff692000000b00241f918703fmr1272883wrp.573.1669250902816; 
 Wed, 23 Nov 2022 16:48:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:22 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 15/18] arm64: dts: qcom: sdm630: Add compat qcom,
 sdm630-dsi-ctrl
Date: Thu, 24 Nov 2022 00:47:58 +0000
Message-Id: <20221124004801.361232-16-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm630 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0e7764f66b104..905ddb57318dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1581,7 +1581,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm630-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

