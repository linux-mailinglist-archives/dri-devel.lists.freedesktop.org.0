Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31935310211
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 02:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF126E147;
	Fri,  5 Feb 2021 01:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78DA6E147
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 01:05:15 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 4 Feb 2021 17:05:09 -0800
Received: from sroland-t5810.vmware.com (unknown [10.30.24.252])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 40AB720614;
 Thu,  4 Feb 2021 17:05:11 -0800 (PST)
From: Roland Scheidegger <sroland@vmware.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@redhat.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/vmwgfx: add some 16:9 / 16:10 default resolutions
Date: Fri, 5 Feb 2021 02:04:46 +0100
Message-ID: <20210205010446.26559-1-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The default list was old and in particular lacking all common 16:9
resolutions, as well as some newer 16:10 ones.
This makes them selectable in resolution change lists, which can be
quite useful (for instance in case auto-fit isn't enabled).

Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b90b3fb16937..60f095511f09 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2057,6 +2057,10 @@ static struct drm_display_mode vmw_kms_connector_builtin[] = {
 	{ DRM_MODE("1152x864", DRM_MODE_TYPE_DRIVER, 108000, 1152, 1216,
 		   1344, 1600, 0, 864, 865, 868, 900, 0,
 		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
+	/* 1280x720@60Hz */
+	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74500, 1280, 1344,
+		   1472, 1664, 0, 720, 723, 728, 748, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
 	/* 1280x768@60Hz */
 	{ DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 79500, 1280, 1344,
 		   1472, 1664, 0, 768, 771, 778, 798, 0,
@@ -2101,6 +2105,10 @@ static struct drm_display_mode vmw_kms_connector_builtin[] = {
 	{ DRM_MODE("1856x1392", DRM_MODE_TYPE_DRIVER, 218250, 1856, 1952,
 		   2176, 2528, 0, 1392, 1393, 1396, 1439, 0,
 		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
+	/* 1920x1080@60Hz */
+	{ DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 173000, 1920, 2048,
+		   2248, 2576, 0, 1080, 1083, 1088, 1120, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
 	/* 1920x1200@60Hz */
 	{ DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 193250, 1920, 2056,
 		   2256, 2592, 0, 1200, 1203, 1209, 1245, 0,
@@ -2109,10 +2117,26 @@ static struct drm_display_mode vmw_kms_connector_builtin[] = {
 	{ DRM_MODE("1920x1440", DRM_MODE_TYPE_DRIVER, 234000, 1920, 2048,
 		   2256, 2600, 0, 1440, 1441, 1444, 1500, 0,
 		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
+	/* 2560x1440@60Hz */
+	{ DRM_MODE("2560x1440", DRM_MODE_TYPE_DRIVER, 241500, 2560, 2608,
+		   2640, 2720, 0, 1440, 1443, 1448, 1481, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
 	/* 2560x1600@60Hz */
 	{ DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 348500, 2560, 2752,
 		   3032, 3504, 0, 1600, 1603, 1609, 1658, 0,
 		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
+	/* 2880x1800@60Hz */
+	{ DRM_MODE("2880x1800", DRM_MODE_TYPE_DRIVER, 337500, 2880, 2928,
+		   2960, 3040, 0, 1800, 1803, 1809, 1852, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	/* 3840x2160@60Hz */
+	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 533000, 3840, 3888,
+		   3920, 4000, 0, 2160, 2163, 2168, 2222, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	/* 3840x2400@60Hz */
+	{ DRM_MODE("3840x2400", DRM_MODE_TYPE_DRIVER, 592250, 3840, 3888,
+		   3920, 4000, 0, 2400, 2403, 2409, 2469, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
 	/* Terminate */
 	{ DRM_MODE("", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) },
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
