Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A97DB7F0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBFE10E28B;
	Mon, 30 Oct 2023 10:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3110E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7082:5ab3:115b:c8d0])
 by andre.telenet-ops.be with bizsmtp
 id 4APi2B00A1qcjVs01APiHz; Mon, 30 Oct 2023 11:23:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQq-007p3N-Uf;
 Mon, 30 Oct 2023 11:23:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQs-006o5e-It;
 Mon, 30 Oct 2023 11:23:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v5 8/9] util: add pwetty support for big-endian RGB565
Date: Mon, 30 Oct 2023 11:23:35 +0100
Message-Id: <d8a0c03943a3b11ebff493946d4efe7effb84f98.1698661177.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698661177.git.geert@linux-m68k.org>
References: <cover.1698661177.git.geert@linux-m68k.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for rendering the crosshairs in a buffer using the
big-endian RGB565 format.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
  - Add Reviewed-by,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - New.
---
 tests/util/pattern.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 769da5814d1f689e..34da1c4d4f8d5ff0 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -1188,6 +1188,7 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 		cairo_format = CAIRO_FORMAT_ARGB32;
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 		cairo_format = CAIRO_FORMAT_RGB16_565;
 		swap16 = fb_foreign_endian(format);
-- 
2.34.1

