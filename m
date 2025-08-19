Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FECB2BD31
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5747610E57A;
	Tue, 19 Aug 2025 09:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664CF10E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:25:56 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4c5kht70nCz5XCT
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 17:25:50 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4c5khs5vs4zBQkJw
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 17:25:49 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4c5khn5n3Mz6G42S;
 Tue, 19 Aug 2025 17:25:45 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 57J9POZx082163;
 Tue, 19 Aug 2025 17:25:24 +0800 (+08)
 (envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Tue, 19 Aug 2025 17:25:26 +0800 (CST)
Date: Tue, 19 Aug 2025 17:25:26 +0800 (CST)
X-Zmail-TransId: 2afc68a44306ffffffffbba-845b4
X-Mailer: Zmail v1.0
Message-ID: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <chunkuang.hu@kernel.org>
Cc: <p.zabel@pengutronix.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWVkaWF0ZWs6IG10a19kcm1fZHJ2OiBzd2l0Y2ggdG8gdXNlIGRldm1fa21lbWR1cF9hcnJheSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 57J9POZx082163
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: zhang.enpei@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.35.20.121 unknown Tue, 19 Aug 2025 17:25:51 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68A4431D.000/4c5kht70nCz5XCT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use devm_kmemdup_array() to avoid multiplication or possible overflows.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..e700c0f0a3a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1003,7 +1003,8 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
                return -EINVAL;
        }

-       final_ddp_path = devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[0]), GFP_KERNEL);
+       final_ddp_path = devm_kmemdup_array(dev, temp_path, idx,
+                                           sizeof(*temp_path), GFP_KERNEL);
        if (!final_ddp_path)
                return -ENOMEM;

-- 
2.25.1
