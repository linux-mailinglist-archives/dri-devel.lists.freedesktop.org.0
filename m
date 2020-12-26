Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84412E35C0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87B8982E;
	Mon, 28 Dec 2020 10:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8453489650
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Dec 2020 08:02:52 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D2x9Y2Ryyzhvbs;
 Sat, 26 Dec 2020 16:02:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 16:02:45 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <anitha.chrisanthus@intel.com>, <edmund.j.dea@intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/kmb: remove unneeded semicolon
Date: Sat, 26 Dec 2020 16:02:48 +0800
Message-ID: <1608969768-41988-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the warning below:
drivers/gpu/drm/kmb/kmb_dsi.c:284:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:304:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:321:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:340:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:364:2-3: Unneeded semicolon

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5d82a..231041b 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
