Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67832860F9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 16:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167016E8F5;
	Wed,  7 Oct 2020 14:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE58B6E8F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 14:12:14 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id ce10so3173494ejc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YFB+tdyXOtCPNmNlbyeGl25fBeChj1S+VT6tzzLEZ78=;
 b=d8LN7dGO3Ag/inP5rvlWv5j43byrHe3f2u6a2r5SiIA/iuBN1VvbkR0plJSfSgqBlh
 Xu6ol8DY8sIaLVYX8C/ptKWjmAW3b06V+W6maw4cEpyWOcxb/M9F7iw98CO5YNTALD0W
 RHBCozGcvxlKPGX6uoYJpCQxNytt1WigBKfUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFB+tdyXOtCPNmNlbyeGl25fBeChj1S+VT6tzzLEZ78=;
 b=QfjYUkjovCsiigWyABsgGpf5/v06DcLmnQbVqTHLVi+ckQomfWrSfPy8wf4NAJV9fU
 9ynTHdBDanEKcPXCxpAzbuRzle3W0mv8H9cliXPJsVXQymX2zovyz1Q3VpKOSQQAg6bB
 UlpELB5Wez+oEdzeiD6bAM5cIiSP/F6LDrsiQf0lJuajwE9Acx1Q3eIxrWs9kk0Qqvez
 beBCx+1yL72VN88QVa3yHa7M1IhswgtUzb9VeOpJhSu8B+2VwQgLSFgzqtcbQygt66xB
 CPbNd9IL9isp4nd19YeglBuJ94jL+F624hceX6Svt/80KO1wcPZ3gfxqIhTCp/OshbMU
 hnjg==
X-Gm-Message-State: AOAM530zYhxHujDzchW2hFY23dXcvlXpEk6ubhzFmk7TD/myzRNqZC6e
 VeaYW5zQMnbQ5hT6dqXumMKdpJkZxcNYiw==
X-Google-Smtp-Source: ABdhPJwC6RTDJ7UCWlPVuZqbQnZO87DzoprxOuTlXIPOEshNgw6nSSV8q4mv+3D9zGDVjeJ6B+SLWA==
X-Received: by 2002:a17:906:f118:: with SMTP id
 gv24mr3553522ejb.174.1602079933379; 
 Wed, 07 Oct 2020 07:12:13 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id ba6sm1570825edb.61.2020.10.07.07.12.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 07:12:13 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id p15so2477631wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 07:12:12 -0700 (PDT)
X-Received: by 2002:a1c:8057:: with SMTP id b84mr3494264wmd.116.1602079932144; 
 Wed, 07 Oct 2020 07:12:12 -0700 (PDT)
MIME-Version: 1.0
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
 <20201007130610.GP5177@ziepe.ca>
 <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
 <CAKMK7uFSTrULTE-o+vHU-81dJpKJ5cHAAb8qkpQtcz6KrhvPzg@mail.gmail.com>
In-Reply-To: <CAKMK7uFSTrULTE-o+vHU-81dJpKJ5cHAAb8qkpQtcz6KrhvPzg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 7 Oct 2020 16:11:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
Message-ID: <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Wed, Oct 7, 2020 at 4:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Oct 7, 2020 at 3:34 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Wed, Oct 7, 2020 at 3:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 02:58:33PM +0200, Daniel Vetter wrote:
> > > > On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > > >
> > > > > On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > > >
> > > > > > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > > > > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > > > > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> > > > > >
> > > > > > There is no guarentee that holding a get on the file says anthing
> > > > > > about the VMA. This needed to check that the file was some special
> > > > > > kind of file that promised the VMA layout and file lifetime are
> > > > > > connected.
> > > > > >
> > > > > > Also, cloning a VMA outside the mm world is just really bad. That
> > > > > > would screw up many assumptions the drivers make.
> > > > > >
> > > > > > If it is all obsolete I say we hide it behind a default n config
> > > > > > symbol and taint the kernel if anything uses it.
> > > > > >
> > > > > > Add a big comment above the follow_pfn to warn others away from this
> > > > > > code.
> > > > >
> > > > > Sadly it's just verbally declared as deprecated and not formally noted
> > > > > anyway. There are a lot of userspace applications relying on user
> > > > > pointer support.
> > > >
> > > > userptr can stay, it's the userptr abuse for zerocpy buffer sharing
> > > > which doesn't work anymore. At least without major surgery (you'd need
> > > > an mmu notifier to zap mappings and recreate them, and that pretty
> > > > much breaks the v4l model of preallocating all buffers to make sure we
> > > > never underflow the buffer queue). And static mappings are not coming
> > > > back I think, we'll go ever more into the direction of dynamic
> > > > mappings and moving stuff around as needed.
> > >
> > > Right, and to be clear, the last time I saw a security flaw of this
> > > magnitude from a subsystem badly mis-designing itself, Linus's
> > > knee-jerk reaction was to propose to remove the whole subsystem.
> > >
> > > Please don't take status-quo as acceptable, V4L community has to work
> > > to resolve this, uABI breakage or not. The follow_pfn related code
> > > must be compiled out of normal distro kernel builds.
> >
> > I think the userptr zero-copy hack should be able to go away indeed,
> > given that we now have CMA that allows having carveouts backed by
> > struct pages and having the memory represented as DMA-buf normally.
>
> Not sure whether there's a confusion here: dma-buf supports memory not
> backed by struct page.
>

That's new to me. The whole API relies on sg_tables a lot, which in
turn rely on struct page pointers to describe the physical memory.

> > How about the regular userptr use case, though?
> >
> > The existing code resolves the user pointer into pages by following
> > the get_vaddr_frames() -> frame_vector_to_pages() ->
> > sg_alloc_table_from_pages() / vm_map_ram() approach.
> > get_vaddr_frames() seems to use pin_user_pages() behind the scenes if
> > the vma is not an IO or a PFNMAP, falling back to follow_pfn()
> > otherwise.
>
> Yeah pin_user_pages is fine, it's just the VM_IO | VM_PFNMAP vma that
> don't work.

Ack.

> >
> > Is your intention to drop get_vaddr_frames() or we could still keep
> > using it and if vec->is_pfns is true:
> > a) if CONFIG_VIDEO_LEGACY_PFN_USERPTR is set, taint the kernel
> > b) otherwise just undo and fail?
>
> I'm typing that patch series (plus a pile more) right now.

Cool, thanks!

We also need to bring back the vma_open() that somehow disappeared
around 4.2, as Marek found.

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
