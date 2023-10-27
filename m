Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFD7D9D56
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7037A10E9ED;
	Fri, 27 Oct 2023 15:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5910E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:48:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a11d:fe3:b715:706f])
 by albert.telenet-ops.be with bizsmtp
 id 33oE2B00Q2Q454m063oE5z; Fri, 27 Oct 2023 17:48:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4A-007cgv-ED;
 Fri, 27 Oct 2023 17:48:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4I-00HHnQ-D4;
 Fri, 27 Oct 2023 17:48:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 9/9] modetest: add support for big-endian
 XRGB1555/RGB565
Date: Fri, 27 Oct 2023 17:48:12 +0200
Message-Id: <6f4b5076e2bdcc0070e0b8bd5f67e5222b7e66eb.1698416179.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698416179.git.geert@linux-m68k.org>
References: <cover.1698416179.git.geert@linux-m68k.org>
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

Add support for creating buffers using big-endian formats.

For now this is limited to XRGB1555 and RGB565, which are the most
common big-endian formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - New.
---
 tests/modetest/buffers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 65f1cfb32ab9eeae..c8aafadd5145b64a 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -158,6 +158,7 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_BGRX4444:
 	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 	case DRM_FORMAT_RGBA5551:
@@ -165,6 +166,7 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_BGRA5551:
 	case DRM_FORMAT_BGRX5551:
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 	case DRM_FORMAT_UYVY:
 	case DRM_FORMAT_VYUY:
@@ -318,6 +320,7 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_BGRX4444:
 	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 	case DRM_FORMAT_RGBA5551:
@@ -325,6 +328,7 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_BGRA5551:
 	case DRM_FORMAT_BGRX5551:
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 	case DRM_FORMAT_BGR888:
 	case DRM_FORMAT_RGB888:
-- 
2.34.1

