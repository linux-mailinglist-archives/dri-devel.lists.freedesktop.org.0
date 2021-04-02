Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14235279C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 10:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F666EE2F;
	Fri,  2 Apr 2021 08:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DFE6EE2F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 08:55:29 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 8FC374003CC;
 Fri,  2 Apr 2021 16:55:27 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: cleanup coding style a bit
Date: Fri,  2 Apr 2021 01:55:21 -0700
Message-Id: <20210402085523.76928-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUxKHhlLGEpCSxpCVkpNSkxITkhMSUxMSUNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6Czo4Tj8PMCovDToKCk0a
 TxwaCRxVSlVKTUpMSE5ITElMQk1CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFKTEtMNwY+
X-HM-Tid: 0a7891cb5eb2d991kuws8fc374003cc
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coccicheck warning:
drivers/gpu/drm/gud/gud_internal.h:89:2-3: Unneeded semicolon
drivers/gpu/drm/gud/gud_internal.h:107:2-3: Unneeded semicolon

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/gud/gud_internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index de2f2d2dbc60..b65105585578 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -86,7 +86,7 @@ static inline u8 gud_from_fourcc(u32 fourcc)
 		return GUD_PIXEL_FORMAT_XRGB8888;
 	case DRM_FORMAT_ARGB8888:
 		return GUD_PIXEL_FORMAT_ARGB8888;
-	};
+	}
 
 	return 0;
 }
@@ -104,7 +104,7 @@ static inline u32 gud_to_fourcc(u8 format)
 		return DRM_FORMAT_XRGB8888;
 	case GUD_PIXEL_FORMAT_ARGB8888:
 		return DRM_FORMAT_ARGB8888;
-	};
+	}
 
 	return 0;
 }
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
