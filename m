Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D738B6AA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03B66E42E;
	Thu, 20 May 2021 19:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B80A6E42E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:04:37 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k14so23490115eji.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mTXdI2drfoWUPKF0t7qmTILSukRu3ePco32ol8KZ9AU=;
 b=nz1dVW57d4Ho8SiL1NzxbImOo7g6zonoEFRVMJ/fCqb9xKIZu5ozHCnUzX1jgYe4U5
 nBiINO/wn/Bx6WDa9Cszu04E4a0Kh3xudhxmnQZ0jK1eSQzlaIQG2zX09Vpr3Wl2QVAR
 TaBVoihTbOEETb2n2XrlOphQpWsEm7TK7CYA3AwqhRU4ggzkyPCMpNSEuFtO88GbVyrc
 v2RgXH84uP2oLg44UXSfsRmbXvR+Wb705H3Lhn/ufCyj9d98UvpaLMK3i8NGtqYI3DV7
 DwgZK2iQGxOt5eakEoPz0sMGczJKNn5mXAPnNfgNzeqJDREaOG3uL7R3bW4D+Xk1Flii
 yq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mTXdI2drfoWUPKF0t7qmTILSukRu3ePco32ol8KZ9AU=;
 b=eUt0Bg736iv6vukx2rMC+rljcaQrVJFjSbFjrcIAK6cLWyFwsrsn8Tnqm5RpPQtRzf
 ox8L0SI8pPOXUSbX+YqPE1qlEJ7VLGY4epA/SWi+QjdALml7yYAO2mb54Pr5yzCHWO7u
 uw2oebTuWV1kVp5/ZS0N358rQJMN7v5rDLw/nKtf4ZOOr3CZSeOjML4qynRIRf+6NMgd
 2QVMSLLg0IpkOyXTNfpoxC6z4NqJf1gPnoBG8G69AYt0AmYenjlFwG1gSJXhaG/iFZmF
 iRBgsSXGDt8NJ60K7MuQh2RDCMJDuBF/q68Sq72Qb3PSM/ulNCD7mpi8dgO3t5NbADKk
 +kzA==
X-Gm-Message-State: AOAM532/EM7FHeymoV86ke+lCpsAp+dvmVtB7R7HYjBn3ViuJdhjzGgS
 1LtQXuJeRNrBdyrUsEpwTbh+/tOg3kgKiUL8dqrCHQ==
X-Google-Smtp-Source: ABdhPJwyRqIB63CV46hL0OvemvV1s2f7JdrKiDtsw8KO76Rop+39nddmuRBGt2yMU8JBCow63FWKAo9aXMvGLBG1Tto=
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr6233422ejb.175.1621537475730; 
 Thu, 20 May 2021 12:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
 <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
 <a8d0acd9-6a0e-58bb-1f2d-e85f00ad9677@gmail.com>
 <CAOFGe96tzhp+=NX8TdPmGpq8L+FrQcOzgPUDdtog4MQ72RJv2w@mail.gmail.com>
In-Reply-To: <CAOFGe96tzhp+=NX8TdPmGpq8L+FrQcOzgPUDdtog4MQ72RJv2w@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 20 May 2021 14:04:24 -0500
Message-ID: <CAOFGe94Ck3JT2JZ+6-pFrwLx6XEoz8Dq5hReccy4F2_dzRt_oA@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 12:23 PM Jason Ekstrand <jason@jlekstrand.net> wrot=
e:
>
> On Thu, May 20, 2021 at 5:50 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 20.05.21 um 09:55 schrieb Daniel Vetter:
> > > On Wed, May 19, 2021 at 5:48 PM Michel D=C3=A4nzer <michel@daenzer.ne=
t> wrote:
> > >> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
> > >>> On Wed, May 19, 2021 at 5:52 AM Michel D=C3=A4nzer <michel@daenzer.=
net> wrote:
> > >>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> > >>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> > >>>>>> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> > >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> > >>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> > >>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>>>>>
> > >>>>>>>>> And as long as we are all inside amdgpu we also don't have an=
y oversync,
> > >>>>>>>>> the issue only happens when we share dma-bufs with i915 (rade=
on and
> > >>>>>>>>> AFAIK nouveau does the right thing as well).
> > >>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anym=
ore and
> > >>>>>>>> have to use the one atomic helpers use. Which is also the one =
that
> > >>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf=
 ioctl,
> > >>>>>>>> so as soon as that lands and someone starts using it, somethin=
g has to
> > >>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just wh=
en it's
> > >>>>>>>> shared with another device.
> > >>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI c=
hange.

I just re-sent my dma-buf sync_file import/export series.  Assuming we
can sort out what implicit sync looks like on the inside of dma-buf,
would that alleviate some of your uAPI fears?  The idea would be that
radeonsi and RADV would use amdgpu explicit sync primitives for
everything and then, at the very end, fetch a sync_file and stuff it
in the dma-buf's implicit sync container.  No nasty new uAPI for you.
We still get implicit sync.  Everyone wins?

