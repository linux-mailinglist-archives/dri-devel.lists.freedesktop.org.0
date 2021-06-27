Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589313B5978
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FBF6E220;
	Mon, 28 Jun 2021 07:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 929 seconds by postgrey-1.36 at gabe;
 Sun, 27 Jun 2021 08:16:22 UTC
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B12E89FDE;
 Sun, 27 Jun 2021 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=dn2OHWnaKzUjkxfP+B
 r0ExjTZGAQz9D9C9SLtoPnw2c=; b=Oi2znL7XpqCdHeQt9vqzwmrv3SU8ouRVaj
 DveHEikK1nTJNbiJ5Lp9Eg/sEJAg6458eA9fVJRj+zOMfYH53b/FwOo/+NT8IRXH
 EzgutytcRdtqZhSBPpLnIny0ksHEr1p3c94cixtt0JwSG/ucE2VueDv30ZIO+BGd
 f0N+NNZqQ=
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (unknown [39.183.0.171])
 by smtp11 (Coremail) with SMTP id D8CowADHz_fpL9hgJ7k8Ag--.1973S4;
 Sun, 27 Jun 2021 15:59:57 +0800 (CST)
From: Cai Huoqing <caihuoqing1990@163.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, kherbst@redhat.com
Subject: [PATCH v2] drm/nouveau: remove unused varialble "struct device *dev"
Date: Sun, 27 Jun 2021 15:59:35 +0800
Message-Id: <20210627075935.373-1-caihuoqing1990@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: D8CowADHz_fpL9hgJ7k8Ag--.1973S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4kWFykJw13Kw4rKr1kuFg_yoW8Jw43pF
 48Ca47ZF4DKws2gr40yF18ZF9IyanrJFyxGFyjy3sYgw4Fyr98Xr4rJry5ArW5JFyxuay3
 tF9rKasIv3WjkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYGQDUUUUU=
X-Originating-IP: [39.183.0.171]
X-CM-SenderInfo: xfdlx3xrtl0warzziqqrwthudrp/1tbiMB2+plWByBTxdAAAs4
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: nouveau@lists.freedesktop.org, Cai Huoqing <caihuoqing@baidu.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Cai Huoqing <caihuoqing@baidu.com>

fix the warning- variable 'dev' set but not used

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 984721bf3ab4..cb3ff4ae203e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1242,7 +1242,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
        struct ttm_tt *ttm_dma = (void *)ttm;
        struct nouveau_drm *drm;
-       struct device *dev;
        bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);

        if (ttm_tt_is_populated(ttm))
@@ -1255,7 +1254,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
        }

        drm = nouveau_bdev(bdev);
-       dev = drm->dev->dev;

        return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1265,14 +1263,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
                          struct ttm_tt *ttm)
 {
        struct nouveau_drm *drm;
-       struct device *dev;
        bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);

        if (slave)
                return;

        drm = nouveau_bdev(bdev);
-       dev = drm->dev->dev;

        return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
--
2.17.1

