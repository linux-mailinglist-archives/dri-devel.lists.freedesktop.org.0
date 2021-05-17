Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A69386B19
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA976EA83;
	Mon, 17 May 2021 20:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DB56EA83
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:15:54 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so6675213otg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qhN2FfBnzcOD4RhuPKOBjmcoT3KQPo6nzUn3iBe0bJc=;
 b=WQz99USgsA5B9ykTazB6AHdUqcrHMTPWI28J0zu4Pz0DjhhVv0SVgMibcULC9xJCh7
 LDJcZsXzjtCqvlrL3FLFG3x5vvCsSEm6WJSRGgux6/CZKzndDa4xNo8n+oyH+YYurAVD
 n+82zn8bxY0paqIrIGXysj0N7DUp2p0wmoat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qhN2FfBnzcOD4RhuPKOBjmcoT3KQPo6nzUn3iBe0bJc=;
 b=ZM0QKVkZCkqpVp1xkHyJ2K3BR0UEygWTSyO1Y6hZ0Zn4rYOdR7Q5K00pzeZXiow1Vv
 AhaP17/GyGeHHHE2F+eeuc10HW3x9hw3YlsZBiL3OIC3XpfbpbikskGpjVvmEx20SnF/
 Mi191yooxYa00tsno7+rLFi7xP9qIMPAelYsEGK3xcx8xB/l7J/qbwWz2rIRrCwZiO8I
 g6EIwk9VnINX+nv/KveWdRxANRsmKiqcJTvT9tI/TOBGZMZscbizsR83piiQy4o5N3Ec
 wRce8jeh0qkmboDbnFZI3a1wT9y9fABOQ0YZHXc5WeaApi1R63PoDVFlY48X/6kBd1C7
 8Ugg==
X-Gm-Message-State: AOAM533wi9n/MsZDRbTlMG5FnY3HIHmXwi8/+Su9IRyWQW+4ZLdhPniS
 vl/jaJC/5YIBD+u5pE1dT7nf6DvV0YVYhnmtoLs1kA==
X-Google-Smtp-Source: ABdhPJz4axAeh2q7wKMEWb0uR1Wr7MtfD2l6KHacw7T+PwitcHv5xiexkvp0l3tvU3x7yMW7ZAQMgGSZ20HxnSOHF5k=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr1053491otq.303.1621282553868; 
 Mon, 17 May 2021 13:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
In-Reply-To: <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 22:15:42 +0200
Message-ID: <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Jason Ekstrand <jason@jlekstrand.net>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 9:38 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> > On Mon, May 17, 2021 at 04:11:18PM +0200, Christian K=C3=B6nig wrote:
> >> We had a long outstanding problem in amdgpu that buffers exported to
> >> user drivers by DMA-buf serialize all command submissions using them.
> >>
> >> In other words we can't compose the buffer with different engines and
> >> then send it to another driver for display further processing.
> >>
> >> This was added to work around the fact that i915 didn't wanted to wait
> >> for shared fences in the dma_resv objects before displaying a buffer.
> >>
> >> Since this problem is now causing issues with Vulkan we need to find a
> >> better solution for that.
> >>
> >> The patch set here tries to do this by adding an usage flag to the
> >> shared fences noting when and how they should participate in implicit
> >> synchronization.
> > So the way this is fixed in every other vulkan driver is that vulkan
> > userspace sets flags in the CS ioctl when it wants to synchronize with
> > implicit sync. This gets you mostly there. Last time I checked amdgpu
> > isn't doing this, and yes that's broken.
>
> And exactly that is a really bad approach as far as I can see. The
> Vulkan stack on top simply doesn't know when to set this flag during CS.

Adding Jason for the Vulkan side of things, because this isn't how I
understand this works.

But purely form a kernel pov your patches are sketchy for two reasons:

- we reinstate the amdgpu special case of not setting exclusive fences

- you only fix the single special case of i915 display, nothing else

That's not how a cross driver interface works. And if you'd do this
properly, you'd be back to all the same sync fun you've orignally had,
with all the same fallout.

> That's also the reason the Valve guys came up with a solution where each
> BO gets a flag for explicit sync, but that only works for exports and
> not for imports.
>
> > I915 and iirc msm has explicit flags for this, panfrost was designed to
> > support this correctly from the start (also with flags I think). That's=
 at
> > least what I remember from all the discussions at XDC and #dri-devel, b=
ut
> > didn't check the code again to give you the list of uapi flags you need
> > for each driver.
> >
> > The other piece is making sure you're only picking up implicit fences w=
hen
> > you should, and not any later ones, for which Jason has a solution:
> >
> > https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekst=
rand.net/
>
> Yes, I helped with that as well. But I think that this is just another
> workaround without really addressing the underlying problem.
>
> > If amdgpu isn't using those, then you will suffer from
> > over-synchronization in vulkan and pay a price. The entire point of vul=
kan
> > is that you pick up sync points very explicitly, and we also need to ha=
ve
> > very explicit uapi for userspace to pick up/set the implicit fences.
> >
> > Trying to paper over this with more implicit magic is imo just wrong, a=
nd
> > definitely not the long term explicit sync model we want.
>
> I completely disagree.
>
> In my opinion the implicit sync model we have for dma_resv currently is
> just not well designed at all, since it always requires cooperation from
> userspace.
>
> In other words you need to know when to enable implicit sync in
> userspace and that information is simply not present all of the time.
>
> What we have done here is just keeping the old reader/writer flags i915,
> radeon and nouveau once had and pushed that out to everybody else making
> the assumption that everybody would follow that without documenting the
> actual rules of engagement you need to follow here.
>
> That was a really big mistake and we should try to fix that sooner or
> later. The only other clean alternative I see is to use a flag on the
> exporter to tell the importer if it should sync to shared fences or not.
>
> Additional to that I'm perfectly fine with implicit sync. Explicit sync
> certainly has some use cases as well, but I don't see it as an absolute
> advantage over the implicit model.

Ok this stops making sense. Somehow you claim userspace doesn't know
when to sync, but somehow the kernel does? By guessing, and getting it
wrong mostly, except for the one case that you benchmarked?

Aside from silly userspace which exports a buffer to a dma-buf, but
then never imports it anywhere else, there isn't a case I know of
where the kernel actually knows more than userspace. But there's lots
of cases where the kernel definitely knows less, especially if
userspace doesn't tell it about what's going on with each rendering
and buffer.

So here's the 2 things you need to make this work like every other driver:

1. A way to set the explicit fence on a buffer. CS ioctl is perfectly
fine, but also can be seperate. Userspace uses this only on a) shared
buffers b) when there's a flush/swap on that shared buffer. Not when
rendering any of the interim stuff, that only leads to oversync.
Anything non-shared is handled explicitly in userspace (at least for
modern-ish drivers). This is the only thing that ever sets an
exclusive fence (aside from ttm moving buffers around ofc).

2. A way to sync with the implicit fences, either all of them (for
upcoming write access) or just the write fence (for read access). At
first we thought it's good enough to do this in the CS ioctl, but
that's a wee bit too late, hence the patches from Jason. My
understanding is that vulkan converts this into an vk syncobj/fence of
some sorts, so really can't make this more explicit and intentional
than that.

None of this is something the kernel has the slightest idea about when
it happens, so you have to have explicit uapi for it. Trying to fake
it in the kernel just doesn't work.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
