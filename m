Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273368C58A7
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4052E10EABA;
	Tue, 14 May 2024 15:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tV5Hda4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD210EABA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715700262;
 bh=p7nTz/Irz77RiCSjoigxmGbDz02q1CnibFJajp5cPw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tV5Hda4AXXSV+gBLPGXMrdFGL33+gcnuSGI60CBLFQtOcWSaYTb6XDVRRmGy4DC0E
 08XVWtEfv8Unohji+Dqq4bAHaP2tmtAJMuAnPGHSFOHpmbjAA8rsGbveIBC14tUv9y
 7uFM+yfjX/p8jWMKLEi/e9CXy3IBXc/IKg0WqXq3EowUuanIJZkCyjWfd8yr39kIG7
 XT2tsD6I6RZ6bCCa3bc9g6V6lMmvQLE03pNbrU/XP9C9iat4iqBmSc4uYU8irRpcfn
 zFZcoZwSWXhU7f098rg64RxI0HHBz+kyPTx1e62LNMDWfyH6PUOZ6vpopQCMLIQm2b
 1HmBeCp4zPvJQ==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 98D883782198;
 Tue, 14 May 2024 15:24:18 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 3/3] dt-bindings: display: vop2: Add VP clock resets
Date: Tue, 14 May 2024 11:19:47 -0400
Message-ID: <20240514152328.21415-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514152328.21415-1-detlev.casanova@collabora.com>
References: <20240514152328.21415-1-detlev.casanova@collabora.com>
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

Add the documentation for VOP2 video ports reset clocks.
One reset can be set per video port.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../display/rockchip/rockchip-vop2.yaml       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306b..941fd059498d4 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -65,6 +65,22 @@ properties:
       - const: dclk_vp3
       - const: pclk_vop
 
+  resets:
+    minItems: 3
+    items:
+      - description: Pixel clock reset for video port 0.
+      - description: Pixel clock reset for video port 1.
+      - description: Pixel clock reset for video port 2.
+      - description: Pixel clock reset for video port 3.
+
+  reset-names:
+    minItems: 3
+    items:
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+      - const: dclk_vp3
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -128,6 +144,11 @@ allOf:
         clock-names:
           minItems: 7
 
+        resets:
+          minItems: 4
+        reset-names:
+          minItems: 4
+
         ports:
           required:
             - port@0
@@ -183,6 +204,12 @@ examples:
                               "dclk_vp0",
                               "dclk_vp1",
                               "dclk_vp2";
+                resets = <&cru SRST_VOP0>,
+                         <&cru SRST_VOP1>,
+                         <&cru SRST_VOP2>;
+                reset-names = "dclk_vp0",
+                              "dclk_vp1",
+                              "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
-- 
2.43.2

