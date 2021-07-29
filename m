Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578483DA597
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 16:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3816ED74;
	Thu, 29 Jul 2021 14:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725616ED74
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:06:05 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w6so8567090oiv.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ERFue+oHCOjcFjpKybCHGm8Nf73ebXktzSux0cMnuM0=;
 b=RvIXERV7oStEjYkk/BrebgVpiq6/8GMBlhwGRXTlJXtmQD0+0FSp6vKd3U3rx72vnb
 Dskbh9JEQHgZzaz14qnJiRv0Z85Z8/nI+jSd2GcG3uZQGbUV7HY1dYkpF40rHuOH/tOy
 t++dhn7XmaIjhp7fKjyA8LkXn0d40y+ELabsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ERFue+oHCOjcFjpKybCHGm8Nf73ebXktzSux0cMnuM0=;
 b=HFYrpLNoWNrsDqXcHmJeaj/Gb9zutSIPJ81I6nNOi0ZkafZBbR+uB2jHcyNzaZzoaB
 gXD2naPtqpR0Jjzl0IJVBjPhXu/7Qkx9XyR2K5sl+Opr+dI/SAVV3y/4kSN/YMx1HsFw
 TIBHvhOZjsam4Cv6J7mnc9GRfgbuKBjpucHBEjIvra8CoIhHrX/hAuxmmFEjV+k1Gifr
 A71dFuE83v0WL7gb4AZszebP6ynWtMOVOyKGYA3oOi1lY4KtQKEZr/vt0zdAkk4QB8Kq
 3HAZMPFXINaszw90ODf3L/DcOoHh2K2euI5uCvKPTeks0GEU3UvRl3eMa8UVbTzm36IC
 htfQ==
X-Gm-Message-State: AOAM531rauP3DY+nVbSSNSKatxMs93Zhog/FnwMFGClZ5PVgl2YipyxK
 EdZXTrSuwZygu2gXa8fdJyQM8O1OpAcy8F8ja/cd5A==
X-Google-Smtp-Source: ABdhPJxwHe8UR04yoFZoPSRg5yexYy7LIXZIIj5YSvpYgpfw3k7PwllaAKSr1vBFepIW+UHzpPn0HMznlj122DeDwuw=
X-Received: by 2002:aca:d682:: with SMTP id n124mr3260319oig.128.1627567564541; 
 Thu, 29 Jul 2021 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
 <YQJUKXgf/Q957fmy@phenom.ffwll.local>
 <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
 <YQJu6AqKn7bdT1li@phenom.ffwll.local> <20210729123732.3259a9bf@eldfell>
 <YQKclVvL+QeeL6cP@phenom.ffwll.local> <20210729155959.665fc1a6@eldfell>
