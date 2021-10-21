Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCE435DE3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B93D6E425;
	Thu, 21 Oct 2021 09:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4066E425
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:27:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so155712wmd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUizT5Wo6QNRZzLKQyX7xAagO6y2u5vlJ1IHIzpEMig=;
 b=8MyqEVx81dV7pE7mPfN/OecXsjb2Qv/SvK1MGn4n2hIQNJ6xMKdEUM7+tSQYLsARc3
 384KGvuma+/fJGBxypQUfCheMIhkOkkRINw34Pzd0q/SQ6tR4MlMAjs9O5A3OrQOsiRU
 XQn7qlnXHnN2U/PjSlX/4M3Zd3m+z09PEBjntw/9xgPMKCdU1Si1ds056Yb8Dx1rl6rb
 NTVjgk1gQDglYkuxVLUWjuts337Pg5iKRfsw9QdieDjb/xigjd6HO2bazX259Tg7ET2a
 rA6JVukqzDBTeTV+BTOloCEfnGeeWnsh4zYM+WHymrp7JepuIuzfZ1Xb9JeDLn3+BS7/
 O16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUizT5Wo6QNRZzLKQyX7xAagO6y2u5vlJ1IHIzpEMig=;
 b=1gjxiAJdIIhR+NMC6Ov0OielHYVtv1URB90vi1uQbD9vZbU7UV41Q7RBtAiGiVNKEI
 FIb4sFz+tyzCJFjYJbOa1nKTYgDKtRJa0fScZYaBKfOnLJxHLnNHqQSosX4E+cIYzOoT
 xUXSL+qMEZtzbNvqpwBz5pqvGMLKQI8Dz/J2k5kaJzy3oAHZ04+J2ezWnIjTh3aoQsRN
 m/1Wo8bd6PCXrLHi2j6LgoIVKp1CYAVNGPggnO73gc3v7fcbCGlSCP0h8O4L729weMse
 gvtCkK2m4vdB3kO7v2fPcmPZYa4HT5e/nanirt30BoFAC0XTHNE/2jFOjo7DqQJF/jHx
 daCg==
X-Gm-Message-State: AOAM530e98v3oaXNaVx9UjOGB3SAyWBEYZ/SbGPZyc0zNAPRsvqRt68b
 q+iB/uHpQY2eV4LK33o+MaDfZg==
X-Google-Smtp-Source: ABdhPJz1E+9+oInCY1vqxibaqKskcDP7eWbh3y5SDTdZxzg/MhVoYwSyqQLSyEcMXzma59LSuMGbqw==
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr19808078wmi.59.1634808446096; 
 Thu, 21 Oct 2021 02:27:26 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id d3sm4538468wrb.36.2021.10.21.02.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:27:25 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v5 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Thu, 21 Oct 2021 11:27:01 +0200
Message-Id: <20211021092707.3562523-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021092707.3562523-1-msp@baylibre.com>
References: <20211021092707.3562523-1-msp@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP_INTF is similar to DPI but does not have the exact same feature set
or register layouts.

DP_INTF is the sink of the display pipeline that is connected to the
DisplayPort controller and encoder unit. It takes the same clocks as
DPI.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes v4 -> v5:
    - Newly created patch after realizing that the specific clocks for dpintf were
      the same as engine and pixel clocks.

 .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..53acf9a84f7f 100644
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
2.33.0

