Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B5A21B31
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E088310E79D;
	Wed, 29 Jan 2025 10:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kJUXxRIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A248010E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:48:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso6179911f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738147687; x=1738752487; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryBwukoqzZ+fWbwCQpwIcNNyqAhFIJftd2f9BxMzlNM=;
 b=kJUXxRIsdu2O6aMYz7bleXdbUxX+zibe4uHu06KPDZ23pWClXBSJd1WevxOi5CnbA1
 /H7rLe9hrzKuvhpUwl9IUmzafz4BEjsrErpV/SWqkOehXjkNE15WksyYFsT94WYbQDQb
 5RZJfrRDx7528BimR+wtG1sITgJN+z96RnY58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738147687; x=1738752487;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ryBwukoqzZ+fWbwCQpwIcNNyqAhFIJftd2f9BxMzlNM=;
 b=GSxhzaVtdY0IPOGxKE7Az0e5g06PqhxKjzl1jdfPt7i4W4B4/wxtFLnGxBjWzhLYsr
 f3up2BFWvJbdvciXe3RAWYimZBlcbGUTuDz8H+ZAEetFsgi0zM5SG75XTUJmO5Ui0Oae
 km6SsnGXtWcgWGjNgy6q+mriYpvBQw/CFY7d8PTnCYaN62rbhx+Kj+pzD+mTpaPNCxMP
 U5Nj+LbWMeD6rcptzKjBwUZ/reWD/LAOvkW9tX2pPnV3B4UxQa7LLpfXWVljJJkhUIB/
 9dpghZp/0KWjkcOA+ijxjuIfrA6PXFyYbUHWTuJYwqB1HsRnRFMra6uyRy1ncN4G3ajW
 NO1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFHOX9JRf094WjxFWiZQN4QWpCDxYUkuuiBoMO/R1GGCvvmVI+C5XqnG2PgZMCP7Qz9u0mFdNEC8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz88hfLObcvdG00AUtPJmPabcuZIgsjp6koFD6eWbGkt92I2es
 sEsSp+B29dgbyrKMgylzOhf3wHC7kxDw0TwdlzHBCrrPOkwZbUkaBZtHPwdIfuM=
X-Gm-Gg: ASbGnctAWR0aTQ3C8k+ORbJ5KBECqUusaRUV0EvmRtLyH2L3hVkgbptN1REYE1IQVBu
 An9ppc2+4pFefrY56IbzhkCeM7B0i6zfc2hnkSb2gde4Gmpez7bP5ew+K8zKog/uS5DtgmtZCf6
 D8tyY34w43i1E5ZR0v9dUCvKhJp/eJn9BwJ6HuK+HtIK+3UcZjAULdnKHM2CDWYSTS970BFNRqA
 5WFvDXJr0vxEM0ywZqUOYtCbIHzs0dwFCh14WxuMATAmpOYniDePnsYHLvbwyBnUFUldkGTZImT
 Zro55M8TQv2ahQj13iLQEHQWrFg=
X-Google-Smtp-Source: AGHT+IHkpU9HVR3dgO6bNsbHY85ZsMiwPjBxrIk+WmzzA2RI0HfvngMMueRn5xza9b8YqDfkhmFu5w==
X-Received: by 2002:a05:6000:1548:b0:38c:3f12:64be with SMTP id
 ffacd0b85a97d-38c51f8a3camr2705778f8f.35.1738147686765; 
 Wed, 29 Jan 2025 02:48:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188a85sm16348103f8f.44.2025.01.29.02.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:48:06 -0800 (PST)
Date: Wed, 29 Jan 2025 11:48:03 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5oHY1pjjwBfRN1g@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
 <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
 <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
 <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2025 at 09:24:33PM +0100, David Hildenbrand wrote:
