Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1A38C34B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EEE6F603;
	Fri, 21 May 2021 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631836F603
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:36:36 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id o9so17695354ilh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l3oLBK85Xc9sxjqDc8Ejf4r8ZgSY87eGOCStaKKZso4=;
 b=KzxhouJCOXKa0VBX0a58OAXPafdrzvUOAEsWuHvtfQJl5GWT4yNvFRb0XKfdYmqOb1
 vXtNc9Tz7u9lgtBB4bioh89Q1/HqMiup8Xy0BprjAgBsCLOGw9DEXwvAu92QTCc7zwy8
 HmDGKi9zOfc1xVaps3nBaf2+WB774uaX6Az1f1iQdhZEzWn/M+WTtAu45xpXIm+5027g
 vfFXr6gh5w8ny39MUeEgot1Z4xbVCVxYrOZqpXWb2WxPhtIG3leKSvtADLsXInVB/wbt
 JppKB25ZojqhjzvJyXbyGUSrRlGEPX100MrESR8hbaMfPQ+cNgPCmiAlFV1WsoQrPLhq
 Z8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l3oLBK85Xc9sxjqDc8Ejf4r8ZgSY87eGOCStaKKZso4=;
 b=Ui0z1Y3d9gQyy9HogHu8CCYA4xAsezr0Nr3y/0mNgd5JWmXHFj0AAjmeKHS+uQtcjU
 hXmFIoQyywXq+Rn9BAVIVtVIp9OwdjbBJ8xZizmjm+9gKvPpa4i4+hmBQdgLHd+scc72
 0ot9myaOE6pN075A8hVSQPU+51iwkhI3kL1pJjY2I4t46KBSbLkCY0Va2wGoRCaE9/Ko
 7ZFSse0WtlhB9u0unBldvSiKsHNurrAbcWUK5ZvYtojSJGmRBsSZbIy6EewroIBUhxBe
 yzDm+P4NbHpxnMvHnX0PlB4Ve8ss24fGKKKE2mnpgLNb7H5ECeZmEB2IBT9LtV6dCg/i
 8PhQ==
X-Gm-Message-State: AOAM530KckFF8mHWgFLG4UrSD/eBbJbCJhQVP2lPiDnA4Il86POBSp1I
 eI9N0zquI1FTxl6O9R/i97toeEeBlfpXginh+BdIXg==
X-Google-Smtp-Source: ABdhPJy6YmWRkpGp9299z1CriSAt0pw2qIS/eJx4YdZh4PRoG/KWp9vmuH9RTNf83VIeb4p8ZHVl6h2TkacF+5q/KJU=
X-Received: by 2002:a05:6e02:1aa7:: with SMTP id
 l7mr10343670ilv.307.1621589795582; 
 Fri, 21 May 2021 02:36:35 -0700 (PDT)
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
 <CAOFGe94Ck3JT2JZ+6-pFrwLx6XEoz8Dq5hReccy4F2_dzRt_oA@mail.gmail.com>
 <CAKMK7uHp8SanT-Eu-HZP-R65nYCPoa=0sCDwyLXBjxxQcOgY3g@mail.gmail.com>
