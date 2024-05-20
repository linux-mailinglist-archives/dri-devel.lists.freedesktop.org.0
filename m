Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5A8C9DBF
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7783410E6C4;
	Mon, 20 May 2024 12:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="qBp6ucon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC9210E6A8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=i+gBr0dyONZ8//GblVtrNJo1gt5VfgjaWVel6lxqg9w=; b=qBp6uconUQjLMovb
 h7msqVzFfDdv6mJ2Wob8E7s2Z7Rw23ajYWGwTk50c0EnTJP6c7XGDvJYSCU66MsA9UCqGA01uGGrm
 82Pc3XUUj+MonNshcTUy8y1EsHmoiBDRbMqxyA9MjQNbHRPGf1O6y5vJ/1r8QIKV4loa6ts8L5d8C
 C3vcde6qx+P+hdfXyMVnk6KlYfl9psMzEAjcKrRx1g2b+Mo98Dsl3hLbQHFYrzk/tu/shM5RGvO9j
 dyWskUr56R5bG47Ly/E/NcMjiKJubVDz0q84urD/tkkmzbMWogx5JouIShwJl1qDSZL41AqLDuF1d
 pq8cphw1XXr3/cp+DQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s92YU-001g4B-2a;
 Mon, 20 May 2024 12:55:55 +0000
From: linux@treblig.org
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] drm/bridge: analogix: remove unused struct 'bridge_init'
Date: Mon, 20 May 2024 13:55:51 +0100
Message-ID: <20240520125551.11534-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
has dropped all the users of the struct bridge_init from the
exynos_dp_core, while retaining unused structure definition.
Later on the driver was reworked and the definition migrated
to the analogix_dp driver. Remove unused struct bridge_init definition.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index df9370e0ff23..1e03f3525a92 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -36,11 +36,6 @@
 
 static const bool verify_fast_training;
 
-struct bridge_init {
-	struct i2c_client *client;
-	struct device_node *node;
-};
-
 static int analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
 	int ret;
-- 
2.45.1

