Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9C30D4D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3F36E9D4;
	Wed,  3 Feb 2021 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17640.qiye.163.com (mail-m17640.qiye.163.com
 [59.111.176.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBFE6E115
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 12:23:48 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id F27EC5404D7;
 Tue,  2 Feb 2021 20:23:45 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: remove unneeded variable: "ret"
Date: Tue,  2 Feb 2021 04:23:38 -0800
Message-Id: <20210202122338.15351-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZThoaT04aS0hDHR1MVkpNSklJTUNNSU1KQ0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006Kjo*Tj8QTDYSFCkrLywU
 TBAaCQpVSlVKTUpJSU1DTUlNTkpJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSkNPSDcG
X-HM-Tid: 0a7762b2e0ccd995kuwsf27ec5404d7
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

remove unneeded variable: "ret".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index b641252939d8..445d3bab89e0 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1026,7 +1026,6 @@ int vc4_queue_seqno_cb(struct drm_device *dev,
 		       void (*func)(struct vc4_seqno_cb *cb))
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	int ret = 0;
 	unsigned long irqflags;
 
 	cb->func = func;
@@ -1041,7 +1040,7 @@ int vc4_queue_seqno_cb(struct drm_device *dev,
 	}
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 
-	return ret;
+	return 0;
 }
 
 /* Scheduled when any job has been completed, this walks the list of
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
