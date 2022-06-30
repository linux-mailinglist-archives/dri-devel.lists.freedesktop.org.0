Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E695562CB4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5A10FF65;
	Fri,  1 Jul 2022 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8DF11A2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1534484wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
 b=sK0CAukDTWACoQtJfMyFzJ3PG/JOH8MqpXMYQA/NMqS86Ozt6beCfW1ean69vMDTvY
 QrbAxJeq1oyQxXSwPABP7oL8PC9MeyrLHeCjkwWSjpgy6KdjVMxdAtaqsxsCSN4Uu+hT
 Ss/3czz6km3T2Erk4XxuX7WajyqSDY8FAFaPRAde5utsskpye+gmtb/5g3K+satVmjER
 HubKyT5l6SomqJmaet0ez70gvmJuoW3hJyVaRRsrulfPVR0OIW9NXsquZ6nklkF52eFT
 9IHDVJRfKySd+w+nW+YxBAXl8imBpVgyCB83i9jn4fM18rmXJjgN4bfraI5J2b48UJ3Q
 gaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
 b=pseyPryhlWQZg0pksMFCpwHSyFQomXFe8l91rg8Tfm4dT6GI0BanAODNwl6tsq7nEB
 Xl54hJ/zfbOyZSzwzjxuYFTIdp9G2OzUQb57U0ka+/Q2gTpW2RI9U6Ic6YU+5Cwi2mil
 ZwZ1VrkU/kDOtbVmbGlCbzWc0AlvQ1GuGDWbcNIovUro5pXLkJ+rDjZv2dROZsvCTyFq
 H0lQEZ3PaLAz1f14TLHCLf08iPaaxXAYmcEGylaAoI1i3j1Uj2cVaiaExt0npEHAVhmy
 lJVat8sJ3zR0QuEa3yvXLicVi4qPtdm1cYpQZ+oP49h7rfYQzlDOYLNiXgBM+aRso/2y
 rmpA==
X-Gm-Message-State: AJIora+JBpYuA+pVUXyswf/3fmzKU9VvL26i0PSduWuYtQ/KzREw7LTE
 R5OQrIgkDtUl/DWzX5Zoz+vfQQ==
X-Google-Smtp-Source: AGRyM1uGKVKbziLy2t2BlcrLr0mk26fcsPQY7sqpIVNX4XJVkw9hpX1thprzgTd3GKF6NI4k0lSu+w==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr9624027wmc.73.1656590935626; 
 Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks to 28nm DSI PHY
 YAML
Date: Thu, 30 Jun 2022 13:08:44 +0100
Message-Id: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add in missing clock and clock-names declarations to the 28nm DSI PHY.
When converting from .txt to .yaml we missed these.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..9ecd513d93661 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -19,6 +19,21 @@ properties:
       - qcom,dsi-phy-28nm-lp
       - qcom,dsi-phy-28nm-8960
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+        description: AHB clock
+      - const: iface_clk
+        description: AHB clock
+      - const: ref
+        description: Block reference clock
+    minItems: 1
+    maxItems: 2
+
   reg:
     items:
       - description: dsi pll register set
@@ -36,6 +51,8 @@ properties:
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - reg
   - reg-names
   - vddio-supply
-- 
2.36.1

