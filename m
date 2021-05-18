Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAF38834D
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD4E6E101;
	Tue, 18 May 2021 23:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FE66E101
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 23:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621381511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NyB3nRYXEIw9i58PAbApIYiWHD6bmSqOFX83eNLmrgQ=;
 b=A2azpbbzdV/hO2S7UbDnm1Fx2eXKsptBL034xKb3UlLDkbq81PQhDZoUD4pgiUcK6YbySp
 XAV6Hn5WoWOcGs+xbPOZraJ7jR6wdTngSdwgpPkXNVruH7qkCECWrI5UYYCTXVCwBM+k5p
 7y6JT25I5ausTL1NAx1XNt1E63DVrKY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-jH_YRZ3WPKuLXRsXkkAolg-1; Tue, 18 May 2021 19:45:08 -0400
X-MC-Unique: jH_YRZ3WPKuLXRsXkkAolg-1
Received: by mail-qt1-f200.google.com with SMTP id
 69-20020aed304b0000b02901c6d87aed7fso8489531qte.21
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NyB3nRYXEIw9i58PAbApIYiWHD6bmSqOFX83eNLmrgQ=;
 b=BE360ngBKHOwT/5BelaIRu3q/06dfa0KWns9JMbP8aX9F5Oo2KeMoIQyMia05MNOQM
 B1P9BxCL8VZvQigWIhXmRqeApNUtjUJT4hBH5GdZkyrpO0+sbiBxW5ny2kDZMkNDqsdq
 geLho/D3yHkdbHgYEeN4bbCXAaZSYF/jAnztdzHQuz5jQj+1xufsU8jTTyFCgmpyUvP8
 sfR2q6curRWbkhioXoUnL6+J755i/BEVeVcBdhNtGkGbj1MgwKcC1VJzZQRSvwVqhX7s
 m9AE+LlMMI0+hefkQ9xDcAdOHWw0RVvIdblKNMvbeAYGWKyXAPVxzK/QWEobayrvSoeK
 k44g==
X-Gm-Message-State: AOAM5302s9onzhljUa/ey0ylquLFPtlIj2q6gGUXpyzzXWvGp/gN+w1I
 umyICWo3BhxtdxSGXuwTQSiiCuwpj2n49HGkP9Q1YVYjSJZ2F4Gh4y5jbOE4f/FRjTH5X+rRHUe
 pox03okvnXi+t4iMCStDW1krg/2DV
X-Received: by 2002:a05:622a:350:: with SMTP id
 r16mr7491996qtw.27.1621381507347; 
 Tue, 18 May 2021 16:45:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ExMzzZXtIx7iGUTcSpCi16S7VAiLXsFhzha61Te2cv+Okvdh1uyfL/4TjC80GU7c5+ldwA==
X-Received: by 2002:a05:622a:350:: with SMTP id
 r16mr7491943qtw.27.1621381506771; 
 Tue, 18 May 2021 16:45:06 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id 7sm15927040qtu.38.2021.05.18.16.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 16:45:06 -0700 (PDT)
Date: Tue, 18 May 2021 19:45:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKRRgZmRMdk1vH7A@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s> <20210518230327.GG1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210518230327.GG1002214@nvidia.com>
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
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> Logically during fork all these device exclusive pages should be
> reverted back to their CPU pages, write protected and the CPU page PTE
> copied to the fork.
> 
> We should not copy the device exclusive page PTE to the fork. I think
> I pointed to this on an earlier rev..

Agreed.  Though please see the question I posted in the other thread: now I am
not very sure whether we'll be able to mark a page as device exclusive if that
page has mapcount>1.

> 
> We can optimize this into the various variants above, but logically
> device exclusive stop existing during fork.

Makes sense, I think that's indeed what this patch did at least for the COW
case, so I think Alistair did address that comment.  It's just that I think we
need to drop the other !COW case (imho that should correspond to the changes in
copy_nonpresent_pte()) in this patch to guarantee it.

I also hope we don't make copy_pte_range() even more complicated just to do the
lock_page() right, so we could fail the fork() if the lock is hard to take.

-- 
Peter Xu

