Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16E620446
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95010E405;
	Mon,  7 Nov 2022 23:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F910E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso6573085wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6+k+VnBlUqDvk2kkm8jof+dC2sdOCi6gT/1zjBraSs=;
 b=i8bcjlRLWz2eVfBMXkZ+YP2GXHL+oICNaqk7chAMX1OPwEKT+r2xr+BagAoqefWCle
 Cp57t5oK7tzFmSGPg5BujBFd5C2xazKjfVDVREUg29hAUAuP/Of9NOIiET104ftzW/k6
 9qa78qJG3L4iry45JEQYBRN0iC3WjqCvTVKD617TmcrYi85srsf2Z5U+z+aXcko4Zj4o
 unXqjgpxrbk7JVk3AMaITpUL/CMpI0n9NsylkUSj3PljH+eRTtL/Fc/82xqvreHIz3bS
 8BoXVZW/wUEgyr7ryKuVtRvuvIFIMRdCI302mst4RICl3FXerToMirc2M5rMq9bfh6Az
 bXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6+k+VnBlUqDvk2kkm8jof+dC2sdOCi6gT/1zjBraSs=;
 b=Buw+fMRTdRt1pmvoWYzmWB+fC34E+Al7f1oKjFAtfHPenmXyX7EEq32WDy6UcFlbuJ
 sMaQ0VyhHzor2JPr/fQQ+RaeGrVrDV+ffNIaA1PK72vOv7ql3cd1t4kUDp7O+8YHFVKv
 JHmg48AFM3r/UV535tAVC2hxs65+bYPA5xwagaojBbqltACAgINuD+lCIFoz8MTzRJPg
 8EEKOpi0DspqI+RpaccJimrBMXPBdZ6Hqwh2EPTvYKqXo1UQ4hvvpk+mav1WmP3SQE9S
 Q7QO6q7iPr1y5Hbefm7Kn3d09L5roU4wwT/lEuB3GxswbX2BCt88vsbaD8JE/uJryqfw
 cbog==
X-Gm-Message-State: ACrzQf0Zd9Yx0OpQGNTscaIvFl7lQWw9CWcF2MUsfHlGtYa7+nEMQt2j
 XzIk1n5Tlncv+vOdTnS9Xo07Xg==
X-Google-Smtp-Source: AMsMyM4BjviatZxI4AXfbI//77GZJxjhD+ZNpWnd4ktfs4CcSRgEUb++H9AvtkRJj7nhqNoH3JXbQA==
X-Received: by 2002:a05:600c:4d86:b0:3cf:7257:ba15 with SMTP id
 v6-20020a05600c4d8600b003cf7257ba15mr29852243wmp.22.1667865419855; 
 Mon, 07 Nov 2022 15:56:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:56:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Date: Mon,  7 Nov 2022 23:56:39 +0000
Message-Id: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. Mark the supplies as required as was previously the case in the
.txt implementation.

Warnings about missing regulators can be resolved by updating the relevant
dtsi files to point to fixed always-on regulators where appropriate.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..0f7747e55b9be 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -124,6 +124,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vddio-supply:
+    description:
+      Phandle to vdd-io regulator device node
+
+  vdda-supply:
+    description:
+      Phandle to vdda regulator device node
+
 required:
   - compatible
   - reg
@@ -135,6 +147,9 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - ports
+  - vdd-supply
+  - vddio-supply
+  - vdda-supply
 
 additionalProperties: false
 
-- 
2.38.1

