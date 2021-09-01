Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92E3FDE7A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 17:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3AE6E202;
	Wed,  1 Sep 2021 15:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAF76E1F6;
 Wed,  1 Sep 2021 15:20:07 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id y128so4177891oie.4;
 Wed, 01 Sep 2021 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bUaBP4RJLklreyl4xWNpJJVXkInXA9mu/Fn0S4fBdPE=;
 b=LGfEGgudH3XvY0jQZvrOzzxJtYXkvpRS15tjq4FpG20T7IzdzAxyMOSUdzg5k8Z6Xs
 nv4cd5AMQW0FT5+n11ZfHL37l2buychK+TjrvpqbXszKaJ8mVuVjXif4voFz8RU75pYW
 oTq9wsbRNk2oT6UVC/URQrPUcmOOqEOLaCsKG9n40VIx7Gh3ORAr3CvqSf0J7+77ntje
 gnapro/59FYeVrXf7QlxNbCXJtHIxL2oE9AucEti8nhQmDn34b2Irb6XRcmoFvShpRPq
 sU7y2skHdfiaFteqY4I98l9ghKTNO3Pf9pLCOiPdFYjpR+MdWC4S8YL00udmz6AOdRCU
 wWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bUaBP4RJLklreyl4xWNpJJVXkInXA9mu/Fn0S4fBdPE=;
 b=psI24HBwd1+qCIb9BwVaKK5tnZmIG43MHfGRCUtUYLRMESq87Hm2QM2Umig4I+fwHH
 z1PQWMjIhp64ffYKAOKXzNCGtrzyP7NmfhlqAJuNNWJKxvw2u96zRwqud5+Nib/I3P4A
 HJarhYuUWm2vmWIAoMYrE2iqH1jQPRi7jw+tqxyIiTdwUmScrfzIZ8MtR8/nB15WEhNl
 9bvDNQQKbPcAsmdJLK2pCXYBWhA89+nadXkQ913bNHPgs0vfnxHkxJHlpp5M2t8MnFR0
 JdNJIyyT11szUp1mdHokEuMWSN9SRCW7I6NRbLJaBvVz6ES8vSqXXCZAGzdiUPQ6VqxP
 Mhnw==
X-Gm-Message-State: AOAM530zMN9GbSpHKOXs7Z2LwgYsWqB7k1GFWeJNd+nC5S9GfogKOelM
 0Q2GrOp3LOyyoiGwudRolBDFY5gwcVlJT2PHCoCDx/6m
X-Google-Smtp-Source: ABdhPJwjrZWAJKUaZ/tVWyAtoPeay7oDXeG2BX/9PykJ4FVcnvL8x/8ZDtRFVP1NeiGgI4eKhZ2oz8UhfJwkPTUJYkY=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr59895oih.120.1630509607229; 
 Wed, 01 Sep 2021 08:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Sep 2021 11:19:56 -0400
Message-ID: <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: "Liu, Monk" <Monk.Liu@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen,
 JingWen" <JingWen.Chen2@amd.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
>
> [AMD Official Use Only]
>
> Daniel
>
> From the link you share it looks you(or someone else) have quite a bunch =
patches that changes DRM_SCHED or even amdgpu, by that case before they are=
 merged to kernel tree I'm wondering if any AMD develop reviewed them ?
>
> They looks to me somehow conflicting with what we changed in our repo....
>
> It is really a chaos for AMDer if someone else out side of AMD changes ou=
r kernel driver (or/and scheduler) without reviewed by AMDer, just like we =
are requiring your review if we tend to change scheduler's logic here ....
>
> This one changes AMD's code: https://lore.kernel.org/dri-devel/2021062513=
3327.2598825-2-boris.brezillon@collabora.com/
> And I didn't see any reviewed-by from AMDers ...
>
> This one also touches AMD's code: https://lore.kernel.org/dri-devel/20200=
604081224.863494-12-daniel.vetter@ffwll.ch/
> Which is conflicting with one patch we submitted (in our repo rightnow), =
and neither see AMDder gave a review-by on this one (let me know if I misse=
d it)
>

Monk, this is not how upstream works.  You need to participate.
That's how communities work.  There's a reason all these discussions
happen on public mailing lists.  The patch author can't be expected to
know every person on every vendor team to CC with a patch.  If you
have concerns, you need to raise them when the patches are being
discussed.

Alex


> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Daniel=
 Vetter
> Sent: Wednesday, September 1, 2021 4:18 PM
> To: Liu, Monk <Monk.Liu@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <And=
rey.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Develop=
ment <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/su=
ggestions in one thread
>
> Hi Monk,
>
> On Wed, Sep 1, 2021 at 3:23 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> >
> > [AMD Official Use Only]
> >
> >
> > Hi Daniel/Christian/Andrey
> >
> >
> >
> > It looks the voice from you three are spread over those email floods to=
 me, the feature we are working on (diagnostic TDR scheme) is pending there=
 for more than 6 month (we started it from feb 2021).
