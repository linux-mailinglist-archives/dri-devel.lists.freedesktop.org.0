Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB217A7632D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB8910E10B;
	Mon, 31 Mar 2025 09:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Mon, 31 Mar 2025 09:31:56 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7410E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:31:56 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5Vv1Hrfz51SXr;
 Mon, 31 Mar 2025 17:31:51 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 52V9VLLh081624;
 Mon, 31 Mar 2025 17:31:21 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 31 Mar 2025 17:31:24 +0800 (CST)
Date: Mon, 31 Mar 2025 17:31:24 +0800 (CST)
X-Zmail-TransId: 2af967ea60ecffffffffa1c-480dd
X-Mailer: Zmail v1.0
Message-ID: <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>
In-Reply-To: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
References: 20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvNF0gZHJtOiBtYWxpZHA6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGjCoGNvbXBvbmVudF9jb21wYXJlX29m?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V9VLLh081624
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA6107.000/4ZR5Vv1Hrfz51SXr
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

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/arm/malidp_drv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index e083021e9e99..e2e6fd1f64b0 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -910,13 +910,6 @@ static const struct component_master_ops malidp_master_ops = {
 	.unbind = malidp_unbind,
 };

-static int malidp_compare_dev(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int malidp_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -930,7 +923,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of,
 				   port);
 	of_node_put(port);
 	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
-- 
2.25.1
