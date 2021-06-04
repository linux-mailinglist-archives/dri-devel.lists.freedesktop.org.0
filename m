Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02939B0B6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 05:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307136F56E;
	Fri,  4 Jun 2021 03:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92C6E6F56E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 03:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=u8CRh
 j9NpaNynNgg7yQQS2uC6hLXKsf/LnEpS7op8Ps=; b=CB6+FNRz1ov9FW7tYjI2D
 Ujq9hLCfPez8RuLsPH8wFoFu6URp7nYrGsQAXaqEYOzDYGtjqYhrZ2u0CiREpkMk
 zzOOfZLsO5vrlp8mHDBbN/3EYdWwEjk8UXVL1LC8eZUNBTLhacVBsOsFLz8yIas9
 CXqXeMqe2uKzQf9JsV5fE4=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowAAnK7fqmLlglFyrEQ--.1587S2;
 Fri, 04 Jun 2021 11:07:23 +0800 (CST)
From: lijian_8010a29@163.com
To: tzimmermann@suse.de, sam@ravnborg.org, gustavoars@kernel.org,
 rppt@kernel.org, saeed.mirzamohammadi@oracle.com
Subject: [PATCH] video: fbdev: cirrusfb: Removed unnecessary 'return'
Date: Fri,  4 Jun 2021 11:06:24 +0800
Message-Id: <20210604030624.122085-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAnK7fqmLlglFyrEQ--.1587S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxGrW3CF45Cw1fZry7KFg_yoWxAFX_Cr
 12vr93WrWqkr1vkr10gFyayryvyFn8Zasav3ZFg34Syry7W34rZr18uw12qryagr92vFnr
 WFyqgr4vywn5CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5rWrtUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBEROnUFaEEmK0EAABsy
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Removed unnecessary 'return' in void function init_vgachip().

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/cirrusfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 93802abbbc72..e726e7ac3eeb 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -1662,7 +1662,6 @@ static void init_vgachip(struct fb_info *info)
 
 	/* misc... */
 	WHDR(cinfo, 0);	/* Hidden DAC register: - */
-	return;
 }
 
 static void switch_monitor(struct cirrusfb_info *cinfo, int on)
-- 
2.25.1


