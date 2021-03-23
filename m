Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFB345953
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 09:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B056E095;
	Tue, 23 Mar 2021 08:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FBE6E095;
 Tue, 23 Mar 2021 08:11:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UT2qUJD_1616487100; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UT2qUJD_1616487100) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 23 Mar 2021 16:11:46 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Subject: [PATCH v2] drm/nouveau/mc: make tu102_mc_intr_mask and
 tu102_mc_intr_rearm static
Date: Tue, 23 Mar 2021 16:11:24 +0800
Message-Id: <1616487084-104391-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following sparse warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:74:1: warning: symbol
'tu102_mc_intr_mask' was not declared. Should it be static?

drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:62:1: warning: symbol
'tu102_mc_intr_rearm' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Modified the commit message.

 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
index 58db83e..7cf659cc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -58,7 +58,7 @@ struct tu102_mc {
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 
-void
+static void
 tu102_mc_intr_rearm(struct nvkm_mc *base)
 {
 	struct tu102_mc *mc = tu102_mc(base);
@@ -70,7 +70,7 @@ struct tu102_mc {
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 
-void
+static void
 tu102_mc_intr_mask(struct nvkm_mc *base, u32 mask, u32 intr)
 {
 	struct tu102_mc *mc = tu102_mc(base);
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
