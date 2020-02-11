Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D1158E36
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 13:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEF36EA39;
	Tue, 11 Feb 2020 12:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62F96EA2A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:17:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BCHOPD068027;
 Tue, 11 Feb 2020 06:17:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581423444;
 bh=kYvy9ivM4muEk5uUJm2ukv5c8x3SttyHoCc4YU+ulhQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rypllP8V7yjXoPOYdVwaOEvVHSMbPHAAYhEvc8AJxn2DY2gap8WPJmjaa5b1K59vt
 6kgoXznSTT/ENHVEyloV92qGk/Ij2Aoc/QWL8aoVM7NeMRDPRrqRjPuZiI0Kw3yopq
 oN3GqleIIUhRDzrf4+hhpVLATQeeRTpgKqNTlx74=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BCHOsL093626
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 06:17:24 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 06:17:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 06:17:23 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BCHJ82092021;
 Tue, 11 Feb 2020 06:17:21 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <sam@ravnborg.org>
Subject: [PATCH v3 1/2] dt-bindings: panel-simple: Add rocktech,
 rk101ii01d-ct compatible
Date: Tue, 11 Feb 2020 14:17:17 +0200
Message-ID: <2ffedf45e65943a021ed57a0d174900e43663b27.1581423249.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581423249.git.jsarha@ti.com>
References: <cover.1581423249.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to panel-simple for Rocktech Displays Limited
RK101II01D-CT 10.1" TFT 1280x800 Pixels with LVDS interface, LED
Backlight, and capacitive touch panel ("goodix,gt928" compatible).

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index cf23b0ad077a..e717018d34ae 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -201,6 +201,8 @@ properties:
       - osddisplays,osd101t2045-53ts
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
+        # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
+      - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
       - rocktech,rk070er9427
         # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
