Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22B54F37B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A75C11AB19;
	Fri, 17 Jun 2022 08:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597EE11AB15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:48:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <bst@pengutronix.de>) id 1o27eI-0003Lt-KR
 for dri-devel@lists.freedesktop.org; Fri, 17 Jun 2022 10:48:14 +0200
Resent-From: Bastian Krause <bst@pengutronix.de>
Resent-To: dri-devel@lists.freedesktop.org
Resent-Date: Fri, 17 Jun 2022 10:48:14 +0200
Resent-Message-ID: <005d270b-8461-51d2-41e8-26ae9eeb0b4a@pengutronix.de>
Received: from localhost ([127.0.0.1] helo=metis.ext.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <kernel-bounces@pengutronix.de>)
 id 1nzcbr-0003y3-8I; Fri, 10 Jun 2022 13:15:23 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <bst@pengutronix.de>)
 id 1nzcbp-0003x2-FF; Fri, 10 Jun 2022 13:15:21 +0200
From: Bastian Krause <bst@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: simple: add Ampire
 AM-800600P5TMQW-TB8H panel
Date: Fri, 10 Jun 2022 13:15:10 +0200
Message-Id: <20220610111511.1421067-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PTX-Original-Recipient: kernel@pengutronix.de
X-BeenThere: kernel@pengutronix.de
X-Mailman-Version: 2.1.29
Precedence: list
X-PTX-Original-Recipient: bst@pengutronix.de
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Yannick Fertre <yannick.fertre@st.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Bastian Krause <bst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Ampire AM-800600P5TMQW-TB8H 8" TFT LCD panel compatible string.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 21ba90c9fe338..00a2bffa0ce82 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -35,6 +35,8 @@ properties:
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
       - ampire,am800480r3tmqwa1h
+        # Ampire AM-800600P5TMQW-TB8H 8.0" SVGA TFT LCD panel
+      - ampire,am800600p5tmqw-tb8h
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
       - auo,b101aw03
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-- 
2.30.2


