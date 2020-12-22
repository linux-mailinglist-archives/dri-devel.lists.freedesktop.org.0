Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCF2E053D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 05:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361C76E0B6;
	Tue, 22 Dec 2020 04:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D946E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 04:06:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d8so10833647otq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 20:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3IkBlOmHE3mDRbIb8lAHBUkpZJ3o80cNN5b/4sEG/I=;
 b=O1k3WNJ+ZWMvZi7jbPRZiQdb5o+RHSCA/oEtatliGGxW48ro1lZCP/28YZVHRTHraw
 l+ZJiye1JlYnwgijEEGQAdMMJOlVJuCgkdVFH1ohMVTMMYLShH7Lv4nCBZC+ecM5p2ZY
 7zPQ88z4mdd/o5CZzHFbqlztnwIaiVlzFjBFXiUHOQZMPQgYNaUv+1vffSgjlNYgnarr
 CTuAmIeVc73i+gi2KzNlDw2nak5wJ3R4ETOSTpmtuHiIAccbB2vWh6tmBH/NSfb6yO3U
 aJpoYiVRzMpw66ixRjhvFs5ogKuL8IsCUgl/rAIJre5HsoQsYIMKOu4qlp99vVSYyGWA
 YdHA==
X-Gm-Message-State: AOAM530DLSkJk08baZ526sFhD97cDX0z1Ai7CXAVY1o1JFwBeeoPfHKH
 BNuuE3FjodzhSCHKLaDEYA==
X-Google-Smtp-Source: ABdhPJzc2AcXawDMexyhwX9kljUmHJGpp3yp74aSZqBghugGE4ma17w5UwkOCA62mhIs+ne0II6TKw==
X-Received: by 2002:a05:6830:1189:: with SMTP id
 u9mr14233531otq.70.1608610007879; 
 Mon, 21 Dec 2020 20:06:47 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id m22sm4261765otr.79.2020.12.21.20.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 20:06:47 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop redundant maxItems/items
Date: Mon, 21 Dec 2020 21:06:45 -0700
Message-Id: <20201222040645.1323611-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
preferred for a single entry while greater than 1 should have an 'items'
list.

A meta-schema check for this is pending once these existing cases are
fixed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: dmaengine@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -
 Documentation/devicetree/bindings/mailbox/arm,mhu.yaml         | 1 -
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 2 --
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml    | 1 -
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml       | 3 ---
 6 files changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 7b9d468c3e52..403d57977ee7 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -98,7 +98,6 @@ properties:
     maxItems: 1
 
   dmas:
-    maxItems: 4
     items:
       - description: Video layer, plane 0 (RGB or luma)
       - description: Video layer, plane 1 (U/V or U)
diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
index b548e4723936..c07eb6f2fc8d 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
@@ -73,7 +73,6 @@ properties:
     maxItems: 1
 
   clock-names:
-    maxItems: 1
     items:
       - const: fck
 
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
index d43791a2dde7..d07eb00b97c8 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
@@ -61,7 +61,6 @@ properties:
       - description: low-priority non-secure
       - description: high-priority non-secure
       - description: Secure
-    maxItems: 3
 
   clocks:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index e543a6123792..b55775e21de6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -44,7 +44,6 @@ properties:
     maxItems: 3
 
   clock-names:
-    maxItems: 3
     items:
       - const: hda
       - const: hda2hdmi
@@ -54,7 +53,6 @@ properties:
     maxItems: 3
 
   reset-names:
-    maxItems: 3
     items:
       - const: hda
       - const: hda2hdmi
diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index 0f078bd0a3e5..22603256ddf8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -51,7 +51,6 @@ properties:
     maxItems: 1
 
   phy-names:
-    maxItems: 1
     items:
       - const: usb
 
diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 737c1f47b7de..54c361d4a7af 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -74,11 +74,8 @@ properties:
 
   phys:
     maxItems: 1
-    items:
-      - description: phandle + phy specifier pair.
 
   phy-names:
-    maxItems: 1
     items:
       - const: usb
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
