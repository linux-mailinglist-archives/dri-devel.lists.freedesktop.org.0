Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3E720070
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D27C10E666;
	Fri,  2 Jun 2023 11:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE3D10E668
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:31:00 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:158c:2ccf:1f70:e136])
 by michel.telenet-ops.be with bizsmtp
 id 4BWv2A00A1tRZS806BWvv8; Fri, 02 Jun 2023 13:30:57 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q52zM-00DRLv-2P;
 Fri, 02 Jun 2023 13:30:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q52zf-00Av41-6A;
 Fri, 02 Jun 2023 13:30:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH] drm/todo: Fix corrupted duplicate in defio section
Date: Fri,  2 Jun 2023 13:30:53 +0200
Message-Id: <843fbc95dd5b067b64fa684204234b915ecf0304.1685705373.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Part of the paragraph was accidentally duplicated.

Fixes: be5cadc7e7b4cee8 ("drm/todo: Better defio support in the generic fbdev emulation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/gpu/todo.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 66736db00e6d182d..c25e3cdbe964967a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -312,8 +312,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
 - Set the mkwrite and fsync callbacks with similar implementions to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
-  require a struct page.  uff. These should all work on plain ptes, they don't
-  actually require a struct page.
+  require a struct page.
 
 - Track the dirty pages in a separate structure (bitfield with one bit per page
   should work) to avoid clobbering struct page.
-- 
2.34.1

