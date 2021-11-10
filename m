Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78344C1D9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344656E247;
	Wed, 10 Nov 2021 13:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357CC6E247
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:06:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso4577341wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 05:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=1m0Zm/PCzG9z0NWK6pM25Oo95Vg28gOv9Xxo1+5wlKgKglsyHyBsqDFgDUzTbsMB57
 xjaltweVlNWagApW8IO23aA6bVgPVDa1mHKIQenHFxGcg1slLrTpEjrE9KxGTEHQ43Hc
 QsTCAXXZ6mxyPu8yLVIpDLuPl0PiLvgyJYTuncv0ws/0NA4Su+PgOY9mN9SqBhD/tyks
 4EDYwHGKMDvkRSzKKECAGh+vTlT2CmOIs5U6Ye9qg3JNW52SlzaPJrsHf3U1W1osTt+s
 l9AisBK1qbStdmqnc1r4cAVDnZK8oK6nTjuazIEE9DpN+tS+uDGqG8wYbSIxIC+TWn6z
 ydKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=jisMtOvCd/TP9ozQZyvCxyXQxnosaWqhq6V36SP//k/8OzkcMJsdIgnfG5EE3l5cLY
 U9UmfRTNJyKxtDKhINAPROw9h64/2I3X6evhDqeAq93I7Qj04G4L0IrXIpmV/islI3zq
 3f1N0FU2yGe/BFt8l3xKAxmHT49nqdvl2eg9DTs6q41917XlEPcPfJfD2cldnAWQgBi4
 AwpRIm1GHk8beDzObz+dUiZPb26mYXHXFidsLeTRogrLlXQltTFuG5gVcawxlN5CKitZ
 LsDWmda5WQ78liQeHEo3LIZV89m/JLIZzg7smpaGQrYj0t1E0NPzRhxyzVnbQuWwy2un
 sKvA==
X-Gm-Message-State: AOAM5331pJfy29rReOIkHx97ZJtSKhCMKZg9yOBnRtg59bruil2VJhPh
 VeoZVmaDdSnhg/9vAnoUKEyXaA==
X-Google-Smtp-Source: ABdhPJxg96GtGO4PDG74wJnowtrVZTuUQp8gjbRnkF7TxTwbcLHbB6RNHz7trA0AOKagF0tJgbHZtA==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr15986433wmq.97.1636549593736; 
 Wed, 10 Nov 2021 05:06:33 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id i17sm5952175wmq.48.2021.11.10.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:06:33 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v6 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Wed, 10 Nov 2021 14:06:17 +0100
Message-Id: <20211110130623.20553-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110130623.20553-1-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
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
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

DP_INTF is similar to DPI but does not have the exact same feature set
or register layouts.

DP_INTF is the sink of the display pipeline that is connected to the
DisplayPort controller and encoder unit. It takes the same clocks as
DPI.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff08..53acf9a84f7fb 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,16 +4,16 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DP_INTF Controller Device Tree Bindings
 
 maintainers:
   - CK Hu <ck.hu@mediatek.com>
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  The Mediatek DPI function block is a sink of the display subsystem and
-  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-  output bus.
+  The Mediatek DPI and DP_INTF function blocks are a sink of the display
+  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
+  parallel output bus.
 
 properties:
   compatible:
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpintf
 
   reg:
     maxItems: 1
@@ -54,7 +55,7 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description:
       Output port node. This port should be connected to the input port of an
-      attached HDMI or LVDS encoder chip.
+      attached HDMI, LVDS or DisplayPort encoder chip.
 
 required:
   - compatible
-- 
2.32.0

