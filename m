Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE118683450
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28FF10E2AA;
	Tue, 31 Jan 2023 17:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2810E2A5;
 Tue, 31 Jan 2023 17:51:59 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso5647453oti.10; 
 Tue, 31 Jan 2023 09:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHZ4CiN2LSueiLLWk/VFYuSuLha8XhYt2yv7Oa2VUMw=;
 b=e9ZznIRnowXKDr0cu2XvI1NsmqM0D60f5Mptfc7iRFiviioWirDKzMCicseE6Ge4qA
 G8GePMnlSKhdDmyQIqOH2aZitSQl7ot8EyTpagv90SRfmsyvMnBOhrELq8hGVHppJbpM
 PeC/xHkZ24RR9eQDUqWFbeYLAuUgZZfvXkJR9rgClXjJgqRgsLWUHZ6IqRJitIC8zgae
 UhaGymhMmck6DHbjty3b+PbvfpBzFP9kHEeQkXBVOGEf7fI4dA+zto60S58+j70t5miQ
 OsEkhqoUNCp2xIaEc7dlA2nh7w4VWmOszidKHLPqSPETzToCEBlPQt+dzGYCmgMvKbAJ
 VUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHZ4CiN2LSueiLLWk/VFYuSuLha8XhYt2yv7Oa2VUMw=;
 b=NIBNDhvJaiUibTJBjfbLS2uDh5k80ZdhDYQE0RkvNiK9WLHBZ5O0bnpDIHwXfmHGKR
 pMHoB5jX6DPuWgyO874po7OVTRFW/sBymgzrD7prtI5D1zXNBmKTN2gGubXxMMLD6LX/
 qGTe9ZnRzRa73EJMato76acbG7vc3JI9UWris0vwFpwKZ+sWuEIRx+hOX7x7tBiDshmj
 STyytlwAgoPrqjYORlG817zcUSNTh+QlyzlVAx5+l12LCPIIHp/8dfHqsEDjHMfdJGIH
 AxYQ3LOfwGmK+2/gJX2hO5HDefywJOhdAl7R3H/H/omGtALM0FnDDJhI7QC9H6/dTlfo
 nITA==
X-Gm-Message-State: AFqh2kpIpnSwP7HEZysPd4E+jGorM2UGDN7rda2y7mQMDeJwkJo7pYcp
 IqT6IQ2/RcAt16IbxqpRuNQ7bmZaoq+di+jw5y8=
X-Google-Smtp-Source: AMrXdXt+I3Teg9F7VndUVpCVPT1NBtbDZsz9vSmDbiXs+p/nJVui9F0imHz6NB6pelIGr9/q+JgmIzY1/QSw8lrU2es=
X-Received: by 2002:a9d:5606:0:b0:686:413a:59ae with SMTP id
 e6-20020a9d5606000000b00686413a59aemr3283982oti.120.1675187518391; Tue, 31
 Jan 2023 09:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
In-Reply-To: <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:51:46 -0500
Message-ID: <CADnq5_OK974NzmJqboQVUpCa3-vNqVGfJJcQ4JtQh31YnF_7Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 5:58 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 31.01.23 um 10:17 schrieb Chen, Guchun:
> > Hi Piccoli,
> >
> > Please ignore my request of full dmesg log. I can reproduce the issue a=
nd get the same failure callstack by returning early with an error code pri=
or to amdgpu_device_init_schedulers.
> >
> > Regards,
> > Guchun
> >
> > -----Original Message-----
> > From: Chen, Guchun
> > Sent: Tuesday, January 31, 2023 2:37 PM
> > To: Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli <gpiccol=
i@igalia.com>
> > Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui <Xi=
nhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tu=
ikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@i=
galia.com; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christia=
n <Christian.Koenig@amd.com>
> > Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm=
_sched init/fini
> >
> > Hi Piccoli,
> >
> > I agree with Alex's point, using ring->sched.name for such check is not=
 a good way. BTW, can you please attach a full dmesg long in bad case to he=
