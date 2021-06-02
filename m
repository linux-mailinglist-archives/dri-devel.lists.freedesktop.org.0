Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB1397F30
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389989FDD;
	Wed,  2 Jun 2021 02:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E6C689FDD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 02:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DM3i/
 sEar+rgTXWuUpWQOQV9DGRjv3jpGVAH42azir8=; b=mT0ED5EyN6g/yVX5zve1h
 tc6GPVOZO9NYtYyT0ffcpB7sjlKGWGGXByOX6dSoHa/9BKrnm01hl54xTwA0bDla
 vqecklzyrfgtW5GADD7QXmiFm4aNSzCys1gZRctnJ/I+NqoFKmwqyp71FjJHgUzS
 TlBldhjwovX+BOKaTlrEow=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp14 (Coremail) with SMTP id EsCowAC3vOR58bZgNm7tmw--.26211S2;
 Wed, 02 Jun 2021 10:48:26 +0800 (CST)
From: lijian_8010a29@163.com
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: kyro: STG4000OverlayDevice.c: deleted the
 repeated word
Date: Wed,  2 Jun 2021 10:47:28 +0800
Message-Id: <20210602024728.74862-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAC3vOR58bZgNm7tmw--.26211S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJrW5Zw1kGFWkKry8Krg_yoWfZFX_C3
 9FvF4fWrWkKFy8G3ZxJFnIvr90va9rZFyrWF12q3s3GrZxJ3ySq3yjqr1FgrykGrs8Z3WD
 W3ZFqr18Zrn3CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5bVy3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiHRqlUFSIq--YGAAAs6
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
Cc: lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

deleted the repeated word 'number' in the comments

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
index 9fde0e3b69ec..7a09178024a6 100644
--- a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
@@ -398,7 +398,9 @@ int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
 		ulDecimated =
 		    (ulBits * ulApplied) + Overlap((ulSrc % 32),
 						   ulPattern);
-		ulSrc = ulSrc - ulDecimated;	/* the number number of lines that will go into the scaler */
+
+		/* the number of lines that will go into the scaler */
+		ulSrc = ulSrc - ulDecimated;
 	}
 
 	if (ulBits && (ulBits != 32)) {
-- 
2.25.1


