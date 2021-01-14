Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1DD2F5D94
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52F66E14B;
	Thu, 14 Jan 2021 09:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A3D6E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:30:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id r9so4599437otk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFa2b7jY6SK0DVENMGG3y7udUEVcyGK8UAxCA06hl6o=;
 b=MLFSxyYerMbAhsq0Hqwo+AjV/ypxsNn143sl93yWLnZex7sSPPUWLJ3jWbdOxEBXlF
 FE8tzE1N0iaycdqce6c9PiVqIC+kfUYF9D2XJAWvbBY5LyfD06vb64k65j+MzG3EIF44
 Wgz/E7FFps8nCbHMPyvwpQGLEM75s3X/G4apk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFa2b7jY6SK0DVENMGG3y7udUEVcyGK8UAxCA06hl6o=;
 b=Q71bPcLE4+TRID8WpHrY3dDF96mb9UX/wOukzv2sSEts3gIIuzJzoD/27oT6BH3vQv
 siL5jMHK5lwi08OZXG8eIp7TGovMP+7E7AEvVfGF7OainB8c14DdzFZj7Ezr0CFebPiL
 9Es4d+c8xyhIkALnS9bz8ayNsMocgWlZmpFBwjUBQtEAsbB5BmIIOEl0xhSsCGWl5OgK
 by30XvVkUXUCHzczf8PYLpUUkJaNVPtIoISJ3if9kZ0F1ieb2DPArqBsd+h2jel8b0UJ
 hAYZzMOvXlhHa0+APtXVL/DVSgtVmAFHbYQAFhOQ1RIVAEfjHwEMipOkGmPsW1rhoAcI
 2Ngg==
X-Gm-Message-State: AOAM530cN7+8yf284aKRiWsuIVe59oVo0KLngVSdB5FsYXJH6wft+BWL
 J2uq/zYUbw6JGHLjY/XV6VdPUlmoCytJfCKlW5/JTA==
X-Google-Smtp-Source: ABdhPJw2LTqNAW3RwduC6zKVj5hub+pGYMgA44nEqq+R0Id0O/Pb0/joilsy80BLKujgrXyKKwdAWks5x5wtOwiCm5w=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr4089555otb.281.1610616643262; 
 Thu, 14 Jan 2021 01:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
 <161057213487.6195.581396740566956696@build.alporthouse.com>
 <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
 <161061619887.19482.10606780107376365239@build.alporthouse.com>
In-Reply-To: <161061619887.19482.10606780107376365239@build.alporthouse.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 14 Jan 2021 10:30:32 +0100
Message-ID: <CAKMK7uE58dJabnaTNgePTyio_JY3=kvFZtu1RT1eFeGDK76ZeA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 10:23 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2021-01-14 09:02:57)
> > On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Quoting Daniel Vetter (2021-01-13 20:50:11)
> > > > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > >
> > > > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > > > We have too many people abusing the struct page they can get at but
> > > > > > really shouldn't in importers. Aside from that the backing page might
> > > > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > > > completely. Importers really must go through the proper interface like
> > > > > > dma_buf_mmap for everything.
> > > > >
> > > > > If the exporter doesn't want to expose the struct page, why are they
> > > > > setting it in the exported sg_table?
> > > >
> > > > You need to store it somewhere, otherwise the dma-api doesn't work.
> > > > Essentially this achieves clearing/resetting the struct page pointer,
> > > > without additional allocations somewhere, or tons of driver changes
> > > > (since presumably the driver does keep track of the struct page
> > > > somewhere too).
> > >
> > > Only for mapping, and that's before the export -- if there's even a
> > > struct page to begin with.
> > >
> > > > Also as long as we have random importers looking at struct page we
> > > > can't just remove it, or crashes everywhere. So it has to be some
> > > > debug option you can disable.
> > >
> > > Totally agreed that nothing generic can rely on pages being transported
> > > via dma-buf, and memfd is there if you do want a suitable transport. The
> > > one I don't know about is dma-buf heap, do both parties there consent to
> > > transport pages via the dma-buf? i.e. do they have special cases for
> > > import/export between heaps?
> >
> > heaps shouldn't be any different wrt the interface exposed to
> > importers. Adding John just in case I missed something.
> >
> > I think the only problem we have is that the first import for ttm
> > simply pulled out the struct page and ignored the sgtable otherwise,
> > then that copypasted to places and we're still have some of that left.
> > Although it's a lot better. So largely the problem is importers being
> > a bit silly.
> >
> > I also think I should change the defaulty y to default y if
> > DMA_API_DEBUG or something like that, to make sure it's actually
> > enabled often enough.
>
> It felt overly draconian, but other than the open question of dma-buf
> heaps (which I realise that we need some CI coverage for), I can't
> think of a good reason to argue for hiding a struct page transport
> within dma-buf.

Yeah there's the occasional idea floating around to split sgtable into
the page and the dma side completely. But aside from the bikeshed no
one volunteered for the massive amount of work rolling that out would
mean, so I'm trying to go with a cheap trick here meanwhile.

> The only other problem I see with the implementation is that there's
> nothing that says that each dmabuf->ops->map_dma_buf() returns a new
> sg_table, so we may end up undoing the xor. Or should each dma-buf
> return a fresh dma-mapping for iommu isolation?

Maybe I screwed it up, but that's why I extracted the little helpers:
We scramble when we get the sgtable from exporter, and unscramble
before we pass it back. dma-buf.c does some caching and will hand back
the same sgtable, but for that case we don't re-scramble.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
