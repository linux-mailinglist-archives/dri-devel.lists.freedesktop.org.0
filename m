Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7735D5DA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 05:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D06E0D4;
	Tue, 13 Apr 2021 03:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E216E0D4;
 Tue, 13 Apr 2021 03:26:08 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FK9sr5dQbzPpsl;
 Tue, 13 Apr 2021 11:23:12 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 11:25:56 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <sumit.semwal@linaro.org>
Subject: [PATCH] drm/radeon/cik: remove set but not used variables
Date: Tue, 13 Apr 2021 11:26:19 +0800
Message-ID: <1618284379-28126-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: Tian Tao <tiantao6@hisilicon.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value of pipe_id and queue_id  are not used under certain
circumstances, so just delete.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/radeon/cik.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 8b7a4f7..42a8afa 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -7948,8 +7948,6 @@ int cik_irq_process(struct radeon_device *rdev)
 			DRM_ERROR("Illegal register access in command stream\n");
 			/* XXX check the bitfield order! */
 			me_id = (ring_id & 0x60) >> 5;
-			pipe_id = (ring_id & 0x18) >> 3;
-			queue_id = (ring_id & 0x7) >> 0;
 			switch (me_id) {
 			case 0:
 				/* This results in a full GPU reset, but all we need to do is soft
@@ -7971,8 +7969,6 @@ int cik_irq_process(struct radeon_device *rdev)
 			DRM_ERROR("Illegal instruction in command stream\n");
 			/* XXX check the bitfield order! */
 			me_id = (ring_id & 0x60) >> 5;
-			pipe_id = (ring_id & 0x18) >> 3;
-			queue_id = (ring_id & 0x7) >> 0;
 			switch (me_id) {
 			case 0:
 				/* This results in a full GPU reset, but all we need to do is soft
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
