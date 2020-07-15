Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF02220EA0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAB36EB6A;
	Wed, 15 Jul 2020 14:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D426EB6A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:03:45 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 18so1529396otv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ZU2aXmgxNLozPcshiuT8bp8C2jrvs4v7NA8fvgdsm0=;
 b=eVPTgaMdiy/4+Gc/WfirGzkZ3cP7U/eKtpibFuOEllPjXVywkDAFBWI8s5Yqik/+et
 oEFpp7Bxc+N7gMlN6IMQd9/C4f2Sh+ZwHMVi0UB2WFYBqldqjg3V/DFC1NdyHmYJwQEf
 3+dWIbSdfJmBScy/vjz7XHn0cPidZ2uBeg/sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZU2aXmgxNLozPcshiuT8bp8C2jrvs4v7NA8fvgdsm0=;
 b=MkobAyQDmiMkDW4cPNzOk0bksLkHFqJTzQGc2WFPl3wLtsTRXj1wkFt5xmS40pKxYG
 /MkceAI/0unR7WbshWD8aMQGTOf4Kulq11ttalTkI23T5xxHrb5QZ1j7+hbYE7J1fdLQ
 Bmne+2tAjsGkMUXQtRLT9N6qrrP+E1JPs2bc1OF5zSRSwghAzBQUqF4d+2nz13MMXGB+
 PPlLgxNWr+Ri26W52O43Qv3Ioo40jCnJRjm6/oeWEUt5552UR8v6Fx7FZuPuJoM77xcT
 22+zG9Jk2l3IfF0INl8krNYlKfqtM5icKDFAuzH1vG9FQXQWtIYaWw0knzW7j7EmdYQL
 VFuA==
X-Gm-Message-State: AOAM532FI0NXWaccQtLU58umo5eDrnaq+ZgzXTWfpkEi3nQv5r7tXsYr
 WP70tou/5L3V6Mr//OjlDpVLzQyS4NluNXg338K3hw==
X-Google-Smtp-Source: ABdhPJwR2GRF0nqx61aZJemOrcxMc9RI61OO8PqJsT+P2ibXGS/or6KISyjpyQpCCRWy4uWNtCc49ql8Yq4HVdQxPyE=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr9533893ota.188.1594821825064; 
 Wed, 15 Jul 2020 07:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200715104905.11006-1-chris@chris-wilson.co.uk>
 <20200715104905.11006-2-chris@chris-wilson.co.uk>
 <20200715121022.GK3278063@phenom.ffwll.local>
 <159481570397.13728.7155187046112827709@build.alporthouse.com>
 <159481680826.13728.12654400528941223194@build.alporthouse.com>
In-Reply-To: <159481680826.13728.12654400528941223194@build.alporthouse.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 16:03:34 +0200
Message-ID: <CAKMK7uGtGkYnq+Fe1jD7t315OOgRCiZhqvpTjoOLuYhuV3Qy3A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf/dma-fence: Add quick tests before
 dma_fence_remove_callback
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 2:40 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Chris Wilson (2020-07-15 13:21:43)
> > Quoting Daniel Vetter (2020-07-15 13:10:22)
> > > On Wed, Jul 15, 2020 at 11:49:05AM +0100, Chris Wilson wrote:
> > > > When waiting with a callback on the stack, we must remove the callback
> > > > upon wait completion. Since this will be notified by the fence signal
> > > > callback, the removal often contends with the fence->lock being held by
> > > > the signaler. We can look at the list entry to see if the callback was
> > > > already signaled before we take the contended lock.
> > > >
> > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > ---
> > > >  drivers/dma-buf/dma-fence.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > > index 8d5bdfce638e..b910d7bc0854 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -420,6 +420,9 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
> > > >       unsigned long flags;
> > > >       bool ret;
> > > >
> > > > +     if (list_empty(&cb->node))
> > >
> > > I was about to say "but the races" but then noticed that Paul fixed
> > > list_empty to use READ_ONCE like 5 years ago :-)
> >
> > I'm always going "when exactly do we need list_empty_careful()"?
> >
> > We can rule out a concurrent dma_fence_add_callback() for the same
> > dma_fence_cb, as that is a lost cause. So we only have to worry about
> > the concurrent list_del_init() from dma_fence_signal_locked(). So it's
> > the timing of
> >         list_del_init(): WRITE_ONCE(list->next, list)
> > vs
> >         READ_ONCE(list->next) == list
> > and we don't need to care about the trailing instructions in
> > list_del_init()...
> >
> > Wait that trailing instruction is actually important here if the
> > dma_fence_cb is on the stack, or other imminent free.
> >
> > Ok, this does need to be list_empty_careful!

Hm, tbh I'm not really clear what list_empty_careful does on top.
Seems to lack READ_ONCE, so either some really big trickery with
dependencies is going on, or I'm not even sure how this works without
locks.

I've now stared at list_empty_careful and a bunch of users quite a
bit, and I have now idea when you'd want to use it. Lockless you want
a READ_ONCE I think and a simple check, so list_empty. And just accept
that any time you race you'll go into the locked slowpath for "list
isn't empty". Also only works if the list_empty case is the "nothing
to do, job already done" case, since the other one just isn't
guaranteed to be accurate.

list_empty_careful just wraps a bunch more magic around that will make
this both worse, and more racy (if the compiler feels creative)
because no READ_ONCE or anything like that. I don't get what that
thing is for ...

> There's a further problem in that we call INIT_LIST_HEAD on the
> dma_fence_cb before the signal callback. So even if list_empty_careful()
> confirms the dma_fence_cb to be completely decoupled, the containing
> struct may still be inuse.

The kerneldoc of dma_fence_remove_callback() already has a very stern
warning that this will blow up if you don't hold a full reference or
otherwise control the lifetime of this stuff. So I don't think we have
to worry about any of that. Or do you mean something else?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
