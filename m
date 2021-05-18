Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B83881FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 23:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A886ECAB;
	Tue, 18 May 2021 21:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4636ECAB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621372603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
 b=S7oIJY1pBUY+y3xOY9sHqrU9CfblvFEvJZJ3pV8M0MfBEz4sV2n52FW0dsscQbRePEPone
 f/FXagl3vNCkFUasOmL3/j4Tg2cil5PFtD537sMB+9DKgfl46Sl1g7QTwY5gFnUr6rPC2c
 q9QEtwR6Y8kz+cFxqUOsynomcOSJi6k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105--bMkAnWuOtGA46zeuGf5aA-1; Tue, 18 May 2021 17:16:42 -0400
X-MC-Unique: -bMkAnWuOtGA46zeuGf5aA-1
Received: by mail-qt1-f198.google.com with SMTP id
 b20-20020ac87fd40000b02901e1370c5e12so8297495qtk.17
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
 b=FHlAjMq4fd/2+3wzJ1Ve/DqUSuzKthBeN06aDjaf5eZCxAWBayC3H7IVHQVQgTaoxM
 ZVYt72B4kBZ4otihLZS6W4jIdfTDLRZkK/zTm5HDu1weGzZdt5epG11W2+j2bsCVy7qr
 wkG0B+Y3aluy40nnHjzo2CcpWhkNk0BuGmYnBQVdPP7kwecOtxRkZ6k8zsnRYJibh4pw
 E+udVHYDin+X0C9gJBQMuvZI5R7XYdaC5ISWWqAYkag3BT7mizzWpKfy0QFORSI4+p3X
 2SRkckIPk8NKSRB1J31twwBypgbP4kh2qr8fA4Rho2543ENBsDi6Ihb5j+m1yQ2hhHD1
 pfLw==
X-Gm-Message-State: AOAM533jKYnLQe4cLuBapmOopekoGgBLxUdX8V5T2Pt/YMGPNCY1eCTv
 9R9M76zXITo7sAShUrvHCFquvpKKN0z+JfeVPPPUVSnslN51iLnLt7mTwOVN8TZWCQ/mHiEOXFA
 6jKVrxB/PM6hfyikYjeuaIGCiF5kx
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111159qta.172.1621372601481; 
 Tue, 18 May 2021 14:16:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7CflObEdpN93nC2c9rCnQMv5qBohaNF3R0O5eiJLrnt/E6MHpUTkD6EfDzN6tiXMS/VwRag==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111124qta.172.1621372601142; 
 Tue, 18 May 2021 14:16:41 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id v66sm13507150qkd.113.2021.05.18.14.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:16:40 -0700 (PDT)
Date: Tue, 18 May 2021 17:16:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKQutvAa3NlgGaMm@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210407084238.20443-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:

[...]

> +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> +			   unsigned long address, void *arg)
> +{
> +	struct ttp_args ttp = {
> +		.mm = mm,
> +		.address = address,
> +		.arg = arg,
> +		.valid = false,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.rmap_one = try_to_protect_one,
> +		.done = page_not_mapped,
> +		.anon_lock = page_lock_anon_vma_read,
> +		.arg = &ttp,
> +	};
> +
> +	/*
> +	 * Restrict to anonymous pages for now to avoid potential writeback
> +	 * issues.
> +	 */
> +	if (!PageAnon(page))
> +		return false;
> +
> +	/*
> +	 * During exec, a temporary VMA is setup and later moved.
> +	 * The VMA is moved under the anon_vma lock but not the
> +	 * page tables leading to a race where migration cannot
> +	 * find the migration ptes. Rather than increasing the
> +	 * locking requirements of exec(), migration skips
> +	 * temporary VMAs until after exec() completes.
> +	 */
> +	if (!PageKsm(page) && PageAnon(page))
> +		rwc.invalid_vma = invalid_migration_vma;
> +
> +	rmap_walk(page, &rwc);
> +
> +	return ttp.valid && !page_mapcount(page);
> +}

I raised a question in the other thread regarding fork():

https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/

While I suddenly noticed that we may have similar issues even if we fork()
before creating the ptes.

In that case, we may see multiple read-only ptes pointing to the same page.  We
will convert all of them into device exclusive read ptes in rmap_walk() above,
however how do we guarantee after all COW done in the parent and all the childs
processes, the device owned page will be returned to the parent?

E.g., if parent accesses the page earlier than the children processes
(actually, as long as not the last one), do_wp_page() will do COW for parent on
this page because refcount(page)>1, then the page seems to get lost to a random
child too..

To resolve all these complexity, not sure whether try_to_protect() could
enforce VM_DONTCOPY (needs madvise MADV_DONTFORK in the user app), meanwhile
make sure mapcount(page)==1 before granting the page to the device, so that
this will guarantee this mm owns this page forever, I think?  It'll simplify
fork() too as a side effect, since VM_DONTCOPY vma go away when fork.

-- 
Peter Xu

