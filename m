Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710932F6BD0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 21:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323E6E072;
	Thu, 14 Jan 2021 20:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735C36E072
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 20:09:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c124so5554233wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KnWvL+lo2bL3aayR6CrbRW4jvR2YGyM7wpVB5PU5/Z8=;
 b=cncknWeMUpk86ytoE2TAdMqoB7uCYwpSWKxpARfxRry/yQhDi7d4fJvCGVTIMN4ab3
 IUXuv297bINoFwINSZOTN8D75F/RunbaheFThg0kBY1p1duBeknf1xKtEFrS+ZQ69KxR
 oj4DQP5Fp16gqPRz/nRWPnHIJfvN4VmGSPFHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KnWvL+lo2bL3aayR6CrbRW4jvR2YGyM7wpVB5PU5/Z8=;
 b=WOeqEHGhqRdsWj+mUymfWezjuMjU68RvQ9xt6GyzoLkQ4WtkEIIkrXSnqCZ+aqL7Je
 1Q12ydFQPwZK7S5GzYyAmLIGERypX7Bm14dAqvDUgaGkkhCuaLG939OVZMRuCviZZs0q
 o95DZD8jRaTgZZ8deZWo6hSsSnnm+Dimf6tJ1kC9edl8vJTc8QtR9x/qT4q5dpJiM/go
 m3uGck4PsrCacWOkK+So+u9USO8zh1aOEHDvNerEHnvokpwur9RZOhn+1GO9l3oRRN4U
 CTym65Os7+5ywYD0Q4EGACevp/7590cJ1AXecyXEfmhf3RGhuxUwVvIPxaHlkJzpd+ly
 yAJA==
X-Gm-Message-State: AOAM530nyUnj5Sxsnk2V8CxUsUcxUEK7KowTjzAHwCQjaXzqVmpQwguT
 M9jyintC2LieeLaEXUnIh04NWA==
X-Google-Smtp-Source: ABdhPJxywsdX6YEsTA83hSOkYgSHfCIua/N0TKcxfdf3PiHAJvCDIKSSZbik4AV/LMu9NjkykvrZRA==
X-Received: by 2002:a1c:1d09:: with SMTP id d9mr5387224wmd.125.1610654965154; 
 Thu, 14 Jan 2021 12:09:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r20sm9485268wmh.15.2021.01.14.12.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:09:24 -0800 (PST)
Date: Thu, 14 Jan 2021 21:09:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory
 manager to KFD)
Message-ID: <YACk8s97KW8I7554@phenom.ffwll.local>
References: <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
 <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
 <CAKMK7uEWTGv69w4qDFtWZuX1OmcRi8hejQKuZnm8gpxmeRrCFw@mail.gmail.com>
 <0d400766-d000-aecc-747d-b5f2a2df2c2d@gmail.com>
 <CAKMK7uEgHpzGBKE5vTEpfvqgoK2DrQW4KGbvXMsAF_n85opbmg@mail.gmail.com>
 <55d283fc-10e1-d3de-0c2c-88e16c3af9c0@amd.com>
 <CAKMK7uGZbak7P-icLhPd=koExWmLHjnm0qJupd2toHuhGO7DZg@mail.gmail.com>
 <1591bedd-95b5-8a75-df40-f59cf8f35656@amd.com>
 <CAKMK7uHaOBzm3wNf7ZE7TMgZ4tNQKmmihQXQ-vD0TME6DMQs8Q@mail.gmail.com>
 <221c52f0-6fb2-b863-d00c-e60f0fa3c45b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <221c52f0-6fb2-b863-d00c-e60f0fa3c45b@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 08:08:06PM +0100, Christian K=F6nig wrote:
> Am 14.01.21 um 17:36 schrieb Daniel Vetter:
> > On Thu, Jan 14, 2021 at 5:01 PM Christian K=F6nig
> > <christian.koenig@amd.com> wrote:
> > > Am 14.01.21 um 16:40 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > So I think we have to somehow solve this in the kernel or we will=
 go in
> > > > > circles all the time.
> > > > > =

> > > > > > So from that pov I think the kernel should at most deal with an
> > > > > > hmm_fence for cross-process communication and maybe some standa=
rd wait
> > > > > > primitives (for userspace to use, not for the kernel).
> > > > > > =

> > > > > > The only use case this would forbid is using page faults for le=
gacy
> > > > > > implicit/explicit dma_fence synced workloads, and I think that's
> > > > > > perfectly ok to not allow. Especially since the motivation here=
 for
> > > > > > all this is compute, and compute doesn't pass around dma_fences
> > > > > > anyway.
> > > > > As Alex said we will rather soon see this for gfx as well and we =
most
> > > > > likely will see combinations of old dma_fence based integrated gr=
aphics
> > > > > with new dedicated GPUs.
> > > > > =

> > > > > So I don't think we can say we reduce the problem to compute and =
don't
> > > > > support anything else.
> > > > I'm not against pagefaults for gfx, just in pushing the magic into =
the
> > > > kernel. I don't think that works, because it means we add stall poi=
nts
> > > > where usespace, especially vk userspace, really doesn't want it. So
> > > > same way like timeline syncobj, we need to push the compat work into
> > > > userspace.
> > > > =

