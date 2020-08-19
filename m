Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD9249C1A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B86E239;
	Wed, 19 Aug 2020 11:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E45D6E223
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DFCF22B49;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=2yQjdvyRlegxhP3g7Ww09HkpPA50NKlkwbqSSbfz3Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L8gwwe9Mb1Pjem3EbtG1gQA62R5MrWxIbVz0rdlyzmoWdbw9/6rNg93zczReSjsZC
 aVD6mSZUdws0YLOPBUmQFdw/LGGQwBl2fSmz49BhUc5yDzrG0Bbk2xo9oWyYzeHH68
 8YVN2k5bqWCSaOhRCqjtx9NnDQ+ABfnfXGbeIZHM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euak-5K; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 19/49] staging: hikey9xx/gpu: add a copy of set_reg() function
 there
Date: Wed, 19 Aug 2020 13:45:47 +0200
Message-Id: <a92be25fef54fc7f339417861e2bd8ead90ac5cb.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function has a too generic name to export it as a
symbol. Also, we should likely use some other macro instead.

So, for now, just copy it into the Kirin9xx dsi module, in order
for the driver to build.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index cfb6bfd1c338..cba81ee2639d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -37,7 +37,6 @@
 #else
 #include "kirin960_dpe_reg.h"
 #endif
-#include "kirin9xx_drm_dpe_utils.h"
 #include "kirin9xx_drm_drv.h"
 
 #if defined (CONFIG_DRM_HISI_KIRIN970)
@@ -270,6 +269,22 @@ static const struct dsi_phy_range dphy_range_info[] = {
 	{ 1000000,  1500000,   0,    0 }
 };
 
+/*
+ * Except for debug, this is identical to the one defined at
+ * kirin9xx_drm_dpe_utils.h.
+ */
+static void set_reg(char __iomem *addr, uint32_t val, uint8_t bw,
+		    uint8_t bs)
+{
+	u32 mask = (1UL << bw) - 1UL;
+	u32 tmp = 0;
+
+	tmp = inp32(addr);
+	tmp &= ~(mask << bs);
+
+	outp32(addr, tmp | ((val & mask) << bs));
+}
+
 void dsi_set_output_client(struct drm_device *dev)
 {
 	struct drm_connector_list_iter conn_iter;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
