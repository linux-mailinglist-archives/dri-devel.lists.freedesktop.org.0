Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB82B1760
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AB06E48B;
	Fri, 13 Nov 2020 08:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CF16E303
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:21:37 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1605198095;
 bh=Yab+DpMKrzGHr1XGNcNAibAtjY21k1y20x0J0byD9z8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=hwIBm348uoWLaXaGsDhBSwkqe7zLprsuTipBE+5KHT8srMsz7h4U8T5MrKBUUb984
 ZJ3LffR4aSj2xPaJIvzSjDvOqDQONvK/PZAMvAnkNL8GAPWxAEBdoB8FcbpWDYNSV8
 8OJS2cGuz8Cl4chCzIjIKuzPEVe52tveenbemeCc=
To: linux-arm-msm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/5] dt-bindings: panel-simple-dsi: add samsung panels for
 OnePlus 6/T
Message-ID: <20201112161920.2671430-3-caleb@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatibles for the samsung,sofef00 and samsung,s6e3fc2x01 panels
used in the OnePlus 6 & 6T respectively.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index c0dd9fa29f1d..04d829177aa8 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -47,6 +47,10 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung sofef00 1080x2280 AMOLED panel
+      - samsung,sofef00
+        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
+      - samsung,s6e3fc2x01
 
   reg:
     maxItems: 1
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
