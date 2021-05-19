Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C30388DF6
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201AE6ED9C;
	Wed, 19 May 2021 12:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18CA6ED9C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621427073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6+GMlwrRYCIhKlucQm0d4pBq6rNn427lZR0x1Dlm1U=;
 b=Jt3bQIqKb6ZKmf1wZOOjiSNnlFUKBvTUryhy+ezZC7cEqie+EUslRe+yNp9B3u92IhgInP
 LJMQOvBHM3S6ZMB+t1dEQKtwwxyvpkSJX72tviyvxlsuntawpc1I609a7ELcpCXyaqdp0u
 L8kuRfXHMqXb6SWPTD3otzgcTzVeFiY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-IKy1U3fFNFmQKLXPRlEg5Q-1; Wed, 19 May 2021 08:24:29 -0400
X-MC-Unique: IKy1U3fFNFmQKLXPRlEg5Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 a29-20020a0ca99d0000b02901ec0ad2c871so10230224qvb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 05:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B6+GMlwrRYCIhKlucQm0d4pBq6rNn427lZR0x1Dlm1U=;
 b=RQurHIUg1LKEQkC9L82F2LqYgubNeeCvPnLK19mg5FtSOJAzOzAyS/fSIhJu/NMCdE
 RGMdzNs5fo0L/kl4SCwFnjCPrYCgmxzQg5BrsWXqX+5NvBb16w1psxxwe/SNF8of02qP
 qi7SfncJPhlbMWwCcJ6cfty+YffQsLKGWTyNUJqr3q3jgE081QBBf9GyzF39GVK04qyd
 N29bcmDijfzM+cZ2vjy7A86lU3ChgZXb2caM/j3gRzAuiNC/iPckpBVK6s2QOMBywij5
 KvD+JVAXP2QWBQFI9BbKap/Kw5Pc4raZiVsAcJSDNQju8CAnubnfrdppd+lFbK9emTWZ
 pD0Q==
X-Gm-Message-State: AOAM532DWmm2475fPMkip9Su9eZKYAPDb6Dmx2FIF0Vj/vcL989bv+9J
 o2RLlXlqMW+9KYf6nWOX7CjYO6mSvjR+Z/U7eLu3SJi6obxMAsVc6Vprhn1apy3uKw/9BdGC7eu
 fhJQ2+bvoS9HzUN5p1uMlzxffraR6
X-Received: by 2002:ac8:4b74:: with SMTP id g20mr11134583qts.196.1621427068813; 
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfYWS/dsuPCr9XZO07LTE6R21Hbq/UdkcASCcx2KQMguWwavSEob3mks8rwF1tmkFnKYSzdA==
X-Received: by 2002:ac8:4b74:: with SMTP id g20mr11134560qts.196.1621427068562; 
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id m4sm15981169qtg.21.2021.05.19.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
Date: Wed, 19 May 2021 08:24:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUDe8Oe4Y+q5Kxx@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKQutvAa3NlgGaMm@t490s> <3859486.fHISG1RMxY@nvdebian>
MIME-Version: 1.0
In-Reply-To: <3859486.fHISG1RMxY@nvdebian>
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

On Wed, May 19, 2021 at 08:49:01PM +1000, Alistair Popple wrote:
> On Wednesday, 19 May 2021 7:16:38 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:
> > 
> > [...]
> > 
> > > +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> > > +                        unsigned long address, void *arg)
> > > +{
> > > +     struct ttp_args ttp = {
> > > +             .mm = mm,
> > > +             .address = address,
> > > +             .arg = arg,
> > > +             .valid = false,
> > > +     };
> > > +     struct rmap_walk_control rwc = {
> > > +             .rmap_one = try_to_protect_one,
> > > +             .done = page_not_mapped,
> > > +             .anon_lock = page_lock_anon_vma_read,
> > > +             .arg = &ttp,
> > > +     };
> > > +
> > > +     /*
> > > +      * Restrict to anonymous pages for now to avoid potential writeback
> > > +      * issues.
> > > +      */
> > > +     if (!PageAnon(page))
> > > +             return false;
> > > +
> > > +     /*
> > > +      * During exec, a temporary VMA is setup and later moved.
> > > +      * The VMA is moved under the anon_vma lock but not the
> > > +      * page tables leading to a race where migration cannot
> > > +      * find the migration ptes. Rather than increasing the
> > > +      * locking requirements of exec(), migration skips
> > > +      * temporary VMAs until after exec() completes.
> > > +      */
> > > +     if (!PageKsm(page) && PageAnon(page))
> > > +             rwc.invalid_vma = invalid_migration_vma;
> > > +
> > > +     rmap_walk(page, &rwc);
> > > +
> > > +     return ttp.valid && !page_mapcount(page);
> > > +}
> > 
> > I raised a question in the other thread regarding fork():
> > 
> > https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/
> > 
> > While I suddenly noticed that we may have similar issues even if we fork()
> > before creating the ptes.
> > 
> > In that case, we may see multiple read-only ptes pointing to the same page. 
> > We will convert all of them into device exclusive read ptes in rmap_walk()
> > above, however how do we guarantee after all COW done in the parent and all
> > the childs processes, the device owned page will be returned to the parent?
> 
> I assume you are talking about a fork() followed by a call to 
> make_device_exclusive()? I think this should be ok because 
> make_device_exclusive() always calls GUP with FOLL_WRITE both to break COW and 
> because a device performing atomic operations needs to write to the page. I 
> suppose a comment here highlighting the need to break COW to avoid this 
> scenario would be useful though.

Indeed, sorry for the false alarm!  Yes it would be great to mention that too.

-- 
Peter Xu

