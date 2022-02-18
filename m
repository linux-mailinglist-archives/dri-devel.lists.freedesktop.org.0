Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC94BBB18
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01D10E631;
	Fri, 18 Feb 2022 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374F10E3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m27so3234976wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qC+RbOnlbAMYT0RkhfvSIqXlBo3fNavEyqmQsnLiR2Q=;
 b=CB/gthuBR1PKlTX0iRK6AGpgmej1LoRD8khuOAy0FQB9eCSE8iJkQM4NYE1ZysOiKs
 la2wmI5DNqHmk3Wie4KVwcRAjSuR3pv9v0Z3NBZHUVKejZwAY0Y78WkhHLlnXLYHPDIv
 KiAERdi2FrteWdUGKvtFGAAT71x4pk+S1RHGgB1i/atRB3wMMCKZVkDFzFbER0ZMu+O4
 VATNEmRSJkbX/ZDl4zvF+/q0Cl8dwfUwyt24KzEVU8MVMBpgeCCsQTzOW3z1fLhqK7CM
 WOhVK1BhA0a2HUW0Pn8hKI2l4dGz92rXj1d/SpDEDofgbA1bFqHzXEVn6guVSxM93lv7
 SjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qC+RbOnlbAMYT0RkhfvSIqXlBo3fNavEyqmQsnLiR2Q=;
 b=gPYxMvq3FuGoMPA0michSeY1u1PYmasgaCtg72cZn8tz/zR/EiT4AGUm2YtQqmnUFk
 gNBgBY99xX6bGx8MV0ZyIzYSj0sul9FVXDMH6t2Xqu8VMiY7qRu5hVSmS/5UulrlQgfa
 g1cPCHXYDYmv8PSYAOeQPVTuTEZQxRJ4xKQUMTG2zaNC0NwRoUpi98IpoaGDHKKyCd1Q
 Wwq5pIIRdF1gUOhElijyLdlzlFXBC13E7+Ic21M64jkNXPyU63dP8116hUGr9YkKoAiZ
 mHdGMB6Z4/IyFpHzyYokGXeLTovRLA/KLjc4DzLjzm4+58BBks6xlCs1uzenU7EqnakH
 Qi/Q==
X-Gm-Message-State: AOAM531BXuxI2nuR050CpOEiyH6g1ixCt9YA8eXKHUXFPnHG9t7XFOQX
 Rww2JLmYu4PIqYkmnQNZ86mnvQ==
X-Google-Smtp-Source: ABdhPJwNBdk3NS5ZflKP/t4iGuuUk373NB0fBIlAS30h710cFUX/Rlxqs4tq3A739PN3fuS29Ive5g==
X-Received: by 2002:a05:6000:257:b0:1e3:3a1b:d4ca with SMTP id
 m23-20020a056000025700b001e33a1bd4camr6304391wrz.112.1645196158903; 
 Fri, 18 Feb 2022 06:55:58 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:55:58 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 01/19] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Fri, 18 Feb 2022 15:54:19 +0100
Message-Id: <20220218145437.18563-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
2.34.1

