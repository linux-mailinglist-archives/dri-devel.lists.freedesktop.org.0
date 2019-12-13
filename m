Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA111E1CF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E086E312;
	Fri, 13 Dec 2019 10:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451506E313
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:19:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so6030774wrh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rl6ZcpYNx9OU5/nEbfBo5yylHG5ar169zdHs7M50F4Q=;
 b=Ap0FGuiBLoc7CtJsj51ddw+Fe6G5hC9uLNn75596J5Cu1boRP8Hx4/X+SsUFptCl/Q
 4QdXTyu9jjysyr2JBOZZkONFripkTFG1nJ6Je9FXEKJyJV3CS23bW7QqwatOtTVrW34S
 /3MuLnSkpFz69g6E4iETKNuOb9eg/WRwlc/rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=rl6ZcpYNx9OU5/nEbfBo5yylHG5ar169zdHs7M50F4Q=;
 b=d0VvIWOrObGJAV/m0mdHoNhihabbnmwxurjAFhzIqTb4qA+lXdKRV89uLtLnSYzL6D
 6gTxo7ckKHRNIULNpcFLYwkwFSr6qoMhUXFFZPxuBmMU+a+izb1s90pL30SN/2nncjDK
 8t3WIXuYjb3jHTI+d2cVx/Kr9xt/6JE5awFRaE0jtKe8c4cnwnfyB7u4Mk5AtyoYHBnQ
 kIRC/uRKBYIv5uE9h7Y+4Ou09jU5eIbZnLizOI6wWDbHi1IA16EHKB3WTcVTvJeAJAc/
 5JJPnVvqEf1Qs7bJCPYnX2vjoZUoaU/YvBWBCDz76pn8DPoLLvulgfkQyFfLwnFlUjgb
 Ow1A==
X-Gm-Message-State: APjAAAXPgArzuVX+GgrNJQi2N1n9L55Hs9BFlZY0vRydmeM6oHawsMOS
 8U41ZElfLzlcLGC+TtL5y8yWCw==
X-Google-Smtp-Source: APXvYqyhmTb9L+Ty2qqWHWby6TsBUoPJB8m/X3BYq7Z4RTM7jDbTx/v8gsKAoFlcC2n53nTyeYCmrQ==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr11521520wrr.158.1576232359891; 
 Fri, 13 Dec 2019 02:19:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id x1sm9393930wru.50.2019.12.13.02.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:19:18 -0800 (PST)
Date: Fri, 13 Dec 2019 11:19:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [GIT PULL] Please pull hmm changes
Message-ID: <20191213101916.GD624164@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com>
 <20191205160324.GB5819@redhat.com>
 <20191211225703.GE3434@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211225703.GE3434@mellanox.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 10:57:13PM +0000, Jason Gunthorpe wrote:
> On Thu, Dec 05, 2019 at 11:03:24AM -0500, Jerome Glisse wrote:
> 
> > > struct mmu_notifier_mm (ie the mm->mmu_notifier_mm)
> > >    -> mmn_mm
> > > struct mm_struct 
> > >    -> mm
> > > struct mmu_notifier (ie the user subscription to the mm_struct)
> > >    -> mn
> > > struct mmu_interval_notifier (the other kind of user subscription)
> > >    -> mni
> > 
> > What about "interval" the context should already tell people
> > it is related to mmu notifier and thus a notifier. I would
> > just remove the notifier suffix, this would match the below
> > range.
> 
> Interval could be a good replacement for mni in the mm/mmu_notififer
> file if we don't do the wholesale rename
> 
> > > I think it would be overall nicer with better names for the original
> > > structs. Perhaps:
> > > 
> > >  mmn_* - MMU notifier prefix
> > >  mmn_state <- struct mmu_notifier_mm
> > >  mmn_subscription (mmn_sub) <- struct mmu_notifier
> > >  mmn_range_subscription (mmn_range_sub) <- struct mmu_interval_notifier
> > >  mmn_invalidate_desc <- struct mmu_notifier_range
> > 
> > This looks good.
> 
> Well, lets just bite the bullet then and switch it. Do you like
> 'state'? I thought that was the weakest one

Since you're asking, here's my bikeshed. I kinda agree _state looks a bit
strange for this, what about a _link suffix in the spirit of

	struct list_head link;

The other common name is "node", but I think that's confusing in the
context of mm code. The purpose of this struct is to link everything
together (and yes it carries also some state, but the main job is to link
a mm_struct to a mmu_notifier). At least for me a _state is configuration
state for a specific object, not something that links a bunch of things
together. But I'm biased on this, since we use that pattern in drm for all
the display state tracking.

Also feel free to ignore my bikeshed :-)

Aside from this I think the proposed names are a solid improvement.
-Daniel

> 
> We could use mmnotif as the prefix, this makes the longest:
> 
>   struct mmnotif_range_subscription
> 
> Which is reasonable enough
> 
> > Maybe we can do a semantic patch to do convertion and then Linus
> > can easily apply the patch by just re-running the coccinelle.
> 
> I tried this last time I renamed everything, it was OK, but it missed
> updating the comments. So it still needs some by-hand helping.
> 
> I'll make some patches next week when I get back.
> 
> Jason
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
