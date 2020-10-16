Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351C290C0F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 21:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9EA6E0A8;
	Fri, 16 Oct 2020 19:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814CA6E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 19:04:05 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id c13so3582273oiy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDGiTqL122cqbXZ5gmkVRBP3kDwxXwWxYEu+99pwLt8=;
 b=Vu3mPMHF4DBQL4kRlIWhIl9ji8RQex+xp7zFTvbtx9Zh3wWBCGFoYeL/7r0Hwx7EEm
 ek/hS1ud5mnmbehUUkObdzbIdX1ck0whwPXMxyA+pc4U2Po7VQFjq76x7YeoaqZ4xAFJ
 mwF4zceOwX+zbQMCOYexMBUOltu9uBPnMBcKiz318natkpmKGrWTqxNZ5Kkiu5RJurMu
 G/iH5A/kDsU0spCOTx5TFbopILA7+8QBYCiLHYfxxrGaW08UxWy4D6M49AWqht3kleGc
 lWN6yRRg3N3kw1bDIyIRC8GWZYDYuXhfaMzjmSt5arM4Ogx55jg+MJ5wQfQvit3Fy1Q6
 4vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDGiTqL122cqbXZ5gmkVRBP3kDwxXwWxYEu+99pwLt8=;
 b=KmbV2LdnMLwceOKjTUDmwJuBejuAzMEdVByEQZo5hJ0R7WPLybJN3pdreYPwwb5Qth
 MIZz0Tb/OBZozsDChjt6CYbZCqPUx5UX6t5dJoOnz9RJTv88qle7Qa8CWCOp/GDQYXji
 d6FSK6/sYDQ0KDorEsa7y1XwESUemXByQaBA5JG3wmjgAdQ1owm9w91p3eEm2kCCmULY
 x5eY4nOxRlvcDHi1dCsv0rO2QKy5EBYQg4qWtOUJLxSBjEVf9nuXmEgxD+16lpiTUNSz
 kXadSf4Nraoy64j6tp15Q/uKgUriZ1VrZn+SSROi8NMf07KiEtHU+LLqdvDGrugjdLPq
 Khkw==
X-Gm-Message-State: AOAM532BA1Xp86qyNcZgyX6cly+3AAjL1zxjDw5uHSJBBcfeWFvGUaWn
 gQou1bgeSdz//1Mar2wsbzcbj56MFud4CYHxlZW6FzpV+zs=
X-Google-Smtp-Source: ABdhPJyCT4CFxxioZ0RKc9SGkaYU2J4oKTJezbHz1a5Jln7LGJyPN5dehP917sAYUY6hvIpgxqdn6fwmIVzzFsccKtw=
X-Received: by 2002:aca:3341:: with SMTP id z62mr3245667oiz.169.1602875044682; 
 Fri, 16 Oct 2020 12:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
 <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 16 Oct 2020 12:03:52 -0700
Message-ID: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: nd <nd@arm.com>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > @@ -215,8 +236,12 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
> >       struct page **pages = vmalloc(sizeof(struct page *) * npages);
> >       struct page **tmp = pages;
> >       struct sg_page_iter piter;
> > +     pgprot_t pgprot = PAGE_KERNEL;
> >       void *vaddr;
> >
> > +     if (buffer->uncached)
> > +             pgprot = pgprot_writecombine(PAGE_KERNEL);
>
> I think this should go after the 'if (!pages)' check. Best to get the
> allocation failure check as close to the allocation as possible IMO.

Sounds good. Changed in my tree.

> > @@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
> >               /* just return, as put will call release and that will free */
> >               return ret;
> >       }
> > +
> > +     /*
> > +      * For uncached buffers, we need to initially flush cpu cache, since
> > +      * the __GFP_ZERO on the allocation means the zeroing was done by the
> > +      * cpu and thus it is likely cached. Map (and implicitly flush) it out
> > +      * now so we don't get corruption later on.
> > +      */
> > +     if (buffer->uncached)
> > +             dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
>
> Do we have to keep this mapping around for the entire lifetime of the
> buffer?

Yea, I guess we can just map and unmap it right there.  It will look a
little absurd, but that sort of aligns with your next point.

> Also, this problem (and solution) keeps lingering around. It really
> feels like there should be a better way to solve "clean the linear
> mapping all the way to DRAM", but I don't know what that should be.

Yea, something better here would be nice...


> > @@ -426,6 +487,16 @@ static int system_heap_create(void)
> >       if (IS_ERR(sys_heap))
> >               return PTR_ERR(sys_heap);
> >
> > +     exp_info.name = "system-uncached";
> > +     exp_info.ops = &system_uncached_heap_ops;
> > +     exp_info.priv = NULL;
> > +
> > +     sys_uncached_heap = dma_heap_add(&exp_info);
> > +     if (IS_ERR(sys_uncached_heap))
> > +             return PTR_ERR(sys_heap);
> > +
>
> In principle, there's a race here between the heap getting registered
> to sysfs and the dma_mask getting updated.
>
> I don't think it would cause a problem in practice, but with the API
> as it is, there's no way to avoid it - so I wonder if the
> dma_heap_get_dev() accessor isn't the right API design.

Hrm.  I guess to address your concern we would need split
dma_heap_add() into something like:
  dma_heap_create()
  dma_heap_add()

Which breaks the creation of the heap with the registering it to the
subsystem, so some attributes can be tweaked inbetween?

I'll see about taking a stab at this, but I'll probably submit my
updated series sooner with this un-addressed so I can get some further
review.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
