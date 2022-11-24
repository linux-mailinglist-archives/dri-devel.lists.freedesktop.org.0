Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F99636F3C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2129710E680;
	Thu, 24 Nov 2022 00:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707CB10E670
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s5so269089wru.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=X1ktmbuxUtprr95vwa/Jqij/BOKG3dAJ70YWLdPNa4R9yOaHzbwEnM7EmlhJVOLnQ/
 YkuiIHEJdvxQva+YwrJJzKTzIGqg798SZMRGvcmwqbCdEQdMKqiC80kgijD48kMcnfrm
 Nb7lQcbl/WM4F4/EbiEqH/6Pe2S49g83U85bFStaOjR/dUD5y2TZz5Een5C5jCs9W5BA
 j4KCxmn57v+OXYMLRhZKA1UqFyRc0ZbnxWyvDWp5aYNNcdVqpNTOaONfMKrbjFcXpJa/
 zxEEfB+SYOkC48GmICOo5fVLq16KF8vrKz+I1lQBaqYDcK369Kq9OWfJKbclALXt71Gg
 qG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=w7K6lKNdjv2TCkKesfbK3P1utMYNAtNBO7TKb/OysXZzMNxzGfqzgwem5ujK8/4Y4m
 uXIxc0oHyD65sJxFe3qHX2h2u3hWFNj9yxemHS0Q7cxbWWI4gmMZR+17F6a1gt6ZqHn4
 CZ9fXgh2xnCxXvQx/NL602WJIvhouvnQMABWOBTNdsLktjtfjYGUeyfq4wFBa1mvn9ha
 xUMA4xSDOTWkSTZQDI2OujFmYisbSi4zZSFjq109z/Vh5aWaGF37aobr7gT7t7XjOa8F
 DtMNg74/qwJjGizZBszOiR7KcQeE9wyhFnGSJ2S0G4R42Tett//xAjgztJYtNcas5uIC
 G9TQ==
X-Gm-Message-State: ANoB5plUVseLKikbLblYV+a8l1QIJv2D49X7WfgCjQrtP2vNLY8CKRQK
 5GUscrl7vW8YgUuW8K26kaQD6A==
X-Google-Smtp-Source: AA0mqf7cEekN6X6KQ4eos1UGBo978jGXjtZiZg32pj/0lH0vHRvTIorDX3ON/RRVv4zJAeY6zcF4jg==
X-Received: by 2002:a05:6000:1105:b0:22e:3498:9adb with SMTP id
 z5-20020a056000110500b0022e34989adbmr7343268wrw.335.1669250898063; 
 Wed, 23 Nov 2022 16:48:18 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:17 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 11/18] arm64: dts: qcom: msm8916: Add compat qcom,
 msm8916-dsi-ctrl
Date: Thu, 24 Nov 2022 00:47:54 +0000
Message-Id: <20221124004801.361232-12-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1d8a1b388d27..20e72038cadfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

