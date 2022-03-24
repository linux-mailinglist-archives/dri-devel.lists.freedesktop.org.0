Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54E4E65F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 16:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA110E8B4;
	Thu, 24 Mar 2022 15:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C510E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 15:27:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r7-20020a1c4407000000b0038ccb70e239so96471wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+ay7tqudhjbGbdnObBg9rVW5P7BZjQ31rnVnGMAZWk=;
 b=yoqOuL45S1UOIOGTlbIjvOP0bcxCkdJmgO8ybdxTGcfeYXEDM/kYQY5Z6U5IvTUlrA
 teugwQjBm4bNPPo/5MKruClvWqHLscb3DjwlkqT2o8KXo2YvAG0f1lr6wGfUt2IVH/GI
 LuMWm36r+7lU5phOt6LmbSOkARXaNetUPuFetaALFUzIeVHEe2XfAxuPP6W1+tOXLv1R
 +4S5S29KOI8tD1M7ubPpTaVDFXTViYra3jR6/wt2Jl+gK4n/A6aq1GicM2o4Ef6lFni2
 67DImm+X4wY+/1BLE/ziAbPoBDrAfVPdB8yjTWNJt+E7LRg78xdK03pNl8d5o10QmszF
 06dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+ay7tqudhjbGbdnObBg9rVW5P7BZjQ31rnVnGMAZWk=;
 b=GGLYHHNayVZuwwLi0phOLECfh7IltG8Y6TXxCh28JHCpzSb86l3dn7YGwZYhiVQT+H
 +NkvwP/i3IWrPjWKjAZijpa94c84muu9F5a+IHcd0rwNLkI5EiSz/9feG6+WV5rFzfEC
 giGX4ihzFZWeBOG81kSf3qTMhISGK1IcXGFFwmUuxvkxEi8w82TLdOrIFdaV5hr7h1J6
 X2BsId5dij09oPf/tBE4Qt5m2e0Y1+fPusGbqRivXcFVvE/JOTbJkYmFf++/fnPn+hT/
 tZ8bcs5UyRDbLjLe18iH8v52h3T8qJu74aMLSGWTnn1/P9tv88dyoiabBQ94NKTI2wQx
 +0ng==
X-Gm-Message-State: AOAM5305D3R2l9RdkmRpjjFfjflfEfGL+vMxhAybxk0SDiRevbCMnrX9
 1fe9ecnMewBogRzdMHHllyXIKg==
X-Google-Smtp-Source: ABdhPJws87KVaVeOTw0TuPGtZNrXPQklwZMoptawtDOQ+Tbg5xeUk0cUlzKNYP316LQXkP4tCMCcwQ==
X-Received: by 2002:a05:600c:ac5:b0:38c:9a51:3059 with SMTP id
 c5-20020a05600c0ac500b0038c9a513059mr5382446wmr.2.1648135624059; 
 Thu, 24 Mar 2022 08:27:04 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 g17-20020a05600c4ed100b0038ca32d0f26sm2808104wmq.17.2022.03.24.08.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:27:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: airlied@linux.ie, alexandre.torgue@foss.st.com, chunkuang.hu@kernel.org,
 daniel@ffwll.ch, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Subject: [PATCH] dt-bindings: display: mediatek: Add includes on examples
Date: Thu, 24 Mar 2022 15:26:58 +0000
Message-Id: <20220324152658.1132110-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

make dt_binding_check fail on lot of mediatek bindings due to missing
includes.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
2 files remains to be fixed, but their examples use some variable undefined, so I cannot do anything:
- display/mediatek/mediatek,ethdr.yaml
- display/mediatek/mediatek,merge.yaml

 .../display/mediatek/mediatek,aal.yaml        |   4 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +
 .../display/mediatek/mediatek,color.yaml      |   4 +
 .../display/mediatek/mediatek,dither.yaml     |   4 +
 .../display/mediatek/mediatek,dsc.yaml        |   4 +
 .../display/mediatek/mediatek,gamma.yaml      |   4 +
 .../display/mediatek/mediatek,mutex.yaml      |   4 +
 .../display/mediatek/mediatek,od.yaml         |   1 +
 .../display/mediatek/mediatek,ovl-2l.yaml     |   5 +
 .../display/mediatek/mediatek,ovl.yaml        |   5 +
 .../display/mediatek/mediatek,postmask.yaml   |   4 +
 .../display/mediatek/mediatek,rdma.yaml       |   5 +
 .../display/mediatek/mediatek,split.yaml      |   3 +
 .../display/mediatek/mediatek,ufoe.yaml       |   3 +
 .../display/mediatek/mediatek,wdma.yaml       |   5 +
 17 files changed, 59 insertions(+), 257 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 225f9dd726d2..63755d4d21d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -66,6 +66,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     aal@14015000 {
         compatible = "mediatek,mt8173-disp-aal";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 6894b6999412..b32355b32dfa 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -65,6 +65,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8183-power.h>
 
     ccorr0: ccorr@1400f000 {
         compatible = "mediatek,mt8183-disp-ccorr";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index bc83155b3b4c..ffdef0b30de8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -75,6 +75,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     color0: color@14013000 {
         compatible = "mediatek,mt8173-disp-color";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 9d89297f5f1d..7ac58022a2ed 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -65,6 +65,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8183-power.h>
 
     dither0: dither@14012000 {
         compatible = "mediatek,mt8183-disp-dither";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 1ec083eff824..1ab30b0efffe 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -60,6 +60,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
 
     dsc0: disp_dsc_wrap@1c009000 {
         compatible = "mediatek,mt8195-disp-dsc";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 247baad147b3..4f8ba492dc0a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -66,6 +66,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     gamma@14016000 {
         compatible = "mediatek,mt8173-disp-gamma";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 6eca525eced0..ad3a69d1254c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -71,6 +71,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mutex: mutex@14020000 {
         compatible = "mediatek,mt8173-disp-mutex";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 7519db315217..1f92566ff5ed 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -45,6 +45,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
 
     od@14023000 {
         compatible = "mediatek,mt8173-disp-od";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index e3cef99d0f98..e810e152404a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -66,6 +66,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+    #include <dt-bindings/power/mt8183-power.h>
 
     ovl_2l0: ovl@14009000 {
         compatible = "mediatek,mt8183-disp-ovl-2l";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 93d5c68a2dbd..14673f979edc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -81,6 +81,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     ovl0: ovl@1400c000 {
         compatible = "mediatek,mt8173-disp-ovl";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 6ac1da2e8871..d0d45d1e4f15 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -58,6 +58,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/gce/mt8192-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8192-power.h>
 
     postmask0: postmask@1400d000 {
         compatible = "mediatek,mt8192-disp-postmask";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index b56e22fbcd52..2265fef6a795 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -94,6 +94,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     rdma0: rdma@1400e000 {
         compatible = "mediatek,mt8173-disp-rdma";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 4f08e89c1067..83e6cb40ba7c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -49,6 +49,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     split0: split@14018000 {
         compatible = "mediatek,mt8173-disp-split";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 6e8748529e73..69cddc2ee531 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -51,6 +51,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     ufoe@1401a000 {
         compatible = "mediatek,mt8173-disp-ufoe";
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index f9f00a518edf..60e9f890ebf1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -64,6 +64,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     wdma0: wdma@14011000 {
         compatible = "mediatek,mt8173-disp-wdma";
-- 
2.34.1

