Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A43527A0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 10:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439B6EE35;
	Fri,  2 Apr 2021 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B076EE35
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 08:55:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id BB838400480;
 Fri,  2 Apr 2021 16:55:41 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/kmb: cleanup coding style a bit
Date: Fri,  2 Apr 2021 01:55:39 -0700
Message-Id: <20210402085539.76989-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZS0NKQklNSU8eHRhMVkpNSkxITkhMT0pCQkJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N0k6HCo6Qz8KKCoBKzgqCR1M
 LEwwCRJVSlVKTUpMSE5ITE9JSEtDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFIS0tCNwY+
X-HM-Tid: 0a7891cb9660d991kuwsbb838400480
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
drivers/gpu/drm/kmb/kmb_dsi.c:284:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:304:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:321:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:340:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:364:2-3: Unneeded semicolon

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5d82af84b3..231041b269f5 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -281,7 +281,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_YCBCR422_16B:
 		data_type_param.size_constraint_pixels = 2;
@@ -301,7 +301,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_LPPS_YCBCR422_20B:
 	case DSI_LP_DT_PPS_YCBCR422_24B:
@@ -318,7 +318,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_RGB565_16B:
 		data_type_param.size_constraint_pixels = 1;
@@ -337,7 +337,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_RGB666_18B:
 		data_type_param.size_constraint_pixels = 4;
@@ -361,7 +361,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 	default:
 		DRM_ERROR("DSI: Invalid data_type %d\n", data_type);
 		return -EINVAL;
-	};
+	}
 
 	*params = data_type_param;
 	return 0;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
