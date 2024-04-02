Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB478949C0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A7210F832;
	Tue,  2 Apr 2024 02:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/6xdXOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B35410F834
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:57:21 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d700beb6beso57408151fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026639; x=1712631439; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HoUhYVZ2Tq2DHEccutZmGIwFijmsWdx4cLjCaahu8LU=;
 b=P/6xdXOrushbCPG4Z/n6w+s7ygZjBZjU1/KEmeDGGd7PZGjVBkraMKPSO0zCOd4FGR
 53jXrfIlZm+bEZjq7M2fcghlqSuyAuE3NoT1SJKRfGZbr1QUedaddDGW5FE7eX0X6KuA
 4aMGyN+a5SF+jv2B/3TrSyv/iz2luJTk2/Wxm/KiK5Upk/DpPmGf4TGjeXCogyjGNuL3
 z9xVBVTv3qSj5/vo0lQcxyeCDh0jVVrkgKdcBwtGX7k7/db7W+x8vlI+6xdA/jgIEC93
 VoYuZvcDaBsBvcNOyRYPlbtzhi9sYtH8hSxf5FK75oxf29l2m9l8PDQ1WLld9Pu7jXhq
 0rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026639; x=1712631439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoUhYVZ2Tq2DHEccutZmGIwFijmsWdx4cLjCaahu8LU=;
 b=f3mjRT3INzrmPf0X1kqaBeZ+1pxkGizyzjEzAOkeVw4IXiml9qunpYkZGDUovKtWBa
 Xm+1SJfT80rIHtNGrS1k0Md4CaFKLCKdW+wOSkLlV5bbraN7GmtA/+Cd4wJvsUhxlWST
 spkiLus7e12kp/zSQkT6IX1JC1WI5H73He/DKWBjpDShICsDuW4OZZjCHlQgonlZhv5V
 x1rBV4UxKV77ao7vdGcJcqF+Oyq4xEBAl8Bga2JaTyLXbp24F0M0QvIgUp9LVWHhH+hB
 fAa9KfnBMDCdh6+7SqWx4auknYirnIBxJFzphYyGMbIcgsIkgP+Hy1/a7Wv7xrdCYBNt
 Larw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnVFkD1XoFUtThgb0qxozUGd5GpTYdEah+6CuYmQtR+rflV37C0bqJ1uiehi0UXat52/Tg349BT7k6UvKK0s/W5KxX3lOA5GwKRBImP4lU
X-Gm-Message-State: AOJu0Yx/zvxymnbWknUiVRjdGqMkl/6pvq2ytufTvGjNbRM77p3zK6dn
 LAq7a8P4JW28FF34IhdC7v6n1cJy00gRhLTJGumgK0OTyCqJMSPa9bOrdbhW8QQ=
X-Google-Smtp-Source: AGHT+IFJ5b4AhghRvjiY6bcxsVFL8TOH0DAdoKTGPdBTFNnvgUWxMGtlzzmwG8CjNYgJGYP28s9edg==
X-Received: by 2002:a2e:a264:0:b0:2d4:2b05:a671 with SMTP id
 k4-20020a2ea264000000b002d42b05a671mr5942436ljm.32.1712026639627; 
 Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:17 +0300
Subject: [PATCH v3 3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-3-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZjqkKDc8DJv3bb82aWF6rG7TXxmc2eeO/VaiOfqbMnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM9Kxk3hwvb09OlJ9nDtKjXYTVkiYfBD7l1
 q9qbaQhvwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1aNZCACZyNclBB4r6VXGa7ois5UQYWKrwpfg4MWCi1QjvtaNWRUGu0ahjUzFifVlG/oTkTnKr2o
 3ykyzBrYFUixoTZmVwgdnUXZbAqN/Maexbh5o0ay1FWZHm27PsBbib89a1+YRGqsl8hI/k0JjK9
 KFI64XKlSrfRaQ09BepY/efhwZWwE722dwyA8dYPfqCHgq/diVX/GgoqoR16fyXJBOIjVesdJN/
 imkLZfO9XRI01HmDZZY1paUGm7i0tYWvtHm3DpWvJspUiA/56wGobJcjnj6kTkQpcLbnS9Btym/
 0cbDFE+5AAcJXY2oyl88/WiBDI72g1LE3OKWORC+dlQJZxHu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 99462b42cfc5..6d74867d3b61 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2804,7 +2804,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -2877,7 +2877,7 @@ mdss_dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -2963,7 +2963,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,

-- 
2.39.2

