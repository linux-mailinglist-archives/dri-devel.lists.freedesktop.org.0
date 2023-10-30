Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F97DB7F1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E909C10E28C;
	Mon, 30 Oct 2023 10:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8178B10E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7082:5ab3:115b:c8d0])
 by albert.telenet-ops.be with bizsmtp
 id 4APi2B00G1qcjVs06APizL; Mon, 30 Oct 2023 11:23:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQq-007p35-RN;
 Mon, 30 Oct 2023 11:23:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQs-006o5K-Fo;
 Mon, 30 Oct 2023 11:23:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v5 4/9] util: add missing big-endian RGB16 frame buffer
 formats
Date: Mon, 30 Oct 2023 11:23:31 +0100
Message-Id: <34535f281a944fb600bc14ab18dfed742d2664bf.1698661177.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698661177.git.geert@linux-m68k.org>
References: <cover.1698661177.git.geert@linux-m68k.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
  - Add Reviewed-by,

v4:
  - No changes,

v3:
  - Update for suffix change from "be" to "_BE", cfr. commit
    ffb9375a505700ad ("xf86drm: handle DRM_FORMAT_BIG_ENDIAN in
    drmGetFormatName()"),

v2:
  - New.
---
 tests/util/format.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/util/format.c b/tests/util/format.c
index b99cc9c3599d9237..376a32fe4b485238 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -78,6 +78,9 @@ static const struct util_format_info format_info[] = {
 	{ DRM_FORMAT_BGRX5551, "BX15", MAKE_RGB_INFO(5, 1, 5, 6, 5, 11, 0, 0) },
 	{ DRM_FORMAT_RGB565, "RG16", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
 	{ DRM_FORMAT_BGR565, "BG16", MAKE_RGB_INFO(5, 0, 6, 5, 5, 11, 0, 0) },
+	/* Big-endian RGB16 */
+	{ DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, "XR15_BE", MAKE_RGB_INFO(5, 10, 5, 5, 5, 0, 0, 0) },
+	{ DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, "RG16_BE", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
 	/* RGB24 */
 	{ DRM_FORMAT_BGR888, "BG24", MAKE_RGB_INFO(8, 0, 8, 8, 8, 16, 0, 0) },
 	{ DRM_FORMAT_RGB888, "RG24", MAKE_RGB_INFO(8, 16, 8, 8, 8, 0, 0, 0) },
-- 
2.34.1

