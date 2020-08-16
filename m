Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC74245D56
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FFA6E4FE;
	Mon, 17 Aug 2020 07:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28D689229
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:21:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so12682440wrh.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qhnpa/trjt4QH5oDT0w3lHC9wDtosLLIKcCmM7fmRXQ=;
 b=Y6u1bIXtETM8nGKBLOBIaoMtwk7e5Dq322h5yNAMefwW3i4FFJYEsqBEsxmq18/fq9
 ObAoERHhe90ZEKwShMc6+htbd50V4WJvTmDHdgjXBjna2PbHzD844iMrjmHMbrEojuDU
 JCuD+pgOnmx8YEZO8konRuzf8afDGnIl2/BrV26HFcFCb08Pxh/a8tgAfV+lwWfO1iSb
 lyd4tRbvqaKbydcHQt7dMMHBM1ThkrT0Q8aXsrvpbGtNimi3nNj9zyG1iDsQTiltuSJJ
 ySeqmVUsvIJcj7WvE+UX+MZx8rQIMNNV9PgA5qj85w1Jaqyfvg+PH1vymjfAGYmlaHst
 RAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qhnpa/trjt4QH5oDT0w3lHC9wDtosLLIKcCmM7fmRXQ=;
 b=qQHUnoNDz0It5Ep54aVDqZsj3vuEEFkEdaaQF8Kh9VmQCp9IkFS4iFJ7JbSeCqIQLp
 V4S+F5h/7cPOXD5CjtS44Yfmn7wda1ZQ2H5bjUO1lydjOtLpXu82LlpDRGOMhp7WOl6t
 slNO/Q1inJYvl/OqSx01S4E9xlVbJ/+Xa0hZILjp99sOOOfn8v5JchISvj67X5VNvPnQ
 pcm1wLETyahkDc5QvQJxFgnrKoxSujTtZZmBlvsEd1SSu2Q+AhCPXyNFIDsNXMHUcoPJ
 QVtVOQrbRJTZ7TmeZROWcMrwapPYoApVWDLhAHWrnhg4p83Hh8uAyXytLVW9EERmNMu6
 P0ZQ==
X-Gm-Message-State: AOAM530Q4x4/YG29wTQg06qxcjRJes9Db+7TI8fJrtHuT3Sb+58JasIr
 mbaNC64yvH9xIka3plXjLLk=
X-Google-Smtp-Source: ABdhPJxyPopkvGjX4OPrqDue+B2GiVZNzO8/x7ztlFw9xOxvn8pjAforCHS7gsWVwSKA3+GmKPlmtQ==
X-Received: by 2002:a5d:4b11:: with SMTP id v17mr11304091wrq.224.1597598508589; 
 Sun, 16 Aug 2020 10:21:48 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id i66sm27550212wma.35.2020.08.16.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 10:21:48 -0700 (PDT)
Date: Sun, 16 Aug 2020 20:21:44 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] staging: androind: Replace BUG_ONs with WARN_ONs
Message-ID: <b300cc0e9c75bfc14b091c874d22359b8ad9d6c9.1597597955.git.tomersamara98@gmail.com>
References: <cover.1597597955.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597597955.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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

BUG_ON() is replaced with WARN_ON at ion_page_pool.c
Fixes the following issue:
Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 0198b886d906..4acc0eebf781 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -46,11 +46,13 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 	struct page *page;
 
 	if (high) {
-		BUG_ON(!pool->high_count);
+		if (WARN_ON(!pool->high_count))
+			return NULL:
 		page = list_first_entry(&pool->high_items, struct page, lru);
 		pool->high_count--;
 	} else {
-		BUG_ON(!pool->low_count);
+		if (WARN_ON(!pool->low_count))
+			return NULL;
 		page = list_first_entry(&pool->low_items, struct page, lru);
 		pool->low_count--;
 	}
@@ -65,7 +67,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 {
 	struct page *page = NULL;
 
-	BUG_ON(!pool);
+	if (WARN_ON(!pool))
+		return NULL;
 
 	mutex_lock(&pool->mutex);
 	if (pool->high_count)
@@ -82,7 +85,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 
 void ion_page_pool_free(struct ion_page_pool *pool, struct page *page)
 {
-	BUG_ON(pool->order != compound_order(page));
+	if (WARN_ON(pool->order != compound_order(page)))
+		return;
 
 	ion_page_pool_add(pool, page);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
