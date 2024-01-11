Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3182A6D8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 05:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6A410E088;
	Thu, 11 Jan 2024 04:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3230A10E088
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Vab4e2aBGIW5uTr9Tpos6UuO9ZTChmMGyb6A0nM+R3w=; b=DYubyUnN3TD3Db/aAufPtB3Z70
 ggOeu8AQXAhBVmCI0h4najc8kAspagDGmXjqLUliOeVES5/f+WNAvP0fNiT3LleowgDIaKPBmXaBE
 7NRqcz1UhmDK7BrfYLQamQsJc0x2sf43SgD6SSph/DvVEd9+H7WvRK9sopbFD8sjMajrA8tptuuxO
 lNHKPHI2TXVc5304Kqp1QvsH9Ea/6YNOXxRS586mhdoI7X7X8kkqrJtZZ7AACji02sNVtQINWfHKQ
 r9kx5mzmpC+FAjOlxUPkYRGoOY76Me2Eqsh6W7EVhScODeHo+crS/2+f6ZJ7jgLs1Cj+jB8bCqbbw
 zJPfvvpg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rNmQE-00Fk8Z-2S; Thu, 11 Jan 2024 04:12:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/dma-resv: fix spelling
Date: Wed, 10 Jan 2024 20:11:55 -0800
Message-ID: <20240111041202.32011-1-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling mistakes as reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-resv.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -405,7 +405,7 @@ static void dma_resv_iter_walk_unlocked(
  *
  * Beware that the iterator can be restarted.  Code which accumulates statistics
  * or similar needs to check for this with dma_resv_iter_is_restarted(). For
- * this reason prefer the locked dma_resv_iter_first() whenver possible.
+ * this reason prefer the locked dma_resv_iter_first() whenever possible.
  *
  * Returns the first fence from an unlocked dma_resv obj.
  */
@@ -428,7 +428,7 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlock
  *
  * Beware that the iterator can be restarted.  Code which accumulates statistics
  * or similar needs to check for this with dma_resv_iter_is_restarted(). For
- * this reason prefer the locked dma_resv_iter_next() whenver possible.
+ * this reason prefer the locked dma_resv_iter_next() whenever possible.
  *
  * Returns the next fence from an unlocked dma_resv obj.
  */
