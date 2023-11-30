Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741E7FFD86
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 22:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745310E042;
	Thu, 30 Nov 2023 21:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23E610E042;
 Thu, 30 Nov 2023 21:30:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b843b61d8aso842021b6e.0; 
 Thu, 30 Nov 2023 13:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701379811; x=1701984611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AdLM7lBVKO5z85JUEsbZhnOFnXHXkAG5gRF28PcXpY=;
 b=SW8U5WFQMKPZw8Tqsl/kbBbNPu/6glv2M9r9VOmfEZIuMHpY+OguTBH7a1yFqdgWdH
 jHDhyTFxXwU+bx8I436huYPe2GS6ASm4i5KTqDygjx6SLMLcOv8ks7fUwhHmiLsOe/YZ
 SeFcYjEXVOJzYFk83J30/vPT3JODBbncwUc+NX5tMKC+87vQX9BxQ7UqZmLQ62VOxCkr
 OZH3NotvZ+N9CbMEGVPQ4FBhVz9zai+srDfnhpoKk/9MmLEVzRF+TCjaE5dmrW258n1n
 /FD6dVI6apRL1r75x2rRYIlvnTeumBVghsC6Mc4J6+luRDQun3OYdtppMv/fX834tvlC
 X7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701379811; x=1701984611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AdLM7lBVKO5z85JUEsbZhnOFnXHXkAG5gRF28PcXpY=;
 b=f6EU2cMD9Q6kmchAFTCFHRJB8iZ2RGTIPmdYE7gNNUDyxpJJIAWJdsEdvEo7DGIFRg
 nRuR9Q6ZSv0npXCY+ueiiOH+bK6i+ukgZEQUyVSX4FCKqxfVgNhwok4kdTcSbOd/+b3S
 Xzw5l7OVtjVeJc7lh5+ywr6hK9Diq1sj/APqqCXY2gXjoIVA4CY0lPnB6QaS0HV6kcVV
 4GrkT46PTB9bvErl9dV1GkNNh+CDFFd8C5UtPSloTZcEfNUpVvRi+Jb5p6V+RBhC95Qg
 UbDIN/XNHD0TG8Crs6AnSMB/YBhJ2Uj9jJnMyvjNGvzJZ1kzkIp4shasY9qJ09xdzpFg
 U6WQ==
X-Gm-Message-State: AOJu0YzfMEGBxxA/RZmwZGr0TN0kRJIx1sc765uYg2fyc3bqt12ouimY
 3BVYqX0WWCxxdA5++FlDiyb0ROUBM0/+WVdCWeo=
X-Google-Smtp-Source: AGHT+IHRTBmBvngzFuhZ/hAvU/HjEpkJ6562bbm429mg+ZXfGWU9OhuYmYnadn/s6OrB7cxyCnXK4nnGzGZfGpj5Sms=
X-Received: by 2002:a05:6870:9a90:b0:1fa:82:3d69 with SMTP id
 hp16-20020a0568709a9000b001fa00823d69mr28555314oab.46.1701379811130; Thu, 30
 Nov 2023 13:30:11 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
In-Reply-To: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Nov 2023 16:29:59 -0500
Message-ID: <CADnq5_M6PtLPHxd7kaS6Rtkun5G2wNMs6aZ84pj58wniZ8Smsg@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:36=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-29 15:49, Alex Deucher wrote:
> > On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >>
> >> Actually I think I see the problem.  I'll try and send out a patch
> >> later today to test.
> >
> > Does the attached patch fix it?
>
> Thanks for the patch, Alex.
>
> Is it possible for AMD to also reproduce this issue and test this patch o=
n a Navi23 system?

I haven't had a chance to dig into it much due to LPC and thanksgiving
and other end of year stuff.

>
> > From 96e75b5218f7a124eafa53853681eef8fe567ab8 Mon Sep 17 00:00:00 2001
> > From: Alex Deucher <alexander.deucher@amd.com>
> > Date: Wed, 29 Nov 2023 15:44:25 -0500
> > Subject: [PATCH] drm/amdgpu: fix buffer funcs setting order on suspend
> >
> > We need to make disable this after the last eviction
>
> "make disable" --> "disable"
>
> > call, but before we disable the SDMA IP.
> >
> > Fixes: b70438004a14 ("drm/amdgpu: move buffer funcs setting up a level"=
)
> > Link: https://lists.freedesktop.org/archives/amd-gfx/2023-November/1011=
97.html
>
> Link: https://lore.kernel.org/r/87edgv4x3i.fsf@vps.thesusis.net
>
> Let's link the start of the thread.

