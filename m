Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753B316748
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 13:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20E46EC77;
	Wed, 10 Feb 2021 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FE66EC79
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:59:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r21so2402430wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 04:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6MsHCb96PmdEoxri8X3RrE2xw2rPHnbybff/JS7t4rM=;
 b=Tstgim+g0HY1P/mkk3+/u2VrYZzdm9S0YfCCOW5tUOYsB36CYieEHqqX4gLAN0dvYl
 HwuWr0Ii0ZR/atXuP6UXJ5kI/MFr3fELyAgmJG9LEiHWGssayf7qVtCiTYZ270jOoGKa
 40lRsXcevUNvgMYcsuDv15Ykj6bDqL5ycyu64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6MsHCb96PmdEoxri8X3RrE2xw2rPHnbybff/JS7t4rM=;
 b=EQlTrnr1bGSOQ2Y//U0svGzorHiA+6cYqbhwWABdaCZ8qbQ8yp0sZ6Qt6YGM3XOv8G
 DoybR3Z73BDeyLEthd9Nv9eII1yMq0bvcBXXWWuv2yi9sI3GAL3aCEgsdC3CTKBBUsR/
 ZD/HJKzQLrCF7VYB0WIBeEN1SEfOLebmY/RmlFPosE4uyuiLLlCbghY9oWkoxFIFsxcd
 l9v2bHHkh96dtSU61ML1DnU1/Kx6HiBRiTMNrEWO9vDTBzz1qL8AX3cpmBsyG+k1JCvq
 u3jE9k0aoElx25X2s/4A/9eTYyCz0deNRqX9h+Izh+15kZNvpU/6qTHRMY9fQOjBT/g+
 YnXA==
X-Gm-Message-State: AOAM533jUf+wIrYUPN0IH9RJnRLi9LIoky3zKYeWU+uWgPe8CoHYmr2Q
 M/Ucst6+9i5AC4FVFe6M/zQcWA==
X-Google-Smtp-Source: ABdhPJwRmPaxUgrAFJhjeq8xi1cVj/iHb/OYEDnTnx72e9/77v9DlCR5ZxyjtYtC8tHGuc5C0xMUTQ==
X-Received: by 2002:a5d:4211:: with SMTP id n17mr3539933wrq.37.1612961975096; 
 Wed, 10 Feb 2021 04:59:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d10sm2955713wrn.88.2021.02.10.04.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 04:59:34 -0800 (PST)
Date: Wed, 10 Feb 2021 13:59:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <YCPYtNeYCuu6i2/d@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Linux MM <linux-mm@kvack.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
 <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
 <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:53:27PM -0800, John Hubbard wrote:
> On 2/9/21 5:37 AM, Daniel Vetter wrote:
> > On Tue, Feb 9, 2021 at 1:57 PM Alistair Popple <apopple@nvidia.com> wrote:
> > > 
> > > On Tuesday, 9 February 2021 9:27:05 PM AEDT Daniel Vetter wrote:
> > > > > 
> > > > > Recent changes to pin_user_pages() prevent the creation of pinned pages in
> > > > > ZONE_MOVABLE. This series allows pinned pages to be created in
> > > ZONE_MOVABLE
> > > > > as attempts to migrate may fail which would be fatal to userspace.
> > > > > 
> > > > > In this case migration of the pinned page is unnecessary as the page can
> > > be
> > > > > unpinned at anytime by having the driver revoke atomic permission as it
> > > > > does for the migrate_to_ram() callback. However a method of calling this
> > > > > when memory needs to be moved has yet to be resolved so any discussion is
> > > > > welcome.
> > > > 
> > > > Why do we need to pin for gpu atomics? You still have the callback for
> > > > cpu faults, so you
> > > > can move the page as needed, and hence a long-term pin sounds like the
> > > > wrong approach.
> > > 
> > > Technically a real long term unmoveable pin isn't required, because as you say
> > > the page can be moved as needed at any time. However I needed some way of
> > > stopping the CPU page from being freed once the userspace mappings for it had
> > > been removed. Obviously I could have just used get_page() but from the
> > > perspective of page migration the result is much the same as a pin - a page
> > > which can't be moved because of the extra refcount.
> > 
> > long term pin vs short term page reference aren't fully fleshed out.
> > But the rule more or less is:
> > - short term page reference: _must_ get released in finite time for
> > migration and other things, either because you have a callback, or
> > because it's just for direct I/O, which will complete. This means
> > short term pins will delay migration, but not foul it complete
> 
> 
> GPU atomic operations to sysmem are hard to categorize, because because application
> programmers could easily write programs that do a long series of atomic operations.
> Such a program would be a little weird, but it's hard to rule out.

Yeah, but we can forcefully break this whenever we feel like by revoking
the page, moving it, and then reinstating the gpu pte again and let it
continue.

If that's no possible then what we need here instead is an mlock() type of
thing I think.

> > - long term pin: the page cannot be moved, all migration must fail.
> > Also this will have an impact on COW behaviour for fork (but not sure
> > where those patches are, John Hubbard will know).
> 
> 
> That would be Jason's commit 57efa1fe59576 ("mm/gup: prevent gup_fast from racing
> with COW during fork"), which is in linux-next 20201216.

Nice, thanks for the pointer.
> 
> 
> > 
> > So I think for your use case here you want a) short term page
> > reference to make sure it doesn't disappear plus b) callback to make
> > sure migrate isn't blocked.
> > 
> > Breaking ZONE_MOVEABLE with either allowing long term pins or failing
> > migrations because you don't release your short term page reference
> > isn't good.
> > 
> > > The normal solution of registering an MMU notifier to unpin the page when it
> > > needs to be moved also doesn't work as the CPU page tables now point to the
> > > device-private page and hence the migration code won't call any invalidate
> > > notifiers for the CPU page.
> > 
> > Yeah you need some other callback for migration on the page directly.
> > it's a bit awkward since there is one already for struct
> > address_space, but that's own by the address_space/page cache, not
> > HMM. So I think we need something else, maybe something for each
> > ZONE_DEVICE?
> > 
> 
> This direction sounds at least...possible. Using MMU notifiers instead of pins
> is definitely appealing. I'm not quite clear on the callback idea above, but
> overall it seems like taking advantage of the ZONE_DEVICE tracking of pages
> (without having to put anything additional in each struct page), could work.
> 
> Additional notes or ideas here are definitely welcome.

Well I don't have ideas for the details tbh, just from the little I
learned about how this all fits together pretending to be a pin while
pretending to not be a pin just gets us back to the mess we're trying to
solve with gup vs pup cleanup. And given that the pin_user_pages rollout
hasn't even completed yet it's maybe way to early to already toss it out
again.

I think overall we should try really hard to not mix up things between
memory that's pinned and memory that can be moved. Because retroactively
trying to fix things up just because it was easier to get a feature going
that way is very, very hard. And I think we've demonstrated countless
times that "ah we just fix this with pinning, it doesn't happen often, no
one will notice" always comes back to bite us later on :-)

Like just looking ahead, 1GB pages are a thing, we will have to support
that, migrate_page is the only way to get there, and statistically just a
1/256th chance of encountering a pinned page guarantees we'll never
assemble a giant page.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