Of course, that still leaves the question of what read and write
fences are, what they mean, and where they go in the dma_resv.  But
I'm trying to separate problems here.

--Jason


> > >>>>>>> This doesn't works for amdgpu at all for the reasons outlined a=
bove.
> > >>>>>> Uh that's really not how uapi works. "my driver is right, everyo=
ne
> > >>>>>> else is wrong" is not how cross driver contracts are defined. If=
 that
> > >>>>>> means a perf impact until you've fixed your rules, that's on you=
.
> > >>>>>>
> > >>>>>> Also you're a few years too late with nacking this, it's already=
 uapi
> > >>>>>> in the form of the dma-buf poll() support.
> > >>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
> > >>>>> there.  It just lets you take a snap-shot of a wait instead of do=
ing
> > >>>>> an active wait which might end up with more fences added dependin=
g on
> > >>>>> interrupts and retries.  The dma-buf poll waits on all fences for
> > >>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uA=
PI.
> > >>>> Note that the dma-buf poll support could be useful to Wayland comp=
ositors for the same purpose as Jason's new ioctl (only using client buffer=
s which have finished drawing for an output frame, to avoid missing a refre=
sh cycle due to client drawing), *if* it didn't work differently with amdgp=
u.
> > >>>>
> > >>>> Am I understanding correctly that Jason's new ioctl would also wor=
k differently with amdgpu as things stand currently? If so, that would be a=
 real bummer and might hinder adoption of the ioctl by Wayland compositors.
> > >>> My new ioctl has identical semantics to poll().  It just lets you t=
ake
> > >>> a snapshot in time to wait on later instead of waiting on whatever
> > >>> happens to be set right now.  IMO, having identical semantics to
> > >>> poll() isn't something we want to change.
> > >> Agreed.
> > >>
> > >> I'd argue then that making amdgpu poll semantics match those of othe=
r drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely=
 that the ioctl will be widely adopted.
> > > This seems backwards, because that means useful improvements in all
> > > other drivers are stalled until amdgpu is fixed.
> >
> > Well there is nothing to fix in amdgpu, what we need to is to come up
> > with an DMA-buf implicit syncing model which works for everyone.
> >
> > I've pointed this problem out at FOSDEM roughly 6 years ago, before
> > DMA-buf was even merged upstream and way before amdgpu even existed. An=
d
> > the response was yeah, maybe we need to look at this as well.
> >
> > Over the years I've mentioned now at least 5 times that this isn't goin=
g
> > to work in some situations and came up with different approaches how to
> > fix it.
> >
> > And you still have the nerves to tell me that this isn't a problem and
> > we should fix amdgpu instead? Sorry, but I'm really running out of idea=
s
> > how to explain why this isn't working for everybody.
>
> I'm trying really hard to not fuel a flame war here but I tend to lean
> Daniel's direction on this.  Stepping back from the individual needs
> of amdgpu and looking at things from the PoV of Linux as a whole, AMD
> being a special snowflake here is bad.  I think we have two problems:
> amdgpu doesn't play by the established rules, and the rules don't work
> well for amdgpu.  We need to solve BOTH problems.  Does that mean we
> need to smash something into amdgpu to force it into the dma-buf model
> today?  Maybe not; stuff's working well enough, I guess.  But we can't
> just rewrite all the rules and break everyone else either.
>
> > That amdgpu wants to be special is true, but it is a fundamental proble=
m
> > that we have designed the implicit sync in DMA-buf only around the need=
s
> > of DRM drivers at that time instead of going a step back and saying hey
> > what would be an approach which works for everyone.
>
> How else was it supposed to be designed?  Based on the needs of
> non-existent future drivers?  That's just not fair.  We (Intel) are
> being burned by various aspects of dma-buf these days too.  It does no
> good to blame past developers or our past selves for not knowing the
> future.  It sucks but it's what we have.  And, to move forward, we
> need to fix it.  Let's do that.
>
> My concern with the flags approach as I'm beginning to digest it is
> that it's a bit too much of an attempt to rewrite history for my
> liking.  What do I mean by that?  I mean that any solution we come up
> with needs ensure that legacy drivers and modern drivers can play
> nicely together.  Either that or we need to modernize all the users of
> dma-buf implicit sync.  I really don't like the "as long as AMD+Intel
> works, we're good" approach.
>
> > You just need to apply my example from FOSDEM with ring buffers in a
> > single BO to the DMA-buf implicit sync model and immediately see how it
> > falls apart.
> >
> > > I think we need agreement on what the rules are, reasonable plan to
> > > get there, and then that should be enough to unblock work in the wide=
r
> > > community. Holding the community at large hostage because one driver
> > > is different is really not great.
> >
> > Well forcing a drivers into a synchronization model not ideal for their
> > hardware isn't great either.
>
> As I said above, we're feeling the pain too.
>
> --Jason
