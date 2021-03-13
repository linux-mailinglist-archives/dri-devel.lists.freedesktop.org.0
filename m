Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FD339BBC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 05:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3B06E043;
	Sat, 13 Mar 2021 04:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ECF6E043
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 04:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Z9134
 IZ7Ed8Fem9202feWjiTTDlCnJ/XvKeEPy9FOIg=; b=pWCfZVUecdZtdq/2wVvEk
 aRdLqnxIdYBJHfkZfunmBHNWpIe2V0oMB20BEhq1XUNv6qk/YEEkEzWxkRf5cd1Y
 gMP0xQMPzgG/uWhajDkwSdIFMzgQJGJ45AjHWErx5nQCoIqrtuEOab2qARSUgF9a
 eeiBqea5wiIIzhRCYT58sY=
Received: from yangjunlin.ccdomain.com (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowAAXb49MQkxgOrrgAw--.18176S2;
 Sat, 13 Mar 2021 12:40:46 +0800 (CST)
From: angkery <angkery@163.com>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/kmb: remove unneeded semicolon
Date: Sat, 13 Mar 2021 12:39:46 +0800
Message-Id: <20210313043946.1853-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: DcCowAAXb49MQkxgOrrgAw--.18176S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DWF47ZF1UXr1fCFy7trb_yoW8urWkpF
 WUG3yvvry2qrs7tr1jya1fA3W5Ca4jqFyxGFWqgas2gF4j9Fn3Aw1Y9397J34Fya17Z3s7
 A39FgFyxu3s3ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWksDUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbCBhdUI13I1AppagAAsu
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
Cc: Junlin Yang <yangjunlin@yulong.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Junlin Yang <yangjunlin@yulong.com>

Fixes coccicheck warnings:
./drivers/gpu/drm/kmb/kmb_dsi.c:284:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:304:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:321:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:340:3-4: Unneeded semicolon
./drivers/gpu/drm/kmb/kmb_dsi.c:364:2-3: Unneeded semicolon

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
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
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
