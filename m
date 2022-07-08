Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA21D56BEB6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A777110EC04;
	Fri,  8 Jul 2022 18:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E1E10EBE4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id siMt2700D4C55Sk06iMtcX; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-002fNn-Te; Fri, 08 Jul 2022 20:21:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtVn-8k; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 09/10] util: Add pwetty support for big-endian RGB565
Date: Fri,  8 Jul 2022 20:21:48 +0200
Message-Id: <7956f2485b6d6ea11860736417a2122cf2e2cd6e.1657302103.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302103.git.geert@linux-m68k.org>
References: <cover.1657302103.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for rendering the crosshairs in a buffer using the
big-endian RGB565 format.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 tests/util/pattern.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 627f402be1d02e1c..1222b47ea3f14cd0 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -1178,6 +1178,7 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 		cairo_format = CAIRO_FORMAT_ARGB32;
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 		cairo_format = CAIRO_FORMAT_RGB16_565;
 		swap16 = fb_foreign_endian(format);
-- 
2.25.1

