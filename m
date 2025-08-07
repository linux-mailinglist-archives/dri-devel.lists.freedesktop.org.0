Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBAB1DF04
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 23:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BC510E002;
	Thu,  7 Aug 2025 21:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QiamnT9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460CC10E002
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 21:45:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 552F95C5DDA;
 Thu,  7 Aug 2025 21:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA070C4CEEB;
 Thu,  7 Aug 2025 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754603111;
 bh=BcqwRlgnCAKwxdgorrU4/Y1BN3OUrz4kEzJGkFYmBKw=;
 h=From:To:Cc:Subject:Date:From;
 b=QiamnT9Nk2fIzBq0gXPcoNsROoJ53xe9Bz9pCijPj95dtnUKvgmXAbsiYE904EH0Y
 QTQsjX2D78GdHjBvUwjQ07iUwc7JqVUJopSJxpMhUQVCxr2lNyN/Lk75Fv/2KWmOOm
 mJNSi7rJ4Z7XnUQiAqGLBjUkxvi/9FOmuF6sgI9Ov9zIiEe608lQT2Hovp0SP56LHg
 Jk15vkx/3XKQaNdh4UtpXEtHbdahfpUfb05qWyAXTtRf1pfoXARVuB7UjStkybPLzv
 NrnwDpyhKQgAimwTOi+W024DLo+80uf7qYKwygt5FWxX8XJdsptZ1D4ujnAfG0t1nz
 6jZXhhPQl3nVg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: Drop duplicate ti,opa362 binding
Date: Thu,  7 Aug 2025 16:45:07 -0500
Message-ID: <20250807214508.4174167-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

The "ti,opa362" binding is already supported in simple-bridge.yaml, so
remove the old binding doc.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/display/ti/ti,opa362.txt         | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ti/ti,opa362.txt

diff --git a/Documentation/devicetree/bindings/display/ti/ti,opa362.txt b/Documentation/devicetree/bindings/display/ti/ti,opa362.txt
deleted file mode 100644
index f96083c0bd17..000000000000
--- a/Documentation/devicetree/bindings/display/ti/ti,opa362.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-OPA362 analog video amplifier
-
-Required properties:
-- compatible: "ti,opa362"
-- enable-gpios: enable/disable output gpio
-
-Required node:
-- Video port 0 for opa362 input
-- Video port 1 for opa362 output
-
-Example:
-
-tv_amp: opa362 {
-	compatible = "ti,opa362";
-	enable-gpios = <&gpio1 23 0>;  /* GPIO to enable video out amplifier */
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			opa_in: endpoint@0 {
-				remote-endpoint = <&venc_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			opa_out: endpoint@0 {
-				remote-endpoint = <&tv_connector_in>;
-			};
-		};
-	};
-};
-
-
-
-- 
2.47.2

