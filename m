Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC702394341
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19166F5BF;
	Fri, 28 May 2021 13:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177BD6F5BF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622207492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FW9/4jT9qjw9qNpmMNMU5+vfx14NmLdS+jsCbfo2ekM=;
 b=irvnPD1t4HV7s6qhDAJfesr+ittldPGWcNqBVJ6rZt8p3+lSeiHVYiBkKhIDHLaPGfnZ1G
 eOGdbAGiS6A46LqQZonaCE3IO2KyRszRrWg7t6S9CL98LHch0CZps12sS7EZrr4yh3lGR5
 oFcLrBWNCwRQBzRT8+sC1bzeSmA214M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-LUWo_he1NQOQj8VAgLcd0w-1; Fri, 28 May 2021 09:11:28 -0400
X-MC-Unique: LUWo_he1NQOQj8VAgLcd0w-1
Received: by mail-qv1-f69.google.com with SMTP id
 a29-20020a0ca99d0000b02901ec0ad2c871so2681406qvb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FW9/4jT9qjw9qNpmMNMU5+vfx14NmLdS+jsCbfo2ekM=;
 b=YCG//Mf8MBVlaodmS8V8esqebi2TwHBfNL7KUHgiC4M7WwsYLBWIKhcd4hcLRCgctr
 aK0FXa17ZeUqxNp8jKtbU5BR3tQJMUWP2qjTiU0wdG2Rf1ux19CR/dEnVQEX5MJL83Ac
 nMBeHdrR4tSQ2aSWzkMx7e8sXpoUezbFRPU9b0deGGeN/kxa5r5lr0804HgvbtYaP7QX
 o4ebBTOVWg6iLKAmSVgsGLbeQal0s+cNo1LXwaNXCXOQlj5f5M8mOX17AEjROOzclETL
 CjhUukJFD17wjif6yCw/z4eDyZGVGv1jRYWdg3KdCgnZjGJL7HrQsNOymXbzVMPbj/pL
 3zeg==
X-Gm-Message-State: AOAM532w31+BBMxtNgB3CRI2MjGAu3bFGc7K9quY/6+5490WuXAs0E/F
 QjVzx7rFBafCPP9DOriz+eRROYZBzaPNI/+4HaJaCJp+p3J1//LhXLhX+sVj8mMepuS84m86EDI
 lQTHr+Pz/nIDWh5v4/oM32D6tN1zb
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr3830635qvb.25.1622207487813; 
 Fri, 28 May 2021 06:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeO8jD8WA5p6Lyazpu9mOUIrqsQpzhE1ohGBKpqpJPFBu0QqiibLIgKj2MM0bzxmuiSjk/GA==
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr3830596qvb.25.1622207487542; 
 Fri, 28 May 2021 06:11:27 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id t137sm3473526qke.50.2021.05.28.06.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:11:26 -0700 (PDT)
Date: Fri, 28 May 2021 09:11:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLDr/RyAdUR4q0kk@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <37725705.JvxlXkkoz5@nvdebian> <YK+Y+aAZHDv8+w+Q@t490s>
 <2243324.CkbYuGXDfH@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2243324.CkbYuGXDfH@nvdebian>
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 11:48:40AM +1000, Alistair Popple wrote:

[...]

> > > > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > > > +             /* Unexpected PMD-mapped THP? */
> > > > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > > > > +
> > > > > +             if (!pte_present(*pvmw.pte)) {
> > > > > +                     ret = false;
> > > > > +                     page_vma_mapped_walk_done(&pvmw);
> > > > > +                     break;
> > > > > +             }
> > > > > +
> > > > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > > > 
> > > > I see that all pages passed in should be done after FOLL_SPLIT_PMD, so
> > > > is
> > > > this needed?  Or say, should subpage==page always be true?
> > > 
> > > Not always, in the case of a thp there are small ptes which will get
> > > device
> > > exclusive entries.
> > 
> > FOLL_SPLIT_PMD will first split the huge thp into smaller pages, then do
> > follow_page_pte() on them (in follow_pmd_mask):
> > 
> >         if (flags & FOLL_SPLIT_PMD) {
> >                 int ret;
> >                 page = pmd_page(*pmd);
> >                 if (is_huge_zero_page(page)) {
> >                         spin_unlock(ptl);
> >                         ret = 0;
> >                         split_huge_pmd(vma, pmd, address);
> >                         if (pmd_trans_unstable(pmd))
> >                                 ret = -EBUSY;
> >                 } else {
> >                         spin_unlock(ptl);
> >                         split_huge_pmd(vma, pmd, address);
> >                         ret = pte_alloc(mm, pmd) ? -ENOMEM : 0;
> >                 }
> > 
> >                 return ret ? ERR_PTR(ret) :
> >                         follow_page_pte(vma, address, pmd, flags,
> > &ctx->pgmap); }
> > 
> > So I thought all pages are small pages?
> 
> The page will remain as a transparent huge page though (at least as I 
> understand things). FOLL_SPLIT_PMD turns it into a pte mapped thp by splitting 
> the pmd and creating pte's mapping the subpages but doesn't split the page 
> itself. For comparison FOLL_SPLIT (which has been removed in v5.13 due to lack 
> of use) is what would be used to split the page in the above GUP code by 
> calling split_huge_page() rather than split_huge_pmd().

But shouldn't FOLL_SPLIT_PMD filled in small pfns for each pte?  See
__split_huge_pmd_locked():

	for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
                ...
		} else {
			entry = mk_pte(page + i, READ_ONCE(vma->vm_page_prot));
                        ...
		}
                ...
		set_pte_at(mm, addr, pte, entry);
        }

Then iiuc the coming follow_page_pte() will directly fetch the small pages?

-- 
Peter Xu

