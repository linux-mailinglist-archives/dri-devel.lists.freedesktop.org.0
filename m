Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49995A39662
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4DB10E03A;
	Tue, 18 Feb 2025 09:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WijSGcAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E3C10E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739869471;
 bh=IoSrMv71ID9ekjkacGKInTn1Qnx2Ah1BUMPVIHvGazY=;
 h=From:To:Cc:Subject:Date:From;
 b=WijSGcACUlEnBBBHl8nT/4Mfk4xzfBSRXR9zDgaGaZAuN+hz5zIunMgnkpZxb6KzL
 2hsGGvmV9bxvViftYTpmr1oaVMM2GEhSn+0Hd1BuK+Hn6KwmhjjICZMwp9qQbkq/Ez
 4IaGG6UYhQcfcuxWOgL+fxElV6KG/pDFZEsVwlrpaTFfFdoliFJWGAdPuSxIPTo+xC
 EiNpnrIdrdjKgbUoKTiCaEPuOc9RKl8+LR5mQCvh7gB2mG1zDydpBrdxhCGf100yVv
 pp6clctCSE9HALXCRLZ7/H3cjLILN+m3VVgNMoSti06dTFSZ+CD0nRHPITe8/+AIuM
 qc2Qkrlwgc1Zw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 90FDC17E154A;
 Tue, 18 Feb 2025 10:04:30 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 pablo.sun@mediatek.com
Subject: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
Date: Tue, 18 Feb 2025 10:04:27 +0100
Message-ID: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
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

Add compatible for Display Stream Compression (DSC) IP found in
the display controller of the MT8188 SoC.

This IP is fully compatible with the one found on MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 846de6c17d93..a5b88eb97e3b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -22,6 +22,9 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt8195-disp-dsc
+      - items:
+          - const: mediatek,mt8188-disp-dsc
+          - const: mediatek,mt8195-disp-dsc
 
   reg:
     maxItems: 1
-- 
2.48.1

