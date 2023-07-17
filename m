Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102117564C3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C70310E247;
	Mon, 17 Jul 2023 13:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A98E10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:24:02 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by albert.telenet-ops.be with bizsmtp
 id NDPz2A00K0ucMBo06DPzZQ; Mon, 17 Jul 2023 15:23:59 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLOCc-001fvf-Ku;
 Mon, 17 Jul 2023 15:23:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLOCl-007QvQ-I6;
 Mon, 17 Jul 2023 15:23:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm: Spelling s/randevouz/rendez-vous/
Date: Mon, 17 Jul 2023 15:23:58 +0200
Message-Id: <084bf178dd676a4f07933eb9fcd04d3e30a779ba.1689600209.git.geert+renesas@glider.be>
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
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a misspelling of "rendez-vous".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v3:
  - Add Reviewed-by,

v2:
  - s/vouz/vous/.
---
 include/drm/task_barrier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h
index 217c1cf21c1ab7d5..f6e6ed52968133d2 100644
--- a/include/drm/task_barrier.h
+++ b/include/drm/task_barrier.h
@@ -24,7 +24,7 @@
 #include <linux/atomic.h>
 
 /*
- * Reusable 2 PHASE task barrier (randevouz point) implementation for N tasks.
+ * Reusable 2 PHASE task barrier (rendez-vous point) implementation for N tasks.
  * Based on the Little book of semaphores - https://greenteapress.com/wp/semaphores/
  */
 
-- 
2.34.1

