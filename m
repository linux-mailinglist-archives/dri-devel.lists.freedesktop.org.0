Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D4654AD0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57010E5ED;
	Fri, 23 Dec 2022 02:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0A210E594
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w15so3381556wrl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=VGuUkPeHEBkRteyOmLDHHF7IEGlB1z1swr0H8+0cxyaaJHUlr0HsuZanj0wplW7iIC
 MZNZaPazzp9HBnKIPVIhPKglbOf8pYBCFHrbxonYl26nMusknZI8WNb2Ep3MoWXWDy8a
 xVZDD/hOYz1QA848CARmdLljMjdrc1hQnn6ns9Qz6gib2OmQqQ5bDlCHMWwmsY2NqJ8G
 j+kyGMea1HeBwnxh18O2PPBJhp8uaHHVDIQ+7m+lvko7Z6lWVswpSjb/TPalGJjRnW3s
 a9ab1DoWbvrKpgbnnzjGefyt3D9AEURIDCtYQIDi82iwbazgRFgyE814JwoMbBdpNDpC
 DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=6rR8yezLiiOifyfbCH6rFpm+KbbfendhQsyRn/st1AOpqG/+4cxdEApNqJiISOnulR
 KeR3hj52L/f6szdP0HTcFNeO7aXZucJrLtbh4YlyiqUcOVctBgizuO4C9KrUQRDcWuON
 egmPx/1t8iOcANwTg9ZREJdU6dEHTxLFWVCGtzOZM4DDPl8gX4cGEzgGf4kVXpLEFURP
 kjcowRzv2LGeIAtgem9Y141A7Vdi8ut3HAWPNvQbTI80G0aw0K9rD+17MVoLDYBm3DhR
 XcNPLpj91BRcaIkgiV5pF3EKTPHJVEx5WtVoJ8Ib/Q2bjmGMTSp4LaArohxqRbHaNIeN
 AwXw==
X-Gm-Message-State: AFqh2kqAZu17PGHq3FxH/eGu83Q7AewwWiwe1ETsk9ZqyViQF0N8KfhG
 hiTbagYz8aXZqyLHm4z+A+NJnw==
X-Google-Smtp-Source: AMrXdXuJf38NMjATjxH1GWiammOC66orXHWZbba1E+Cz2zFWGhC7y+RzKSe7O8mRDZePq+Hw0/ACtQ==
X-Received: by 2002:a5d:42c1:0:b0:242:2844:8489 with SMTP id
 t1-20020a5d42c1000000b0024228448489mr4642207wrr.8.1671761437253; 
 Thu, 22 Dec 2022 18:10:37 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 08/18] ARM: dts: qcom: apq8064: add compat qcom,
 apq8064-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:15 +0000
Message-Id: <20221223021025.1646636-9-bryan.odonoghue@linaro.org>
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

