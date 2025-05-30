Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E26AC8AA3
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 11:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708CC10E248;
	Fri, 30 May 2025 09:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="kqBQFSvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2526 seconds by postgrey-1.36 at gabe;
 Fri, 30 May 2025 09:22:30 UTC
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3EC10E7FF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49GMHY4OeLfk5bMG6QeyscjCUBw8doMpODBe1qStcRk=; b=kqBQFSvGPsJn8LEtC9minAmpVA
 azao16RPeaJBiJCrLQFIl0edFlDbhpKN6Dng0rjoWPcYHR6fLLDcLZDQ8SlMVWTXJLVP2poXz884B
 +MixYgn5YQO0l3+HfxWk2FpSqM8EMrhGTWJ8BX9hZVmSnI5PlxXf8hPEP+wQKCP/7/YElGSDNyt21
 AjZGfQaqeIJd9e/ytqRaN4G568hb3H2bBod9eKKZjO7yq0hBHWQW7wmjdngwP8oGvoA2mXgORSgZA
 BCFl3UvnpMZdYfIKOlWycav1vmF8EEtcKKSMg1YCYCR00rPHaP6fxkXO9OBaqiIoQ/53dwQb3QBVp
 B2V7deSA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1uKvHZ-009jxI-0c; Fri, 30 May 2025 16:40:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 30 May 2025 16:40:05 +0800
Date: Fri, 30 May 2025 16:40:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Add forward declaration of struct seq_file in
 dma-fence.h
Message-ID: <aDlu5TGyA1WuMsvw@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Add forward declaration of struct seq_file before using it in
function prototype.

Fixes: a25efb3863d0 ("dma-buf: add dma_fence_describe and dma_resv_describe v2")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..b751ae49d007 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -26,6 +26,7 @@
 struct dma_fence;
 struct dma_fence_ops;
 struct dma_fence_cb;
+struct seq_file;
 
 /**
  * struct dma_fence - software synchronization primitive
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
