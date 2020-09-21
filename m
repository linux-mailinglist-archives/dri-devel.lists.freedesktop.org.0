Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15B273C8B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C22D6E828;
	Tue, 22 Sep 2020 07:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896889D52
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 13:10:04 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AB584AD019DE5FA38497;
 Mon, 21 Sep 2020 21:09:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:09:51 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm: omapdrm: dss: simplify the return expression of
 hdmi_init_pll_data
Date: Mon, 21 Sep 2020 21:10:15 +0800
Message-ID: <20200921131015.91422-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
index cf2b000f3..c3e85b636 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
@@ -131,7 +131,6 @@ static int hdmi_init_pll_data(struct dss_device *dss,
 {
 	struct dss_pll *pll = &hpll->pll;
 	struct clk *clk;
-	int r;
 
 	clk = devm_clk_get(&pdev->dev, "sys_clk");
 	if (IS_ERR(clk)) {
@@ -151,11 +150,7 @@ static int hdmi_init_pll_data(struct dss_device *dss,
 
 	pll->ops = &hdmi_pll_ops;
 
-	r = dss_pll_register(dss, pll);
-	if (r)
-		return r;
-
-	return 0;
+	return dss_pll_register(dss, pll);
 }
 
 int hdmi_pll_init(struct dss_device *dss, struct platform_device *pdev,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
