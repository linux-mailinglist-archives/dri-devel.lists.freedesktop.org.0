Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A88327B0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 11:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A9810E9AE;
	Fri, 19 Jan 2024 10:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 532 seconds by postgrey-1.36 at gabe;
 Fri, 19 Jan 2024 10:31:28 UTC
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D857910EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 10:31:24 +0000 (UTC)
Received: from localhost (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by prime.voidband.net (Postfix) with ESMTPSA id C5A6F635B043;
 Fri, 19 Jan 2024 11:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1705659735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LttVVa3g+FcMM7+wKG/iSOZzeZ5h749vPmGrbkCjpb8=;
 b=Nu2l/pF0q6dusVkP/ar33zJYozomAOYl2Cw1WzBjw//WCvwH6X5QKUohAvvmGD+KKSrAtF
 2h4p2TuT4VT0glHtcO90hvQf1uhdjoewnmeL7ihlgv8SCtLowGZhomW7CwPma4xzm4+2I/
 O1KdE0FhZnDSTlI+eo/nx6E+FUCzBtY=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/display: fix typo
Date: Fri, 19 Jan 2024 11:22:15 +0100
Message-ID: <20240119102215.201474-1-oleksandr@natalenko.name>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While studying the code I've bumped into a small typo within the
kernel-doc for two functions, apparently, due to copy-paste.

This commit fixes "sizo" word to be "size".

Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index bd61e20770a5b..14a2a8473682b 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -52,7 +52,7 @@
  * @adapter: I2C adapter for the DDC bus
  * @offset: register offset
  * @buffer: buffer for return data
- * @size: sizo of the buffer
+ * @size: size of the buffer
  *
  * Reads @size bytes from the DP dual mode adaptor registers
  * starting at @offset.
@@ -116,7 +116,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_read);
  * @adapter: I2C adapter for the DDC bus
  * @offset: register offset
  * @buffer: buffer for write data
- * @size: sizo of the buffer
+ * @size: size of the buffer
  *
  * Writes @size bytes to the DP dual mode adaptor registers
  * starting at @offset.
-- 
2.43.0

