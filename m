Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70C2B3AE7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D317789CF7;
	Mon, 16 Nov 2020 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207FA6E4F9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:15:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 8827D3A5AEE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:07:39 +0000 (UTC)
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2081720003;
 Fri, 13 Nov 2020 15:07:09 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] dt-bindings: fsl-imx-drm: fix example compatible string
Date: Fri, 13 Nov 2020 18:06:19 +0300
Message-Id: <20201113150618.417424-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cengiz Can <cengiz@kernel.wtf>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Example `display-subsystem` has an incorrect compatible string.

Required properties section tells that developers should use
"fsl,imx-display-subsystem" as "compatible" string but the example
misses 'imx-' prefix.

Change example to have correct "compatible" string.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 5a99490c17b9..3c35338a2867 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -12,7 +12,7 @@ Required properties:
 example:
 
 display-subsystem {
-	compatible = "fsl,display-subsystem";
+	compatible = "fsl,imx-display-subsystem";
 	ports = <&ipu_di0>;
 };
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
