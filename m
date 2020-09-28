Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90427B14F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 17:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D269895E2;
	Mon, 28 Sep 2020 15:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB3895E2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 15:59:55 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v20so1861592oiv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pDZaQ21Usp87w25mzRYuT8tC9E3ltWzHrXuhQk5quZo=;
 b=X3iI2OK8Y5ys8yhs9lNkYfHN+Z4itTcLuez/33yOQ9jM59ecbulaEIjp+5f2BtvFut
 fKtUDQXaBk7h4LO3pCajfx4nxUcebHoVs+Xx+ms85p709Fh1bdzdJH40O7ZXujtPWiQa
 ifdf2RCaGHMMQLQR+2uDiFUF1HG6TWY8F/53czW7TT+BkmevCSjhy7BqtIxqNE14A46A
 llYNi6tW3eC79ZESd6kfJOotJw7UCAmpkKUdkjisHObL31EV0yaWZK37duiul4J5lkyk
 xkLakXa6r4FpE80gRnhQfKm3fJf2hWSMCr4PEUFhZzdmtxpcukLlAO9OPFRfVwUfEdtY
 sgVQ==
X-Gm-Message-State: AOAM5300/0b7a/b5CvNCcojbuO/nHhggMicHIGtOR4vjvbnJT5E0am5b
 ygX474rjSR1Lck9q4HnWCg==
X-Google-Smtp-Source: ABdhPJzx+t1SOL3gjMvBl7qVDgfaG2ctw26l0RciW4e4fNOhVNui+5TwEJ9WxZinHySz68G0w5+aZg==
X-Received: by 2002:aca:f203:: with SMTP id q3mr1238105oih.148.1601308794852; 
 Mon, 28 Sep 2020 08:59:54 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u2sm2170497oot.39.2020.09.28.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 08:59:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix 'reg' size issues in zynqmp examples
Date: Mon, 28 Sep 2020 10:59:53 -0500
Message-Id: <20200928155953.2819930-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The default sizes in examples for 'reg' are 1 cell each. Fix the
incorrect sizes in zynqmp examples:

Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.example.dt.yaml: example-0: dma-controller@fd4c0000:reg:0: [0, 4249616384, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:0: [0, 4249485312, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:1: [0, 4249526272, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:2: [0, 4249530368, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:3: [0, 4249534464, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: dmaengine@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml          | 8 ++++----
 .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 52a939cade3b..7b9d468c3e52 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -145,10 +145,10 @@ examples:
 
     display@fd4a0000 {
         compatible = "xlnx,zynqmp-dpsub-1.7";
-        reg = <0x0 0xfd4a0000 0x0 0x1000>,
-              <0x0 0xfd4aa000 0x0 0x1000>,
-              <0x0 0xfd4ab000 0x0 0x1000>,
-              <0x0 0xfd4ac000 0x0 0x1000>;
+        reg = <0xfd4a0000 0x1000>,
+              <0xfd4aa000 0x1000>,
+              <0xfd4ab000 0x1000>,
+              <0xfd4ac000 0x1000>;
         reg-names = "dp", "blend", "av_buf", "aud";
         interrupts = <0 119 4>;
         interrupt-parent = <&gic>;
diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
index 5de510f8c88c..2a595b18ff6c 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
@@ -57,7 +57,7 @@ examples:
 
     dma: dma-controller@fd4c0000 {
       compatible = "xlnx,zynqmp-dpdma";
-      reg = <0x0 0xfd4c0000 0x0 0x1000>;
+      reg = <0xfd4c0000 0x1000>;
       interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-parent = <&gic>;
       clocks = <&dpdma_clk>;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