Thanks, I will update the patch.

Alex

>
> Regards,
> Luben
>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Phillip Susi <phill@thesusis.net>
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index b5edf40b5d03..78553e027db4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -4531,8 +4531,6 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
> >
> >       amdgpu_ras_suspend(adev);
> >
> > -     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> > -
> >       amdgpu_device_ip_suspend_phase1(adev);
> >
> >       if (!adev->in_s0ix)
> > @@ -4542,6 +4540,8 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
> >       if (r)
> >               return r;
> >
> > +     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> > +
> >       amdgpu_fence_driver_hw_fini(adev);
> >
> >       amdgpu_device_ip_suspend_phase2(adev);
>
> >
> > Alex
> >
> >>
> >> Alex
> >>
> >> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
> >>>
> >>> On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmai=
l.com> wrote:
> >>>>
> >>>> On 2023-11-29 10:22, Alex Deucher wrote:
> >>>>> On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> >>>>>>
> >>>>>> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@g=
mail.com> wrote:
> >>>>>>>
> >>>>>>> On 2023-11-28 17:13, Alex Deucher wrote:
> >>>>>>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thes=
usis.net> wrote:
> >>>>>>>>>
> >>>>>>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> >>>>>>>>>
> >>>>>>>>>>> In that case those are the already known problems with the sc=
heduler
> >>>>>>>>>>> changes, aren't they?
> >>>>>>>>>>
> >>>>>>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Mayb=
e I'm
> >>>>>>>>>> misunderstanding what the original report was actually testing=
.  If it
> >>>>>>>>>> was 6.7, then try reverting:
> >>>>>>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>>>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>>>>>>
> >>>>>>>>> At some point it was suggested that I file a gitlab issue, but =
I took
> >>>>>>>>> this to mean it was already known and being worked on.  -rc3 ca=
me out
> >>>>>>>>> today and still has the problem.  Is there a known issue I coul=
d track?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> At this point, unless there are any objections, I think we shoul=
d just
> >>>>>>>> revert the two patches
> >>>>>>> Uhm, no.
> >>>>>>>
> >>>>>>> Why "the two" patches?
> >>>>>>>
> >>>>>>> This email, part of this thread,
> >>>>>>>
> >>>>>>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >>>>>>>
> >>>>>>> clearly states that reverting *only* this commit,
> >>>>>>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable n=
umber of run-queues
> >>>>>>> *does not* mitigate the failed suspend. (Furthermore, this commit=
 doesn't really change
> >>>>>>> anything operational, other than using an allocated array, instea=
d of a static one, in DRM,
> >>>>>>> while the 2nd patch is solely contained within the amdgpu driver =
code.)
> >>>>>>>
> >>>>>>> Leaving us with only this change,
> >>>>>>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> >>>>>>> to be at fault, as the kernel log attached in the linked email ab=
ove shows.
> >>>>>>>
> >>>>>>> The conclusion is that only b70438004a14f4 needs reverting.
> >>>>>>
> >>>>>> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14=
f4,
> >>>>>> 56e449603f0ac5 breaks amdgpu.
> >>>>>
> >>>>> We can try and re-enable it in the next kernel.  I'm just not sure
> >>>>> we'll be able to fix this in time for 6.7 with the holidays and all
> >>>>> and I don't want to cause a lot of scheduler churn at the end of th=
e
> >>>>> 6.7 cycle if we hold off and try and fix it.  Reverting seems like =
the
> >>>>> best short term solution.
> >>>>
> >>>> A lot of subsequent code has come in since commit 56e449603f0ac5, as=
 it opened
> >>>> the opportunity for a 1-to-1 relationship between an entity and a sc=
heduler.
> >>>> (Should've always been the case, from the outset. Not sure why it wa=
s coded as
> >>>> a fixed-size array.)
> >>>>
> >>>> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and =
the problem
> >>>> is wholly contained in amdgpu, and no other driver has this problem,=
 there is
> >>>> no reason to have to "churn", i.e. go back and forth in DRM, only to=
 cover up
> >>>> an init bug in amdgpu. See the response I just sent in @this thread:
> >>>> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail=
.com
> >>>>
> >>>> And it's not like this issue is unknown. I first posted about it on =
2023-10-16.
> >>>>
> >>>> Ideally, amdgpu would just fix their init code.
> >>>
> >>> You can't make changes to core code that break other drivers.
> >>> Arguably 56e449603f0ac5 should not have gone in in the first place if
> >>> it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> >>> code, but as a side effect it seems to have broken suspend for some
> >>> users.
> >>>
> >>> Alex
