Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1845396DE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 09:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5C06E1D3;
	Tue,  1 Jun 2021 07:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Tue, 01 Jun 2021 01:44:34 UTC
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE7506E12E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 01:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TD8tt
 DRjkoIh5GipXEh5UOfa9zr6wYIAwrcv6LbbEQQ=; b=jDcI3ldYfFIWJE73onAQN
 dPdSXiakmfvG26Bkh6HlFpj8qEeI2tDucp220sdDHVz0dR8xEEtS9HBYWEwS4vnH
 APvsgT7WdKdViFeQ4HSQUjLSCmbZAuntBuLUxZm51Jn8Zl5xy5hbKri+rR7+kOtG
 q0IpTxepz1DjXYO6nId8mc=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp8 (Coremail) with SMTP id DMCowADHu_dhjbVgHw2AHQ--.8323S2;
 Tue, 01 Jun 2021 09:29:06 +0800 (CST)
From: lijian_8010a29@163.com
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: atyfb: mach64_cursor.c: deleted the repeated
 word
Date: Tue,  1 Jun 2021 09:27:47 +0800
Message-Id: <20210601012747.38884-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowADHu_dhjbVgHw2AHQ--.8323S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryxtF4kAryfArW3CFykZrb_yoWDXrX_Cr
 srZ39Yqryvyw4vqrn3Jw4fWFyqq3WkXFWDX3s2qrWSk34UXr45Xr1Dur10gFyUWryUZFZ8
 Zwna9rWvv3yfujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5b_-JUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBLAOkUF++MAqd8QAAss
X-Mailman-Approved-At: Tue, 01 Jun 2021 07:24:48 +0000
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

deleted the repeated word 'be' in the comments.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/aty/mach64_cursor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
index b06fa6e42e6e..4ad0331a8c57 100644
--- a/drivers/video/fbdev/aty/mach64_cursor.c
+++ b/drivers/video/fbdev/aty/mach64_cursor.c
@@ -46,7 +46,7 @@
  * The Screen position of the top left corner of the displayed
  * cursor is specificed by CURS_HORZ_VERT_POSN. Care must be taken
  * when the cursor hot spot is not the top left corner and the
- * physical cursor position becomes negative. It will be be displayed
+ * physical cursor position becomes negative. It will be displayed
  * if either the horizontal or vertical cursor position is negative
  *
  * If x becomes negative the cursor manager must adjust the CURS_HORZ_OFFSET
-- 
2.25.1