> On 28.01.25 21:14, Simona Vetter wrote:
> > On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
> > > On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
> > > > > > > On integrated the gpu is tied into the coherency
> > > > > > > fabric, so there it's not needed.
> > > > > > > 
> > > > > > > I think the more fundamental question with both this function here and
> > > > > > > with forced migration to device memory is that there's no guarantee it
> > > > > > > will work out.
> > > > > > 
> > > > > > Yes, in particular with device-exclusive, it doesn't really work with THP
> > > > > > and is only limited to anonymous memory. I have patches to at least make it
> > > > > > work reliably with THP.
> > > > > 
> > > > > I should have crawled through the implementation first before replying.
> > > > > Since it only looks at folio_mapcount() make_device_exclusive() should at
> > > > > least in theory work reliably on anon memory, and not be impacted by
> > > > > elevated refcounts due to migration/ksm/thp/whatever.
> > > > 
> > > > Yes, there is -- in theory -- nothing blocking the conversion except the
> > > > folio lock. That's different than page migration.
> > > 
> > > Indeed - this was the entire motivation for make_device_exclusive() - that we
> > > needed a way to reliably exclude CPU access that couldn't be blocked in the same
> > > way page migration can (otherwise we could have just migrated to a device page,
> > > even if that may have added unwanted overhead).
> > 
> > The folio_trylock worries me a bit. I guess this is to avoid deadlocks
> > when locking multiple folios, but I think at least on the first one we
> > need an unconditional folio_lock to guarantee forward progress.
> 
> At least on the hmm path I was able to trigger the EBUSY a couple of times
> due to concurrent swapout. But the hmm-tests selftest fails immediately
> instead of retrying.

My worries with just retrying is that it's very hard to assess whether
there's a livelock or whether the retry has a good chance of success. As
an example the ->migrate_to_ram path has some trylocks, and the window
where all other threads got halfway and then fail the trylock is big
enough that once you pile up enough threads that spin through there,
you're stuck forever. Which isn't great.

So if we could convert at least the first folio_trylock into a plain lock
then forward progress is obviously assured and there's no need to crawl
through large chunks of mm/ code to hunt for corner cases where we could
be too unlucky to ever win the race.

> > Since
> > atomics can't cross 4k boundaries (or the hw is just really broken) this
> > should be enough to avoid being stuck in a livelock. I'm also not seeing
> > any other reason why a folio_lock shouldn't work here, but then my
> > understanding of mm/ stuff is really just scratching the surface.
> > 
> > I did crawl through all the other code and it looks like everything else
> > is unconditional locks. So looks all good and I didn't spot anything else
> > that seemed problematic.
> > 
> > Somewhat aside, I do wonder whether we really want to require callers to
> > hold the mmap lock, or whether with all the work towards lockless fastpath
> > that shouldn't instead just be an implementation detail.
> 
> We might be able to use the VMA lock in the future, but that will require
> GUP support and a bunch more. Until then, the mm_lock in read mode is
> required.

Yup. I also don't think we should try to improve before benchmarks show an
actual need. It's more about future proofing and making sure mmap_lock
doesn't leak into driver data structures that I'm worried about. Because
I've seen some hmm/gpu rfc patches that heavily relied on mmap_lock to
keep everything correct on the driver side, which is not a clean design.

> I was not able to convince myself that we'll really need the folio lock, but
> that's also a separate discussion.

This is way above my pay understanding of mm/ unfortunately.

> > At least for the
> > gpu hmm code I've seen I've tried to push hard towards a world were the
> > gpu side does not rely on mmap_read_lock being held at all, to future
> > proof this all. And currently we only have one caller of
> > make_device_exclusive_range() so would be simple to do.
> 
> We could likely move the mmap_lock into that function, but avoiding it is
> more effort.

I didn't mean more than just that, which would make sure drivers at least
do not rely on mmap_lock being held. That then allows us to switch over to
vma lock or anything else entirely within mm/ code.

If we leave it as-is then more drivers accidentally or intentionally will
rely on this, like I think is the case for ->migrate_to_ram for hmm
already. And then it's more pain to untangle.

> In any case, I'll send something out probably tomorrow to fix page
> migration/swapout of pages with device-exclusive entries and a bunch of
> other things (THP, interaction with hugetlb, ...).

Thanks a lot!

Cheer, Sima
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
