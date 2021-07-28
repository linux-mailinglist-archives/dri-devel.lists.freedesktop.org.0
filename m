Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128043D91F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAC6E1EE;
	Wed, 28 Jul 2021 15:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D396E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:30:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r2so3094712wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PGO5orqGxOkAQAyjuFowp4gIrUTAp7PM+7R6jiUynG4=;
 b=BfMKIt0w2M+dV5hZ8Gi6+ugs+Y9MuZ8dsZffTOTGljdDv8TG0bHfCtbs0mS/zF3vRE
 6UE+o3xXlhAduVywXjrQrBXPSaL93/QrwAP+LZWy4bRPoakL1RX9kp2q3V6sN0n+1Ccd
 9NzHMwZgQVs9yYvmds7zEP4XBeMhAzpQ7u3PBOTKh6WNnBPbzQPy2MMFZnpl1dnHXJpU
 eGgZd3z39zVgOHcd9KXKeDzHrVuDWSM4zDJdzPsdYDDs1OpaaYuZwNF9X6LnoadNKH7H
 iFxgCg5K6frLy7kiDtadxWTe5DC8d91PzhkviKkfPiIxhVlE16JnU0qPW2mDFa3RQw42
 IVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PGO5orqGxOkAQAyjuFowp4gIrUTAp7PM+7R6jiUynG4=;
 b=pSJG4dMTvPsEg/maJzctV+/2Pe32b7xUN1esWZ+B6e7tDXRjTQ2IOOe3QtVGnUY4+0
 O5CsTSIlyxxT83wB7k2nV8g3N0onEp4d8iW4fEBtHmzcpEz/RRu6uebpnZNG268siAN0
 tZPMmHefr+7iUxKRPAHPcuPfRtvd9o2f2m2IRY9qDIyQjf4QmhftpMmhKl+/8cMgPRGW
 UHB5B9j+l/JOsWMtPILinuXJLQ9zKxUmJJKwQnql6mRvegLU7DYurOxpK+va11XtRnp2
 acAMieXKkrpMZvkpAeRf+4qh/d83xP3klJpxxWNaFtRxRaeE+Kqd/64a3uv20gi6ZIMu
 br1A==
X-Gm-Message-State: AOAM531JzVjPyuMe+BeYoP+Iuomv1rz4lcZMdoB9ftPxgCYSJ9bpEsbS
 qIMAXCVylDZP/AGSuU4fV3+wwPO+TZ7SnA8DHBA=
X-Google-Smtp-Source: ABdhPJy2p+1wHDhRbufcHC7EWE4KRZmJktPfNZHrScfzWT3BeZBWBOqZvMA/tCI22TcDazN9EtCkVunxO93zYHXcxqY=
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr30512016wrt.132.1627486204224; 
 Wed, 28 Jul 2021 08:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
