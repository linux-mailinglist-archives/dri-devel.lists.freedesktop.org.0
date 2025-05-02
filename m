Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B672DAA7173
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B166B10E36D;
	Fri,  2 May 2025 12:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S6yH0aIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054DA10E369
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746188248;
 bh=tC3yerrzg8rWelNEn6xwDuErAgY2oEHyEk9X9qlwnaA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=S6yH0aIPv6+Y4J/CTeVkMVQErQvZLIvVa94SXTDFatQ6CW+HIdJSnbbNkXjPXyEPz
 2dPA6MgGO3Jw92nrhecf8JcWDR6cpwcpmfhJPn5IGd2mo/7kBkJlhYV04ZmcOEH+Tt
 3WjUhVTYiP46dzw9ehts2L8h78weUZ/J6xoMI+uWn3frHkFtk/BFctpMJg/+ZwbD0f
 sH5F3pYbHqO4u2EIZuVQxWv0bUA4ccxS2ksXQ0YLW2RivHQFuTlJG+OqxDS37dBQDN
 gmBIOjFAaVmPH/7Vbhcx44A9iIp+mP5wIwHy881P7kTv2tNzk1inDfJxQXyt4+hEdQ
 DbnplMzq0lcIw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D8E3A17E1047;
 Fri,  2 May 2025 14:17:26 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 02 May 2025 14:17:16 +0200
Subject: [PATCH v5 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-mt8370-enable-gpu-v5-1-98e247b30151@collabora.com>
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
In-Reply-To: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746188245; l=1599;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tC3yerrzg8rWelNEn6xwDuErAgY2oEHyEk9X9qlwnaA=;
 b=vVN4lbu8agmw0jNb5OBsUl+KyjjfGYL+6AQ/tEDBrN65MFF5zBz/lv07ezI/3a5Xq8QYx8P2O
 hkcYeiq/3W3A5BAXYftpMyh/QszQAldt5J1SHwTiQpLvPpc8TZ1gg/+
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

Add a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
None of the already existing SoC specific compatibles is usable as
fallback, as those either do not match the number of cores (and number
of power domains), or are for a different GPU architecture.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 019bd28a29f19bb4f7a9c32434b208b6d04db221..5726b79fd0f9de8914f724929f462409e088ec31 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -40,6 +40,7 @@ properties:
           - enum:
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
+              - mediatek,mt8370-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -221,7 +222,9 @@ allOf:
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
2.49.0

