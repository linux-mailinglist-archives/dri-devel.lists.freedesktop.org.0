Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D27487EB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393AC10E38D;
	Wed,  5 Jul 2023 15:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2030410E38D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:26:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by laurent.telenet-ops.be with bizsmtp
 id HTSR2A00A45Xpxs01TSRp8; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Ob-000ck4-Ma;
 Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Of-00AwXW-94;
 Wed, 05 Jul 2023 17:26:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/3] util: Add NV24 and NV42 frame buffer formats
Date: Wed,  5 Jul 2023 17:26:15 +0200
Message-Id: <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688570702.git.geert+renesas@glider.be>
References: <cover.1688570702.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing entries for semi-planar YUV formats with
non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/util/format.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/util/format.c b/tests/util/format.c
index 1ca1b82ce947b2f4..f825027227ddba24 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -51,6 +51,8 @@ static const struct util_format_info format_info[] = {
 	{ DRM_FORMAT_NV21, "NV21", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 2) },
 	{ DRM_FORMAT_NV16, "NV16", MAKE_YUV_INFO(YUV_YCbCr, 2, 1, 2) },
 	{ DRM_FORMAT_NV61, "NV61", MAKE_YUV_INFO(YUV_YCrCb, 2, 1, 2) },
+	{ DRM_FORMAT_NV24, "NV24", MAKE_YUV_INFO(YUV_YCbCr, 1, 1, 2) },
+	{ DRM_FORMAT_NV42, "NV42", MAKE_YUV_INFO(YUV_YCrCb, 1, 1, 2) },
 	/* YUV planar */
 	{ DRM_FORMAT_YUV420, "YU12", MAKE_YUV_INFO(YUV_YCbCr, 2, 2, 1) },
 	{ DRM_FORMAT_YVU420, "YV12", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 1) },
-- 
2.34.1

