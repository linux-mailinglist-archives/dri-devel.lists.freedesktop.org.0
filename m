Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717B377D00
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C666E222;
	Mon, 10 May 2021 07:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712FB6E222
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 07:17:11 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so13601656oth.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IhB0bIAA6mNgVJcfwc6pFjtsYpHcwnidnUaVEALfzAI=;
 b=DcFxeuviLqMJK1VOxpDP7iKBaegJNE1XYPxwsKMaFGAj2NpdrLkRhT55H9GQaygVNx
 1SeTBY16BF7gKnMhIIf5DxtvTinhP3GCxq0PqcebcKDPInrlBoPk1ZZ7Fb2/tF6E/Tfo
 sWFhuo66q0s83TApmLbvzpQXU+w4YFKi9Wxwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhB0bIAA6mNgVJcfwc6pFjtsYpHcwnidnUaVEALfzAI=;
 b=RZU+nuYU+0Yd6UFHHduYDFdbA/NjT3MRplHuC0Blf73K4IRKCCvFJZKvgUtD8+7jkX
 8SsVTkWu3ZjIxcML158tF8Rg5uhJCcKJQXcnJVbgrx/U210+jxmrWpRzYR/sMf0YdJj4
 bCV+Qv89r/7JE49NIQckPnKrpH6zDr6NvG3FiGwz4B1ra0h0adwWZx9FbkLhKijQwho6
 DQyYLP9J63UQKaKFl6HbBqUHNB3kvXzT8kLyPeikxVaQilDF75dznYjdTWPWoFHfIKED
 cce3mEdW1UxTR1vDmATRjDCpQHrjOWm+ZovmjQor2dJGGrnElYsXZN9BqV2dEXYTiabF
 9OTw==
X-Gm-Message-State: AOAM532PmNNvOXi3VNOaFaJvhTgfdxATf2z4VqDcpoIiI1NZcOjaXsUC
 de4ViQ8/QV1vyoeCn3DpNqCW7H2oznOzXKWlyWI7Jg==
X-Google-Smtp-Source: ABdhPJy/Xn4t/rhcrM6b4Fmi2Q5ua128it2ybIXLDlJVUoo+FC6OFAIP58ZQupclu11lfKm/OHcj6XvNHUBJyL5LVmA=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr20409398otq.281.1620631030232; 
 Mon, 10 May 2021 00:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
In-Reply-To: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 10 May 2021 09:16:58 +0200
Message-ID: <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 8, 2021 at 6:47 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Daniel, please fix your broken email setup. You have this insane
> "Reply-to" list that just duplicates all the participants. Very
> broken, very annoying ]
>
> On Fri, May 7, 2021 at 8:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > So personally I think the entire thing should just be thrown out, it's all
> > levels of scary and we have zero-copy buffer sharing done properly with
> > dma-buf since years in v4l.
>
> So I've been looking at this more, and the more I look at it, the less
> I like this series.
>
> I think the proper fix is to just fix things.
>
> For example, I'm looking at the v4l users of follow_pfn(), and I find
> get_vaddr_frames(), which is just broken.
>
> Fine, we know users are broken, but look at what appears to be the
> main user of get_vaddr_frames(): vb2_dc_get_userptr().
>
> What does that function do? Immediately after doing
> get_vaddr_frames(), it tries to turn those pfn's into page pointers,
> and then do sg_alloc_table_from_pages() on the end result.
>
> Yes, yes, it also has that "ok, that failed, let's try to see if it's
> some physically contiguous mapping" and do DMA directly to those
> physical pages, but the point there is that that only happens when
> they weren't normal pages to begin with.
>
> So thew *fix* for at least that path is to
>
>  (a) just use the regular pin_user_pages() for normal pages

Yup, the "rip it all out" solution amounts to replacing this all,
including frame_vector helper code, with pin_user_pages.

>  (b) perhaps keep the follow_pfn() case, but then limit it to that "no
> page backing" and that physical pages case.
>
> And honestly, the "struct frame_vector" thing already *has* support
> for this, and the problem is simply that the v4l code has decided to
> have the callers ask for pfn's rather than have the callers just ask
> for a frame-vector that is either "pfn's with no paeg backing" _or_
> "page list with proper page reference counting".
>
> So this series of yours that just disables follow_pfn() actually seems
> very wrong.
>
> I think follow_pfn() is ok for the actual "this is not a 'struct page'
> backed area", and disabling that case is wrong even going forward.

I think this is where you miss a bit: We very much also want to stop
pinned userptr to physcial addresses that aren't page backed. This
might very well be some gpu pci bar, backed by vram, and vram is
managed as dynamically as struct page backed stuff (and there's all
the hmm dreams to make it actually use struct page, but that's another
story).

So by the time the media hw access that vb2 userptr buffer there's
good chances someone else's data is now there. If vb2 would have a
mmu_notifier subscription or similar to follow pte updates the gpu
driver does, then it would be all fine. But this vb2 model is a pinned
one, hence not fixable.

The other more practical issue is that peer2peer dma on modern hw
needs quite some setup. Just taking a cpu pfn and hoping that matches
the bus addr your device would need is a bit optimistic.

One theoretical & proper fix I discussed with Jason Gunthrope would be
to replace the pfn lookup with a lookup for a struct dma_buf. Which
has proper interfaces for pinning gpu buffers, figuring out p2p dma or
just figuring out the right dma mapping and all that. Idea was to make
a direct vma->dma_buf lookup or something like that. But consensus is
also that outside of gpus and very closely related things using
dma_buf is not a great idea, because there's a few too many silly
rules involved. For everyone else it's better to make the struct page
managed device memory stuff work most likely.

> End result, I think the proper model is:
>
>  - keep follow_pfn(), but limit it to the "not vm_normal_page()" case,
> and return error for some real page mapping
>
>  - make the get_vaddr_frames() first try "pin_user_pages()" (and
> create a page array) and fall back to "follow_pfn()" if that fails (or
> the other way around). Set the
>
> IOW, get_vaddr_frames() would just do
>
>         vec->got_ref = is_pages;
>         vec->is_pfns = !is_pages;
>
> and everything would just work out - the v4l code seems to already
> have all the support for "it's a ofn array" vs "it's properly
> refcounted pages".
>
> So the only case we should disallow is the mixed case, that the v4l
> code already seems to not be able to handle anyway (and honestly, it
> looks like "got_ref/is_pfns" should be just one flag - they always
> have to have the opposite values).
>
> So I think this "unsafe_follow_pfn()" halfway step is actively wrong.
> It doesn't move us forward. Quite the reverse. It just makes the
> proper fix harder.
>
> End result: not pulling it, unless somebody can explain to me in small
> words why I'm wrong and have the mental capacity of a damaged rodent.

No rodents I think, just more backstory of how this all fits. tldr;
pin_user_pages is the only safe use of this vb2 userptr thing.
-Daniel


Cheers, Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
