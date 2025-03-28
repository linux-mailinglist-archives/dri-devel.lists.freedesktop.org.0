Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C2A745FA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2E10E9A7;
	Fri, 28 Mar 2025 09:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE610E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:07:20 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF5z44Hsz5B1J4;
 Fri, 28 Mar 2025 17:07:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 52S972DG013128;
 Fri, 28 Mar 2025 17:07:03 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Fri, 28 Mar 2025 17:07:05 +0800 (CST)
Date: Fri, 28 Mar 2025 17:07:05 +0800 (CST)
X-Zmail-TransId: 2afc67e666b9ffffffffbd4-c782e
X-Mailer: Zmail v1.0
Message-ID: <20250328170705401AXCIsIhOYGoIu8LDn_lj6@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <fnkl.kernel@gmail.com>
Cc: <j@jannau.net>, <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm06IGFkcDogVXNlIGRldmljZV9tYXRjaF9vZl9ub2RlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52S972DG013128
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E666C7.00A/4ZPF5z44Hsz5B1J4
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
 drivers/gpu/drm/adp/adp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c98c647f981d..0abb56ce2c34 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -553,7 +553,7 @@ static const struct component_master_ops adp_master_ops = {

 static int compare_dev(struct device *dev, void *data)
 {
-	return dev->of_node == data;
+	return device_match_of_node(dev, data);
 }

 static int adp_probe(struct platform_device *pdev)
-- 
2.25.1
