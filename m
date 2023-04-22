Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAD26EBB46
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1AF10E1A7;
	Sat, 22 Apr 2023 20:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BEB10E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1657061537;
 Sat, 22 Apr 2023 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A9CC4339C;
 Sat, 22 Apr 2023 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196627;
 bh=5pTEe5QNmuiGBfjEiv1SzkhBlJWy5vnpGmBzGZ3koYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dh80RwQo8vfVEPI+IA2p9L5NZm4T/GXu9XE2tY7tOJdaGChTl6PHPzut+66Ax7YKH
 oQccGTdqxBJV5rDK7tLK3eiXgJkTT28pIPuapmLbd+1Zmmf0DGlbfzBT+SDi039Cw5
 tRzB3B/XMnWshCLDCp+IkTi8qlRDGj1Rv7JYkYQ6BEA2XTckACLBGX8oJsvySu3ceH
 TLA3s/chdLMilu/IVaEfdw5/T+mf7IUxrWoB8zMhEzq6p5X3J64tqalki6nxJvXNte
 1yZ5ErUg7Rt9qxOTunmFg1z1s0fw8mLR4E8GbRfz5DJJuJiRnSKPOInmOfms/g14cL
 y/9jm/nimUFBw==
Received: by mercury (Postfix, from userid 1000)
 id 0B5A11066CB7; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 02/13] dt-bindings: display: st7789v: add Inanbo T28CP45TN89
Date: Sat, 22 Apr 2023 22:50:01 +0200
Message-Id: <20230422205012.2464933-3-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible value for Inanbo t28cp45tn89 and make reset GPIO non
mandatory, since it might not be connected to the CPU.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index d984b59daa4a..7c5e4313db1d 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -15,7 +15,9 @@ allOf:
 
 properties:
   compatible:
-    const: sitronix,st7789v
+    enum:
+      - inanbo,t28cp45tn89-v17
+      - sitronix,st7789v
 
   reg: true
   reset-gpios: true
@@ -29,7 +31,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - power-supply
 
 unevaluatedProperties: false
-- 
2.39.2

