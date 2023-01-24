Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7FC67957F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99A10E65D;
	Tue, 24 Jan 2023 10:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923C510E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:41:56 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:6083:1fd7:ba05:ea8d])
 by albert.telenet-ops.be with bizsmtp
 id Caht290034604Ck06ahtxU; Tue, 24 Jan 2023 11:41:53 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pKGkK-007DIk-DV;
 Tue, 24 Jan 2023 11:41:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pKGkS-00GcpT-TR;
 Tue, 24 Jan 2023 11:41:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drivers: Restore alignment and newline in Makefile
Date: Tue, 24 Jan 2023 11:41:45 +0100
Message-Id: <20230124104145.3962497-1-geert+renesas@glider.be>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The introduction of drivers/accel/ broke alignment, and removed the
newline at the end of the file.  Fix all of that.

Fixes: 35b137630f08d913 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index f0972e2226c97cb5..9ea6eb3b5d7b7f17 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -189,4 +189,4 @@ obj-$(CONFIG_COUNTER)		+= counter/
 obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_PECI)		+= peci/
 obj-$(CONFIG_HTE)		+= hte/
-obj-$(CONFIG_DRM_ACCEL)	+= accel/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL)		+= accel/
-- 
2.34.1

