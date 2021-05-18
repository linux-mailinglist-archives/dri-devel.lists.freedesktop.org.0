Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9D6386FDE
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 04:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBDC6E5A3;
	Tue, 18 May 2021 02:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B216E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621304257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHUED2xywhieoA8Ohgqwa/BFwS5IrraVCcyW37p8oEc=;
 b=HAxnpIeBAIgJ2cFctu//SWzGseRHbxULUCXTn6S3D1aEZCJnKItOGl0sX/uCMDVNTF8XgH
 iW+tWZzT46YNUKe49wkGl5iWQwna8b11bN2BINLH39Zd7f3i5a3LKa00hOMCK+WKx3qtGO
 vTVyNS5T7oglx0nJM7vxEkEhneqonPs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-0K_DdJUjMGCoVOYlZOx05w-1; Mon, 17 May 2021 22:17:35 -0400
X-MC-Unique: 0K_DdJUjMGCoVOYlZOx05w-1
Received: by mail-qk1-f198.google.com with SMTP id
 u9-20020a05620a4549b02902e956c2a3c8so6058474qkp.20
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SHUED2xywhieoA8Ohgqwa/BFwS5IrraVCcyW37p8oEc=;
 b=jrDEZp2NcQukTWdqolwK0F9c+7+K0uhEa1SBBWLiuBtnhrU8IO+0jzcVlcucJ0YQse
 RTAJgf9KW4xXYAfISYOkNFwac6/CRNgU4PPAIAKQJqUoMafZaJpEUd/OTj5171pdLfIc
 L2hcK629TPZyE+MTsJ8/W7A9UYqY/T1FS4ZhF+gV7X7geIBcFv9kPdDxqKIGxtLJ1cvc
 fi41J4xz3qNUXKtwSyIhc6Y6xjYbkCXwUMLziDwFssUHjiMLZM1szXQOH/lwynKvVHIh
 PTBot0Ifh4ZLPSm6z9FxND2MgkZqBC5pQFryBj1HKFInjngHihvUYFJ+j9iKXu67jZRn
 AFug==
X-Gm-Message-State: AOAM5303ule+9W0hJ2YyH/VbK2A5N49yqYussr1R2qE1jQATal6PuXdH
 qyv96C0lQYovl21kdcaF6KpRDLuJxlKMgUBUvJkG7t4wzaXG0SmBbH/j/pnKQCd1Q7DlvUMqXLr
 VrfNrlL1L1cwMmbOfKKcFShLSyeKE
X-Received: by 2002:a37:acc:: with SMTP id 195mr3056555qkk.237.1621304254982; 
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvfhDruyVRENBywFHKAF09zhJc/VYjDjiU6UtKjssWV4m2MY09oz2Ie4CFZZ05uo8IZIWTfA==
X-Received: by 2002:a37:acc:: with SMTP id 195mr3056543qkk.237.1621304254755; 
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id q185sm11488655qkd.69.2021.05.17.19.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
Date: Mon, 17 May 2021 22:17:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 1/8] mm: Remove special swap entry functions
Message-ID: <YKMjvKGIHdwQN2Ml@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210407084238.20443-2-apopple@nvidia.com>
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

On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> +{
> +	struct page *p = pfn_to_page(swp_offset(entry));
> +
> +	/*
> +	 * Any use of migration entries may only occur while the
> +	 * corresponding page is locked
> +	 */
> +	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> +
> +	return p;
> +}

Would swap_pfn_entry_to_page() be slightly better?

The thing is it's very easy to read pfn_*() as a function to take a pfn as
parameter...

Since I'm also recently working on some swap-related new ptes [1], I'm thinking
whether we could name these swap entries as "swap XXX entries".  Say, "swap
hwpoison entry", "swap pfn entry" (which is a superset of "swap migration
entry", "swap device exclusive entry", ...).  That's where I came with the
above swap_pfn_entry_to_page(), then below will be naturally is_swap_pfn_entry().

No strong opinion as this is already a v8 series (and sorry to chim in this
late), just to raise this up.

[1] https://lore.kernel.org/lkml/20210427161317.50682-1-peterx@redhat.com/

Thanks,

> +
> +/*
> + * A pfn swap entry is a special type of swap entry that always has a pfn stored
> + * in the swap offset. They are used to represent unaddressable device memory
> + * and to restrict access to a page undergoing migration.
> + */
> +static inline bool is_pfn_swap_entry(swp_entry_t entry)
> +{
> +	return is_migration_entry(entry) || is_device_private_entry(entry);
> +}

-- 
Peter Xu

