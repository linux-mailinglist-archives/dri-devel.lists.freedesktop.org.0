Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4076520CF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0B10E3DF;
	Tue, 20 Dec 2022 12:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33DB10E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so830910wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
 b=zdYDioXderfwfcpoqEGSszKKxODISIK+eKBQGtZazVtj03hImGlDylU1a+r60Dr6K+
 pjoH9kaVjyulD41ZfMC9FuYp+wIXMBfi1szB6Fr3e3hOKh0nqIUPbgOLdnQZ+GnrvLTY
 kLhPZJIFez08nw6BHtEz8yYbSQ1SI4ugFS7pcAL8ZHB9HBZBBADtKjYAPVlU98fBoWVp
 gDPn6XCWO3UMYNK7sY1Gs+zO0hg0xHgjBiQ7Uo55RO8N/5bt4VDlyIssqT038bPRLfnh
 yY7YK2BEuq/4diuvujMDCfwvaxwZMDZe/m2jJSmV6uJk6KELOygUGLJUqgsdkVYnlzYs
 F4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
 b=M5a1OGiD3vsqCRjHvUXXNSV+/8qDF+wdW2n1WmiXlAEo+lscX+0Cj44AoTDMdvH6DY
 5zaM2r7tknP4cKGGE25QocbrT9o6636uk90ZHp6+4D77OQ/lImB5Q1Ey4NQfv+U8X2rV
 kmzbnfW2YUvBBpoVx7xVOaHn7D/IpFJtmS0vkT65/PRwVmjkM4CoxN87uEod6+vSQ711
 jcmGxUwYejcbBD1/DTwKa5L0BxCz9qraf4CcntWkTtlb/RIen5S8WIVpcPwetdKcRtfc
 h8dnWk3kBmlYl3bsYyCLG2uM4tBI/zgb7/tSXFyaKq9i1FYx/O92XlvaGQNsE7wnnE/H
 /biQ==
X-Gm-Message-State: ANoB5plCEBpACpObvVTdws0rzoNm8wrPsOv1Yd51CNRoPQLxF+lYXZN4
 JGtBX9hPtX3IrF7jRLssuw6Smg==
X-Google-Smtp-Source: AA0mqf6VMHNvsxwSU1zPalndDOSTwMiH2KTdJZPfExa9hIaCyC9VM0n9H7myjiH4rhd1cZpyqvVTDA==
X-Received: by 2002:a05:600c:253:b0:3d2:17a5:17fe with SMTP id
 19-20020a05600c025300b003d217a517femr28733739wmj.18.1671539815933; 
 Tue, 20 Dec 2022 04:36:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:55 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 16/21] arm64: dts: qcom: sc7180: Add compat qcom,
 sc7180-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:29 +0000
Message-Id: <20221220123634.382970-17-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8a..fbd6a7b31eac2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3022,7 +3022,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

