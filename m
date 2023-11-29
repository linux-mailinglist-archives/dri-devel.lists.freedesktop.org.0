Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED67FDF8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 19:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A981F10E21E;
	Wed, 29 Nov 2023 18:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD010E21E;
 Wed, 29 Nov 2023 18:45:32 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3b85dcecc62so36591b6e.2; 
 Wed, 29 Nov 2023 10:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701283532; x=1701888332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7DCR/D2puLrlYKtfnL5wOuzekl2PYjebLOO/OkVlkg=;
 b=fW1vSeMtOM2sjoMF44K0za+dKtEYs5IacUCp0YnbTOT4j22IHYSlssNDVM25CfQ/7F
 Te91Rk/imjsqN4Intujb9WwUncP98HuioyPKgWUSHhdZtuGWciQ8/VsAM2xhjow0MMnl
 b0aT+nodNkZ3RLZUAgOhiyPeMT/nrGFIiarsjv+A2aLHEFo/eN1oM4MEN6CcbyG5S62m
 N5eoLjJSh9H5+PGjQ4mBirg9cziOlywKVsLZTKfvYtzBTFWZfxH6j+eaYbhXQbY+UMZE
 k5fCRqfZ52gVCVo3Zc0Jvll7Gew/697YsVciHo3KOsJsJFjfPuCnJCQ3bIwad959t40h
 8+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701283532; x=1701888332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7DCR/D2puLrlYKtfnL5wOuzekl2PYjebLOO/OkVlkg=;
 b=RWkjnDqHlr0nec6GB37wgU7PS0BABUs2nQOsbgeQeau/pSMIuR90hNsPH8mxEJb4Lg
 jZ7t0UHDLpTroi2FWdkPPSGred7xcPvG25FCujdby083+zPy+W9iZo7kfukWnVtJb6EM
 XpydTbrvhm2rz/NH1UlZ5ek05xYOlQFhVohmpEbgiQPV1E5XmSqFEADl0/n5DFLwPh8a
 rlZlz/ZgzDNUWPHfiuIgGEX4t5rBeqV04xAaxd4gAGq64dBqvhVKDSZsXVd67klyImst
 ZXg6PLHlWOB9LlfEa45yJcu+eJEr0CqbaQlV5Nt95usD+7SzpmDwhu9GkgLqFTGOXyAG
 pAHg==
X-Gm-Message-State: AOJu0YxQsizoYjXIc5Y10+6cgYovmpT0+e0d9XsPSpZlghSP65C0R9Be
 1qerGxxUmYQgVazei76m94JIuL3u1O9nAdTgBeym3xK5B20=
X-Google-Smtp-Source: AGHT+IHlGLSafRGtkek0S5tuVTw6o7OhfniAJh5CzM0bn20/DR1kfW77Bo0cCRmK4BBhQD4xqF8usW0gMwTqN3vrV/Q=
X-Received: by 2002:a05:6870:9e06:b0:1f9:f5c5:c023 with SMTP id
 ps6-20020a0568709e0600b001f9f5c5c023mr28673722oab.57.1701283531835; Wed, 29
 Nov 2023 10:45:31 -0800 (PST)
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
 <05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com>
In-Reply-To: <05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 13:45:20 -0500
Message-ID: <CADnq5_P3iCNRZ6o3w=u1GrZCd7vkM8GspTpdwT-1G_1eJSNwmQ@mail.gmail.com>
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

On Wed, Nov 29, 2023 at 11:21=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-29 08:50, Alex Deucher wrote:
> > On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.=
com> wrote:
> >>
> >> On 2023-11-28 17:13, Alex Deucher wrote:
> >>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.=
net> wrote:
> >>>>
> >>>> Alex Deucher <alexdeucher@gmail.com> writes:
> >>>>
> >>>>>> In that case those are the already known problems with the schedul=
er
> >>>>>> changes, aren't they?
> >>>>>
> >>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> >>>>> misunderstanding what the original report was actually testing.  If=
 it
> >>>>> was 6.7, then try reverting:
> >>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>
> >>>> At some point it was suggested that I file a gitlab issue, but I too=
k
> >>>> this to mean it was already known and being worked on.  -rc3 came ou=
t
> >>>> today and still has the problem.  Is there a known issue I could tra=
ck?
> >>>>
> >>>
> >>> At this point, unless there are any objections, I think we should jus=
t
> >>> revert the two patches
> >> Uhm, no.
> >>
> >> Why "the two" patches?
> >>
> >> This email, part of this thread,
> >>
> >> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >>
> >> clearly states that reverting *only* this commit,
> >> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number=
 of run-queues
> >> *does not* mitigate the failed suspend. (Furthermore, this commit does=
n't really change
> >> anything operational, other than using an allocated array, instead of =
a static one, in DRM,
> >> while the 2nd patch is solely contained within the amdgpu driver code.=
)
> >>
> >> Leaving us with only this change,
> >> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> >> to be at fault, as the kernel log attached in the linked email above s=
hows.
> >>
> >> The conclusion is that only b70438004a14f4 needs reverting.
> >
> > b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> > 56e449603f0ac5 breaks amdgpu.
>
> It doesn't "break" it, amdgpu just needs to be fixed.
>
> I know we put in a Fixes tag in
> b70438004a14f4 "drm/amdgpu: move buffer funcs setting up a level"
> pointing to 56e449603f0ac5 "drm/sched: Convert the GPU scheduler to varia=
ble number of run-queues",
> but given the testing Phillip has done, the culprit is wholly contained i=
n
> the amdgpu driver code.
>
> No other driver has this problem since commit 56e449603f0ac5.
>
> The Fixes tag in b70438004a14f4 "drm/amdgpu: move buffer funcs setting up=
 a level" should've ideally
> pointed to an amdgpu-driver code commit only (perhaps an old-old commit),=
 and I was a bit uncomfortable
> putting in a Fixes tag which pointed to drm code, but we did it so that t=
he amdgpu commit follows
> the changes in DRM. In retrospect, the Fixes tag should've pointed to and=
 amdgpu-driver commit when
> that the amdgpu code was originally written.
>
> I remember that the problem was really that amdgpu called drm_sched_entit=
y_init(),
> in amdgpu_ttm_set_buffer_funcs_status() without actually having initializ=
ed the scheduler
> used therein. For instance, the code before commit b70438004a14f4, looked=
 like this:
>
> void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool =
enable)
> {
>         struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman=
.bdev, TTM_PL_VRAM);
>         uint64_t size;
>         int r;
>
>         if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>             adev->mman.buffer_funcs_enabled =3D=3D enable)
>                 return;
>
>         if (enable) {
>                 struct amdgpu_ring *ring;
>                 struct drm_gpu_scheduler *sched;
>
>                 ring =3D adev->mman.buffer_funcs_ring;
>                 sched =3D &ring->sched;                             <-- L=
T: No one has initialized this scheduler
>                 r =3D drm_sched_entity_init(&adev->mman.entity,     <-- O=
opses, now that sched->sched_rq is not a static array
>                                           DRM_SCHED_PRIORITY_KERNEL, &sch=
ed,
>                                           1, NULL);
>                 if (r) {
>                         DRM_ERROR("Failed setting up TTM BO move entity (=
%d)\n",
>                                   r);
>                         return;
>                 }
>
>
> Before commit 56e449603f0ac5, amdgpu was getting away with this, because =
the sched->sched_rq
> was a static array.
>
> Ideally, amdgpu code would be fixed.

b70438004a14f4 was the amdgpu fix for this, but it appears to break
suspend for some users.  I'm not confident we can fix it in time for
6.7 final.

Alex
