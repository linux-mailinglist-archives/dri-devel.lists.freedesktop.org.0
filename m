Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942D8196F2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 03:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B610E30C;
	Wed, 20 Dec 2023 02:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B410E30C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 02:49:11 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4Svygl2XNmz1Fhc
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 10:49:07 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4Svygj5vzwz68JxK
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 10:49:05 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Svygc57qqz8XrRF;
 Wed, 20 Dec 2023 10:49:00 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 3BK2mqt7068198;
 Wed, 20 Dec 2023 10:48:52 +0800 (+08)
 (envelope-from yang.guang5@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 20 Dec 2023 10:48:53 +0800 (CST)
Date: Wed, 20 Dec 2023 10:48:53 +0800 (CST)
X-Zmail-TransId: 2afa65825615ffffffffd39-0a04b
X-Mailer: Zmail v1.0
Message-ID: <202312201048538333616@zte.com.cn>
Mime-Version: 1.0
From: <yang.guang5@zte.com.cn>
To: <hanxu5@huaqin.corp-partner.google.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9wYW5lbDogU2ltcGxpZnkgd2l0aCBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3BK2mqt7068198
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 65825622.000/4Svygl2XNmz1Fhc
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
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, cgel.zte@gmail.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, chen.haonan2@zte.com.cn,
 dri-devel@lists.freedesktop.org, jiang.xuexin@zte.com.cn,
 quic_jesszhan@quicinc.com, airlied@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

dev_err_probe() can check if the error code is -EPROBE_DEFER 
and can return the error code, replacing dev_err() with it 
simplifies the code.

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 11b64acbe8a9..e225840b0d67 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -854,26 +854,20 @@ static int panel_add(struct panel_info *pinfo)

 	pinfo->pp18_gpio = devm_gpiod_get(dev, "pp18", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->pp18_gpio)) {
-		ret = PTR_ERR(pinfo->pp18_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp18 gpio: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(pinfo->pp18_gpio),
+							 "failed to get pp18 gpio\n");
 	}

 	pinfo->pp33_gpio = devm_gpiod_get(dev, "pp33", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->pp33_gpio)) {
-		ret = PTR_ERR(pinfo->pp33_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp33 gpio: %d\n", ret);
-		return ret;
+		return	dev_err_probe(dev, PTR_ERR(pinfo->pp33_gpio),
+							 "failed to get pp33 gpio\n");
 	}

 	pinfo->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->enable_gpio)) {
-		ret = PTR_ERR(pinfo->enable_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get enable gpio: %d\n", ret);
-		return ret;
+		return	dev_err_probe(dev, PTR_ERR(pinfo->enable_gpio),
+						 "failed to get enable gpio\n");
 	}

 	drm_panel_init(&pinfo->base, dev, &panel_funcs,
-- 
2.25.1
