Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFA3A3495
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3156E0AB;
	Thu, 10 Jun 2021 20:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0506E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:09:59 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id i6so1095192ybm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mGXTVxUaVXWKPTiYzxUjEsvPKDu3sfvYPmlTlLThP8A=;
 b=wbOu7cr9NUhpa9CieoDwCJSo425nvLJaXZPFDguxP3u6wp0c5foU48lWOBmWfE0l83
 x6O6nHFl+VX7GMIU1bre96TQTe+Pzzf6X7rB/pFSeHmEbtuj9sWLNnlBWsvwf8WMiZwU
 6aCWpoCYE77oxYx6ZWs/zcfz7/FhQdOcVqTrErUNE31NNMC0pN4RanbtNjcOPHxk9Iud
 6DjS2rvPmhI5DS07462zPrFQqKAiQJ5mHRKJ9kTOjYMOF7iXSc/M9R14M1POF+oagqEB
 ykAuLbmrrYH9AH2DRyxv5MKXHprRF3eXXY6/Jf1v6/hY3flWTW32R2WZTzszFYEY3SBO
 YELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mGXTVxUaVXWKPTiYzxUjEsvPKDu3sfvYPmlTlLThP8A=;
 b=PTVkjaY/u6L287l/dAeAWQnlTObaKh+JSqtuAKSYZQx+mJdzHjebJP8Q9x13DNFChe
 QlSo+lwbEskJsH+p3XtJBO20nEytSf/vuhyyO2caW+zdHGnx4+vAPww8U4Gw2z7kKVJa
 kwgrFWP5+aVbFDEQvzwElOTYk+WJKI1b74s6bmArURqBDIU9rFQAwwfhF/W8UcFdlv2L
 C/i6wWSvM8qMbenR/rFfzxqev/ycJnDKHUmlrw+hJa1SHZN2hN9Y/YCPiXlc7mjeI8GX
 QXfh7tk8V7vvfdpl0juJyIAqG+JKOYdL/BjDXmMX1AuT/6gfxqM30PhZ9miy9BFdtHaA
 rVhg==
X-Gm-Message-State: AOAM533ytUQP/WlNXFd6N6RlPcfCqSEtv5GkRJomHIVnOV/sMkvAohc/
 9Yf/Jr4h93/9sIjd8P9k2WfSotokM42ruJV0pbDL5w==
X-Google-Smtp-Source: ABdhPJye+q2A+te5fLc0UhIDoCDqlpp6wKdABFJG/RvnUM0kV4wCk+hIACNK0Cg4/NYtma1h4pnD0CMwYgVZIwV5NTI=
X-Received: by 2002:a25:8804:: with SMTP id c4mr693269ybl.469.1623355798361;
 Thu, 10 Jun 2021 13:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
In-Reply-To: <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 15:09:47 -0500
Message-ID: <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> > On Thu, Jun 10, 2021 at 11:39 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > > Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
> > > > On 09/06/2021 22:29, Jason Ekstrand wrote:
> > > >>
> > > >> We've tried to keep it somewhat contained by doing most of the har=
d work
> > > >> to prevent access of recycled objects via dma_fence_get_rcu_safe()=
.
> > > >> However, a quick grep of kernel sources says that, of the 30 insta=
nces
> > > >> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe(=
).
> > > >> It's likely there bear traps in DRM and related subsystems just wa=
iting
> > > >> for someone to accidentally step in them.
> > > >
> > > > ...because dma_fence_get_rcu_safe apears to be about whether the
> > > > *pointer* to the fence itself is rcu protected, not about the fence
> > > > object itself.
> > >
> > > Yes, exactly that.
>
> The fact that both of you think this either means that I've completely
> missed what's going on with RCUs here (possible but, in this case, I
> think unlikely) or RCUs on dma fences should scare us all.

Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
such,  I'd like to ask a slightly different question:  What are the
rules about what is allowed to be done under the RCU read lock and
what guarantees does a driver need to provide?

I think so far that we've all agreed on the following:

 1. Freeing an unsignaled fence is ok as long as it doesn't have any
pending callbacks.  (Callbacks should hold a reference anyway).

 2. The pointer race solved by dma_fence_get_rcu_safe is real and
requires the loop to sort out.

But let's say I have a dma_fence pointer that I got from, say, calling
dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
with it under the RCU lock?  What assumptions can I make?  Is this
code, for instance, ok?

rcu_read_lock();
fence =3D dma_resv_excl_fence(obj);
idle =3D !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
rcu_read_unlock();

This code very much looks correct under the following assumptions:

 1. A valid fence pointer stays alive under the RCU read lock
 2. SIGNALED_BIT is set-once (it's never unset after being set).

However, if it were, we wouldn't have dma_resv_test_singnaled(), now
would we? :-)

The moment you introduce ANY dma_fence recycling that recycles a
dma_fence within a single RCU grace period, all your assumptions break
down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
also have a little i915_request recycler to try and help with memory
pressure scenarios in certain critical sections that also doesn't
respect RCU grace periods.  And, as mentioned multiple times, our
recycling leaks into every other driver because, thanks to i915's
choice, the above 4-line code snippet isn't valid ANYWHERE in the
kernel.

So the question I'm raising isn't so much about the rules today.
Today, we live in the wild wild west where everything is YOLO.  But
where do we want to go?  Do we like this wild west world?  So we want
more consistency under the RCU read lock?  If so, what do we want the
rules to be?

One option would be to accept the wild-west world we live in and say
"The RCU read lock gains you nothing.  If you want to touch the guts
of a dma_fence, take a reference".  But, at that point, we're eating
two atomics for every time someone wants to look at a dma_fence.  Do
we want that?

Alternatively, and this what I think Daniel and I were trying to
propose here, is that we place some constraints on dma_fence
recycling.  Specifically that, under the RCU read lock, the fence
doesn't suddenly become a new fence.  All of the immutability and
once-mutability guarantees of various bits of dma_fence hold as long
as you have the RCU read lock.

--Jason
