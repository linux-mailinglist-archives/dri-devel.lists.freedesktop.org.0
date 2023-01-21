Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A853A6768D2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108A10E3FA;
	Sat, 21 Jan 2023 20:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480210E402
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6ED84B80880;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6AE8C433A7;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=7RSkAFuK0Xr8s25KHzS2cuHY9aJoXrOKzokeJSRGbBE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=PX1cFfWQAGQxK6NhfdrbsVnfqgtTbXbhfgo+L4kQ4mFQJGNQx9xP/KvGdFyEiPIX8
 dbVAk2CUpShuLTcH8CiM5kyRk3X9nrj7DVxVXkAJtQz1BtA1TbZiQy8HvC72EYVQgs
 BqbY9vyKb7uH5vQ6fcbdhnB/TLIH9Mo1i/vBYMsv2uTzldXCvaKn+1HZLXRE7cC2I3
 Z7ZTIpZ5EzP49jS66tTrH7JUMSom2mC2BRMP6B2cSop8+MIF/IxnOUwcBhEkcZbw/G
 aMXZiD2tO23i2mFaGwH527XxWJsaOBuNa9QLxOOc9S112DaOS0rMtfS06nj9u9OC92
 6wvUm5/sfhloA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B5E99C5320B;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:46 +0100
Subject: [PATCH 08/86] drm/ttm: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230113-drm-include-v1-v1-8-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=1504;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=1jktr7iYIyNcVL7l5ZPEDaMaLjdQFrRNwL0NHAdecII=; =?utf-8?q?b=3DdsymNVucUgHo?=
 =?utf-8?q?1idChGpUZeabhKWPK14WfN1Cjy28GojyLN/nh2cgvgGjW0sp2LqHvm0zTv5anIDd?=
 S+c2T6CSAccaH5Dkwh/LME4jmSWs8CtS54HD8tg3kpmqMPHl6BFT
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ttm/ttm_device.c   | 1 +
 drivers/gpu/drm/ttm/ttm_resource.c | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c7a1862f322a..d2d838bb3d12 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -27,6 +27,7 @@
 
 #define pr_fmt(fmt) "[TTM DEVICE] " fmt
 
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b8a826a24fb2..40b452021649 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -22,6 +22,7 @@
  * Authors: Christian König
  */
 
+#include <linux/debugfs.h>
 #include <linux/iosys-map.h>
 #include <linux/io-mapping.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index ab725d9d14a6..df905445afd6 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <linux/debugfs.h>
 #include <linux/sched.h>
 #include <linux/shmem_fs.h>
 #include <linux/file.h>

-- 
2.34.1

