Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A827716D5
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BF610E138;
	Sun,  6 Aug 2023 21:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C13A10E6BF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:51:06 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RHKCm6wGBz1KCFr
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:49:56 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 16:51:01 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <anitha.chrisanthus@intel.com>, <edmund.j.dea@intel.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/kmb: Make layer_irqs static
Date: Fri, 4 Aug 2023 16:50:33 +0800
Message-ID: <20230804085033.32410-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

layer_irqs is not referred elsewhere, so makt it static.

This resolves the following sparse warning:
  warning: symbol 'layer_irqs' was not declared. Should it be static?

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..ed80233ad418 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -17,7 +17,7 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
-const u32 layer_irqs[] = {
+static const u32 layer_irqs[] = {
 	LCD_INT_VL0,
 	LCD_INT_VL1,
 	LCD_INT_GL0,
-- 
2.17.1

