Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A26026AA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124A210E70F;
	Tue, 18 Oct 2022 08:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B422010E70F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 08:22:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VSTyJ-w_1666081320; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VSTyJ-w_1666081320) by smtp.aliyun-inc.com;
 Tue, 18 Oct 2022 16:22:14 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] gma500: Remove the unused function gma_pipe_event()
Date: Tue, 18 Oct 2022 16:21:28 +0800
Message-Id: <20221018082128.4834-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function gma_pipe_event() is defined in the psb_irq.c file, but not
called elsewhere, so remove this unused function.

drivers/gpu/drm/gma500/psb_irq.c:35:19: warning: unused function 'gma_pipe_event'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2428
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index d421031462df..343c51250207 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -32,17 +32,6 @@ static inline u32 gma_pipestat(int pipe)
 	BUG();
 }
 
-static inline u32 gma_pipe_event(int pipe)
-{
-	if (pipe == 0)
-		return _PSB_PIPEA_EVENT_FLAG;
-	if (pipe == 1)
-		return _MDFLD_PIPEB_EVENT_FLAG;
-	if (pipe == 2)
-		return _MDFLD_PIPEC_EVENT_FLAG;
-	BUG();
-}
-
 static inline u32 gma_pipeconf(int pipe)
 {
 	if (pipe == 0)
-- 
2.20.1.7.g153144c

