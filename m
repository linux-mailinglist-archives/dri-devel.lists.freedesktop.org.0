Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB1565BEE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E519E10F8BA;
	Mon,  4 Jul 2022 16:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F810E1C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 16:11:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t25so16520541lfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33SMaLh1eoDBAxmhXTjcVQWnyDJ3mzNy1PP5WaC9dV8=;
 b=rspOa5EajZPOfNl0ESTchvhQgYhmUu8/ueOoPO44oe2+2Wog+oNj1fpANVwPGESYrF
 5XvBIRqQLRYgoJfdxt/vk4TpyHZd/ZEG3sxCaKFGtFfeS7whXyDPggGmA71CDY9s6915
 2IXUgtBd9BuBTr7dW+Vb0erOlBGKLD9G+mUSlioCNwkwLtOpcyOPF/h2BL/lC0s1St6n
 xSs7vPhyOP4B4CEwjE8N+BvQHR3TqjV/3JDffKSzfuBG2SCG/3t7D65UOJLTD/pdI1dC
 7/DNB/IFANuvTq/u4p1D+IxF+djQM0Lg8QSBwGoja6RbCIA6rpxflr5DfuZTRdhECOd0
 lwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33SMaLh1eoDBAxmhXTjcVQWnyDJ3mzNy1PP5WaC9dV8=;
 b=et/Z8Gx2BxCYbi02oqlsstY5KF56CGhIZeV15xlpJ6JCDj3mmQSR/BYErtPgdIjDfW
 6tRjRiEiUEDPZ1mjU8hQMRPSzbv9mBZh0vjfa14tuP3bmNTIsaqoD6wJ3LnYq4MI19HS
 bQExtzXXV4iY6s/7w1evWpnbO78xDeabvs3zqykqBsg012uFDWzkejNBhf8JZ7UAyy4E
 ZoybacmYb1jeXvGgyoRHHjwj1i8e9qte5LRrjxra0NEemO9zA9TSfZrr5iDk+w1UUkkG
 +nHqbzG3H1nQp381DU1BYDvBes0bdaqDM9Sy314qikAnutD2/3w9Y6Ls/LUZKD8+KeAI
 Zc9Q==
X-Gm-Message-State: AJIora84zemEG9bi3KrWL3eUEsnrNI2jZ9ItHZfftB2yjVAmJWMyzghu
 V8uq7aS8GkwIvoiuGDuw4JPboQ==
X-Google-Smtp-Source: AGRyM1tME+0Mf2I5nShZjoogNnmb77dv/j/FemxX3GyQsTed1mGiCD2xsSlfShkpWOGQKuQxOnKESQ==
X-Received: by 2002:a05:6512:3b9d:b0:47f:7712:3ece with SMTP id
 g29-20020a0565123b9d00b0047f77123ecemr18483411lfv.127.1656951110999; 
 Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,
 hdmi-phy-qmp: add clock-cells and XO clock
Date: Mon,  4 Jul 2022 19:11:46 +0300
Message-Id: <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required. Also add the XO clock to the list of the clocks used
by the driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml           | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..83fe4b39b56f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -28,12 +28,15 @@ properties:
       - const: hdmi_phy
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: ref
+      - const: xo
 
   power-domains:
     maxItems: 1
@@ -44,6 +47,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -75,9 +81,12 @@ examples:
                   "hdmi_phy";
 
       clocks = <&mmcc 116>,
-               <&gcc 214>;
+               <&gcc 214>,
+               <&xo_board>;
       clock-names = "iface",
-                    "ref";
+                    "ref",
+                    "xo";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

