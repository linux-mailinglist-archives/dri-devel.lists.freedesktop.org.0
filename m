Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E486DDE5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C9010E1FB;
	Fri,  1 Mar 2024 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cj1P7XwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 01 Mar 2024 09:10:43 UTC
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334B310E1D7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1709284241; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=nBALHPo6UgPPUyrD3FvDp+iwsXKQboxe3VkcEgjHgOg=;
 b=cj1P7XwVgkiXQwjvDgvufHORMwi7Cikv0A5rqc4RqHIXdVp54chFZ04kuyVVJb+W5H/z/wDndbxxco+8RB9SnK1r5yKIUmAH01umEGi5rWlwkNmqErHh8ROn3boWInUFPIP4fVzxgw3Kadd4Fz30c0GeOy44zCmwBlGQLAHM10g=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0W1azjs2_1709283938; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0W1azjs2_1709283938) by smtp.aliyun-inc.com;
 Fri, 01 Mar 2024 17:05:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: thomas.hellstrom@linux.intel.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next 2/2] drm/xe: Remove unneeded semicolon
Date: Fri,  1 Mar 2024 17:05:35 +0800
Message-Id: <20240301090535.87969-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20240301090535.87969-1-yang.lee@linux.alibaba.com>
References: <20240301090535.87969-1-yang.lee@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch removes the unnecessary semicolons at the end of the
switch-case statements which cleans up the code and ensures consistency
with the rest of the kernel coding style.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..316ed2f6d1f0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -165,7 +165,7 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 		*gt = (*hwe)->gt;
 		*xe = gt_to_xe(*gt);
 		break;
-	};
+	}
 }
 
 /**
-- 
2.20.1.7.g153144c

