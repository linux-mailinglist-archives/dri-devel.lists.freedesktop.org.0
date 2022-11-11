Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CD625645
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CD810E7AE;
	Fri, 11 Nov 2022 09:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B810E7AE;
 Fri, 11 Nov 2022 09:11:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VUWtIsz_1668157892; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VUWtIsz_1668157892) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 17:11:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Subject: [PATCH 1/5] drm/nouveau/nvfw/acr: make wpr_generic_header_dump()
 static
Date: Fri, 11 Nov 2022 17:11:26 +0800
Message-Id: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This symbol is not used outside of acr.c, so marks it static.

drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3023
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
index 83a9c48bc58c..7ac90c495737 100644
--- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
@@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
 	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
 }
 
-void
+static void
 wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
 {
 	nvkm_debug(subdev, "wprGenericHeader\n");
-- 
2.20.1.7.g153144c

