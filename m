Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DE9F42CD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 06:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8067110E4DC;
	Tue, 17 Dec 2024 05:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c9MuJnbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2F410E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:32:29 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DFCB75A;
 Tue, 17 Dec 2024 06:31:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734413511;
 bh=Hus/T97HgEgFTqyUE8sStdGYE5byY6Tb6X0trmbmS5I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c9MuJnbwp1vXW17BJb5iosvmbremHmGEBEo9Jca6wzkuvv30jHrm2FDljhgr9IBkq
 9iI7ijjaz2Nos+ED1RM+ZTtB7XwA/sXgwod4q+DwbqLaL+2kT7BKt0bodvyBmx5HoV
 4XkchFCkkuxdTVgzNGqaHVWSC1k3ztlCqzThU5pQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:37 +0200
Subject: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing
 constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0F0zzA1pJtSNqVdCbuXR3kSh++mHWPjwSztFEJXr+DI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzj7yBoF9yowGgXRC6lpUDVWJUcpA/Z5V2zW
 Q5kDQcM6CCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM4wAKCRD6PaqMvJYe
 9VvgD/9RsRP9qC1mJi4au24oLpqT+W9zYIPdCrn30xOMsPahjO9CHK86aThFpcYh6S2Gnt/fope
 kEzLP8AJAf0FwZFtgKOkqpKcKdzQwZ2j/P2WFBAMAi3CiHMf4LquKRhWGXY+LEHwhZvYg1gpNE4
 yn7kxGuXUQaI1wkzrstsuR9uW85kryLZ6G50Roewgj2mt10498IoFqdqAHu2PDkkFLFI/t6tOXn
 ubhqUYXsv46KDZh+O3Hs/ANbr1BoP3nrnsMq3I7aHwxiLCY2F0HZbS+q5XL88IB4fP4OqGRhiQg
 DcdAve9sPmiHpYgqeRwq3/caGzTHoV/E7M5yrDOqymS8hBRVl0lrmGI35+h1eOKVfCXDUm+Nu16
 r3lYtjwBRjjrCEwlbr1SP9G2g+WOd5671zPRNJdlYrLTKUSmAE0c2qtNFpSOoKgIvf7tKQXwCCD
 O7pSZbIjDF5tBohJh5AyByxtHna/Ek0YiVj92ma7M3a5MbYivGnsYwq7M4OPF7aNSWiXedagWh1
 l5H7EzcLxi5PKJo0VA7x6OSdbngy/j4mPDFLMdtEBz1rnlvZFYy85WdbBUb/hw22L1kUqXhoR0z
 cv5ULkentJO0nwMqjMqt417URhOi9SUrkJ4BmGvoIlWrwUPwLFhFUx4yNkaJPzeVxeJpFCkAsLi
 p45GaMl1J61QdLw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The binding is missing maxItems for all renesas,cmms and renesas,vsps
properties. As the amount of cmms or vsps is always a fixed amount, set
the maxItems to match the minItems.

Also add the minItems and maxItems to the top level properties.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..ef4568118e94 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -77,6 +77,8 @@ properties:
 
   renesas,cmms:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
     items:
       maxItems: 1
     description:
@@ -85,6 +87,8 @@ properties:
 
   renesas,vsps:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
     items:
       items:
         - description: phandle to VSP instance that serves the DU channel
@@ -489,9 +493,11 @@ allOf:
 
         renesas,cmms:
           minItems: 4
+          maxItems: 4
 
         renesas,vsps:
           minItems: 4
+          maxItems: 4
 
       required:
         - clock-names
@@ -558,9 +564,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -627,9 +635,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -683,7 +693,7 @@ allOf:
             - port@1
 
         renesas,vsps:
-          minItems: 1
+          maxItems: 1
 
       required:
         - clock-names
@@ -746,9 +756,11 @@ allOf:
 
         renesas,cmms:
           minItems: 2
+          maxItems: 2
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
@@ -799,6 +811,7 @@ allOf:
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names

-- 
2.43.0

