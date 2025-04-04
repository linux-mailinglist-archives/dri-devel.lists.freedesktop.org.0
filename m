Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A5A7C5B0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 23:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDF610E058;
	Fri,  4 Apr 2025 21:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lJOZ37XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C1710E058
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 21:40:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1EF4261137;
 Fri,  4 Apr 2025 21:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050E1C4CEDD;
 Fri,  4 Apr 2025 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743802840;
 bh=zFEs3x1/XsRtCRQwZtP7pGruMSG2FDF0PmU+lKKJ9YA=;
 h=From:To:Cc:Subject:Date:From;
 b=lJOZ37XTk6Gzb058yCFIkSasbWMpjaSRo0WBYPx7oY6I29arVAfkMJzlDIq3Oz2dk
 OxrS2E0bPYx0vVtvExa1HT+SKWo2fPbvwpMWpYoyp/bI03lRa50nFWQoVLCbgrwTNt
 +YF+OBmSLnZ/qPjNCX3+bwJkTjRf0f3NuR7S80xejJNinrTllZIBi+hrSjSs/sjdXW
 mOWTBqGz4NUOV0jtVHZSe38vBj1DEygyCP6abYkDJ3sI1DgJZF/p1cLm9KdxxdBh13
 E5nG2vRHjEgPGZ8YaRFhFFhlkD5bkCmMrGHzvcyrgR6V3IbeJWwoGPvV4nE6CKd1Dn
 Ac0aoJnHA5TdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Date: Fri,  4 Apr 2025 16:40:29 -0500
Message-ID: <20250404214030.401629-1-robh@kernel.org>
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

assigned-clock properties are implicitly allowed in any node with
'clocks' and don't have to be specified. The max here also appears to be
wrong as there's a case with 4 entries.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index b339b7e708c6..8b5f58103dda 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -73,12 +73,6 @@ properties:
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
-  assigned-clocks:
-    maxItems: 2
-
-  assigned-clock-rates:
-    maxItems: 2
-
   iommus:
     maxItems: 1
 
-- 
2.47.2

