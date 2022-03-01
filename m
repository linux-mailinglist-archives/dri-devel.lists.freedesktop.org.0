Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A344C9783
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 22:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333A10E1FC;
	Tue,  1 Mar 2022 21:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D5C10E13B;
 Tue,  1 Mar 2022 21:05:29 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso23883919oon.5; 
 Tue, 01 Mar 2022 13:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LA63EIWpIZ22OioRlWHUUutV4ScbviS709H8bVJmJVw=;
 b=vasxbcCCDiloJH5X3b7vgzr5sQMh2U0c7FzcIRCX0cCQi+Ouwi1b/pWtcpr0ZWmNTP
 N1PI7Hfp36DY8SLstHEB2Uw9L8s4xuzQsBMWKS0yFUw0CjTzF/pWgcQu9S/i5Gkf1fVu
 qdl4K8TPKtC9lzUCiIDNOT+TS7qz7J20xKJOLbHJf2B/qzxz6EWcWCn6384vjrrR0/NZ
 vYbAYmyBFgaXFQa7SAlIKC4XwKGd6HD9O2yh4l/xPIDnomjN6vPumrIzeqWKoYnniQEL
 w15iAUM6GcWBBlFSGQE9Hpm1V8Zaqm3gSf2vz1CRsOnVckpL95iSxBiTd+NwDxog2JqN
 4bpA==
X-Gm-Message-State: AOAM533hfZqiX5YoZ4wgjQDspwmmQSZuUn8GJ4H5aaIf0JJIXXcaI2Xd
 2ST/76rXb7K072GcjTXvJg==
X-Google-Smtp-Source: ABdhPJyfiQHVEpQyGjJIrnx0etDK7qNmr6LLYws42hGF8QBlc1/VXskb0M4ja4dcze527igdCgI0Hw==
X-Received: by 2002:a05:6870:63a7:b0:d9:9e33:c9d4 with SMTP id
 t39-20020a05687063a700b000d99e33c9d4mr98939oap.69.1646168728216; 
 Tue, 01 Mar 2022 13:05:28 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 t7-20020a9d5907000000b005afa4058a4csm7125244oth.1.2022.03.01.13.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 13:05:27 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: Drop bogus interrupt flags cell on
 MDSS nodes
Date: Tue,  1 Mar 2022 15:05:13 -0600
Message-Id: <20220301210513.1855076-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MDSS interrupt provider is a single cell, so specifying interrupt flags
on the consumers is incorrect.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/msm/dpu-msm8998.yaml          | 4 ++--
 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 167bc48748d7..2df64afb76e6 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -155,7 +155,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    display-subsystem@c900000 {
+    mdss: display-subsystem@c900000 {
         compatible = "qcom,msm8998-mdss";
         reg = <0x0c900000 0x1000>;
         reg-names = "mdss";
@@ -192,7 +192,7 @@ examples:
             clock-names = "iface", "bus", "mnoc", "core", "vsync";
 
             interrupt-parent = <&mdss>;
-            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <0>;
             operating-points-v2 = <&mdp_opp_table>;
             power-domains = <&rpmpd MSM8998_VDDMX>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..28617bc1d2ff 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -197,7 +197,7 @@ examples:
                 power-domains = <&rpmpd QCM2290_VDDCX>;
 
                 interrupt-parent = <&mdss>;
-                interrupts = <0 IRQ_TYPE_NONE>;
+                interrupts = <0>;
 
                 ports {
                         #address-cells = <1>;
-- 
2.32.0

