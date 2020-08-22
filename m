Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF324F2C8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41496EC76;
	Mon, 24 Aug 2020 06:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC406E519
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 19:43:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so4852399wmi.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bDeHhD/5z6aaFlItq04V8HlPaMZcoXhz68jm6W6MONk=;
 b=E4a7p3u+k/VHbSDKvo+vWFDgHYz75Y8+NmMpZQGWE5shPjdmZTRi24d7YVdsF6YAFZ
 zrYn1oTQeDaXMki76OWmSBV9Vyn6OIAazfgRl3Y0NYfr5L1R+JueMY7PulbAUEYYTnHP
 ae9Ipw2x67GtWT1+eQBwo51wObjS5xBprbcXr5Dk6a7ZvOmo8xGQzaJpAGeuS5F/Bakt
 W2r1VFpkF83+xZm5nurZsceL67OmWE3bi/pV6mNiCNI0Ok94JeIWh2+8BeX5Zs6ltUDK
 chaMncvuVVyxcbzBUTXB2oy0iwh0lEjDBuVexS9xnCBznQ715CgWQ+2HK3ir/iMCELyV
 jBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bDeHhD/5z6aaFlItq04V8HlPaMZcoXhz68jm6W6MONk=;
 b=h53iioIdvFTHk4KccdWwTjn5EPFTsg9+9+l0Ny+6VNAOJ2hEkeVoyAaOUTKmccFVno
 YlH2Yg3g8a+BOSf71kebTJnQam7t7N2PUk7HU/GIgkwqoWaUdKgNqOacA82ABUCOQIAW
 zvnNE01GvM7XbW1GL7VqvD463CAYXhnSG9PTbmgHV6N3N0LDylw1HqdRXeA+aVPT2t+D
 3uKr1ZpEgW95KFTCRxKDoOD5zRIqUoDaaKtPRdl9fP4o0k/p97YThXPFvl7Zhg516AAS
 bUuZxtR6EKTk0agpWuYC6TIfG3Uwm2yqlh1C6BEzhmvNuI1ZhT8SxSNlfyBoULsqKG/y
 PPhA==
X-Gm-Message-State: AOAM530FvfpAvO9xpdSBedYjRaHiNRJkGIMFF3erm1y2msfXCrVTS0iu
 JK+pCFOU8nKlJrzUg4m6scs=
X-Google-Smtp-Source: ABdhPJwnnkIT5/uCftHhMXqn1D4NcYSiQuuoKXX9omd0RYEa9lVbqCbaGzyn1xpBO11hX4gU7y3p3w==
X-Received: by 2002:a1c:28d5:: with SMTP id o204mr9837747wmo.104.1598125402082; 
 Sat, 22 Aug 2020 12:43:22 -0700 (PDT)
Received: from tsnow (IGLD-83-130-62-237.inter.net.il. [83.130.62.237])
 by smtp.gmail.com with ESMTPSA id z12sm12968394wrp.20.2020.08.22.12.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 12:43:21 -0700 (PDT)
Date: Sat, 22 Aug 2020 22:43:02 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 1/2] staging: android: Remove BUG_ON from ion_page_pool.c
Message-ID: <aaea4be2ab36395e70f759f3b6976782fe2acfa1.1598125227.git.tomersamara98@gmail.com>
References: <cover.1598125227.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1598125227.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
 drivers/staging/android/ion/ion_page_pool.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 0198b886d906..fa764299f004 100644
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
@@ -82,8 +78,6 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 
 void ion_page_pool_free(struct ion_page_pool *pool, struct page *page)
 {
-	BUG_ON(pool->order != compound_order(page));
-
 	ion_page_pool_add(pool, page);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
