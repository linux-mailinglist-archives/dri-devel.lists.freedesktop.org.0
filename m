Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FF6520D2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A9F10E3D4;
	Tue, 20 Dec 2022 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECF10E3BC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h11so11549827wrw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=AlOKjm0oELLxx+jAkVNSqFql6WmyOmKrY0zPkfu429Ka7TM8KTOFeu5pL4iqSanszP
 z7K4VzLV3SzRee1yY24jMo4UevNeGiqw2suAvaddBaeTi49rp33SSAcCobTBxGFap0Ay
 rSemFk2D29mD075eKojO3JXVDCzUPAo7Tzjri6200GWCC2XEQtjEKbj+dgjNhTRRECrJ
 7WgHNv3KVs3IfMo/mIx1t3xPZeHvVZf1EkZ0RQPLGMNjLLUL8Go2lSK/ZGW9AESd6cVu
 IU5K8T9ypzdhv1elkWQ0uwYiPjZnWPYlFETxLrITDc+0YwqqJed/8n0fBkGjB5nbQUvh
 m/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=H24XI9pf9Wn9pFtAYoiOZUulby/PK9wdCeCgxjsW/7Q+2pWKynX3hLqz+GFCullwIU
 gEeRObJAwFYmtkT4JdAMiTqziTxXiZ0uovuHFhdnnFj0tjoKkvFA7VlH+FewI9ScoB4j
 S5JZQG0pzcNzeKkMRZdDj1+PINwjcd4bi7GqYfrzKLiFWFt9BdGZU9vH/tubOkCu78WK
 KXZG6mVWVLq6ImjwRWjOyNJwa6+XH6+YP+abm1Qd9JKzsGuhjbg7oJn1dNaSMAK+MIkQ
 vWtfV8njeInlj8vQK9JNjnef4jGWBFjWZpgySHd6uklgPlL3FFKTiOsVA7uOcAfuAolk
 k9ig==
X-Gm-Message-State: ANoB5pkerH6nlLkzTv7LD5sptRLfO6t0xLljGNkMMihibh7xGIG2x5xZ
 F5ZQPTz890kgENaii+lo3FBrFg==
X-Google-Smtp-Source: AA0mqf4Qwn1lOj+RanfIZTDmk0766KngiFyW+bGOmLbGxRnfVPSk39xJNcAUZxRbEff+9dYOHJXFRQ==
X-Received: by 2002:adf:ec86:0:b0:242:31ba:1389 with SMTP id
 z6-20020adfec86000000b0024231ba1389mr27047390wrn.31.1671539817207; 
 Tue, 20 Dec 2022 04:36:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 17/21] arm64: dts: qcom: sc7280: Add compat qcom,
 sc7280-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:30 +0000
Message-Id: <20221220123634.382970-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e649..a437ad4047f52 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3906,7 +3906,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

