Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E147A13C25
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3286310E986;
	Thu, 16 Jan 2025 14:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pLHqYxaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8115510E986
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737037601;
 bh=8yu7sHlF0L2J8I4QtITvucR3TWX1vtVwIa4uOowDQX4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pLHqYxawEFfhX//hlffTWDVb7MVEpmZ/efsoPvfHKmJvNrl3vxBKcMISazpjPR3Us
 HqsEEJUgMKDb75jTxdiCHLsu0u8SJOYPFZSr2sRQTOBx13EbcJrNExhKTTpYl6bt5P
 j9S4+VQQ8tTRaj+bAK+lWvawQsPitQrxrmDsOCdxE6HOpr4ZRg+knvvBBquyjzgS3B
 er2pcaF9kBojGN8NeEj7uv3J5Dib4MGFdUvR2LTxwpvA2ukJADg+NBQzmwCa8DWAhJ
 t1Jnm8JxAgvRJBVS6WTIhfa6JHHLwn3WDA9uES1tifR0OIER+d+N6vR9bn+1VhslRZ
 WWRyQR6JuRB+Q==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 25B6317E0E57;
 Thu, 16 Jan 2025 15:26:40 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 16 Jan 2025 15:25:57 +0100
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-mt8370-enable-gpu-v1-1-0a6b78e925c8@collabora.com>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
In-Reply-To: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737037598; l=1275;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=8yu7sHlF0L2J8I4QtITvucR3TWX1vtVwIa4uOowDQX4=;
 b=yCw5VTaylfzCb8NuJETVRnUii/5h0PZCc+oIK4nytALD7sRByWwT1c+T0voQUD2vP6aoKaqjJ
 4L4zJ1vzc0xCBu4mNjJODTuS0pt7OAeDyD7f9srBcqUFqCDnfALiHJW
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

This commit adds a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
+              - mediatek,mt8370-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -217,7 +218,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8186-mali
+            enum:
+              - mediatek,mt8186-mali
+              - mediatek,mt8370-mali
     then:
       properties:
         power-domains:

-- 
2.48.0

