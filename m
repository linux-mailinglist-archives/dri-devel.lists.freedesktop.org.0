Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1056982A6D5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 05:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7BB10E6AE;
	Thu, 11 Jan 2024 04:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7179410E6AE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 04:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=b4pQ8hJoVvzvXHxUFM9uPj+P7m+YblKumbV4h+B9NcU=; b=PFDKEvoTOU181sWOpwAIf5OQUB
 ZQ0uvHyPcQwHyzHkDJ/m7iKzNfZ2g5v3opb0x+PgfHdcHYeiud4irhPlCD5aXj9KUPDaItC0Hs5ON
 Y6kYhMHlBBO0btZZQctB+iKRcKpAT5S7lPMpGEqNki6RLxl7VziCAhlL+pIkp31GrdnEiZS5GqnSe
 8sM8ShMh9oSC1L/1wUhk2jP/tfAZmkhJBVgC7XKAPqW+5ASZyTvdyLX6HSZVJlXGy+f3Dg+nAIuga
 bPZ0oDK6J4OHyi9hNIUksffc3Ypzmpwwkm9fKkWL4lenLOY4aRncqsDONyjwKt9ICSHJao/Mdnb6E
 DEz4MQyQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rNmPr-00FjzT-1i; Thu, 11 Jan 2024 04:11:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/dma-fence: fix spelling
Date: Wed, 10 Jan 2024 20:11:36 -0800
Message-ID: <20240111041138.30278-1-rdunlap@infradead.org>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, Randy Dunlap <rdunlap@infradead.org>,
 patches@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling mistakes as reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-fence.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -102,7 +102,7 @@ static atomic64_t dma_fence_context_coun
  *
  * * Drivers are allowed to call dma_fence_wait() from their &mmu_notifier
  *   respectively &mmu_interval_notifier callbacks. This means any code required
- *   for fence completeion cannot allocate memory with GFP_NOFS or GFP_NOIO.
+ *   for fence completion cannot allocate memory with GFP_NOFS or GFP_NOIO.
  *   Only GFP_ATOMIC is permissible, which might fail.
  *
  * Note that only GPU drivers have a reasonable excuse for both requiring
@@ -522,7 +522,7 @@ dma_fence_wait_timeout(struct dma_fence
 EXPORT_SYMBOL(dma_fence_wait_timeout);
 
 /**
- * dma_fence_release - default relese function for fences
+ * dma_fence_release - default release function for fences
  * @kref: &dma_fence.recfount
  *
  * This is the default release functions for &dma_fence. Drivers shouldn't call
@@ -974,8 +974,8 @@ void dma_fence_set_deadline(struct dma_f
 EXPORT_SYMBOL(dma_fence_set_deadline);
 
 /**
- * dma_fence_describe - Dump fence describtion into seq_file
- * @fence: the 6fence to describe
+ * dma_fence_describe - Dump fence description into seq_file
+ * @fence: the fence to describe
  * @seq: the seq_file to put the textual description into
  *
  * Dump a textual description of the fence and it's state into the seq_file.
