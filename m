Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BE7D625A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E111410E559;
	Wed, 25 Oct 2023 07:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEBD10E561
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:24:05 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7faa:e55:54a:cff])
 by albert.telenet-ops.be with bizsmtp
 id 27Q32B00a5Uc89d067Q3Ej; Wed, 25 Oct 2023 09:24:03 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qvYFA-007ScN-97;
 Wed, 25 Oct 2023 09:24:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qvYFH-00Bs6b-4E;
 Wed, 25 Oct 2023 09:24:03 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v3 8/9] util: add pwetty support for big-endian RGB565
Date: Wed, 25 Oct 2023 09:23:48 +0200
Message-Id: <4718b9c148c6caca24ccc0cfc9f8f76beee50a05.1698217235.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698217235.git.geert@linux-m68k.org>
References: <cover.1698217235.git.geert@linux-m68k.org>
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
v3:
  - No changes,

v2:
  - New.
---
 tests/util/pattern.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index aeac84a9b0dfed09..4d6e9e32ab0f4e93 100644
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

