Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4113654AF7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5C10E5EC;
	Fri, 23 Dec 2022 02:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431B10E5EE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bx10so3427888wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=vqeD+GlPbNoU1iixZcMJrhkLCEYwaPHVNlmadjIDM660EGop7Dw+juHhBEMfPwDR9f
 V93Qy/Ni7W5maOq1BnYYEoIamCBIaplOcqJR5Aj95ONahGt3xG5tZ/QNjg7mYQiq9jKt
 NCuTcmYROOfmCbirKfz9qnws180iOP/gI2d2KvT2mQfzoJDs0BzW/l+qP0nvxApVxerY
 sxK+eypnJgn9srIcGKLRU3jpGeB73ZTVUFcXQJxKM3rBB26kY1jh+mTR5zBAdGwTbT01
 qG4Fo6o/gsPXUQdvHzMWa5FvFtUew0c99FxTpkBoTXGA2eJURv/CzaXs5XnjFBrAQFwO
 EkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=W7l7IZ/Se3dXiO0hTAmkxv/byBCZ5DZNIP1J/vaZFn2fPpars3eyV6r5erQcX8WsHs
 cJ2aX5fboocJKBF3aXX/LSOiScNp4PjUFZoOu8UL8NXZIxYPag/4uX0nc34bPORplCi9
 Hy1WDkc1NIvs1TJW75avA6cYEjZWE+fKnITmAiDt9s5fYW1pg2AUAtSmhCV0f9EeYA7W
 31HZaZOyyLJWoOV0O/fhLH6eALPcAe/vhWqzgnKR4lPUO54AQI8k/2KK+su0UIrENtro
 w3/F0RPjoVPvP9UGRsFprzvuZUKfIuYlrYQtVJWQBvPhaZ+3DvzZmFgpvaB9RbiG0Uqg
 B5XQ==
X-Gm-Message-State: AFqh2koWhJpWkORyATH6wB5xiaYWO9ANX+FTyj4auSLJDQHnfbqRp6qS
 8qukLXSDH0LT4DXel1t9kpKz6Q==
X-Google-Smtp-Source: AMrXdXuNYc1TxK5uyXFod8fCjIYDorJ/xtarU5lUvC1JFyaHnMzuOIxlwK+dAxQK7vlDSOmjld4SVw==
X-Received: by 2002:a5d:4578:0:b0:260:6b09:fa17 with SMTP id
 a24-20020a5d4578000000b002606b09fa17mr7750880wrc.9.1671761443341; 
 Thu, 22 Dec 2022 18:10:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 14/18] arm64: dts: qcom: sc7280: Add compat qcom,
 sc7280-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:21 +0000
Message-Id: <20221223021025.1646636-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

