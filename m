Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBA28A0FC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 19:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6046F393;
	Sat, 10 Oct 2020 17:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59336F393
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 17:23:03 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l16so12677511eds.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AkcMDQ9MzR0MXrPdl4Z5WIlaKuGLuztzGgHABJ/UwRo=;
 b=Tn1BNmOZPmbfirFetQOYO/ocDzjrlXPQ3LhwSZNpGIDc+8auCeevOxYV9x2mwnL+LJ
 B1X87tTja6iFvGiJMYchruyGKGyDa2qJyDYXpQ4MO9cDFl66eVBMa7wPbnL2v+lbkE61
 A3oosZUv6WC10KVVTloFe7vbgZMt3GHhIV9Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkcMDQ9MzR0MXrPdl4Z5WIlaKuGLuztzGgHABJ/UwRo=;
 b=CiCBIij1p6gDPVsq7S1xHtE+ua0xnRPR/FvHxJmmi6E5xkj7qoq4+qNFKX5PfFtR/G
 P3TZN/SRLTBm8Xj89WYSFc1iESV1m1GYhmKK56M2Iy8gj6KDLYxEyjWoIsNB6oQNUM5V
 hE0k3Y6Dj1f2ihwR3bIkd0R/aHLawhELQUTFudJUasO4xvJqxBAR8M972eUowoVKf5SA
 CpLjdZrQo1vM3K32XcrE1nmvGdedZ9B55GxOFP3lbjJ4AQ7ACnBtDlT1xeehH511ZyWa
 AUCiHqvjr3zM6kHaSXEo9O1lGITYhkgX8rbJtnLsYjztfnTmJ3Jel++k5s0w2Sivcw+T
 ffug==
X-Gm-Message-State: AOAM533N+vpM/sRLlQx7F0Wc5+HJskg21RGhoYKGkiJPIT9i06wcGV3j
 7hti3n9jvLEWhXsaMOJW3B/3rF6SpB3Deg==
X-Google-Smtp-Source: ABdhPJx9+4xnHaxtLbNmLjAadq/3nTgcio5vmW56/WUn2R4jwMYIPoiKXf5iMPheV6y9QeSceJV4Ew==
X-Received: by 2002:a50:fb16:: with SMTP id d22mr5258844edq.255.1602350582082; 
 Sat, 10 Oct 2020 10:23:02 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id a22sm8147316ejs.25.2020.10.10.10.22.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 10:23:00 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id d3so12837851wma.4
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 10:22:59 -0700 (PDT)
X-Received: by 2002:a1c:2d85:: with SMTP id t127mr3480262wmt.22.1602350579384; 
 Sat, 10 Oct 2020 10:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
In-Reply-To: <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Sat, 10 Oct 2020 19:22:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CTT0re4ssj9NNTxhejFX_v_rCjy6=mX7C+dc=Lw9GOHw@mail.gmail.com>
Message-ID: <CAAFQd5CTT0re4ssj9NNTxhejFX_v_rCjy6=mX7C+dc=Lw9GOHw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, Oct 9, 2020 at 7:52 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
> >
> > > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > > description is that this is unsafe *only if*  __GFP_MOVABLE is used.
> >
> > No, it is unconditionally unsafe. The CMA movable mappings are
> > specific VMAs that will have bad issues here, but there are other
> > types too.
> >
> > The only way to do something at a VMA level is to have a list of OK
> > VMAs, eg because they were creatd via a special mmap helper from the
> > media subsystem.
> >
> > > Well, no drivers inside the media subsystem uses such flag, although
> > > they may rely on some infrastructure that could be using it behind
> > > the bars.
> >
> > It doesn't matter, nothing prevents the user from calling media APIs
> > on mmaps it gets from other subsystems.
>
> I think a good first step would be to disable userptr of non struct
> page backed storage going forward for any new hw support. Even on
> existing drivers. dma-buf sharing has been around for long enough now
> that this shouldn't be a problem. Unfortunately right now this doesn't
> seem to exist, so the entire problem keeps getting perpetuated.
>
> > > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > > flag that it would be denying the core mm code to set __GFP_MOVABLE.
> >
> > We can't tell from the VMA these kinds of details..
> >
> > It has to go the other direction, evey mmap that might be used as a
> > userptr here has to be found and the VMA specially created to allow
> > its use. At least that is a kernel only change, but will need people
> > with the HW to do this work.
>
> I think the only reasonable way to keep this working is:
> - add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
> - add dma-buf export support to fbdev and v4l

I assume you mean V4L2 and not the obsolete V4L that is emulated in
the userspace by libv4l. If so, every video device that uses videobuf2
gets DMA-buf export for free and there is nothing needed to enable it.

We probably still have a few legacy drivers using videobuf (non-2),
but IMHO those should be safe to put behind some disabled-by-default
Kconfig symbol or even completely drop, as the legacy framework has
been deprecated for many years already.

> - roll this out everywhere we still need it.
>
> Realistically this just isn't going to happen. And anything else just
> reimplements half of dma-buf, which is kinda pointless (you need
> minimally refcounting and some way to get at a promise of a permanent
> sg list for dma. Plus probably the vmap for kernel cpu access.
>
> > > Please let address the issue on this way, instead of broken an
> > > userspace API that it is there since 1991.
> >
> > It has happened before :( It took 4 years for RDMA to undo the uAPI
> > breakage caused by a security fix for something that was a 15 years
> > old bug.
>
> Yeah we have a bunch of these on the drm side too. Some of them are
> really just "you have to upgrade userspace", and there's no real fix
> for the security nightmare without that.

I think we need to phase out such userspace indeed. The Kconfig symbol
allows enabling the unsafe functionality for anyone who still needs
it, so I think it's not entirely a breakage.

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