In-Reply-To: <20210729155959.665fc1a6@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Jul 2021 16:05:53 +0200
Message-ID: <CAKMK7uG=UtTjtGCxTQm9wnm44QqTK2=ZCSM2MS0wVwpTL7DEkw@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Roy Sun <Roy.Sun@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Gustavo Padovan <gustavo@padovan.org>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 3:00 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Thu, 29 Jul 2021 14:18:29 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Thu, Jul 29, 2021 at 12:37:32PM +0300, Pekka Paalanen wrote:
> > > On Thu, 29 Jul 2021 11:03:36 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Thu, Jul 29, 2021 at 10:17:43AM +0200, Michel D=C3=A4nzer wrote:
> > > > > On 2021-07-29 9:09 a.m., Daniel Vetter wrote:
> > > > > > On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote:
> > > > > >> On Wed, Jul 28, 2021 at 6:24 AM Michel D=C3=A4nzer <michel@dae=
nzer.net> wrote:
> > > > > >>> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote:
> > > > > >>>> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer:
> > > > > >>>>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote:
> > > > > >>>>>> Am 27.07.21 um 17:37 schrieb Rob Clark:
> > > > > >>>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel D=C3=A4nzer <miche=
l@daenzer.net> wrote:
> > > > > >>>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
> > > > > >>>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <mic=
hel@daenzer.net> wrote:
> > > > > >>>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> > > > > >>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> Based on discussion from a previous series[1] to add =
a "boost" mechanism
> > > > > >>>>>>>>>>> when, for example, vblank deadlines are missed.  Inst=
ead of a boost
> > > > > >>>>>>>>>>> callback, this approach adds a way to set a deadline =
on the fence, by
> > > > > >>>>>>>>>>> which the waiter would like to see the fence signalle=
d.
> > >
> > > ...
> > >
> > > > > I'm not questioning that this approach helps when there's a direc=
t
> > > > > chain of fences from the client to the page flip. I'm pointing ou=
t
> > > > > there will not always be such a chain.
> > > > >
> > > > >
> > > > > >> But maybe the solution to make this also useful for mutter
> > > > >
> > > > > It's not just mutter BTW. I understand gamescope has been doing
> > > > > this for some time already. And there seems to be consensus among
> > > > > developers of Wayland compositors that this is needed, so I expec=
t
> > > > > at least all the major compositors to do this longer term.
> > > > >
> > > > >
> > > > > >> is to, once we have deadline support, extend it with an ioctl =
to
> > > > > >> the dma-fence fd so userspace can be the one setting the
> > > > > >> deadline.
> > > > >
> > > > > I was thinking in a similar direction.
> > > > >
> > > > > > atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutt=
er
> > > > > > the option to bail out with an old frame if it's too late?
> > > > >
> > > > > This is a bit cryptic though, can you elaborate?
> > > >
> > > > So essentially when the mutter compositor guesstimator is fairly
> > > > confident about the next frame's composition (recall you're keeping
> > > > track of clients to estimate their usual latency or something like
> > > > that), then it does a TEST_ONLY commit to check it all works and pr=
ep
> > > > the rendering, but _not_ yet fire it off.
> > > >
> > > > Instead it waits until all buffers complete, and if some don't, pic=
k
> > > > the previous one. Which I guess in an extreme case would mean you
> > > > need a different window tree configuration and maybe different
> > > > TEST_ONLY check and all that, not sure how you solve that.
> > > >
> > > > Anyway, in that TEST_ONLY commit my idea is that you'd also supply
> > > > all the in-fences you expect to depend upon (maybe we need an
> > > > additional list of in-fences for your rendering job), plus a deadli=
ne
> > > > when you want to have them done (so that there's enough time for yo=
ur
> > > > render job still). And the kernel then calls dma_fence_set_deadline
> > > > on all of them.
> > > >
> > > > Pondering this more, maybe a separate ioctl is simpler where you ju=
st
> > > > supply a list of in-fences and deadlines.
> > > >
> > > > The real reason I want to tie this to atomic is for priviledge
> > > > checking reasons. I don't think normal userspace should have the
> > > > power to set arbitrary deadlines like this - at least on i915 it wi=
ll
> > > > also give you a slight priority boost and stuff like that, to make
> > > > sure your rendering for the current frame goes in ahead of the next
> > > > frame's prep work.
> > > >
> > > > So maybe just a new ioctl that does this which is limited to the
> > > > current kms owner (aka drm_master)?
> > >
> > > Yeah.
> > >
> > > Why not have a Wayland compositor *always* "set the deadlines" for th=
e
> > > next screen update as soon as it gets the wl_surface.commit with the
> > > new buffer and fences (a simplified description of what is actually
> > > necessary to take a new window state set into use)?
> >
> > Yeah taht's probably best. And if the frame is scheduled (video at 24fp=
s
> > or whatever) you can also immediately set the deadline for that too, ju=
st
> > a few frames later. Always minus compositor budget taken into account.
> >
> > > The Wayland client posted the frame to the compositor, so surely it
> > > wants it ready and displayed ASAP. If we happen to have a Wayland fra=
me
> > > queuing extension, then also take that into account when setting the
> > > deadline.
> > >
> > > Then, *independently* of that, the compositor will choose which frame=
s
> > > it will actually use in its composition when the time comes.
> > >
> > > No need for any KMS atomic commit fiddling, userspace just explicitly
> > > sets the deadline on the fence and that's it. You could tie the
> > > privilege of setting deadlines to simply holding DRM master on whatev=
er
> > > device? So the ioctl would need both the fence and any DRM device fd.
> >
> > Yeah tying that up with atomic doesn't make sense.
> >
> > > A rogue application opening a DRM device and becoming DRM master on i=
t
> > > just to be able to abuse deadlines feels both unlikely and with
> > > insignificant consequences. It stops the obvious abuse, and if someon=
e
> > > actually goes the extra effort, then so what.
> >
> > With logind you can't become drm master just for lolz anymore, so I'm n=
ot
> > worried about that. On such systems only logind has the rights to acces=
s
> > the primary node, everyone doing headless goes through the render node.
>
> Mm, I hope the DRM leasing protocols don't rely on clients being able
> to open KMS nodes anymore... they used to at some point, I think, for
> the initial resource discovery before actually leasing anything.

Yeah I thought that was fixed with additional xrandr/wayland discovery
protocols. It doesn't work anyone on systems with display/render
split. I think that was just to get it all going.

> "only logind has rights" might be a bit off still.
>
> > So just limiting the deadline ioctl to current kms owner is imo perfect=
ly
> > good enough for a security model.
>
> There could be multiple DRM devices. Including VKMS. Some of them not
> used. The deadline setting ioctl can't guarantee the fenced buffer is
> going to be used on the same DRM device the ioctl was called with. Or
> used at all with KMS.

That's not a problem, fence deadline interface is cross-driver.

> Anyway, even if that is not completely secure, I wouldn't think that
> setting deadlines can do more than change GPU job priorities and power
> consumption, which seem quite benign. It's enough hoops to jump through
> that I think it stops everything we care to stop.

Yeah. Plus with this patch set you can do this already, just need to
send out an atomic flip with all the fences merged together into your
in-fence slots.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
