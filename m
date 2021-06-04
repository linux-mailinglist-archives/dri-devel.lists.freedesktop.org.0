Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21439B116
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 05:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614B6F57B;
	Fri,  4 Jun 2021 03:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id D97A66F57B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 03:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FmxUj
 KVQIuJAaq3lGa+6X572w1A/7Qnk6NsprRvzZpI=; b=EV0Fp/V0DlhX49xj0KzBs
 XZ8Ise12m/uK/W1c/l2tvQQs/1Y/VUyMw5IZmgtYEP4wGpd1ChTMz6tihI3Y1L6j
 BqqW6V46bZoA9hFqQgopdeDF0P/Vi7nmFhiyfB+s/sa+qddeotQL/PHwKoO67fAY
 z4IWwUklvqdpSECqdWJgys=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp7 (Coremail) with SMTP id C8CowACnoJiSoblgMnNogA--.1235S2;
 Fri, 04 Jun 2021 11:44:19 +0800 (CST)
From: lijian_8010a29@163.com
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: aty: mach64_gx: Added parentheses for the macro
Date: Fri,  4 Jun 2021 11:43:21 +0800
Message-Id: <20210604034321.167789-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowACnoJiSoblgMnNogA--.1235S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry8Zr1DXr4xXF48Zr1fJFb_yoWxAFb_Cr
 42v3s7Jr90kFs2yrykZr1rury2va4xZFn3uFn0qrZak342yrWYgr1rWFy0qry5Gr4UXFWD
 WF1qgr1Fv34fGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5PrcDUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiRQenUFl9181h0gABs5
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
Cc: linux-kernel@vger.kernel.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Macros with complex values should be enclosed in parentheses，
so Added parentheses for the macro 'MAX_N'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/aty/mach64_gx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/mach64_gx.c b/drivers/video/fbdev/aty/mach64_gx.c
index 9619661b7843..4d89c05e5a65 100644
--- a/drivers/video/fbdev/aty/mach64_gx.c
+++ b/drivers/video/fbdev/aty/mach64_gx.c
@@ -33,7 +33,7 @@
 #define MIN_M		2
 #define MAX_M		30
 #define MIN_N		35
-#define MAX_N		255-8
+#define MAX_N		(255-8)
 
 
     /*
-- 
2.25.1