>
> For me your project exists since a few weeks at most, because that is whe=
n your team showed up on dri-devel. That you already spent 6 months on this=
 within amd, on a code area that very much affects shared code, without kic=
king of any thread on dri-devel isn't great, but also not something we can =
fix, since time machines don't exist.
>
> So we have to make the best out of the situation and move ahead where we =
are. From my understanding you've done a bunch of changes to the scheduler =
code. As far as I can see there's been two related things your team has don=
e:
>
> - remove some allocations from scheduler code, because that can lead to d=
eadlocks. I've kicked up this topic quite a while ago here
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fdri-devel%2F20200604081224.863494-10-daniel.vetter%40ffwll.ch%=
2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208d96d2113=
8d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DpG5sG5pjVXEAMaahvfNS11VwbHkYWRuWrtHFXM9mEyo%3D&a=
mp;reserved=3D0
>
> This is just one patch of the entire series. This is an area where we rea=
lly need a consistent solution across all drm/sched drivers, not something =
that individual drivers just fix in their own way.
>
> - the other one is the timeout issue for the patches you cite here.
> Again there's been discussion on this on dri-devel with Boris from panfro=
st about how we can handle at least some of the races in tdr.
> That resulted in lots of discussions and documentation improvements.
> Those patches are merged now, link
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon%40collabo=
ra.com%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208d=
96d21138d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dm6U6tJbX2x38xiwQXE1oV0sz2BxXZfPlcouyqIqPZ=
NU%3D&amp;reserved=3D0
>
> There's been more than just this, also quite some doc patches from Boris =
that explain how it's all supposed to work and be race-free.
> Again your driver isn't the only one with interesting TDR races.
>
> Your team hasn't been active in any of these discussions, but now suddenl=
y pops up out of nowhere and demands that your approach needs to land asap.=
 That's really not how upstream works.
>
> The other thing where I'm struggling is that there's a lot of missing con=
text for outsiders. The patches sometimes come with zero commit message, fo=
r tricky concurrency bugs. And there's no context with what you've done alr=
eady on the amdgpu side (since that never showed up on dri-devel), which ma=
kes constructive discussions here really hard.
>
> Now fixing these bugs is obviously good, but the way this is supposed to =
work when touching shared infrastructure is:
>
> - Before you start merging anything kick off an RFC thread on dri-devel (=
or whatever the topic really is about) about the problem you have and how y=
our trying to solve it. This can be just text if it's a big thing, but it c=
an also already include some proof of concept solution in the form of patch=
es.
>
> - Then we iterate on the solution, across drivers and shared code _togeth=
er_. Not "merge amdgpu code first, then get annoyed when the core changes d=
on't land immediately after you've practially finished the project".
>
> - This might mean changes to other drivers if we need to adjust interface=
s.
>
> On the plus side you can plan much better, because you know you have upst=
ream buy-in before you start to put in real work on the project.
>
> > Honestly speaking the email ways that we are using now is not friendly =
and quite painful to me ....
>
> Yes this is painful :-(
>
> I think the best way forward is to go through the above process again and=
 essentially restart. So submit a complete patch series with problem descri=
ptions, solution you picked, why you picked that, all the amdgpu patches to=
 get there and the core patches too. Since it sounds like a bunch of this h=
as all landed already you probably need a patch 1 that goes back to 6 month=
s ago so that we can see the overall direction, and review whether that's t=
he right one or not.
>
> The not-so-painful approach would have been to do this from the start,
> 6 months ago. It would definitely have helped if the tdr discussion we've=
 had just a few months ago would have involved your team too, I'm sure ther=
e would have been some good insights from amd's side. I'd really want you a=
nd your engineers involved here, so let's do this properly!
>
> Cheers, Daniel
>
> > Can we try to put all our opinions, suggestions, or even objects here t=
ogether, let's go through them one by one, it's too hard for us to reply ea=
ch email on different questions .
> >
> >
> >
> > For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
> >
> >
> >
> > This is a fixing patch on the timeout timer in scheduler, can we comple=
te this one first ? it should already resolved all the questions and sugges=
tions.
> >
> >
> >
> > For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
> >
> >
> >
> > I think I already explained the questions raised by Daniel in other
> > thread , regarding why I use __kthread_should_park()
> >
> > For other aspects, can we put all our opinion synthesized here ?
> >
> >
> >
> > Thanks !
> >
> >
> >
> > ------------------------------------------
> >
> > Monk Liu | Cloud-GPU Core team
> >
> > ------------------------------------------
> >
> >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.f=
fwll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208=
d96d21138d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DNA3iopIUYFOuTokczRA%2BNBcwVrvMMMHGPM96%2=
B%2Bm0nEg%3D&amp;reserved=3D0
