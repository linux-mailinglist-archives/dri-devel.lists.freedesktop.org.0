Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C414135FD6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DB06E94E;
	Thu,  9 Jan 2020 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031989293
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1578529821; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBs2+5xBBRwxPGVM64B4F5IewNAsuf5FC72iXa54J8g=;
 b=L09tPyP8O+UNNRSClBFMMzQNWFgC/cm51ULuUWPtYhCYsj3K1gDEKhVt0ibVa0OTeDxnFB
 JIfl6boyIGhrKkKTBAQWCp52JkWMtZ2Mcq4NdxTum97Dj0H1fYOIkViM9MMfH7k9i7iB3j
 drighYiU65A71p1x4lINCYil8HFLvZ4=
From: Paul Cercueil <paul@crapouillou.net>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] dt-bindings: panel-simple: Add compatible for Sharp
 LS020B1DD01D
Date: Wed,  8 Jan 2020 21:30:00 -0300
Message-Id: <20200109003000.119516-2-paul@crapouillou.net>
In-Reply-To: <20200109003000.119516-1-paul@crapouillou.net>
References: <20200109003000.119516-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string for the Sharp LS020B1DD01D 2" HQVGA TFT LCD
panel, and remove the old sharp,ls020b1dd01d.txt documentation which is
now obsolete.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/display/panel/panel-simple.yaml         |  2 ++
 .../bindings/display/panel/sharp,ls020b1dd01d.txt    | 12 ------------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index c1a77d9105a2..f1fba1db382a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -35,6 +35,8 @@ properties:
       - ampire,am800480r3tmqwa1h
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
       - giantplus,gpm940b0
+        # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
+      - sharp,ls020b1dd01d
 
   backlight: true
   enable-gpios: true
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
deleted file mode 100644
index e45edbc565a3..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sharp 2.0" (240x160 pixels) 16-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls020b1dd01d"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
