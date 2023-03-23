Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A026C62D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 10:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89E710E46D;
	Thu, 23 Mar 2023 09:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C2110E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 09:08:31 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 528ED66030BA;
 Thu, 23 Mar 2023 09:08:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679562510;
 bh=JcZeO7Hk3n9YL6Pyi7NcCAIvRNlewFD1uN9/JWGWjig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pa1eBUYWyXpb6J00y4TJShK0pq0KPDk2f879FEVLsQS/INas4+9Ehex8ddiYIiGnc
 aNYvXWU++wlqJPqt2/7+doYWpek+TXZ7OXFhcA0wnmMKnxjK4HyPtO6mEOfwZv4ZM4
 OL7NfTXNN02l6vvqX4aMUIQMpid9TDYxhVIWh4MCweYQHlZqyYwRcs9TW7Gg/NmdCB
 brUy8qw8FRHcilSKhTzlEdsbJakep2aazUQw2SpinZ5N2mHG4U2zwCsxe5Don1RuBd
 CY1fwSKmFBbZyGCzFSpcgI3BU59qgnT1AxB8KVL5G9zY0v4dOaHDMYzkie8uXZCWGB
 xdZgMvvPGov6w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v1 RESEND 1/2] dt-bindings: gpu: mali-bifrost: Document nvmem
 for speedbin support
Date: Thu, 23 Mar 2023 10:08:21 +0100
Message-Id: <20230323090822.61766-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs implementing ARM Mali GPUs may be subject to speed binning
and the usable bin is read from nvmem: document the addition of nvmem
and nvmem-cells for 'speed-bin'.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 8a0083800810..1eecb014016c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -104,6 +104,13 @@ properties:
 
   dma-coherent: true
 
+  nvmem-cell-names:
+    items:
+      - const: speed-bin
+
+  nvmem-cells:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.40.0

