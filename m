Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F2286251
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF846E923;
	Wed,  7 Oct 2020 15:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78F56E8DB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:06:12 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o21so1706115qtp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4HblAtS9AKrNcXdrIqeiy/kTpr6U/GTX51Mfam+LA6U=;
 b=gaxle5XVgPiB2J0+XM9zX2irfLEeu+2lzv07I3+3U3SMukmTi39ED8XpWUwdoBcdzg
 sq4EXuxHEnLK8EARG7U4otO1hCCHLRTqMxs1/NAPPc5nyn85tvWrubmlDncTe23EKOaB
 jE9OLIPsLyZnVnoyWAxZ4tlHkPbS9aVO8FiyQjpuMA02++qPCVMiDzO5QLl8lWlJbMD3
 4VK5mAfkVwdhlyMZrArW6rVvJKOeuBU228bcPTy37fSP1ncOhV7pl1K6TD9+VWj6isag
 XGFgvwC3r0uqNL2CEDLuYG1PhamsDOLiaI3s/SgFk61PX6WsySN+n5YF0I2fOeQwZAjk
 4vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4HblAtS9AKrNcXdrIqeiy/kTpr6U/GTX51Mfam+LA6U=;
 b=fsHhxyiTEa+U/GfpxiK7V5KDXHt2EnvZKdJi+9hoPnHmhz+QG7ZSF75DL7EvnqFB+b
 ZRVwSJ+5sNntGMGt30BG6sxd7s/3KMJn5hH6AjuLjdYSH7SSlpzOtXJN0yDwCPJ81Uex
 nxIkt2/FUM/IZdnXfni4oliwExLSoErtZ+ODtQKBDsI28OT0lt1UKCuUFYLUg+RbHblR
 yfSa/TQ/WTxF1ZBq/aywSffTl42WNorcZ6YXEl2P2wTIUwoUYyaOeCNrrzBHEgChuKD/
 i1qhTloZRxNewJJshkhlvYfqPP2YVH6T1iNy2ZnAT1XhDmxGDwyZzScfPJcUOz2dNDst
 2ifw==
X-Gm-Message-State: AOAM531bHeNAnLuhWjnhMG1G6DvTUrHVejGgSqASvZRiHSlyLmUvEkKx
 g5VxsqLryTakLOJnEFo9zJph5g==
X-Google-Smtp-Source: ABdhPJz13fEMZDLnus1GsnlhL3kh+zUp6oNCWrGj1oRDvFmd97g/P2fkBStxQRO5aVdvng5Hk9Rc3A==
X-Received: by 2002:ac8:4807:: with SMTP id g7mr3141587qtq.54.1602075971639;
 Wed, 07 Oct 2020 06:06:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d14sm1449111qtr.62.2020.10.07.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:06:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQ990-000tst-7Q; Wed, 07 Oct 2020 10:06:10 -0300
Date: Wed, 7 Oct 2020 10:06:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007130610.GP5177@ziepe.ca>
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 02:58:33PM +0200, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> > >
> > > There is no guarentee that holding a get on the file says anthing
> > > about the VMA. This needed to check that the file was some special
> > > kind of file that promised the VMA layout and file lifetime are
> > > connected.
> > >
> > > Also, cloning a VMA outside the mm world is just really bad. That
> > > would screw up many assumptions the drivers make.
> > >
> > > If it is all obsolete I say we hide it behind a default n config
> > > symbol and taint the kernel if anything uses it.
> > >
> > > Add a big comment above the follow_pfn to warn others away from this
> > > code.
> >
> > Sadly it's just verbally declared as deprecated and not formally noted
> > anyway. There are a lot of userspace applications relying on user
> > pointer support.
> 
> userptr can stay, it's the userptr abuse for zerocpy buffer sharing
> which doesn't work anymore. At least without major surgery (you'd need
> an mmu notifier to zap mappings and recreate them, and that pretty
> much breaks the v4l model of preallocating all buffers to make sure we
> never underflow the buffer queue). And static mappings are not coming
> back I think, we'll go ever more into the direction of dynamic
> mappings and moving stuff around as needed.

Right, and to be clear, the last time I saw a security flaw of this
magnitude from a subsystem badly mis-designing itself, Linus's
knee-jerk reaction was to propose to remove the whole subsystem.

Please don't take status-quo as acceptable, V4L community has to work
to resolve this, uABI breakage or not. The follow_pfn related code
must be compiled out of normal distro kernel builds.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
