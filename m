Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC02A7416B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 00:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E210E189;
	Thu, 27 Mar 2025 23:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Thu, 27 Mar 2025 12:22:05 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1EC10E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:22:05 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZNjH33GWRz5SgR
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:13:19 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZNjH43PV9zBRHKM
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:13:20 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZNjGw4BThz8RTZK;
 Thu, 27 Mar 2025 20:13:12 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 52RCD8li042813;
 Thu, 27 Mar 2025 20:13:09 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Thu, 27 Mar 2025 20:13:11 +0800 (CST)
Date: Thu, 27 Mar 2025 20:13:11 +0800 (CST)
X-Zmail-TransId: 2af967e540d7fffffffff0b-2c0fc
X-Mailer: Zmail v1.0
Message-ID: <20250327201311965LJfbvO-99xGLUTxfFzg0X@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <maarten.lankhorst@linux.intel.com>
Cc: <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWlwaS1kc2k6IFVzZSBkZXZpY2VfbWF0Y2hfb2Zfbm9kZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52RCD8li042813
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E540DE.004/4ZNjH33GWRz5SgR
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
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index dfa595556320..7a48f902e02c 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -312,7 +312,7 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node)
 	mutex_lock(&host_lock);

 	list_for_each_entry(host, &host_list, list) {
-		if (host->dev->of_node == node) {
+		if (device_match_of_node(host->dev, node)) {
 			mutex_unlock(&host_lock);
 			return host;
 		}
-- 
2.25.1
