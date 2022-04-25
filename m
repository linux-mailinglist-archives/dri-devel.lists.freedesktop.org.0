Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3150EB01
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3852410E23E;
	Mon, 25 Apr 2022 21:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D310E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:07:13 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id n18so28369322plg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pa6zrNLxEFTJIYew9I+MslyE/BqjUU2Vfh9xpblR54=;
 b=Shoz3tJtEfbeJHLbZbbAtm+y0n+qLrUd1IsVnLxx+HlgH0lU5Bzat9UjXBvtUxxkcZ
 fWVUxh4HAjy8+bLXQnIQG4pqK/T/ki1Ts5oXpNSWDKVq5nlj2zefrPxGz04zSJctnqww
 MdFeL7gkO8jwSYpuKBh4ELKQF7TnQPSYm6R2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pa6zrNLxEFTJIYew9I+MslyE/BqjUU2Vfh9xpblR54=;
 b=4scrrfS+Nl1PxfMCFdwO6n07Pn2doMhOiuBeggppL6Z18ErWGW95qs86ZV4/EMIFTn
 lXHfGB0WQPSku/DgmpZlps9A4j7v5qBFqMNDs7oRbcu/fYyuo6tqyB44+a89GkC24yd3
 SedcaAsfOXLs1q2Z5IcQCr2zhuzi3Ew6SLi7LDiyzilQL5zrQBlgdh10n/+I4Mhq0h4E
 MKK7yGIZeRjAbtv2Cpx6f9oUv91qjc8hQCalpZcenngmmfeUmdvALk/Hj+6UdrGioEQ2
 e4hheW0cxINdVl99wcOXFYXAF4/BkyzK7M+w+WnQSHmMq8QBvZpdsb1t2GuR2PZGF1IR
 Hckg==
X-Gm-Message-State: AOAM533Pjx55Smv7uYHIbj9sY5yji0p/Ysxxl3RCC22exZZrt7gOqLyW
 SPAQXsCFXygtCVv3Dts/tHy1BA==
X-Google-Smtp-Source: ABdhPJx+uxbkSaPe2+0BH9EheOMTgYzUOtVzJymppogmrFVLTMjQ1PWdb8ch86SegBtXfRZtKHInSQ==
X-Received: by 2002:a17:902:cf0f:b0:15a:24e0:d9b0 with SMTP id
 i15-20020a170902cf0f00b0015a24e0d9b0mr19745380plg.42.1650920833478; 
 Mon, 25 Apr 2022 14:07:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:b820:7f63:f3dd:3da])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a62a114000000b0050d231e08ffsm8523202pff.37.2022.04.25.14.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:07:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Date: Mon, 25 Apr 2022 14:06:42 -0700
Message-Id: <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220425210643.2420919-1-dianders@chromium.org>
References: <20220425210643.2420919-1-dianders@chromium.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're supposed to list the supplies in the dt bindings but there are
none in the DP controller bindings. Looking at the Linux driver and
existing device trees, we can see that two supplies are expected:
- vdda-0p9-supply
- vdda-1p2-supply

Let's list them both in the bindings. Note that the datasheet for
sc7280 doesn't describe these supplies very verbosely. For the 0p9
supply, for instance, it says "Power for eDP 0.9 V circuits". This
this is obvious from the property name, we don't bother cluttering the
bindings with a description.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index cd05cfd76536..dba31108db51 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -76,6 +76,9 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  vdda-0p9-supply: true
+  vdda-1p2-supply: true
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -137,6 +140,9 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
+        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
+        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