In-Reply-To: <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Jul 2021 08:34:13 -0700
Message-ID: <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 6:24 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote:
> > Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer:
> >> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote:
> >>> Am 27.07.21 um 17:37 schrieb Rob Clark:
> >>>> On Tue, Jul 27, 2021 at 8:19 AM Michel D=C3=A4nzer <michel@daenzer.n=
et> wrote:
> >>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
> >>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <michel@daenzer=
.net> wrote:
> >>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> >>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>
> >>>>>>>> Based on discussion from a previous series[1] to add a "boost" m=
echanism
> >>>>>>>> when, for example, vblank deadlines are missed.  Instead of a bo=
ost
> >>>>>>>> callback, this approach adds a way to set a deadline on the fenc=
e, by
> >>>>>>>> which the waiter would like to see the fence signalled.
> >>>>>>>>
> >>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, b=
ut
> >>>>>>>> wanted to send this out as an RFC in case I don't have a chance =
to
> >>>>>>>> finish the drm/msm part this week.
> >>>>>>>>
> >>>>>>>> Original description:
> >>>>>>>>
> >>>>>>>> In some cases, like double-buffered rendering, missing vblanks c=
an
> >>>>>>>> trick the GPU into running at a lower frequence, when really we
> >>>>>>>> want to be running at a higher frequency to not miss the vblanks
> >>>>>>>> in the first place.
> >>>>>>>>
> >>>>>>>> This is partially inspired by a trick i915 does, but implemented
> >>>>>>>> via dma-fence for a couple of reasons:
> >>>>>>>>
> >>>>>>>> 1) To continue to be able to use the atomic helpers
> >>>>>>>> 2) To support cases where display and gpu are different drivers
> >>>>>>>>
> >>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=3D04%7C01%7C=
christian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DeYaSOSS5wOngNAd9wufp5eWCx5GtAwo6GkultJgrjmA%3D&amp;reserved=3D0
> >>>>>>> Unfortunately, none of these approaches will have the full intend=
ed effect once Wayland compositors start waiting for client buffers to beco=
me idle before using them for an output frame (to prevent output frames fro=
m getting delayed by client work). See https://nam11.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmer=
ge_requests%2F1880&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C269b2d=
f3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D1ZkOzLqbiKSyCixGZ0u7Hd%2=
Fc1YnUZub%2F%2Fx7RuEclFKg%3D&amp;reserved=3D0 (shameless plug :) for a proo=
f of concept of this for mutter. The boost will only affect the compositor'=
s own GPU work, not the client work (which means no effect at all for fulls=
creen apps where the compositor can scan out the client buffers directly).
> >>>>>>>
> >>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
> >>>>> I meant what I wrote: The compositor will wait for the next buffer =
to become idle, so there's no boost from this mechanism for the client draw=
ing to that buffer. And since the compositor does no drawing of its own in =
this case, there's no boost from that either.
> >>>>>
> >>>>>
> >>>>>> I'd perhaps recommend that wayland compositors, in cases where onl=
y a
> >>>>>> single layer is changing, not try to be clever and just push the
> >>>>>> update down to the kernel.
> >>>>> Even just for the fullscreen direct scanout case, that would requir=
e some kind of atomic KMS API extension to allow queuing multiple page flip=
s for the same CRTC.
> >>>>>
> >>>>> For other cases, this would also require a mechanism to cancel a pe=
nding atomic commit, for when another surface update comes in before the co=
mpositor's deadline, which affects the previously single updating surface a=
s well.
> >>>>>
> >>>> Well, in the end, there is more than one compositor out there.. and =
if
> >>>> some wayland compositors are going this route, they can also impleme=
nt
> >>>> the same mechanism in userspace using the sysfs that devfreq exports=
.
> >>>>
> >>>> But it sounds simpler to me for the compositor to have a sort of "ga=
me
> >>>> mode" for fullscreen games.. I'm less worried about UI interactive
> >>>> workloads, boosting the GPU freq upon sudden activity after a period
> >>>> of inactivity seems to work reasonably well there.
> >>> At least AMD hardware is already capable of flipping frames on GPU ev=
ents like finishing rendering (or uploading etc).
> >>>
> >>> By waiting in userspace on the CPU before send the frame to the hardw=
are you are completely killing of such features.
> >>>
> >>> For composing use cases that makes sense, but certainly not for full =
screen applications as far as I can see.
> >> Even for fullscreen, the current KMS API only allows queuing a single =
page flip per CRTC, with no way to cancel or otherwise modify it. Therefore=
, a Wayland compositor has to set a deadline for the next refresh cycle, an=
d when the deadline passes, it has to select the best buffer available for =
the fullscreen surface. To make sure the flip will not miss the next refres=
h cycle, the compositor has to pick an idle buffer. If it picks a non-idle =
buffer, and the pending rendering does not finish in time for vertical blan=
k, the flip will be delayed by at least one refresh cycle, which results in=
 visible stuttering.
> >>
> >> (Until the deadline passes, the Wayland compositor can't even know if =
a previously fullscreen surface will still be fullscreen for the next refre=
sh cycle)
> >
> > Well then let's extend the KMS API instead of hacking together workarou=
nds in userspace.
>
> That's indeed a possible solution for the fullscreen / direct scanout cas=
e.
>
> Not for the general compositing case though, since a compositor does not =
want to composite multiple output frames per display refresh cycle, so it h=
as to make sure the one frame hits the target.
>

I think solving the fullscreen game case is sufficient enough forward
progress to be useful.  And the results I'm seeing[1] are sufficiently
positive to convince me that dma-fence deadline support is the right
thing to do.

But maybe the solution to make this also useful for mutter is to, once
we have deadline support, extend it with an ioctl to the dma-fence fd
so userspace can be the one setting the deadline.

[1] https://patchwork.freedesktop.org/patch/447138/

BR,
-R
