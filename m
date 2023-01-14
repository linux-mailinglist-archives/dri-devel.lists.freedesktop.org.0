Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68566AC32
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 16:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2356110E09D;
	Sat, 14 Jan 2023 15:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0450A10E09D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673710887; bh=CSbwjpVP0TI8uoR+G2gX1VxXrvkg+JX5kZeE9DaLjlM=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=LRotYzEEcWl3PUnmzk5MucPEwXn17uNTyg+SB9MlgyvsRE3GEj5G9IRdjmZujra7x
 TbtmiQLrOQ/iEFV3UdceIa9PIeKf5SqUQSM7qbjNVz2aPd2V2pWy1chpxW7Pv4Sen1
 fSRUzHe5LLsanHJ/sYFAQr8iqlQTPlrKRduHLtXw=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 16:41:27 +0100 (CET)
X-EA-Auth: kx0hu53F1vxsnkhWrm67IQdYuYSD3t5Tz/rdKLzii8sKxaPs1Rqg5heKbrkjIR4CdFckkbd9PpvMh2Od+C1SphO8kWje3Y1o
Date: Sat, 14 Jan 2023 21:11:22 +0530
From: Deepak R Varma <drv@mailo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: dp: Remove extra semicolon
Message-ID: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary semicolon at the end of switch block closing brace.
Issue identified using semicolon Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9d085c05c49c..9da58ac5a8b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1693,7 +1693,7 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 				break;
 			default:
 				return -EINVAL;
-			};
+			}
 			continue;
 		}
 
-- 
2.34.1



