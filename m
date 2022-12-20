Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7AF6520C9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D271110E3D7;
	Tue, 20 Dec 2022 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580810E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z10so1024370wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=bWiX1bT4m3K5rX8A5b9lYS9TWaxEfROhuNxLiByd3L6Cwp6mtPbZ+0zrxBO/POeUi7
 76ZB/l3/eli14mBS3i22/0Y6W9Z+u1gJxbqlG7LweUCn2giuESt/HVd86OaxcH/+UW75
 EIJo5sLLdasrKwwHvClaM6/d5ZHcWuH8AGoqEU+AbdNn9/MXFV9Pxc26SHa6oX0L6XWF
 t/nD78fMJPAY7U0O6RRCq5tbUf1vIYief2ktc17hGyGJ/jfLQ03ZGgbc+pwgPVCkP04A
 xfCEXNsnPsHImBDjseF8P1TjXN8kN99aBEcHi+DB3hpzJPjyARm6FaybKXqooS6pKG7+
 Diwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=kYYvyi7wsclDXQaOJRA3XPa4aIPT6sFRosfeSxF9miLxOkxObB2ETdkQ0rInA0sv30
 2Vd4OtjuNKwEWFc4b5eZ8znYHHiRaazx8xTaNL1qdSocJULoyfkkPBENaOrc66kXZE32
 5xiDO6rXOCRKcOoOQHDSjKngMFlCBhilO6N4SxWd1L8fiKfHzONY2PEQ+cT/VB8Cdq2i
 RzVgzPrhZgCbKhsZ4vD/CzMj7TymJDnOJblre9FKxk5ONW/IB81tQaGhRMi6yMp75+8E
 FZe7vAS3CrZVSGtr0vf0yDAcF3UwFty7gRC/cATDgny9BRcDc3X5hqcYQ7p5dsYlEizG
 q9yw==
X-Gm-Message-State: ANoB5pmTh8ebaryDVaE1sB//0AqGS42WqVMLsBhCIG2MPZFeTxvwjnIV
 Cs8MvCQV65qP7N9ARZwVHw+YZA==
X-Google-Smtp-Source: AA0mqf6Sc9Y+9CNxhHcnsKtt7FIMeS3KstnOErEjMMoR2KOLlNbcn4cz/d+S1IX5I0KfAVTuzBy7gQ==
X-Received: by 2002:a5d:5d0b:0:b0:23a:5a31:29f5 with SMTP id
 ch11-20020a5d5d0b000000b0023a5a3129f5mr32784279wrb.23.1671539810014; 
 Tue, 20 Dec 2022 04:36:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 11/21] ARM: dts: qcom: apq8064: add compat qcom,
 apq8064-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:24 +0000
Message-Id: <20221220123634.382970-12-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0da9623ea0849..1f3e0aa9ab0c8 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1277,7 +1277,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl",
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

