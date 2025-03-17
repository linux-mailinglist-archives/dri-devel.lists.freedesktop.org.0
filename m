Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33677A64A9D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C610E130;
	Mon, 17 Mar 2025 10:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Mon, 17 Mar 2025 06:12:04 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24510E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 06:12:04 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZGPZz2Ymfz57fC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:05:15 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZGPZx1pTWz5TCG9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:05:13 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGPZk0nj2z5B1Jb;
 Mon, 17 Mar 2025 14:05:02 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 52H64sMZ055367;
 Mon, 17 Mar 2025 14:04:54 +0800 (+08)
 (envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 17 Mar 2025 14:04:56 +0800 (CST)
Date: Mon, 17 Mar 2025 14:04:56 +0800 (CST)
X-Zmail-TransId: 2af967d7bb88223-d96ae
X-Mailer: Zmail v1.0
Message-ID: <202503171404563447jAdJlVvoFXDvBoj0sAx6@zte.com.cn>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <neil.armstrong@linaro.org>
Cc: <andrzej.hajda@intel.com>, <rfoss@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYnJpZGdlOiBzaWwtc2lpODYyMDogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52H64sMZ055367
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7BB9A.000/4ZGPZz2Ymfz57fC
X-Mailman-Approved-At: Mon, 17 Mar 2025 10:44:56 +0000
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

From: ZhangEnpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: ZhangEnpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 28a2e1ee04b2..1d0ee9c8d5b2 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2178,12 +2178,9 @@ static int sii8620_extcon_init(struct sii8620 *ctx)

 	edev = extcon_find_edev_by_node(muic);
 	of_node_put(muic);
-	if (IS_ERR(edev)) {
-		if (PTR_ERR(edev) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_err(ctx->dev, "Invalid or missing extcon\n");
-		return PTR_ERR(edev);
-	}
+	if (IS_ERR(edev))
+		return dev_err_probe(ctx->dev, PTR_ERR(edev),
+				     "Invalid or missing extcon\n");

 	ctx->extcon = edev;
 	ctx->extcon_nb.notifier_call = sii8620_extcon_notifier;
-- 
2.25.1