In-Reply-To: <CAKMK7uHp8SanT-Eu-HZP-R65nYCPoa=0sCDwyLXBjxxQcOgY3g@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 21 May 2021 11:36:37 +0200
Message-ID: <CAP+8YyGkW3mqd2_tF6Um+TA8A2qw_fWJ6fVk2LkWu_zW-L4-Zw@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 9:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 20, 2021 at 9:04 PM Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> >
> > On Thu, May 20, 2021 at 12:23 PM Jason Ekstrand <jason@jlekstrand.net> =
wrote:
> > >
> > > On Thu, May 20, 2021 at 5:50 AM Christian K=C3=B6nig
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >
> > > > Am 20.05.21 um 09:55 schrieb Daniel Vetter:
> > > > > On Wed, May 19, 2021 at 5:48 PM Michel D=C3=A4nzer <michel@daenze=
r.net> wrote:
> > > > >> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
> > > > >>> On Wed, May 19, 2021 at 5:52 AM Michel D=C3=A4nzer <michel@daen=
zer.net> wrote:
> > > > >>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> > > > >>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.c=
h> wrote:
> > > > >>>>>> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> > > > >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > >>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> > > > >>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> > > > >>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > >>>>>>>>
> > > > >>>>>>>>> And as long as we are all inside amdgpu we also don't hav=
e any oversync,
> > > > >>>>>>>>> the issue only happens when we share dma-bufs with i915 (=
radeon and
> > > > >>>>>>>>> AFAIK nouveau does the right thing as well).
> > > > >>>>>>>> Yeah because then you can't use the amdgpu dma_resv model =
anymore and
> > > > >>>>>>>> have to use the one atomic helpers use. Which is also the =
one that
> > > > >>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma=
_buf ioctl,
> > > > >>>>>>>> so as soon as that lands and someone starts using it, some=
thing has to
> > > > >>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not jus=
t when it's
> > > > >>>>>>>> shared with another device.
> > > > >>>>>>> Yeah, and that is exactly the reason why I will NAK this uA=
PI change.
> >
> > I just re-sent my dma-buf sync_file import/export series.  Assuming we
> > can sort out what implicit sync looks like on the inside of dma-buf,
> > would that alleviate some of your uAPI fears?  The idea would be that
> > radeonsi and RADV would use amdgpu explicit sync primitives for
> > everything and then, at the very end, fetch a sync_file and stuff it
> > in the dma-buf's implicit sync container.  No nasty new uAPI for you.
> > We still get implicit sync.  Everyone wins?
>
> You still need the implicit fencing opt-out, which currently amdgpu
> lacks completely.

I think one of my big questions is to what extent we need another
opt-out in amdgpu (I mean I certainly want the submission level
opt-out but I don't think it is blocking)? Currently amdgpu has two
opt outs at buffer creation time:

1) AMDGPU_GEM_CREATE_EXPLICIT_SYNC
2) AMDGPU_GEM_CREATE_VM_ALWAYS_VALID

Together implicit sync is mostly disabled for Vulkan outside of the
WSI, allowing multiple engines simultaneously if we just use shared
fences for these (or for the latter not really any fences at the BO
level, but they are not shareable). On GL I think radeonsi now
disabled essentially all SDMA usage meaning it is pretty much
restricted to one engine at a time. Leaves video, where I'm not sure.
Maybe reference frames? On the other hand, video often involves a
process/drm-file boundary in which case the shared fences already
worked as exclusive and hence prohibit cross-engine usage.





>
> But I also thought through the security implications of the patch set
> (including the exclusive injection patch 4), and I think even with
> current amdgpu that's perfectly fine. Not very useful since the fences
> you get out aren't reflecting status accurately, but that's not a
> correctness/security issue. You'll simply hit stalls when you don't
> expect, because the kernel is allowed to throw random other exclusive
> fences in whenever it feels like.
>
> > Of course, that still leaves the question of what read and write
> > fences are, what they mean, and where they go in the dma_resv.  But
> > I'm trying to separate problems here.
>
> Yeah I'll dump my patch set for clarifying status quo tomorrow for that.
> -Daniel
>
> >
> > --Jason
> >
> >
> > > > >>>>>>> This doesn't works for amdgpu at all for the reasons outlin=
ed above.
> > > > >>>>>> Uh that's really not how uapi works. "my driver is right, ev=
eryone
> > > > >>>>>> else is wrong" is not how cross driver contracts are defined=
. If that
> > > > >>>>>> means a perf impact until you've fixed your rules, that's on=
 you.
> > > > >>>>>>
> > > > >>>>>> Also you're a few years too late with nacking this, it's alr=
eady uapi
> > > > >>>>>> in the form of the dma-buf poll() support.
> > > > >>>>> ^^  My fancy new ioctl doesn't expose anything that isn't alr=
eady
> > > > >>>>> there.  It just lets you take a snap-shot of a wait instead o=
f doing
> > > > >>>>> an active wait which might end up with more fences added depe=
nding on
> > > > >>>>> interrupts and retries.  The dma-buf poll waits on all fences=
 for
> > > > >>>>> POLLOUT and only the exclusive fence for POLLIN.  It's alread=
y uAPI.
> > > > >>>> Note that the dma-buf poll support could be useful to Wayland =
compositors for the same purpose as Jason's new ioctl (only using client bu=
ffers which have finished drawing for an output frame, to avoid missing a r=
efresh cycle due to client drawing), *if* it didn't work differently with a=
mdgpu.
> > > > >>>>
> > > > >>>> Am I understanding correctly that Jason's new ioctl would also=
 work differently with amdgpu as things stand currently? If so, that would =
