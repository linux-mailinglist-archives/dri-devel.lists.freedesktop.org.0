Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524A30B9B2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202C46E8E3;
	Tue,  2 Feb 2021 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 02 Feb 2021 07:12:33 UTC
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BBC6E8D1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 07:12:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UNexAtl_1612249647; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UNexAtl_1612249647) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Feb 2021 15:07:28 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: anitha.chrisanthus@intel.com
Subject: [PATCH] drm/kmb: remove unneeded semicolon
Date: Tue,  2 Feb 2021 15:07:26 +0800
Message-Id: <1612249646-68040-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: airlied@linux.ie, edmund.j.dea@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the following coccicheck warning:
./drivers/gpu/drm/kmb/kmb_dsi.c:281:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:301:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:318:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:337:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:361:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
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
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
