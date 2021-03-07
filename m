Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3E330442
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 20:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0E689EB1;
	Sun,  7 Mar 2021 19:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF0B89EB1
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:28:50 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: panel/kingdisplay,
 kd035g6-54nt: Remove spi-cs-high
Date: Sun,  7 Mar 2021 19:28:29 +0000
Message-Id: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NT39016 panel is a fun beast, even though the documentation states
that the CS line is active-low, it will work just fine if the CS line is
configured as active-high, but it won't work if the CS line is forced
low or forced high.

Since it did actually work with the spi-cs-high property, this is not a
bugfix, but we should nonetheless remove that property from the example
to match the documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
index 6960036975fa..c45c92a3d41f 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -47,7 +47,6 @@ examples:
 
             spi-max-frequency = <3125000>;
             spi-3wire;
-            spi-cs-high;
 
             reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
 
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
