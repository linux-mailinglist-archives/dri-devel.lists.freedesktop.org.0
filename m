Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9E376243
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EA46E7F5;
	Fri,  7 May 2021 08:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atl4mhfb01.myregisteredsite.com
 (atl4mhfb01.myregisteredsite.com [209.17.115.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DEC6EDD1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 08:06:09 +0000 (UTC)
Received: from jax4mhob10.registeredsite.com (jax4mhob10.myregisteredsite.com
 [64.69.218.90])
 by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
 14780Xb1024647
 for <dri-devel@lists.freedesktop.org>; Fri, 7 May 2021 04:00:34 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.206])
 by jax4mhob10.registeredsite.com (8.14.4/8.14.4) with ESMTP id 14780Tp2027510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Fri, 7 May 2021 04:00:29 -0400
Received: (qmail 24075 invoked by uid 0); 7 May 2021 08:00:29 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid)
 (mike@milosoftware.com@83.128.90.119)
 by 0 with ESMTPA; 7 May 2021 08:00:29 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: simple: Add YTS700TLBC-02-100C and
 G104AGE-L02
Date: Fri,  7 May 2021 10:00:15 +0200
Message-Id: <20210507080017.2794-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 07 May 2021 08:40:50 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Mike Looijmans <mike.looijmans@topic.nl>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds these panels to the dt bindings:
- Yes Optoelectronics YTS700TLBC-02-100C
- Innolux G104AGE-L02

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b3797ba2698b..d87d6ef496b9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - innolux,g070y2-l01
         # Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
       - innolux,g101ice-l01
+        # Innolux Corporation 7" G104AGE-L02 (800x600) LVDS panel
+      - innolux,g104age-l02
         # Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
       - innolux,g121i1-l01
         # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
@@ -293,6 +295,8 @@ properties:
       - winstar,wf35ltiacd
         # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
       - yes-optoelectronics,ytc700tlag-05-201c
+        # Yes Optoelectronics YTS700TLBC-02-100C (1024x600) TFT LCD panel
+      - yes-optoelectronics,yts700tlbc-02-100c
 
   backlight: true
   enable-gpios: true
-- 
2.17.1

