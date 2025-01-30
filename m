Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1EDA22CF0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760B10E94E;
	Thu, 30 Jan 2025 12:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nn1cAO0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1EC10E965
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738240283;
 bh=CN3+JuK+9gG4rZwQyx1SxziYFUpyVC/10T8zzKMX1ns=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nn1cAO0js0LnMBRrT8pgYaW1UkDmWQO/iPxwaO4laihzwhyiOtH1GqY/NkO6UhViI
 +ch1bH/If5pRmUDjTsm8jrFmE5BA29h7CJ5LHdXAiaDbFappBdZ+GygUOWIwYiMxXo
 SXyTSWJy7NtHMLHH94kpkjfJsiv6eBVoD1d3SRmMdm0BV5kY6Bpg4macb/S0/85Xii
 v2ToK3SyghHtBuinQWSY5JRKkNQfGMYpxM6Z1rMIW9ZDk7xbqm+A3jVykJ/haq9Whu
 8Pqkd0n2MNdDSK2QJmciCw4VDgKXyVXlpfpQQfZgXViCv4qXw3+btLtRp24KcRIHjo
 /rK+LVShtJkPQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 572EE17E10FC;
 Thu, 30 Jan 2025 13:31:22 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jan 2025 13:31:01 +0100
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-mt8370-enable-gpu-v2-3-c154d0815db5@collabora.com>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
In-Reply-To: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=1567;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CN3+JuK+9gG4rZwQyx1SxziYFUpyVC/10T8zzKMX1ns=;
 b=2dk7oHYmka9d8owX6/VMS0BflfeMp/HhNSEXuqnWFaDaO7e21xyKalFO/IFvJavcaUyqNC43P
 k4rzoes5qCZCnV7AvN7yS7OtK02LU9VB3dQisGpJdBpwQuNnvB0/gIx
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

Add a new gpu node in mt8370.dtsi to enable support for the
ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
Panfrost driver.

On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
following message:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
   80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+&gpu {
+	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
+
+	power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
+			<&spm MT8188_POWER_DOMAIN_MFG3>;
+
+	power-domain-names = "core0", "core1";
+};
+
 &ppi_cluster0 {
 	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
 };

-- 
2.48.1

