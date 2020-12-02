Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126302CD0F6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102286EB71;
	Thu,  3 Dec 2020 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892516EA0B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:18:45 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLI-0004hY-66; Wed, 02 Dec 2020 09:18:28 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLH-0007h9-Ii; Wed, 02 Dec 2020 09:18:27 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 1/8] dt-bindings: display: simple: fix alphabetical order
 for EDT compatibles
Date: Wed,  2 Dec 2020 09:18:19 +0100
Message-Id: <20201202081826.29512-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202081826.29512-1-o.rempel@pengutronix.de>
References: <20201202081826.29512-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
 dri-devel@lists.freedesktop.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder it alphabetically and remove one double entry.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/display/panel/panel-simple.yaml     | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index edb53ab0d9eb..428b03342fea 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -106,26 +106,24 @@ properties:
         # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
       - edt,et035012dm6
         # Emerging Display Technology Corp. 480x272 TFT Display with capacitive touch
+      - edt,et057090dhu
+        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
       - edt,etm043080dh6gp
         # Emerging Display Technology Corp. 480x272 TFT Display
       - edt,etm0430g0dh6
         # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
-      - edt,et057090dhu
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-      - edt,etm070080dh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-      - edt,etm0700g0dh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-        # Same as ETM0700G0DH6 but with inverted pixel clock.
       - edt,etm070080bdh6
         # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
         # Same display as the ETM0700G0BDH6, but with changed hardware for the
         # backlight and the touch interface.
+      - edt,etm070080dh6
+        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
       - edt,etm070080edh6
         # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
         # Same timings as the ETM0700G0DH6, but with resistive touch.
-      - edt,etm070080dh6
-        # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
+      - edt,etm0700g0dh6
+        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
+        # Same as ETM0700G0DH6 but with inverted pixel clock.
       - evervision,vgg804821
         # Foxlink Group 5" WVGA TFT LCD panel
       - foxlink,fl500wvr00-a0t
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
