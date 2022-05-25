Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67852533FA7
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4302510FA89;
	Wed, 25 May 2022 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41210FA83
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 6B8481F450F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490687;
 bh=+4m7P+pQtDoPRLeJ/o/TRoRtSsTCzrenQkb157P79lQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TlKOHXS3aCs3rvje9nB1n31DpTc3NvRCrZn0OdKzxRi9cxs4OLRCPXZpVxuGqj0GX
 R5j8gxzle1zXngChlMkXIILoTvIpAvjWBNDuIvAM9yY3TXpkf354PccFwBpqSJwbk4
 qsutJTt2eILUFYhM7/33ZP8HXp3a91pV3NsKqnR4JV4NhaEC++K+n1qcW5h+wpLNDU
 qcYbmr/ynYBC/IkbqNxvPinv6L1kcyEfKBHzdQrymVcKCQ7NRQ/TzDrQnp5dEWf1y5
 ILHxR8jodll6ex09bsZZYvTz2ZmLPqXKFQDhoAvMbnZAw/jp2uF6g7j0GuW/xpAOdx
 J/8Z0nqT5Ving==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] dt-bindings: Add compatible for Mali Valhall (JM)
Date: Wed, 25 May 2022 10:57:46 -0400
Message-Id: <20220525145754.25866-2-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From the kernel's perspective, (pre-CSF, "Job Manager") Valhall is more
or less compatible with Bifrost, although they differ to userspace. Add
a compatible for Valhall to the existing Bifrost bindings documentation.

As the first SoC with a Valhall GPU receiving mainline support, add a
specific compatible for the MediaTek MT8192, which instantiates a
Mali-G57.

v2: Change compatible to arm,mali-valhall-jm (Daniel Stone).

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
CC: devicetree@vger.kernel.org
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 85f8d4764740..78964c140b46 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -14,16 +14,21 @@ properties:
     pattern: '^gpu@[a-f0-9]+$'
 
   compatible:
-    items:
-      - enum:
-          - amlogic,meson-g12a-mali
-          - mediatek,mt8183-mali
-          - realtek,rtd1619-mali
-          - renesas,r9a07g044-mali
-          - renesas,r9a07g054-mali
-          - rockchip,px30-mali
-          - rockchip,rk3568-mali
-      - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson-g12a-mali
+              - mediatek,mt8183-mali
+              - realtek,rtd1619-mali
+              - renesas,r9a07g044-mali
+              - renesas,r9a07g054-mali
+              - rockchip,px30-mali
+              - rockchip,rk3568-mali
+          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
     maxItems: 1
-- 
2.35.1

