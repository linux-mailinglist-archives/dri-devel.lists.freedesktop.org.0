Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F511F225
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0326E394;
	Sat, 14 Dec 2019 14:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41A6E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 09:44:20 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 570F4C574DDA913CB69C;
 Sat, 14 Dec 2019 17:44:18 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 17:44:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <jernej.skrabec@siol.net>,
 <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sun4i: Remove unneeded semicolon in sun4i_layer.c
Date: Sat, 14 Dec 2019 17:51:31 +0800
Message-ID: <1576317091-24968-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576317091-24968-1-git-send-email-zhengbin13@huawei.com>
References: <1576317091-24968-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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

drivers/gpu/drm/sun4i/sun4i_layer.c:253:3-4: Unneeded semicolon
drivers/gpu/drm/sun4i/sun4i_layer.c:257:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index c04f4ba..acfbfd4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -250,11 +250,11 @@ struct drm_plane **sun4i_layers_init(struct drm_device *drm,
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
-		};
+		}

 		layer->id = i;
 		planes[i] = &layer->plane;
-	};
+	}

 	return planes;
 }
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
