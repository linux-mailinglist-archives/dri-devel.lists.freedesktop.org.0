Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23433FD3C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 03:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5EF6E86D;
	Thu, 18 Mar 2021 02:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A826E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 02:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CpYMd
 PsprCRjXvYnmb1EM2qnPp9FdkTspwNPYhwSUV0=; b=fadU3hnXdriW+QBKcE8S+
 IoYsz+jLg6u9xpQqaaBZavHkvXO2tSi+KbeR0RsmbJirT4uYF4lORlv0BUrB9Btu
 tFiBsSZRYm3Saut+9NEuxKdDCDFxwvqZfLCksFjWyw2FCmkjA5Dqm7RMfmj7X9No
 uPzN6m9BgIvPgl1/4as9us=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowADHzZ38u1JgNBNbqg--.26621S2;
 Thu, 18 Mar 2021 10:33:45 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: gustavoars@kernel.org,
	sam@ravnborg.org
Subject: [PATCH] drivers/video/fbdev:modify 0 to NULL
Date: Thu, 18 Mar 2021 10:33:29 +0800
Message-Id: <20210318023329.488-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowADHzZ38u1JgNBNbqg--.26621S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryruFWkKF4xJw43Gw45Jrb_yoWxZrg_Cr
 4kZrZrWrWqkr1Syrn7A39avryrtw4UZ3Z7ZFnaqry3Cry3Cr1Fqr1UZrn29w4UWr1UXr9r
 WrnFgrW0vr1SkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8C38UUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiTgVYUVUDIPi7GQABsv
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
Cc: linux-fbdev@vger.kernel.org, tangchunyou@yulong.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@yulong.com>

modify 0 to NULL,info is a pointer,it should be

compared with NULL,not 0

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/video/fbdev/offb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index 4501e84..cd1042f 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -412,7 +412,7 @@ static void __init offb_init_fb(const char *name,
 
 	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
 
-	if (info == 0) {
+	if (info == NULL) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
