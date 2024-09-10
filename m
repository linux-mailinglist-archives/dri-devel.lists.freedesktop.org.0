Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDF9735B1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB6610E787;
	Tue, 10 Sep 2024 10:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PxGpsdaO";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="kMHkayiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 10:56:26 UTC
Received: from a7-40.smtp-out.eu-west-1.amazonses.com
 (a7-40.smtp-out.eu-west-1.amazonses.com [54.240.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2E310E787
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725965475;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=GzLfsDTUMMdGBR6iRZk3PPetRE7pbsieNX4s440SIME=;
 b=PxGpsdaOdQBWV7m9CIhBM9JlmLhz5JMsmQUlGP8N5v8Y9oIVTR0RFbBlBuDsxeT9
 6vJGeYX5IagBQ6Sd8MEqyLlKK+wtjzNXd9u7HyZ7G8s9YPzRf6qbZI3khaPsNvyJWdq
 sKT8aSUi7UFQ+VFgD3fzOzTwXiro4KiNlhLevCww6jyRJ6KOZ9qIOd5llRPXCQGe8HQ
 EquRXTovzmEEWF1ZjbUU33IVj+V/hbtgvLz8DlHQPkn/7xSp6/flCcdFJFXKEmzgrgC
 RP+FsVe9dj1WXfmdqpfuI6HY70SEOYLjkaLMaIG3MHTOWGquR2DJHzyBHO3qoo05yK3
 nFkBIO5fIg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725965475;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=GzLfsDTUMMdGBR6iRZk3PPetRE7pbsieNX4s440SIME=;
 b=kMHkayiFMkMVnmlgjx8D/5URNc9QKyae7D04k9yWaQFd9/dmzXUVj2fOK+TCK6ra
 6ZF3pgR0TnQPaQVJ02GhUjeP7OnbzmcOYdVrWl9YpjasfSVOed4YzwhPUq6OUdoEKN2
 DPOmbcw2zdip+OO4RUpvjvuqx4EIIElvD7dGQfTA=
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com, 
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc, 
 sjoerd@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>, 
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH v10 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Date: Tue, 10 Sep 2024 10:51:14 +0000
Message-ID: <01020191db8f1c5b-75771ca6-ad57-4568-96c9-b97353248de2-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910105054.125005-1-angelogioacchino.delregno@collabora.com>
References: <20240910105054.125005-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.40
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

Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
per HW instance (so potentially up to six displays for multi-vdo SoCs).

The MMSYS or VDOSYS is always the first component in the DDP pipeline,
so it only supports an output port with multiple endpoints - where each
endpoint defines the starting point for one of the (currently three)
possible hardware paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b3c6888c1457..3f4262e93c78 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -93,6 +93,34 @@ properties:
   '#reset-cells':
     const: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support multiple display outputs per MMSYS.
+    properties:
+      endpoint@0:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the primary display pipeline
+
+      endpoint@1:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the secondary display pipeline
+
+      endpoint@2:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the tertiary display pipeline
+
+    anyOf:
+      - required:
+          - endpoint@0
+      - required:
+          - endpoint@1
+      - required:
+          - endpoint@2
+
 required:
   - compatible
   - reg
-- 
2.46.0

