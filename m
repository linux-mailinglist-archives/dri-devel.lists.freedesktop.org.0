Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222B56BEA4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911A110EBD4;
	Fri,  8 Jul 2022 18:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9813B10EBDF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:47 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMn270064C55Sk06iMnl4; Fri, 08 Jul 2022 20:21:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-002fMP-TR; Fri, 08 Jul 2022 20:21:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-00BtSe-4a; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 04/10] util: Add support for DRM_FORMAT_C[124]
Date: Fri,  8 Jul 2022 20:21:34 +0200
Message-Id: <5b679b05317fbe6a4e1aa63b80cb98908ccae09e.1657302034.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302034.git.geert@linux-m68k.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
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

Add support for creating buffers using the new color-indexed frame
buffer formats with two, four, and sixteen colors.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Split off changes to tests/util/format.c.
---
 tests/util/format.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/util/format.c b/tests/util/format.c
index 1ca1b82ce947b2f4..4b984af9bce8ac6f 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -40,6 +40,9 @@
 
 static const struct util_format_info format_info[] = {
 	/* Indexed */
+	{ DRM_FORMAT_C1, "C1" },
+	{ DRM_FORMAT_C2, "C2" },
+	{ DRM_FORMAT_C4, "C4" },
 	{ DRM_FORMAT_C8, "C8" },
 	/* YUV packed */
 	{ DRM_FORMAT_UYVY, "UYVY", MAKE_YUV_INFO(YUV_YCbCr | YUV_CY, 2, 2, 2) },
-- 
2.25.1