be a real bummer and might hinder adoption of the ioctl by Wayland composit=
ors.
> > > > >>> My new ioctl has identical semantics to poll().  It just lets y=
ou take
> > > > >>> a snapshot in time to wait on later instead of waiting on whate=
ver
> > > > >>> happens to be set right now.  IMO, having identical semantics t=
o
> > > > >>> poll() isn't something we want to change.
> > > > >> Agreed.
> > > > >>
> > > > >> I'd argue then that making amdgpu poll semantics match those of =
other drivers is a pre-requisite for the new ioctl, otherwise it seems unli=
kely that the ioctl will be widely adopted.
> > > > > This seems backwards, because that means useful improvements in a=
ll
> > > > > other drivers are stalled until amdgpu is fixed.
> > > >
> > > > Well there is nothing to fix in amdgpu, what we need to is to come =
up
> > > > with an DMA-buf implicit syncing model which works for everyone.
> > > >
> > > > I've pointed this problem out at FOSDEM roughly 6 years ago, before
> > > > DMA-buf was even merged upstream and way before amdgpu even existed=
. And
> > > > the response was yeah, maybe we need to look at this as well.
> > > >
> > > > Over the years I've mentioned now at least 5 times that this isn't =
going
> > > > to work in some situations and came up with different approaches ho=
w to
> > > > fix it.
> > > >
> > > > And you still have the nerves to tell me that this isn't a problem =
and
> > > > we should fix amdgpu instead? Sorry, but I'm really running out of =
ideas
> > > > how to explain why this isn't working for everybody.
> > >
> > > I'm trying really hard to not fuel a flame war here but I tend to lea=
n
> > > Daniel's direction on this.  Stepping back from the individual needs
> > > of amdgpu and looking at things from the PoV of Linux as a whole, AMD
> > > being a special snowflake here is bad.  I think we have two problems:
> > > amdgpu doesn't play by the established rules, and the rules don't wor=
k
> > > well for amdgpu.  We need to solve BOTH problems.  Does that mean we
> > > need to smash something into amdgpu to force it into the dma-buf mode=
l
> > > today?  Maybe not; stuff's working well enough, I guess.  But we can'=
t
> > > just rewrite all the rules and break everyone else either.
> > >
> > > > That amdgpu wants to be special is true, but it is a fundamental pr=
oblem
> > > > that we have designed the implicit sync in DMA-buf only around the =
needs
> > > > of DRM drivers at that time instead of going a step back and saying=
 hey
> > > > what would be an approach which works for everyone.
> > >
> > > How else was it supposed to be designed?  Based on the needs of
> > > non-existent future drivers?  That's just not fair.  We (Intel) are
> > > being burned by various aspects of dma-buf these days too.  It does n=
o
> > > good to blame past developers or our past selves for not knowing the
> > > future.  It sucks but it's what we have.  And, to move forward, we
> > > need to fix it.  Let's do that.
> > >
> > > My concern with the flags approach as I'm beginning to digest it is
> > > that it's a bit too much of an attempt to rewrite history for my
> > > liking.  What do I mean by that?  I mean that any solution we come up
> > > with needs ensure that legacy drivers and modern drivers can play
> > > nicely together.  Either that or we need to modernize all the users o=
f
> > > dma-buf implicit sync.  I really don't like the "as long as AMD+Intel
> > > works, we're good" approach.
> > >
> > > > You just need to apply my example from FOSDEM with ring buffers in =
a
> > > > single BO to the DMA-buf implicit sync model and immediately see ho=
w it
> > > > falls apart.
> > > >
> > > > > I think we need agreement on what the rules are, reasonable plan =
to
> > > > > get there, and then that should be enough to unblock work in the =
wider
> > > > > community. Holding the community at large hostage because one dri=
ver
> > > > > is different is really not great.
> > > >
> > > > Well forcing a drivers into a synchronization model not ideal for t=
heir
> > > > hardware isn't great either.
> > >
> > > As I said above, we're feeling the pain too.
> > >
> > > --Jason
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
