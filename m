Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7BA30DE7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8E10E2FE;
	Tue, 11 Feb 2025 14:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dRRGBCsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272010E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739283262;
 bh=1/ws8Ki6NG7C14KSm+ch5kNrGgb87tdV3KuV8rop8R4=;
 h=From:Subject:Date:To:Cc:From;
 b=dRRGBCsfCfungegBbvb/QdKKTbpVYpHAf1LLbUuN1+w4janWZxOa1n8O//jP2zOzH
 6ppaQ+Gl81LAqTtvhY93YVTFXOriBezIBP9Zbzz894DfjePJyDqxoRqy3h2bwoimWv
 2bgniwdsQ8GJ75ZmQ/gt7SO4AXV7Oi+5Fw2GLssmoP+Vsd3GIRLr/Ie5sJGNphDNx2
 hpkRrL9wtUeJNgQx5nBrEWz+b17xRQLWi2+WOcAEKj7nI7DZxBiqdh959XbuTrL1tk
 PHxGFy4cBjgXmeHXCEyAr33JGMazC0BT8/mgxyCxQIXuSu2jKzaXdOTJ6pQo8GeBky
 NhiW3EfX3fGkw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CA3D17E0EB8;
 Tue, 11 Feb 2025 15:14:21 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v4 0/3] Add Mali GPU support for Mediatek MT8370 SoC
Date: Tue, 11 Feb 2025 15:13:07 +0100
Message-Id: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPNaq2cC/23Oy2rDMBAF0F8xWldFD48eWfU/Shd6jBKBbaWyY
 1qC/72qU2gp3s0dmDP3TmasGWdy6u6k4prnXKYW+qeOhIubzkhzbJkIJoBxDnRcjNSM4uT8gPR
 8vVHpVQILySkZSbu7Vkz5Yzdf3x654vut0ctjSbybkYYyjnk5dRjBRM4kqug4uL4XKRkNShtrt
 DIxSKdUG8m3dcnzUurnXnflO/bTTB00WzlllDnltUErIJiXUIbB+VLdc3u/i6v4o0h2pIimBA5
 9ZIZD9HCkyF9FMH2kyKZoQOstE8kG/l/Ztu0LeLh9Ao4BAAA=
X-Change-ID: 20250115-mt8370-enable-gpu-3b6f595fa63d
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739283261; l=2673;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1/ws8Ki6NG7C14KSm+ch5kNrGgb87tdV3KuV8rop8R4=;
 b=l1gLMSzjHXCVSRBr92COcRy+kiCGv7Kl0gIzGok5LHsCKjfHRZngn+hJp6eC0Y2Go+86iLx4L
 5oocFMwDJ0kCQXELbaTcT3SodmZNUjl/o7MHsMGpqEuoZRzf8Z3WKow
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

This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
dual core), integrated in the Mediatek MT8370 SoC, to the panfrost driver
and to the mt8370.dtsi include file.

I've tested this patchset on a Mediatek Genio 510 EVK board,
with a kernel based on linux-next (tag: next-20250207) plus [1] patch
(not needed for building, only for testing to avoid boot issues on this
board).

The panfrost driver probed with the following messages:
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

[1] https://lore.kernel.org/all/20250124191644.2309790-1-robh@kernel.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Changes in v4:
- Add warning comment in mt8370.dtsi about GPU node override
- Reword "dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 
  SoC" commit message
- Add code-review trailers
- Link to v3: https://lore.kernel.org/r/20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com

Changes in v3:
- Rebased on linux-next (tag: next-20250207)
- Remove prerequisite change/patch ids
- Reword commit messages to better explicit compatible needs 
- Link to v2: https://lore.kernel.org/r/20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com

Changes in v2:
- Rework "drm/panfrost: Add support for Mali on the MT8370 SoC" to avoid
  data structure duplication, as requested by Krzysztof Kozlowski
- Reword commit messages to use imperative mood and make new compatible
  need more explicit
- Link to v1: https://lore.kernel.org/r/20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com

---
Louis-Alexis Eyraud (3):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        |  5 ++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                 | 16 ++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                  |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

