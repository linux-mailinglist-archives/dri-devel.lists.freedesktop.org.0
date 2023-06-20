Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8317385E5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06AE10E47E;
	Wed, 21 Jun 2023 13:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id 673F410E2AF;
 Tue, 20 Jun 2023 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EVSAA
 Yeay8lPjMlTnk/Pgq9nLkaIdxvjcsr04P+ioqs=; b=LXZrzVH2IFDwFTBEMohO7
 OT6Z2xtO0wkCjfUAItR594nl3lhgF2XNzqIofEzrInLoHflwHdWPc4vT2aoNz2B8
 yXE01WfxvM83XHrzkeaO3lOl0TQ+N3o/syKEj4KJoi199KVtixG50MXSxLLbAcUQ
 QSLum8jGmNAUPAYdA6Ggrk=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id
 _____wAXg3CldZFkB8yiAQ--.11241S12; 
 Tue, 20 Jun 2023 17:47:19 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 10/11] drm/etnaviv: Keep the curly brace aligned
Date: Tue, 20 Jun 2023 17:47:15 +0800
Message-Id: <20230620094716.2231414-11-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S12
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1Utw1xtw13Zry5GFW7urg_yoW3Jrb_CF
 18Zr9rWrsIkr1ktr17Aa45ZFyIvFZ5ZanavwnFqas3K34DJr98Xrykuw1UXa4UJryxCFn8
 G3WkXF1rAF1xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn-o7tUUUUU==
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/1tbiEwmU0WE17eMXkQADsA
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

No functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 8907cdb8a1f8..c9f502a89de6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -185,7 +185,7 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 			drm_sched_entity_init(&ctx->sched_entity[i],
 					      DRM_SCHED_PRIORITY_NORMAL, &sched,
 					      1, NULL);
-			}
+		}
 	}
 
 	file->driver_priv = ctx;
-- 
2.25.1

