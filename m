Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934752DCDCC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5C06E1CF;
	Thu, 17 Dec 2020 08:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629189826
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 01:00:02 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings/display: abt,y030xx067a: Fix binding
Date: Thu, 17 Dec 2020 00:59:45 +0000
Message-Id: <20201217005945.335111-1-paul@crapouillou.net>
In-Reply-To: <20201101093150.8071-1-paul@crapouillou.net>
References: <20201101093150.8071-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The binding should use "unevaluatedProperties" instead of
"additionalProperties", since it is a SPI device and may have
SPI-related Device Tree properties, for instance the "spi-max-frequency"
property that is present in the example.

Fixes: e366a644c69d ("dt-bindings: display: Add ABT Y030XX067A panel bindings")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/display/panel/abt,y030xx067a.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
index 91cb4c3e0198..a108029ecfab 100644
--- a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
@@ -32,7 +32,7 @@ required:
   - power-supply
   - reset-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
