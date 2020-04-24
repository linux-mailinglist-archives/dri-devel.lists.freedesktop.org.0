Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242F1B7FFE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACB66EB40;
	Fri, 24 Apr 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06866EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 07:37:15 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4014B85D237BD9CE40B0;
 Fri, 24 Apr 2020 15:37:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Apr 2020
 15:37:00 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
Subject: [PATCH] drm/rockchip: Remove unneeded semicolon
Date: Fri, 24 Apr 2020 15:44:10 +0800
Message-ID: <20200424074410.1070-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/rockchip/cdn-dp-reg.c:604:2-3: Unneeded semicolon
drivers/gpu/drm/rockchip/cdn-dp-reg.c:622:2-3: Unneeded semicolon
drivers/gpu/drm/rockchip/cdn-dp-reg.c:703:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-reg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
index 7361c07cb4a7..9d2163ef4d6e 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
@@ -601,7 +601,7 @@ static int cdn_dp_get_msa_misc(struct video_info *video,
 	case YCBCR_4_2_0:
 		val[0] = 5;
 		break;
-	};
+	}

 	switch (video->color_depth) {
 	case 6:
@@ -619,7 +619,7 @@ static int cdn_dp_get_msa_misc(struct video_info *video,
 	case 16:
 		val[1] = 4;
 		break;
-	};
+	}

 	msa_misc = 2 * val[0] + 32 * val[1] +
 		   ((video->color_fmt == Y_ONLY) ? (1 << 14) : 0);
@@ -700,7 +700,7 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
 	case 16:
 		val = BCS_16;
 		break;
-	};
+	}

 	val += video->color_fmt << 8;
 	ret = cdn_dp_reg_write(dp, DP_FRAMER_PXL_REPR, val);
--
2.26.0.106.g9fadedd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
