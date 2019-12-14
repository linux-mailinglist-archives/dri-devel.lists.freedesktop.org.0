Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992CA11F21B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DEC6E373;
	Sat, 14 Dec 2019 14:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B166E069
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 09:44:20 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 51B77583F6E70766D7DF;
 Sat, 14 Dec 2019 17:44:18 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 17:44:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <jernej.skrabec@siol.net>,
 <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sun4i: Remove unneeded semicolon in sun8i_mixer.c
Date: Sat, 14 Dec 2019 17:51:30 +0800
Message-ID: <1576317091-24968-2-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/sun4i/sun8i_mixer.c:289:3-4: Unneeded semicolon
drivers/gpu/drm/sun4i/sun8i_mixer.c:292:2-3: Unneeded semicolon
drivers/gpu/drm/sun4i/sun8i_mixer.c:302:3-4: Unneeded semicolon
drivers/gpu/drm/sun4i/sun8i_mixer.c:305:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b803eb..7c24f8f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -286,10 +286,10 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
 			return ERR_CAST(layer);
-		};
+		}

 		planes[i] = &layer->plane;
-	};
+	}

 	for (i = 0; i < mixer->cfg->ui_num; i++) {
 		struct sun8i_ui_layer *layer;
@@ -299,10 +299,10 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
-		};
+		}

 		planes[mixer->cfg->vi_num + i] = &layer->plane;
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
