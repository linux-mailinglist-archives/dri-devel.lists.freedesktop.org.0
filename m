Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378711A6D0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CDB6EAC5;
	Wed, 11 Dec 2019 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5517D6E8ED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1575988918; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=BK+1F7xIRj68d46F1jAvtX4kN3AW/YIFawXHe73bc8E=;
 b=Hx8wSZppBKSt8143F9zfmJP9ElZmC2/0tqtsGIjIMxQLmZA8wnhmHHQb85jz+DRlegKvJa
 biomE7dSZZ8vp4BVfQzKmG3oEgoq2J6CZ80mTZVsAHuNxbcl+ZmSnC3Ofx+ABUj5YrlsJD
 M9Pyd8G5fdBPpgr4SR0h9wqN2pQSjEE=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/6] dt-bindings: display/ingenic: Add compatible string
 for JZ4770
Date: Tue, 10 Dec 2019 15:41:37 +0100
Message-Id: <20191210144142.33143-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string for the LCD controller found in the JZ4770 SoC.

v2: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/ingenic,lcd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
index 7b536c8c6dde..01e3261defb6 100644
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: one of:
   * ingenic,jz4740-lcd
   * ingenic,jz4725b-lcd
+  * ingenic,jz4770-lcd
 - reg: LCD registers location and length
 - clocks: LCD pixclock and device clock specifiers.
 	   The device clock is only required on the JZ4740.
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
