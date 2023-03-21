Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91D6C3097
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0E710E1AD;
	Tue, 21 Mar 2023 11:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Tue, 21 Mar 2023 11:43:33 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA22710E1AD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:43:33 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4PgqLv5SpJzK85
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 19:36:39 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.36.20.94])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4PgqLd4rBJz54hxn
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 19:36:25 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxus.zte.com.cn (FangMail) with ESMTPS id 4PgqLb3TDwz9wn5t
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 19:36:23 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PgqLS3w08z6FK2R;
 Tue, 21 Mar 2023 19:36:16 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
 by mse-fl1.zte.com.cn with SMTP id 32LBa860083657;
 Tue, 21 Mar 2023 19:36:08 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Tue, 21 Mar 2023 19:36:11 +0800 (CST)
Date: Tue, 21 Mar 2023 19:36:11 +0800 (CST)
X-Zmail-TransId: 2afa641996ab7b8-d8e42
X-Mailer: Zmail v1.0
Message-ID: <202303211936116261105@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <tomba@kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm06IG9tYXBkcm06IHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 32LBa860083657
X-FangMail-Miltered: at esgde01-1.novalocal with ID 641996B8.000 by FangMail
 milter!
X-FangMail-Envelope: 1679398585/4PgqLd4rBJz54hxn/641996B8.000/10.36.20.94/[10.36.20.94]/mxus.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641996C6.001/4PgqLv5SpJzK85
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource_byname(), as this is exactly what
this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/omapdrm/dss/hdmi_wp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c b/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
index 9d830584a762..77a7aa797ad0 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
@@ -280,8 +280,7 @@ int hdmi_wp_init(struct platform_device *pdev, struct hdmi_wp_data *wp,
 {
 	struct resource *res;

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "wp");
-	wp->base = devm_ioremap_resource(&pdev->dev, res);
+	wp->base = devm_platform_ioremap_resource_byname(pdev, "wp");
 	if (IS_ERR(wp->base))
 		return PTR_ERR(wp->base);

-- 
2.25.1
