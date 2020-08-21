Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A064F24E687
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4154F6E446;
	Sat, 22 Aug 2020 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E196E175
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:27:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so2313923wrs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A2ib5YeLmICUMl8rksAwSuoFVXHYJ4y/hwVWZYHuMbY=;
 b=q1l9IeVSjBMpvx9pappt54xWWzVHKZAIjcy2grhmETrscRqtkMd92gelvCAxF9/YxC
 df2utnw/GutYtLaWTyxshKq81bXGskLk4qcfcSscEKDCL886LGJEwbC1r96+vnepfNBv
 jkjHnEbfuoDp1u2zzg9/wRQMYc1+nwHjwzSo5R54G3vmWIpoag3D8Nw+ooApVOW1lPIL
 2sySVBcDBsREymUfLDG/3d/biHjObMIHhwnvYhhvHCc+2n9XpU8cgcNkZzk/MNTvt1Kj
 Z68WE74zqAh5LRtvnrlfIyn4mnRWfq7JDcngcwi2y3FeCEqGNlMqQpe1/NrbzwXGCJjD
 9J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A2ib5YeLmICUMl8rksAwSuoFVXHYJ4y/hwVWZYHuMbY=;
 b=nkALomKwQ3MjhJZiHah9Vmo2p3gtm5YuVcR8OQTaSIrHmokvjO+rOgnc0xVSqiK+We
 Y9UW2AaVC7nKpInJtqSFoQIvNAc1F2xtcM3ujw2AINREBRPvy9nmoiTzr0Ec5QOHig2W
 BEQs7m4E0uQ0cUfvIm2cMfP87c3JYrcYxXr0kBiKBmtZXy5KdRPxpwvpMUxWwHq+qZ6h
 9g7mw6a+cZp1pxdVqxAKrgB4mfX29mTkK54l+QmzOWKtaID0O4+4Ti1w+dQyOzsY1SAt
 Ne3mgjtXfon0+9aQAVHFGCcTtjY/M0AJSGn7NNyCbUSIRMh75C1sxCl99tWcZzXALFRy
 m6wA==
X-Gm-Message-State: AOAM531s64OushHvs8BsQ+CylL6Loolv4XlYXN1u9yv1Mi73zGGDbPg8
 SzwNqmxzIa+au/I3apBr5Zw=
X-Google-Smtp-Source: ABdhPJwnHUuth1Lgg+jMpWeo2o0KMQOm5Qu+a71/U7ael4vzzcfepC1XxXX3R/e7IfVXP9rCUNyY7Q==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr3322387wrq.416.1598023663658; 
 Fri, 21 Aug 2020 08:27:43 -0700 (PDT)
Received: from tsnow (IGLD-83-130-85-196.inter.net.il. [83.130.85.196])
 by smtp.gmail.com with ESMTPSA id i4sm4575674wrw.26.2020.08.21.08.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:27:43 -0700 (PDT)
Date: Fri, 21 Aug 2020 18:27:37 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 1/2] staging: android: Remove BUG_ON from ion_page_pool.c
Message-ID: <32ea3b6d840cb56ea927400e1875d9d4db38e926.1598023524.git.tomersamara98@gmail.com>
References: <cover.1598023523.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1598023523.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Riley Andrews <riandrews@android.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BUG_ON() is removed at ion_page_pool.c

Fixes the following issue:
Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 0198b886d906..a3ed3bfd47ee 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -46,11 +46,9 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 	struct page *page;
 
 	if (high) {
-		BUG_ON(!pool->high_count);
 		page = list_first_entry(&pool->high_items, struct page, lru);
 		pool->high_count--;
 	} else {
-		BUG_ON(!pool->low_count);
 		page = list_first_entry(&pool->low_items, struct page, lru);
 		pool->low_count--;
 	}
@@ -65,8 +63,6 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 {
 	struct page *page = NULL;
 
-	BUG_ON(!pool);
-
 	mutex_lock(&pool->mutex);
 	if (pool->high_count)
 		page = ion_page_pool_remove(pool, true);
@@ -82,7 +78,7 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 
 void ion_page_pool_free(struct ion_page_pool *pool, struct page *page)
 {
-	BUG_ON(pool->order != compound_order(page));
+	WARN_ON(pool->order != compound_order(page))
 
 	ion_page_pool_add(pool, page);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
