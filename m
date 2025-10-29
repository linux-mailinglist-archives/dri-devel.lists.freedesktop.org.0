Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8963C1B813
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6F910E7F0;
	Wed, 29 Oct 2025 15:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290810E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:00:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71F3A6035D;
 Wed, 29 Oct 2025 15:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23DFC4CEF7;
 Wed, 29 Oct 2025 15:00:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/imagination: Fix reference to
 devm_platform_get_and_ioremap_resource()
Date: Wed, 29 Oct 2025 16:00:28 +0100
Message-ID: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

The call to devm_platform_ioremap_resource() was replaced by a call to
devm_platform_get_and_ioremap_resource(), but the comment referring to
the function's possible returned error codes was not updated.

Fixes: 927f3e0253c11276 ("drm/imagination: Implement MIPS firmware processor and MMU support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/imagination/pvr_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 294b6019b4155bb7..78d6b8a0a4506c80 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -48,7 +48,7 @@
  *
  * Return:
  *  * 0 on success, or
- *  * Any error returned by devm_platform_ioremap_resource().
+ *  * Any error returned by devm_platform_get_and_ioremap_resource().
  */
 static int
 pvr_device_reg_init(struct pvr_device *pvr_dev)
-- 
2.43.0

