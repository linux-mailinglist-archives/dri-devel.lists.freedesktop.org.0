Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B3A5E0CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303DE10E32D;
	Wed, 12 Mar 2025 15:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FTHvKwhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAF2910E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Y9ZrF
 wpLjdeYrcCA7O95QsfXGi1MudxIC3XCcfV5JMg=; b=FTHvKwhRfNyhHzozYGZ1G
 5OTceGWbpDAtejyEGyo+ro8Ae7LgPgb3Vnt4RI3V/gWhoC/1iwYFloe3Mvw7Aziy
 /VCsKSC2QJWvrwWYGj4xi0H0Owe/RswvQJGzYaSvAqhDXFl8SolAFPHH0gxtpEdT
 5ZvGcFj7oemcXaMgfsQmX8=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgBnGxwErNFnmqUoAw--.31028S3;
 Wed, 12 Mar 2025 23:45:12 +0800 (CST)
From: Shixiong Ou <oushixiong1025@163.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, Jocelyn Falempe <jfalempe@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2 2/2] fbcon: Change return value type to void
Date: Wed, 12 Mar 2025 23:45:07 +0800
Message-ID: <20250312154507.10881-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312154507.10881-1-oushixiong1025@163.com>
References: <20250312154507.10881-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgBnGxwErNFnmqUoAw--.31028S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDurykCw4kAFyDAFyfXrb_yoWftrc_Cr
 1DZr95XrykKry0krn0gF13urWFva12qa1rGr1Dtr93Ja47tr90qr4UZr1qqrWqgF18Ar4v
 q3Wqqr4Ivw1rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0byCJUUUUU==
X-Originating-IP: [222.240.40.50]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRYOD2fRnpHSAQAAsg
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

From: Shixiong Ou <oushixiong@kylinos.cn>

fbcon_init_device() doesn't need to return a value.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/video/fbdev/core/fbcon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 9ee5f8492249..619645ff4f21 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3294,7 +3294,7 @@ static const struct attribute_group fbcon_device_attr_group = {
 	.attrs		= fbcon_device_attrs,
 };
 
-static int fbcon_init_device(void)
+static void fbcon_init_device(void)
 {
 	int ret;
 
@@ -3303,8 +3303,6 @@ static int fbcon_init_device(void)
 	ret = device_add_group(fbcon_device, &fbcon_device_attr_group);
 	if (ret)
 		fbcon_has_sysfs = 0;
-
-	return 0;
 }
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
-- 
2.43.0