lp me understand more?
> >
> > Regards,
> > Guchun
> >
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: Tuesday, January 31, 2023 6:30 AM
> > To: Guilherme G. Piccoli <gpiccoli@igalia.com>
> > Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Chen, Guchun <G=
uchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.free=
desktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mari=
o.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexande=
r.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm=
_sched init/fini
> >
> > On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli <gpiccoli@igalia.c=
om> wrote:
> >> + Luben
> >>
> >> (sorry, missed that in the first submission).
> >>
> >> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
> >>> Currently amdgpu calls drm_sched_fini() from the fence driver sw
> >>> fini routine - such function is expected to be called only after the
> >>> respective init function - drm_sched_init() - was executed successful=
ly.
> >>>
> >>> Happens that we faced a driver probe failure in the Steam Deck
> >>> recently, and the function drm_sched_fini() was called even without
> >>> its counter-part had been previously called, causing the following oo=
ps:
> >>>
> >>> amdgpu: probe of 0000:04:00.0 failed with error -110
> >>> BUG: kernel NULL pointer dereference, address: 0000000000000090 PGD
> >>> 0 P4D 0
> >>> Oops: 0002 [#1] PREEMPT SMP NOPTI
> >>> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli
> >>> #338 Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> >>> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched] [...] Call Trace:
> >>>   <TASK>
> >>>   amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
> >>>   amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
> >>>   amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
> >>>   devm_drm_dev_init_release+0x49/0x70
> >>>   [...]
> >>>
> >>> To prevent that, check if the drm_sched was properly initialized for
> >>> a given ring before calling its fini counter-part.
> >>>
> >>> Notice ideally we'd use sched.ready for that; such field is set as
> >>> the latest thing on drm_sched_init(). But amdgpu seems to "override"
> >>> the meaning of such field - in the above oops for example, it was a
> >>> GFX ring causing the crash, and the sched.ready field was set to
> >>> true in the ring init routine, regardless of the state of the DRM sch=
eduler. Hence, we ended-up using another sched field.
> >>>>> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence
> >>>>> driver fini in s3 test (v2)")
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Guchun Chen <guchun.chen@amd.com>
> >>> Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> >>> ---
> >>>
> >>>
> >>> Hi folks, first of all thanks in advance for reviews / comments!
> >>> Notice that I've used the Fixes tag more in the sense to bring it to
> >>> stable, I didn't find a good patch candidate that added the call to
> >>> drm_sched_fini(), was reaching way too old commits...so
> >>> 067f44c8b459 seems a good candidate - or maybe not?
> >>>
> >>> Now, with regards sched.ready, spent a bit of time to figure what
> >>> was happening...would be feasible maybe to stop using that to mark
> >>> some kind ring status? I think it should be possible to add a flag
> >>> to the ring structure for that, and free sched.ready from being
> >>> manipulate by the amdgpu driver, what's your thoughts on that?
> > It's been a while, but IIRC, we used to have a ring->ready field in the=
 driver which at some point got migrated out of the driver into the GPU sch=
eduler and the driver side code never got cleaned up.  I think we should pr=
obably just drop the driver messing with that field and leave it up to the =
drm scheduler.
>
> To use ring->ready is not a good idea since this doesn't specify if the
> scheduler was initialized, but rather if bringup of the engine worked.

ring->ready no longer exists.  It was moved into the scheduler and the
driver side never got cleaned up.  Also, we set ring->sched.ready =3D
true once the rings are set up, but before we actually test them, so
it's currently a proxy for the ring being ready to test/use.

Alex

>
> It's perfectly possible that the scheduler was initialized, but then the
> IB test failed later on.
>
> I strongly suggest to use scheduler->ops instead since those are set
> during init and mandatory for correct operation.
>
> Christian.
>
> >
> > Alex
> >
> >
> >>> I could try myself, but first of course I'd like to raise the
> >>> "temperature" on this topic and check if somebody is already working
> >>> on that.
> >>>
> >>> Cheers,
> >>>
> >>> Guilherme
> >>>
> >>>
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
> >>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>> index 00444203220d..e154eb8241fb 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_d=
evice *adev)
> >>>                if (!ring || !ring->fence_drv.initialized)
> >>>                        continue;
> >>>
> >>> -             if (!ring->no_scheduler)
> >>> +             /*
> >>> +              * Notice we check for sched.name since there's some
> >>> +              * override on the meaning of sched.ready by amdgpu.
> >>> +              * The natural check would be sched.ready, which is
> >>> +              * set as drm_sched_init() finishes...
> >>> +              */
> >>> +             if (!ring->no_scheduler && ring->sched.name)
> >>>                        drm_sched_fini(&ring->sched);
> >>>
> >>>                for (j =3D 0; j <=3D ring->fence_drv.num_fences_mask; =
++j)
>
