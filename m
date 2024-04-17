Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C988A7BA1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 07:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240C8113124;
	Wed, 17 Apr 2024 05:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.b="a9/H7p0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA2410E3DE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 05:00:05 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 71829440049;
 Wed, 17 Apr 2024 07:59:56 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1713329996;
 bh=V3uBqnpiuAyNWbyyl71QaVAWqL4UlFAM0kLtZbvd3Uk=;
 h=From:To:Cc:Subject:Date:From;
 b=a9/H7p0K38YWhG4aHWddOMROachow4Mi5H9zvnA+GmCdX+vs2pUP9aGG+z/R48fpU
 9vG5MKLTm+WDZlVYFXv2t7Hr1FcZ7jLoOWBNXDUX3carYwHewRFFuPddld/NC/BQgY
 WN9jQYjb2QIlynranpX4A8Hs/s2bKJTO23waCB9mQqQR59zVKfuVHakuT5jvVsj4lU
 J3+6pQXsot6ZReRGKqTYYDgahJoXsy+fq1idEw5ebqqq2sZdGQzcPLYLyOZJ37n+r9
 al5cSE40d+sR4fos90Y2DyjqzKQ6bwPNHtZKKvLff4IYjTI6kuMIQ+VHtqeJ4c3gQN
 MfLjcAVtj6Dhg==
From: Baruch Siach <baruch@tkos.co.il>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] doc: dma-buf: fix grammar typo
Date: Wed, 17 Apr 2024 07:59:48 +0300
Message-ID: <505484b83fedebce3c65b10b076b34df075074b6.1713329988.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use 'supported' instead of 'support'. 'support' makes no sense in this
context.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Add commit log message (Christian König)
---
 Documentation/driver-api/dma-buf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 0c153d79ccc4..29abf1eebf9f 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -77,7 +77,7 @@ consider though:
   the usual size discover pattern size = SEEK_END(0); SEEK_SET(0). Every other
   llseek operation will report -EINVAL.
 
-  If llseek on dma-buf FDs isn't support the kernel will report -ESPIPE for all
+  If llseek on dma-buf FDs isn't supported the kernel will report -ESPIPE for all
   cases. Userspace can use this to detect support for discovering the dma-buf
   size using llseek.
 
-- 
2.43.0

