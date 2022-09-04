Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130345ACAA1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0B710E19A;
	Mon,  5 Sep 2022 06:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03A4A10E078
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hHJgr
 5wYhr6xRNrFQsZXLLIPlZg5J3cO6F0appWlrC4=; b=ll+PFt5LdejQ4kR3xS8fW
 wJ76cRSpjKKDgjKvcoBsPzngE1qO0VwjYecubwQGgGqXIrSgFbbX9MM1pmQUKnbP
 p1W6NYAAHlsjECEcP6QNC9FVgvNQ+0nD/vZx/MPBzTdDNjDcQanUm4gFrzjCK7+M
 Xa/tIW4ityfbn3RDjFYCrQ=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp12 (Coremail) with SMTP id EMCowAA37pK9DBVjKCHDJg--.22806S4;
 Mon, 05 Sep 2022 04:38:49 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/print: cleanup coding style in drm_print.h
Date: Mon,  5 Sep 2022 04:38:18 +0800
Message-Id: <20220904203818.16775-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowAA37pK9DBVjKCHDJg--.22806S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw18GFy5Cr47Zry3uryDKFg_yoW8Ar48p3
 ZxJFyktr4qyr43Ww1qyF42yr1fX3yIgF1xXFZ7Kw1rAF1jva4v9wsYyryjkw1rWryxKF13
 JF9FyFyUuF9xArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEVyxJUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbBaRpyF1Xly05dGgAAsk
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix everything checkpatch.pl complained about in drm_print.h

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 include/drm/drm_print.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..4332fbeb76a8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (C) 2016 Red Hat
  *
@@ -103,7 +104,7 @@ __printf(2, 0)
  * @va: the va_list
  */
 static inline void
-drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)
+drm_vprintf(struct drm_printer *p, const char *fmt, va_list * va)
 {
 	struct va_format vaf = { .fmt = fmt, .va = va };
 
@@ -426,16 +427,16 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 
 #define drm_info(drm, fmt, ...)					\
-	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
+	__drm_printk((drm), info, fmt, ##__VA_ARGS__)
 
 #define drm_notice(drm, fmt, ...)				\
-	__drm_printk((drm), notice,, fmt, ##__VA_ARGS__)
+	__drm_printk((drm), notice, fmt, ##__VA_ARGS__)
 
 #define drm_warn(drm, fmt, ...)					\
-	__drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
+	__drm_printk((drm), warn, fmt, ##__VA_ARGS__)
 
 #define drm_err(drm, fmt, ...)					\
-	__drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
+	__drm_printk((drm), err, "*ERROR* " fmt, ##__VA_ARGS__)
 
 
 #define drm_info_once(drm, fmt, ...)				\

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
prerequisite-patch-id: f039528bc88876d6e0f64e843da089e85f6d3f58
prerequisite-patch-id: c14ed2e970be2c3f8ba746634e8161b94c148e88
-- 
2.34.1

