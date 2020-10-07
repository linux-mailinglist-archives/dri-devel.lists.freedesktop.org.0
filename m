Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677A285F96
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 14:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE296E8D5;
	Wed,  7 Oct 2020 12:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2016E8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:58:45 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 60so2095817otw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
 b=HLP5cVy/+ivPAr8S6VW2DODWQvroNZFg7BttjeOcbezz6CNNniUIHSIARYKF8Ijk1T
 rmy9z7yE9flAapP4YSBu9HIymzY2iBki4HzaALq9rM2UBFkXQlEaW3TvVZzqH2LSayDe
 1rPcp7GgFX99YVk0vI8HYbxifKX0pBDMeSfv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
 b=GsN1JJjtwXdZsah40uiyiZNQ41QPCQzh3t58oDNjJQE/DTlT2NXV5TJHhltlsZrpkl
 cyj948zoiLcmBzCam5Vu6UH1clPwydrNl455scgekJBug0p5WADC8yt9raXoJJAwdAyS
 m61gGrDq9s9XVOWNZbZev2fjo6m8SWAUO6fS53xCmPqs8JcPzeY5bUGqP0Y25RKV6vXV
 T4V3m6XffSw5dD01b/TNRGVWWvMi47ZL96UiqYfQ4/tYQISMA7nx/DJDiY3W9xBGV90a
 SCD+vY+LRWpw4L3N1mWSx2vb+DQgO0AdvEJq82AAOEimcRQ3zG5Ozki7A/Fjr4+miohz
 rMCA==
X-Gm-Message-State: AOAM5336R/aJv32TgOGczEOem/+7J+6cN8SVNL3eVIbayrgf7GVv1dNW
 /MPx+qUi8nhMpWo9QQeF+FFOaMx/2Q3GQu1zwvYFhA==
X-Google-Smtp-Source: ABdhPJwvOqDF0PtNvyjRy9NUPdpqckHeo5Pb4aBKzEFyLCyusu6A+MJ6CRQQIQu70npKdaR3NW8xVD0BDZv4+5HBzkA=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr1696603otj.303.1602075524433; 
 Wed, 07 Oct 2020 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
In-Reply-To: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 14:58:33 +0200
Message-ID: <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Tomasz Figa <tfiga@chromium.org>
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
 Pawel Osciak <pawel@osciak.com>, Linux MM <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> >
> > There is no guarentee that holding a get on the file says anthing
> > about the VMA. This needed to check that the file was some special
> > kind of file that promised the VMA layout and file lifetime are
> > connected.
> >
> > Also, cloning a VMA outside the mm world is just really bad. That
> > would screw up many assumptions the drivers make.
> >
> > If it is all obsolete I say we hide it behind a default n config
> > symbol and taint the kernel if anything uses it.
> >
> > Add a big comment above the follow_pfn to warn others away from this
> > code.
>
> Sadly it's just verbally declared as deprecated and not formally noted
> anyway. There are a lot of userspace applications relying on user
> pointer support.

userptr can stay, it's the userptr abuse for zerocpy buffer sharing
which doesn't work anymore. At least without major surgery (you'd need
an mmu notifier to zap mappings and recreate them, and that pretty
much breaks the v4l model of preallocating all buffers to make sure we
never underflow the buffer queue). And static mappings are not coming
back I think, we'll go ever more into the direction of dynamic
mappings and moving stuff around as needed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
