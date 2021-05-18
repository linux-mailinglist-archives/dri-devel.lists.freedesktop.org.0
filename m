Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D437C387AE0
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63BD6EB86;
	Tue, 18 May 2021 14:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613B6E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621347431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
 b=Mgdrr3paKjTa/ccg2d5DXl58ztsnKn5aQtZcr+KTLpNOOY+Tq2ti/6ivCAdPnKz7CQIAXD
 SYY3o2hab/sXLL6VJtaUjH97vGiyjcjL2jk8PMEj4at0p14/xTHCedF7d9lfERsyFhw5VL
 6efkdvr7ToA1KaAlQds0MwEniD6MREk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-nEmmjCfnO-yaeWG6_Y0btw-1; Tue, 18 May 2021 10:17:09 -0400
X-MC-Unique: nEmmjCfnO-yaeWG6_Y0btw-1
Received: by mail-qk1-f200.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so7204342qkl.23
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
 b=s1/5B9Q9Vuj/zlZNLm+XCrJr9fcRQmPVsPEzJ1QB2IM1ubfkvhTA9c3DP5mcSHMC2+
 wWcLfAwACjeuYXi1fJSs241zNZ6a6XutY29enlcH0QJ3uSzHaN8RALjG8cirJQ2d3zDO
 SVJPh9WyOWsH+l+jfmIJBeti3sES59dzAZSS/yOdUASBb5P8k79XAgYIQdDOQH819ZJf
 sJ03lI2Sqj5ZXcS0MpjBD/u+eaJ8wiOD/ED1mU9X8gc9BVe8sWISA5tKBJZwLDy+aRA+
 NE0NdJVPnFRWRRqtsDEwir843f8Dynk+++W0ueSLByvPnsZ/wmRhu876VvJ6S7jWdq6w
 acMg==
X-Gm-Message-State: AOAM53024APZ6ZPfwxUuam8CpfaIbGM1jJSX5q04JvUFGoWxgzOS8tl9
 47eQ4ujeAPpKX284N6TGuQqCxZyb6PVUGZy6gko3363jMJX7eoqRLeY1OzawAZYbvU2WHGeYF51
 2zsBVA0q/MFptdZZdVQ8aaZqL5I6C
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567975qke.83.1621347429187; 
 Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNwMG50chJ/VK9YBnzgEPGUA+fkxk4jQnSOcxrE0QnRfHFDXo6jlaBwydyt2CUYa9cICfbkQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567929qke.83.1621347428799; 
 Tue, 18 May 2021 07:17:08 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id a23sm12742012qtd.60.2021.05.18.07.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:17:07 -0700 (PDT)
Date: Tue, 18 May 2021 10:17:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 1/8] mm: Remove special swap entry functions
Message-ID: <YKPMYuh06R2DXPHS@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com>
 <YKMjvKGIHdwQN2Ml@t490s> <2009782.faHf7sVjGQ@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2009782.faHf7sVjGQ@nvdebian>
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

On Tue, May 18, 2021 at 09:58:09PM +1000, Alistair Popple wrote:
> On Tuesday, 18 May 2021 12:17:32 PM AEST Peter Xu wrote:
> > On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> > > +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> > > +{
> > > +     struct page *p = pfn_to_page(swp_offset(entry));
> > > +
> > > +     /*
> > > +      * Any use of migration entries may only occur while the
> > > +      * corresponding page is locked
> > > +      */
> > > +     BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> > > +
> > > +     return p;
> > > +}
> > 
> > Would swap_pfn_entry_to_page() be slightly better?
> > 
> > The thing is it's very easy to read pfn_*() as a function to take a pfn as
> > parameter...
> > 
> > Since I'm also recently working on some swap-related new ptes [1], I'm
> > thinking whether we could name these swap entries as "swap XXX entries". 
> > Say, "swap hwpoison entry", "swap pfn entry" (which is a superset of "swap
> > migration entry", "swap device exclusive entry", ...).  That's where I came
> > with the above swap_pfn_entry_to_page(), then below will be naturally
> > is_swap_pfn_entry().
> 
> Equally though "hwpoison swap entry", "pfn swap entry", "migration swap 
> entry", etc. also makes sense (at least to me), but does that not fit in as 
> well with your series? I haven't looked too deeply at your series but have 
> been meaning to so thanks for the pointer.

Yeah it looks good too.  It's just to avoid starting with "pfn_" I guess, so at
least we know that's something related to swap not one specific pfn.

I found the naming is important as e.g. in my series I introduced another idea
called "swap special pte" or "special swap pte" (yeah so indeed my naming is
not that coherent as well... :), then I noticed if without a good naming I'm
afraid we can get lost easier.

I have a description here in the commit message re the new swap special pte:

https://lore.kernel.org/lkml/20210427161317.50682-5-peterx@redhat.com/

In which the uffd-wp marker pte will be the first swap special pte.  Feel free
to ignore the details too, just want to mention some context, while it should
be orthogonal to this series.

I think yet-another swap entry suites for my case too but it'll be a waste as
in that pte I don't need to keep pfn information, but only a marker (one single
bit would suffice), so I chose one single pte value (one for each arch, I only
defined that on x86 in my series which is a special pte with only one bit set)
to not pollute the swap entry address spaces.

> 
> > No strong opinion as this is already a v8 series (and sorry to chim in this
> > late), just to raise this up.
> 
> No worries, it's good timing as I was about to send a v9 which was just a 
> rebase anyway. I am hoping to try and get this accepted for the next merge 
> window but I will wait before sending v9 to see if anyone else has thoughts on 
> the naming here.
> 
> I don't have a particularly strong opinion either, and your justification is 
> more thought than I gave to naming these originally so am happy to rename if 
> it's more readable or fits better with your series.

I'll leave the decision to you, especially in case you still prefer the old
naming.  Or feel free to wait too until someone else shares the thoughts so as
to avoid unnecessary rebase work.

Thanks,

-- 
Peter Xu

