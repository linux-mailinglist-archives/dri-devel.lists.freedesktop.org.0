Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D096B8A4280
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 15:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C2210FF6F;
	Sun, 14 Apr 2024 13:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.b="M5GA7CYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 486 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 13:16:04 UTC
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9D410FF6F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 13:16:04 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 3955C440317;
 Sun, 14 Apr 2024 16:07:20 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1713100040;
 bh=d26hMS4a3xKS20b554++VWyk9qEnuKrkwdbfnGK6NR0=;
 h=From:To:Cc:Subject:Date:From;
 b=M5GA7CYOdJApD4QhgCa2iQESZj6RwJsqMyECTHf/XA2MQk6tkWvhjPFDnNMfds5DY
 meeL2iSExiblN6wX/3hGgwktF0MTsZV41NrKean0t4QbIJghD1KkGWqE+5ttoow9HR
 s9C0v8YfRsaiFE7lIPRvEG5FMEoDMtwXXwg0nDv8UYQomjsN/5+umQD7lLGHosEz7I
 8c+1PCWWmZvWj8YBA2ijyKH+0gGkySy+IgQmWYA5gYaR7aVUSKXhFyUSRSZeqlNxwZ
 0S39ecO5TNnXYABzTXd1IWNjhfnELHNGLZ8kiVFGjd2t0Tt3A2gkSE7SfMn18swjAQ
 54Pu0e9oZ9mrw==
From: Baruch Siach <baruch@tkos.co.il>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] doc: dma-buf: fix grammar typo
Date: Sun, 14 Apr 2024 16:07:37 +0300
Message-ID: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
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

