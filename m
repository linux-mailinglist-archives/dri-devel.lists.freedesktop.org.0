Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404FF478F22
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCC112AE3;
	Fri, 17 Dec 2021 15:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19B4112AE0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 15:09:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j18so4688332wrd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 07:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=HiI6Pzls1JZKv4QmjjgDV0dP59e7eML5Uxrijbu7h94/E6mIBwXfsvMDg/0qDsS/40
 LQ6IaIMyUkNrczWzL3lRvSWZJEjUPaaTesF8oi0tzguCd+hloRw+9tj7+nQ12eqgozsh
 XTtP75hHNxb8vbVPWp0m52ZoQFpl8RjTJnMIhuMAbhMBMQrin6mFYaW6JRGnxoMcX7xj
 LIal1DRnVz6dKP/zniJdPQCjiT7aLJt3f0GG30ccY/w2qPiaJPgA5m7PxwBBVmpNGbVx
 /pf0qcU07yC+xQWkI8l6EfwQBE+kbp7V/jj/x7NZzq0VXECNDhNuN0VxvEm/iU6lx84c
 RsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0zmm5Uwifws1MjnZkoUoDiCdMAMP2gTWa9ThB/Ce5w=;
 b=fnkteH/wSyUZtfVPbmuWxZKv+mS8vRsQ1oCiUgiQTIO/tKZ1Vba7C9dwQQ0uKeG/oz
 jisRMVaVzo9AMa7JYpxI5BDiZQYYQHRBzMu2CWTRVAN7dh4pZgOX1Hfc0sbNbvbQsvxD
 Os4p0SBiCZQlpgundUlRxEB+Z66l0IxW9NXTeIz/2lhGxCTgl9rkV2B7vq9KlOl5HIEC
 hCKh8W8IxHhlIiKYCzbNvbuCyQVH+l4Mybnugj1YCCsg3LB3FRlFcXeYzhWNwS8+MVg9
 4X54p1LmMWyaZR5kZT2RLTG5SWL0N18lWu19tKcQz/nE6DWYnl1wLJcOHMLPo/3NERLE
 8inw==
X-Gm-Message-State: AOAM533ruZ0qEh9iGcBiqVL0jkyUZQHMKraCxx/IIism4DkZyDswRgLx
 65SVolhPS8w8PLPmHXhFCrMWaw==
X-Google-Smtp-Source: ABdhPJx5/1BsBGu53I1FtcJbP7X+IDnOXTCM7flbne+QScrb5fAv3VQF1KMorpUVilt/7lV7ZP4BVw==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr2935396wry.424.1639753759334; 
 Fri, 17 Dec 2021 07:09:19 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:18 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 1/8] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Fri, 17 Dec 2021 16:08:47 +0100
Message-Id: <20211217150854.2081-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
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

