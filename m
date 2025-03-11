Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8267A5BEFB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1E10E013;
	Tue, 11 Mar 2025 11:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="oeO82pSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAF3510E013
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=SM9Ub
 Ll72nXfMLjNLt6sWlifM6ckJcGNSdk6TeIigO4=; b=oeO82pSr0V+mkKe+cTj6F
 MtKUCbiTBEjXEhQ8WTR78xGJ2VyPl/i8KE96XN1VKpHEW/zeB3nNHa5BNbwZiejs
 dQkzRtzoWY5DumqMnCHJlGk/QYyJHXFiFmHfuENJ1b87RVICPqoBgY77Accxm50K
 RrYLHXluzk4EKo4TiTDgoM=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wCH0Ct6HtBna0J3Rw--.58446S3; 
 Tue, 11 Mar 2025 19:29:04 +0800 (CST)
From: oushixiong1025@163.com
To: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 2/2] fbcon: Change return value type to void
Date: Tue, 11 Mar 2025 19:28:56 +0800
Message-Id: <20250311112856.1020095-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311112856.1020095-1-oushixiong1025@163.com>
References: <20250311112856.1020095-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH0Ct6HtBna0J3Rw--.58446S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDurykCw4kAFyDAFyfXrb_yoWftrc_Cw
 1DZr95XrykKry0kwnag3W3u3yYqa12qa1rGr1DtF95Ja47tryFqr4DZr1qqrWqgF18ArZ0
 q3Zrtr4Ivw1rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0xOz7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBgND2fQGIlhsAABsw
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
index 51c3e8a5a092..c1692b68f69e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3296,7 +3296,7 @@ static const struct attribute_group fbcon_device_attr_group = {
 	.attrs		= fbcon_device_attrs,
 };
 
-static int fbcon_init_device(void)
+static void fbcon_init_device(void)
 {
 	int ret;
 
@@ -3305,8 +3305,6 @@ static int fbcon_init_device(void)
 	ret = device_add_group(fbcon_device, &fbcon_device_attr_group);
 	if (ret)
 		fbcon_has_sysfs = 0;
-
-	return 0;
 }
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
-- 
2.25.1