> > > > There's going to be a few stall points:
> > > > - fully new stack, we wait for the userspace fence in the atomic
> > > > commit path (which we can, if we're really careful, since we pin all
> > > > buffers upfront and so there's no risk)
> > > > - userspace fencing gpu in the client, compositor protocol can pass
> > > > around userspace fences, but the compositor still uses dma_fence for
> > > > itself. There's some stalling in the compositor, which it does alre=
ady
> > > > anyway when it's collecting new frames from clients
> > > > - userspace fencing gpu in the client, but no compositor protocol: =
We
> > > > wait in the swapchain, but in a separate thread so that nothing blo=
cks
> > > > that shouldn't block
> > > > =

> > > > If we instead go with "magic waits in the kernel behind userspace's
> > > > back", like what your item 6 would imply, then we're not really
> > > > solving anything.
> > > > =

> > > > For actual implementation I think the best would be an extension of
> > > > drm_syncobj. Those already have at least conceptually future/infini=
te
> > > > fences, and we already have fd passing, so "just" need some protocol
> > > > to pass them around. Plus we could use the same uapi for timeline
> > > > syncobj using dma_fence as for hmm_fence, so also easier to transit=
ion
> > > > for userspace to the new world since don't need the new hw capabili=
ty
> > > > to roll out the new uapi and protocols.
> > > > =

> > > > That's not that hard to roll out, and technically a lot better than
> > > > hacking up dma_resv and hoping we don't end up stalling in wrong
> > > > places, which sounds very "eeeek" to me :-)
> > > Yeah, that's what I totally agree upon :)
> > > =

> > > My idea was just the last resort since we are mixing userspace sync a=
nd
> > > memory management so creative here.
> > > =

> > > Stalling in userspace will probably get some push back as well, but
> > > maybe not as much as stalling in the kernel.
> > I guess we need to have last-resort stalling in the kernel, but no
> > more than what we do with drm_syncobj future fences right now. Like
> > when anything asks for a dma_fence out of an hmm_fence drm_syncob, we
> > just stall until the hmm_fence is signalled, and then create a
> > dma_fence that's already signalled and return that to the caller.
> =

> Good idea. BTW: We should somehow teach lockdep that this materialization=
 of
> any future fence should not happen while holding a reservation lock?

Good idea, should be easy to add (although the explanation why it works
needs a comment).

> > Obviously this shouldn't happen, since anyone who's timeline aware
> > will check whether the fence has at least materialized first and stall
> > somewhere more useful for that first.
> =

> Well if I'm not completely mistaken it should help with existing stuff li=
ke
> an implicit fence for atomic modeset etc...

Modeset is special:
- we fully pin buffers before we even start waiting. That means the loop
  can't close, since no one can try to evict our pinned buffer and would
  hence end up waiting on our hmm fence. We also only unpin the after
  everything is done.

- there's out-fences, but as long as we require that the in and out
  fences are of the same type that should be all fine. Also since the
  explicit in/out fence stuff is there already it shouldn't be too hard to
  add support for syncobj fences without touching a lot of drivers - all
  the ones that use the atomic commit helpers should Just Work.

> > > Ok if we can at least remove implicit sync from the picture then the
> > > question remains how do we integrate HMM into drm_syncobj then?
> >  From an uapi pov probably just an ioctl to create an hmm drm_syncobj,
> > and a syncobj ioctl to query whether it's a hmm_fence or dma_fence
> > syncobj, so that userspace can be a bit more clever with where it
> > should stall - for an hmm_fence the stall will most likely be directly
> > on the gpu in many cases (so the ioctl should also give us all the
> > details about that if it's an hmm fence).
> > =

> > I think the real work is going through all the hardware and trying to
> > figure out what the common ground for userspace fences are. Stuff like
> > can they be in system memory, or need something special (wc maybe, but
> > I hope system memory should be fine for everyone), and how you count,
> > wrap and compare. I also have no idea how/if we can optimized cpu
> > waits across different drivers.
> =

> I think that this is absolutely hardware dependent. E.g. for example AMD
> will probably have handles, so that the hardware scheduler can counter
> problems like priority inversion.
> =

> What we should probably do is to handle this similar to how DMA-buf is
> handled - if it's the same driver and device the drm_syncobj we can use t=
he
> same handle for both sides.
> =

> If it's different driver or device we go through some CPU round trip for =
the
> signaling.

I think we should try to be slightly more standardized, dma-buf was a bit
much free-for all. But maybe that's not possible really, since we tried
this with dma-fence and ended up with exactly the situation you're
describing for hmm fences.

> > Plus ideally we get some actual wayland protocol going for passing
> > drm_syncobj around, so we can test it.
> =

> And DRI3 :)
 =

Yeah. Well probably Present extension, since that's the thing that's doing
the flipping. At least we only have to really care about XWayland for
that, with this time horizon at least.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
