Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CF3FA6D3
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 18:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E4B6E037;
	Sat, 28 Aug 2021 16:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 497 seconds by postgrey-1.36 at gabe;
 Sat, 28 Aug 2021 11:10:37 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A146EA3E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 97FD2C938F;
 Sat, 28 Aug 2021 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1630148538; bh=593ciw0QW1roD1h3TFS7025Qd9Um6NsB+kmDNsGtp2E=;
 h=From:To:Cc:Subject:Date;
 b=YP2K5BgAcdkPXUhhs/TGPxseXSfdP9tL7CEpGui+ebRwolbC6RJgoLExFn/Gi+gQI
 pb+EnTaSgi2YfGHzc52ilbSZA0liS9jVntxAKYO2gszKX4KUp8dMxuYojfTIcff2an
 F3rqQjRAwyerZbdyuSn/4ZCIchyIRxsflmqhBf+Q=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-fbdev@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: add missing simple-framebuffer formats
Date: Sat, 28 Aug 2021 13:02:05 +0200
Message-Id: <20210828110206.142899-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Aug 2021 16:54:49 +0000
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

Document all formats currently present in include/linux/platform_data/
simplefb.h

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../bindings/display/simple-framebuffer.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index c2499a7906f5..c1acd2859ae8 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -83,13 +83,25 @@ properties:
   format:
     description: >
       Format of the framebuffer:
+        * `a1r5g5b5` - 16-bit pixels, d[15]=a, d[14:10]=r, d[9:5]=g, d[4:0]=b
+        * `a2r10g10b10` - 32-bit pixels, d[31:30]=a, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `a8b8g8r8` - 32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r
+        * `a8r8g8b8` - 32-bit pixels, d[31:24]=a, d[23:16]=r, d[15:8]=g, d[7:0]=b
         * `r5g6b5` - 16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b
+        * `r5g5b5a1` - 16-bit pixels, d[15:11]=r, d[10:6]=g, d[5:1]=b, d[0]=a
+        * `r8g8b8` - 24-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
         * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
     enum:
+      - a1r5g5b5
+      - a2r10g10b10
       - a8b8g8r8
+      - a8r8g8b8
       - r5g6b5
+      - r5g5b5a1
+      - r8g8b8
+      - x1r5g5b5
       - x2r10g10b10
       - x8r8g8b8
 
-- 
2.33.0

