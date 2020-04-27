Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FB1BBDDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4472C89A8B;
	Tue, 28 Apr 2020 12:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2877C89F99
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:05:42 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id B9D1C48274B;
 Mon, 27 Apr 2020 16:05:39 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Bernard Zhao <bernard@vivo.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/video: cleanup coding style in video a bit
Date: Mon, 27 Apr 2020 01:05:23 -0700
Message-Id: <20200427080530.3234-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVOTUhLS0tJS0lKTENCTVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTI6Sgw4CDgrFkgNMjU9Dw0w
 ThYaCjJVSlVKTkNMQkxPTE9LS05JVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSU5PTTcG
X-HM-Tid: 0a71baab97fd93bakuwsb9d1c48274b
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the magic numbers, add vender infoframe size macro
like other hdmi modules.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/video/hdmi.c | 2 +-
 include/linux/hdmi.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 856a8c4e84a2..f693076f2e5f 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -495,7 +495,7 @@ int hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame)
 	 * value
 	 */
 	frame->s3d_struct = HDMI_3D_STRUCTURE_INVALID;
-	frame->length = 4;
+	frame->length = HDMI_VENDOR_INFOFRAME_SIZE;
 
 	return 0;
 }
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 9613d796cfb1..ff25aeb95ee4 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -57,6 +57,7 @@ enum hdmi_infoframe_type {
 #define HDMI_SPD_INFOFRAME_SIZE    25
 #define HDMI_AUDIO_INFOFRAME_SIZE  10
 #define HDMI_DRM_INFOFRAME_SIZE    26
+#define HDMI_VENDOR_INFOFRAME_SIZE  4
 
 #define HDMI_INFOFRAME_SIZE(type)	\
 	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
