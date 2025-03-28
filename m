Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E1A745FE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675C10E9A8;
	Fri, 28 Mar 2025 09:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33A410E9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:08:44 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF7b4bs6z5B1J5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 17:08:43 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZPF7M0y4tz501bg;
 Fri, 28 Mar 2025 17:08:31 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 52S98Jn1085156;
 Fri, 28 Mar 2025 17:08:19 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid32;
 Fri, 28 Mar 2025 17:08:22 +0800 (CST)
Date: Fri, 28 Mar 2025 17:08:22 +0800 (CST)
X-Zmail-TransId: 2afa67e6670605c-c9cb3
X-Mailer: Zmail v1.0
Message-ID: <20250328170822125BzIvZeYNIQbV1oqrHVKxG@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <p.zabel@pengutronix.de>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
 <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vaW14OiBVc2UgZGV2aWNlX21hdGNoX29mX25vZGUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52S98Jn1085156
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E6671B.005/4ZPF7b4bs6z5B1J5
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

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ec5fd9a01f1e..099605137343 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -185,7 +185,7 @@ static int compare_of(struct device *dev, void *data)
 		of_node_put(np);
 	}

-	return dev->of_node == np;
+	return device_match_of_node(dev, np);
 }

 static int imx_drm_bind(struct device *dev)
-- 
2.25.1
