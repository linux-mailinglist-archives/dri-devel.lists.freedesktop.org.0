Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843C1638A3F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2FD10E770;
	Fri, 25 Nov 2022 12:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1503B10E757
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso3301917wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=fJJR4QeEbYbrdwi9ZTqdfFKUfYSWnqAF9EsGpW+uixxx2zbe9q7zL6OjmJDVxo0hMd
 myn/rr/7wFhiBZK6cB5qCvfGKPEZtb+sRmw126yZDnQwCxANmo0Oh+U4EFrSdp2x1iJl
 7UiEwCOzYCrdFXVbEvP3xmPo1LlYddEPa5BeLWNC9uN/Y07gDn6T4APWzdU6VnfYkl/f
 YgnnPFhlo1K9NH8gc2xdQABhjJNkSIaSJfI/SIzJ2kJp9bvf6WpqooO4PqFuUwijSl9Q
 Q0SX1O6YKPIDBWjYNc1F6gMZPbKITblTsOBUf+xzeu3d7iIVmmGvDKCQTPUOmu5Py1nl
 rrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=2jbNXcVCd+IRxoHbFe3Maey6v+W9IUvyWqdVJXbEz2yblj7vaZhj/XY0EI5a22/eOF
 8zOO0V4O0f3frvzion2WPJ1cxVyPGsiZNghjVdP9llQgMT2zydFu3JFw3q8pC7rYUv4D
 vcHwfs9RX84jk12vhHKwsT4SlWcXmmKbWrG/p70Q7aCH/fcRO8C/k/hhSKs7+nPjqX9J
 LVF4/CRz1rZngNQhLNmRSzo2gidNgM+shMz1mapIDW8J5+0+u+Y1J5Ypo7apIorPAuxh
 C+d12BTWWGhHDT5PquX18OSEFdkiEJj18SqtJst9PC96DU5yqlhihddGQWMDx/dKGFcp
 J9zw==
X-Gm-Message-State: ANoB5pn6QarEnFrnOt50u6L3pfumyVyXeC+ydn3FtPBOxRJBwjQcvLEG
 cu/uuuOBir7DuVTyJ+bqFmBXxg==
X-Google-Smtp-Source: AA0mqf4C+BIzB93Y+GyJoAW9Q84AZU7HlHwF5CeORzNqfFwZ5t3SbSpe4RxDy89uLI7h+t3HQNpsJw==
X-Received: by 2002:a1c:f216:0:b0:3c6:c2ae:278b with SMTP id
 s22-20020a1cf216000000b003c6c2ae278bmr27105879wmc.127.1669379817884; 
 Fri, 25 Nov 2022 04:36:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 13/18] arm64: dts: qcom: sc7180: Add compat qcom,
 sc7180-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:33 +0000
Message-Id: <20221125123638.823261-14-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d2c374e9d8c03..cfe44afc52b4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2985,7 +2985,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

