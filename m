Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0533ED6B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 10:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671FF6E519;
	Wed, 17 Mar 2021 09:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56F89483
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aG9PL
 GfCbgZItHrxOJqHyjNFlL/xfuALIBa53rMsoSY=; b=ApK6Y+exknHjMND+oObGv
 tLnrCqVigeXl1Sy1gUHse9PTioYIK5GP2i6Hj9cetC65DlxkbR5v5kIU61D6aBRL
 sqnLEcL13F7W7xHoTFul+de01O0LOLqPNZqRSZ1gnWEjG9NEmz4vIU73BSdJGSCN
 chICbTazTv7mRaBYjwMvx0=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp9 (Coremail) with SMTP id DcCowABHzhZ2zVFgT9axBg--.14457S2;
 Wed, 17 Mar 2021 17:36:06 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com
Subject: [PATCH] nouveau/nvkm/subdev/devinit/mcp89.c:Unneeded variable
Date: Wed, 17 Mar 2021 17:35:45 +0800
Message-Id: <20210317093545.354-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: DcCowABHzhZ2zVFgT9axBg--.14457S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1kGryxWrWkZw1kCr1UGFg_yoWDAFX_AF
 1rZrn3Wr4FkrnxuFsrAr1xJF9agwnFvF4vvF1Iqas3W347Ww43Xr1qgr1avrWDWr1rZF98
 K3WvqrnxXrWjgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZiSJUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbipQZYUVUMc2xcnAAAss
X-Mailman-Approved-At: Wed, 17 Mar 2021 09:51:29 +0000
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
Cc: nouveau@lists.freedesktop.org, tangchunyou@yulong.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@yulong.com>

disable,delete disable and return 0

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
index fb90d47..a9cdf24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
@@ -32,7 +32,6 @@
 	struct nvkm_device *device = init->subdev.device;
 	u32 r001540 = nvkm_rd32(device, 0x001540);
 	u32 r00154c = nvkm_rd32(device, 0x00154c);
-	u64 disable = 0;
 
 	if (!(r001540 & 0x40000000)) {
 		nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
@@ -48,7 +47,7 @@
 	if (!(r00154c & 0x00000200))
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
 
-	return disable;
+	return 0;
 }
 
 static const struct nvkm_devinit_func
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
