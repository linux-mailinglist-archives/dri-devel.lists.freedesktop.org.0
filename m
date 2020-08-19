Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F624AFDA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840E46E8D5;
	Thu, 20 Aug 2020 07:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7BB6E560
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:38:57 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id p24so27660315ejf.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YRPJpeT5dhxWJ12GIFcarr8oc1JgRi4yV8j1UvVpQQs=;
 b=Y/TMCp2AfpTBeZ1xLSiaWieg09HkNJpTltYziCwR0usYRnVKobknSYN9bZc2H9GOU3
 RlIzAqE9UhP0dz/dIgffplwsHnZ1x+3PLshll/AhehzZn2KTF23JO76enX5pTX5OJsup
 8WmPltVJM2ZOJdjgexK8RyQ0dCeuBPqsGfwdgFRz+oF84/sKwsu+AC5jELgEtq0rgbQE
 PjJIav1YKoqMmyPrZWdFV3DEyAjPYgVOlnEnEkUMxzCHp3n575g0i3fAw1QUt6gfcOIp
 DcmV0sGoZMEdYhGzIEsBf1K6jqr4iBeu7ULnw1jnCMq4sCDnr/ug208FqJx8N6exgCI8
 bXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YRPJpeT5dhxWJ12GIFcarr8oc1JgRi4yV8j1UvVpQQs=;
 b=Wk8EYSXv8twXqDwxFY+1hhFFwr19vO8knpGpkGLHuWQFpCQtio7zXPkIBRCevbwCjh
 nE9Kc1Ih/SZHR1Fx2DUCZMjmm3SrbApxQKJ/XPPmfw0wRixaKnCypCZO2tJ5exC/9uwp
 zhpM0DMO+ED2jerlkbGPzbsyJJOt3o0svs5hQugb1ulElt7YipgcLrQBlQvAq5YKyp2h
 91RwGJEMVmNPzelXtRDvdclts+CsRqVJP6a0flby30CiFH1+Zfcvh4xEAsc0JU3cwVua
 6mS39FsLndgAqE1kCCe90imVyrEzkO+9oWnJtPN5br2+JKT+oZaGDfiqfOMOpVuHfHHT
 Q7wQ==
X-Gm-Message-State: AOAM533U98s5kCWcXHUFKPEA9amUyWgDXonq7A2uwe2IcNorbA0bcQwa
 Hecqx9BcmdqhtYZ6kKQ141A=
X-Google-Smtp-Source: ABdhPJwaiRRbcYN8dZl/U4YqQD41O2+zpth7YbXzWPNZCNAzTKai7VUycG9u+6QMlPAbQdRSaR7nAQ==
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr6051159ejz.108.1597865936360; 
 Wed, 19 Aug 2020 12:38:56 -0700 (PDT)
Received: from tsnow (IGLD-83-130-68-114.inter.net.il. [83.130.68.114])
 by smtp.gmail.com with ESMTPSA id x16sm18064084edr.25.2020.08.19.12.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:38:55 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:38:47 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 1/2] staging: android: Remove BUG_ON from ion_page_pool.c
Message-ID: <2e6c71ad168f92170ef856922b9a0c8dd0f85e11.1597865771.git.tomersamara98@gmail.com>
References: <cover.1597865771.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597865771.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

BUG_ON() is removed at ion_page_pool.c and add error handleing to
ion_page_pool_shrink

Fixes the following issue:
Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 0198b886d906..ae2bc57bcbe8 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -46,11 +46,13 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 	struct page *page;
 
 	if (high) {
-		BUG_ON(!pool->high_count);
+		if (!pool->high_count)
+			return NULL;
 		page = list_first_entry(&pool->high_items, struct page, lru);
 		pool->high_count--;
 	} else {
-		BUG_ON(!pool->low_count);
+		if (!pool->low_count)
+			return NULL;
 		page = list_first_entry(&pool->low_items, struct page, lru);
 		pool->low_count--;
 	}
@@ -65,7 +67,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 {
 	struct page *page = NULL;
 
-	BUG_ON(!pool);
+	if (!pool)
+		return NULL;
 
 	mutex_lock(&pool->mutex);
 	if (pool->high_count)
@@ -82,7 +85,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 
 void ion_page_pool_free(struct ion_page_pool *pool, struct page *page)
 {
-	BUG_ON(pool->order != compound_order(page));
+	if (pool->order != compound_order(page))
+		return;
 
 	ion_page_pool_add(pool, page);
 }
@@ -124,6 +128,8 @@ int ion_page_pool_shrink(struct ion_page_pool *pool, gfp_t gfp_mask,
 			break;
 		}
 		mutex_unlock(&pool->mutex);
+		if (!page)
+			break;
 		ion_page_pool_free_pages(pool, page);
 		freed += (1 << pool->order);
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
