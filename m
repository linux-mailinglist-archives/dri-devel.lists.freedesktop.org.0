Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF6A7416A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 00:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E88010E188;
	Thu, 27 Mar 2025 23:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24C10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:22:05 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZNjGv59YVz5SgD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:13:11 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZNjGv3P4kzBRHKM
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:13:11 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZNjGf1FxJz5B1Gk;
 Thu, 27 Mar 2025 20:12:58 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 52RCAmMQ037604;
 Thu, 27 Mar 2025 20:10:48 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Thu, 27 Mar 2025 20:10:51 +0800 (CST)
Date: Thu, 27 Mar 2025 20:10:51 +0800 (CST)
X-Zmail-TransId: 2af967e5404bffffffff8f6-28aea
X-Mailer: Zmail v1.0
Message-ID: <20250327201051745x7fHtkSanNs1qDtAIhAnm@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <neil.armstrong@linaro.org>
Cc: <quic_jesszhan@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
 <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vcGFuZWw6IFVzZSBkZXZpY2VfbWF0Y2hfb2Zfbm9kZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52RCAmMQ037604
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E540D6.004/4ZNjGv59YVz5SgD
X-Mailman-Approved-At: Thu, 27 Mar 2025 23:14:04 +0000
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
 drivers/gpu/drm/drm_panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c627e42a7ce7..b8ad5b42534b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -344,7 +344,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 	mutex_lock(&panel_lock);

 	list_for_each_entry(panel, &panel_list, list) {
-		if (panel->dev->of_node == np) {
+		if (device_match_of_node(panel->dev, np)) {
 			mutex_unlock(&panel_lock);
 			return panel;
 		}
-- 
2.25.1
