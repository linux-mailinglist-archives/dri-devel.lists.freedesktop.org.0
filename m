Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6555A12D785
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D356E154;
	Tue, 31 Dec 2019 09:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5C16E0E5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 06:42:52 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BBB959DF03C5317FAABC;
 Tue, 31 Dec 2019 14:42:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 31 Dec 2019 14:42:42 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Add new clock/resolution configurations
Date: Tue, 31 Dec 2019 14:42:51 +0800
Message-ID: <1577774571-60493-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the three new pll config for corresponding resolution 1440x900 and
1600x900, 640x480 for hibmc

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 3 +++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index f1ce6cb..6bf4334 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -40,6 +40,7 @@ struct hibmc_dislay_pll_config {
 };
 
 static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
+	{640, 480, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ},
 	{800, 600, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ},
 	{1024, 768, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MHZ},
 	{1152, 864, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS_80MHZ},
@@ -47,6 +48,8 @@ static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
 	{1280, 720, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MHZ},
 	{1280, 960, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
 	{1280, 1024, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
+	{1440, 900, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106MHZ},
+	{1600, 900, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
 	{1600, 1200, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_162MHZ},
 	{1920, 1080, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_148MHZ},
 	{1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
index 9b7e859..17b30c3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
@@ -179,6 +179,7 @@
 #define CRT_PLL1_HS_74MHZ			0x23941dc2
 #define CRT_PLL1_HS_80MHZ			0x23941001
 #define CRT_PLL1_HS_80MHZ_1152			0x23540fc2
+#define CRT_PLL1_HS_106MHZ			0x237C1641
 #define CRT_PLL1_HS_108MHZ			0x23b41b01
 #define CRT_PLL1_HS_162MHZ			0x23480681
 #define CRT_PLL1_HS_148MHZ			0x23541dc2
@@ -191,6 +192,7 @@
 #define CRT_PLL2_HS_78MHZ			0x50E147AE
 #define CRT_PLL2_HS_74MHZ			0x602B6AE7
 #define CRT_PLL2_HS_80MHZ			0x70000000
+#define CRT_PLL2_HS_106MHZ			0x0075c28f
 #define CRT_PLL2_HS_108MHZ			0x80000000
 #define CRT_PLL2_HS_162MHZ			0xA0000000
 #define CRT_PLL2_HS_148MHZ			0xB0CCCCCD
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
