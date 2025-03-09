Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6127A58760
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 19:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358610E362;
	Sun,  9 Mar 2025 18:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977D10E323
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 18:54:25 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 55A3610202; Sun,  9 Mar 2025 19:54:09 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 2/2] Adding contact info for packed pixel drawing
Date: Sun,  9 Mar 2025 19:47:16 +0100
Message-Id: <20250309184716.13732-3-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250309184716.13732-1-soci@c64.rulez.org>
References: <20250309184716.13732-1-soci@c64.rulez.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to the nature of changes this is probably necessary. Even if these
drawing routines got way more testing than my patch submission scripts.

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0248c9eb3..ac9e23881 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9114,6 +9114,22 @@ S:	Odd Fixes
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/video/fbdev/core/
 
+FRAMEBUFFER DRAWING
+M:	Zsolt Kajtar <soci@c64.rulez.org>
+S:	Odd Fixes
+F:	drivers/video/fbdev/core/cfbcopyarea.c
+F:	drivers/video/fbdev/core/cfbfillrect.c
+F:	drivers/video/fbdev/core/cfbimgblt.c
+F:	drivers/video/fbdev/core/cfbmem.h
+F:	drivers/video/fbdev/core/fb_copyarea.h
+F:	drivers/video/fbdev/core/fb_draw.h
+F:	drivers/video/fbdev/core/fb_fillrect.h
+F:	drivers/video/fbdev/core/fb_imageblit.h
+F:	drivers/video/fbdev/core/syscopyarea.c
+F:	drivers/video/fbdev/core/sysfillrect.c
+F:	drivers/video/fbdev/core/sysimgblt.c
+F:	drivers/video/fbdev/core/sysmem.h
+
 FRAMEBUFFER LAYER
 M:	Helge Deller <deller@gmx.de>
 L:	linux-fbdev@vger.kernel.org
-- 
2.30.2

