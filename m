Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7712E71F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 15:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF796E0FF;
	Thu,  2 Jan 2020 14:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3522F6E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 14:12:54 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
 id lSCn2100M5USYZQ06SCnzC; Thu, 02 Jan 2020 15:12:51 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1in1DT-0006OT-BY; Thu, 02 Jan 2020 15:12:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1in1DT-00006t-AE; Thu, 02 Jan 2020 15:12:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/3] dt-bindings: display: sitronix,
 st7735r: Add Okaya rh128128t
Date: Thu,  2 Jan 2020 15:12:44 +0100
Message-Id: <20200102141246.370-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102141246.370-1-geert+renesas@glider.be>
References: <20200102141246.370-1-geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document support for the Okaya RH128128T display, which is a 128x128
1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.

ST7715R and ST7735R are very similar.  Their major difference is that
the former is restricted to displays of up to 132x132 pixels, while the
latter supports displays up to 132x162 pixels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/sitronix,st7735r.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
index cd5c7186890a2be7..87ebdcb294e29798 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
@@ -4,7 +4,9 @@ This binding is for display panels using a Sitronix ST7735R controller in SPI
 mode.
 
 Required properties:
-- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
+- compatible:	Must be one of the following combinations:
+		  - "jianda,jd-t18003-t01", "sitronix,st7735r"
+		  - "okaya,rh128128t", "sitronix,st7715r"
 - dc-gpios:	Display data/command selection (D/CX)
 - reset-gpios:	Reset signal (RSTX)
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
