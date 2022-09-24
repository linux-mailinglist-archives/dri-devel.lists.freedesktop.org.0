Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F075E942F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF1210E2BC;
	Sun, 25 Sep 2022 16:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D8110E3C5;
 Sat, 24 Sep 2022 07:43:49 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZLWh5yN5zWgr9;
 Sat, 24 Sep 2022 15:39:44 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 15:43:44 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <bskeggs@redhat.com>, <kherbst@redhat.com>, <lyude@redhat.com>,
 <airlied@linux.ie>, <linux-kernel@vger.kernel.org>, <daniel@ffwll.ch>,
 <airlied@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH -next] drm/nouveau/disp: make gv100_disp_core_mthd_base static
Date: Sat, 24 Sep 2022 15:39:57 +0800
Message-ID: <20220924073957.4140388-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The symbol is not used outside of the file, so mark it static.

Fixes the following warning:

./drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c:591:1: warning:
symbol 'gv100_disp_core_mthd_base' was not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 6b9d49270fa7..347c12a1fcb7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -587,7 +587,7 @@ gv100_disp_curs = {
 	.user = 73,
 };
 
-const struct nvkm_disp_mthd_list
+static const struct nvkm_disp_mthd_list
 gv100_disp_core_mthd_base = {
 	.mthd = 0x0000,
 	.addr = 0x000000,
-- 
2.25.1

