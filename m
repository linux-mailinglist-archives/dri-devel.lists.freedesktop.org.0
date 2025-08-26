Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F082B364C7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 15:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1B210E379;
	Tue, 26 Aug 2025 13:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iuocZSCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608A10E378;
 Tue, 26 Aug 2025 13:41:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-24617d3f077so8028285ad.0; 
 Tue, 26 Aug 2025 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756215715; x=1756820515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Na2MfuPlQzsdmOpizppjRy+Z+KXm/8+fdyjFNM3e0V4=;
 b=iuocZSCqUsrOl9bN8Z6eJg1mspNuD/D68io5LeechaGaqOD87ZO37arTdXnFOkAt/K
 0GqA3w6QOQqVv423P8UhO3rH4m4/FW2zmGEycwXOhakPAf52RBz2SNCJAZX1SXZgvmZS
 jHlnHkcXsstHkBInh8UwyGx3o6rVk2J/GGR9w9CQhZhQLjEOPJo/c+tPbt5b8w60pV55
 nar3SpNDxG8zCWAJ2zicYvOKFHn0jHUi4P7E3n1GQbDVrkbTYFsCi4OdA4jLAheTaoPt
 3PMz8Fb2TyQ4xju+52PGXtrZOuFs2Vf86basDVH6LqStLbw/rhNpT+DDjMdiXprbmWl5
 GR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756215715; x=1756820515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Na2MfuPlQzsdmOpizppjRy+Z+KXm/8+fdyjFNM3e0V4=;
 b=uDi3hVzt2dXAoLcyFP/53nwE13VIVyLaWDRgkqegMrcN7dHpWDlqbmNKFarbXcRmvn
 Qxq3siyfBoejzXwkkl7VnS0VGli0Tk6Aqko0GtsyKU/DShIUqx7ki0SJF87Jt6rNvggB
 ib7x19NIruza95cpF9fUlJXTEXqVPXTvY5vic4pyuIok/6QUQL2DK5fF48SG8CVYUrAk
 rPB7Yq9Njl4TtbCHQY7N9eY1GZu5JmJZWAb5XuWBx0cQXN8xwsCmmLxKtTqWoWMHEqNr
 yGaEJAsouVuddyWTyVFGdQ6GOWZEzbkERCAXqh6+mpl8mjucYZK4RLtLkk4CjRrT4/t2
 0kUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz5UxYmCFbTrk519SAIHXGVUNdD7plI5CkXDMjc8NmCnRqG0LpNiIEisnCfciOqDy/4g7zHp3W@lists.freedesktop.org,
 AJvYcCXQYy/aX4tguERZWuJDUWbQv+7t8/tK9ZVGCYjwuGCjgFqdDGZKVxq9HgPTGCRxFOiyqUIzwAGvToOK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy44/XJXc9QA9N/kJx+xq3Y6KVBgFuXTCKGeRtOslDArBDGAZ1d
 jEtXm6BIcj5aasyhnF63JnOga7iMJWKkDK8RHxJPVehiDwzjBwYLox6CmnSyxbmUgIzE3X5EdFM
 dABV4szRQdIzdpkaGwE1J5Eyx3skcbtw=
X-Gm-Gg: ASbGncuCV/pnr3evCGVhs6GEWv7+kwCYVP/r2g2S5p8KQP1zI6LGQVfdQWvErUy/WYg
 n2vqQuoN1UBBp1ihAszcujJLit1YUWpeH5y8DsxMYfNj4rpvPucyC3cCqlGwkeCjDRGPRBXfJSO
 ic0SzNHi39Gs+HkqOyQZOmJMIpW37eqVwCnzcqr72uZ1Ib0ufcLsWShDNTvJ3i1L2LspwU7sNRI
 zZuCWY=
X-Google-Smtp-Source: AGHT+IGXGy/mSAIBBVHkoj9IdaUJHhOJXONKxNdO+PhK5oCgZKinWGfwiL1zqGku4fyjcaQOMbwMfCww/attytfNrm0=
X-Received: by 2002:a17:902:d508:b0:246:cc19:17de with SMTP id
 d9443c01a7336-246cc19233cmr54542985ad.4.1756215714423; Tue, 26 Aug 2025
 06:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
 <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
 <03e5408a-dc5d-4259-a366-2090ef1df622@kernel.org>
 <CAGwozwFCXFGHtpDejq_kr-1JaQhgXc-fyuCHK5FX2k57eKWfmw@mail.gmail.com>
In-Reply-To: <CAGwozwFCXFGHtpDejq_kr-1JaQhgXc-fyuCHK5FX2k57eKWfmw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Aug 2025 09:41:43 -0400
X-Gm-Features: Ac12FXzmeBcxlr6RXDR3tLAZ2bfUR4pWbHI1q58qI3xlGFEC8X9pVX1E9D9SOsE
Message-ID: <CADnq5_Ow4SCZz_jnaQ-Y4zUEnBEKbeW5um3HFyLQvYvOy9WsAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee <peytolee@amd.com>,
 Lang Yu <lang.yu@amd.com>
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

On Tue, Aug 26, 2025 at 3:49=E2=80=AFAM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On Mon, 25 Aug 2025 at 03:38, Mario Limonciello <superm1@kernel.org> wrot=
e:
> >
> >
> >
> > On 8/24/25 3:46 PM, Antheas Kapenekakis wrote:
> > > On Sun, 24 Aug 2025 at 22:16, Mario Limonciello <superm1@kernel.org> =
wrote:
> > >>
> > >>
> > >>
> > >> On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
> > >>> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% o=
f the
> > >>> suspend resumes result in a soft lock around 1 second after the scr=
een
> > >>> turns on (it freezes). This happens due to power gating VPE when it=
 is
> > >>> not used, which happens 1 second after inactivity.
> > >>>
> > >>> Specifically, the VPE gating after resume is as follows: an initial
> > >>> ungate, followed by a gate in the resume process. Then,
> > >>> amdgpu_device_delayed_init_work_handler with a delay of 2s is sched=
uled
> > >>> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> > >>> causes an ungate, After that test, vpe_idle_work_handler is schedul=
ed
> > >>> with VPE_IDLE_TIMEOUT (1s).
> > >>>
> > >>> When vpe_idle_work_handler runs and tries to gate VPE, it causes th=
e
> > >>> SMU to hang and partially freezes half of the GPU IPs, with the thr=
ead
> > >>> that called the command being stuck processing it.
> > >>>
> > >>> Specifically, after that SMU command tries to run, we get the follo=
wing:
> > >>>
> > >>> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 t=
o D3hot
> > >>> ...
> > >>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3h=
ot
> > >>> ...
> > >>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous c=
ommand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > >>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> > >>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe fa=
iled, ret =3D -62.
> > >>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed=
 out
> > >>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous c=
ommand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > >>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> > >>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disabl=
e jpeg failed, ret =3D -62.
> > >>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous c=
ommand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > >>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> > >>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret =
=3D -62.
> > >>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0x=
d3
> > >>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x=
5
> > >>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to =
D3hot
> > >>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed=
 out
> > >>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous c=
ommand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > >>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> > >>>
> > >>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the=
 GPU.
> > >>> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00=
.5,
> > >>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is =
the
> > >>> PowerDownVpe(50) command which is the common failure point in all
> > >>> failed resumes.
> > >>>
> > >>> On a normal resume, we should get the following power gates:
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) par=
am: 0x00000000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) p=
aram: 0x00000000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) p=
aram: 0x00010000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) par=
am: 0x00010000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) par=
am: 0x00000000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param=
: 0x00000000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param=
: 0x00010000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) par=
am: 0x00000000, resp: 0x00000001
> > >>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) par=
am: 0x00010000, resp: 0x00000001
> > >>>
> > >>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> > >>> reliability from 4-25 suspends to 200+ (tested) suspends with a cyc=
le
> > >>> time of 12s sleep, 8s resume.
> > >>
> > >> When you say you reproduced with 12s sleep and 8s resume, was that
> > >> 'amd-s2idle --duration 12 --wait 8'?
> > >
> > > I did not use amd-s2idle. I essentially used the script below with a
> > > 12 on the wake alarm and 12 on the for loop. I also used pstore for
> > > this testing.
> > >
> > > for i in {1..200}; do
> > >    echo "Suspend attempt $i"
> > >    echo `date '+%s' -d '+ 60 seconds'` | sudo tee /sys/class/rtc/rtc0=
/wakealarm
> > >    sudo sh -c 'echo mem > /sys/power/state'
> > >
> > >    for j in {1..50}; do
> > >      # Use repeating sleep in case echo mem returns early
> > >      sleep 1
> > >    done
> > > done
> >
> > =F0=9F=91=8D
> >
> > >
> > >>> The suspected reason here is that 1s that
> > >>> when VPE is used, it needs a bit of time before it can be gated and
> > >>> there was a borderline delay before, which is not enough for Strix =
Halo.
> > >>> When the VPE is not used, such as on resume, gating it instantly do=
es
> > >>> not seem to cause issues.
> > >>>
> > >>> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> > >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > >>> ---
> > >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
> > >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_vpe.c
> > >>> index 121ee17b522b..24f09e457352 100644
> > >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > >>> @@ -34,8 +34,8 @@
> > >>>    /* VPE CSA resides in the 4th page of CSA */
> > >>>    #define AMDGPU_CSA_VPE_OFFSET       (4096 * 3)
> > >>>
> > >>> -/* 1 second timeout */
> > >>> -#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(1000)
> > >>> +/* 2 second timeout */
> > >>> +#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(2000)
> > >>>
> > >>>    #define VPE_MAX_DPM_LEVEL                   4
> > >>>    #define FIXED1_8_BITS_PER_FRACTIONAL_PART   8
> > >>>
> > >>> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> > >>
> > >> 1s idle timeout has been used by other IPs for a long time.
> > >> For example JPEG, UVD, VCN all use 1s.
> > >>
> > >> Can you please confirm both your AGESA and your SMU firmware version=
?
> > >> In case you're not aware; you can get AGESA version from SMBIOS stri=
ng
> > >> (DMI type 40).
> > >>
> > >> =E2=9D=AF sudo dmidecode | grep AGESA
> > >
> > > String: AGESA!V9 StrixHaloPI-FP11 1.0.0.0c
> > >
> > >> You can get SMU firmware version from this:
> > >>
> > >> =E2=9D=AF grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
> > >
> > > grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
> > > /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_fw_version:100.112.=
0
> > > /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_program:0
> > >
> >
> > Thanks, I'll get some folks to see if we match this AGESA version if we
> > can also reproduce it on reference hardware the same way you did.
> >
> > >> Are you on the most up to date firmware for your system from the
> > >> manufacturer?
> > >
> > > I updated my bios, pd firmware, and USB device firmware early August,
> > > when I was doing this testing.
> > >
> > >> We haven't seen anything like this reported on Strix Halo thus far a=
nd
> > >> we do internal stress testing on s0i3 on reference hardware.
> > >
> > > Cant find a reference for it on the bug tracker. I have four bug
> > > reports on the bazzite issue tracker, 2 about sleep wake crashes and =
2
> > > for runtime crashes, where the culprit would be this. IE runtime gate=
s
> > > VPE and causes a crash.
> >
> > All on Strix Halo and all tied to VPE?  At runtime was VPE in use?  By
> > what software?
> >
> > BTW - Strix and Kraken also have VPE.
>
> All on the Z13. Not tied to VPE necessarily. I just know that I get
> reports of crashes on the Z13, and with this patch they are fixed for
> me. It will be part of the next bazzite version so I will get feedback
> about it.
>
> I don't think software that is using the VPE is relevant. Perhaps for
> the runtime crashes it is and this patch helps in that case as well.
> But in my case, the crash is caused after the ungate that runs the
> tests on resume on the delayed handler.
>
> The Z13 also has some other quirks with spurious wakeups when
> connected to a charger. So, if systemd is configured to e.g., sleep
> after 20m, combined with this crash if it stays plugged in overnight
> in the morning it has crashed.
>
> > >
> > >> To me this seems likely to be a platform firmware bug; but I would l=
ike
> > >> to understand the timing of the gate vs ungate on good vs bad.
> > >
> > > Perhaps it is. It is either something like that or silicon quality.
> > >
> > >> IE is it possible the delayed work handler
> > >> amdgpu_device_delayed_init_work_handler() is causing a race with
> > >> vpe_ring_begin_use()?
> > >
> > > I don't think so. There is only a single ungate. Also, the crash
> > > happens on the gate. So what happens is the device wakes up, the
> > > screen turns on, kde clock works, then after a second it freezes,
> > > there is a softlock, and the device hangs.
> > >
> > > The failed command is always the VPE gate that is triggered after 1s =
in idle.
> > >
> > >> This should be possible to check without extra instrumentation by us=
ing
> > >> ftrace and looking at the timing of the 2 ring functions and the ini=
t
> > >> work handler and checking good vs bad cycles.
> > >
> > > I do not know how to use ftrace. I should also note that after the
> > > device freezes around 1/5 cycles will sync the fs, so it is also not =
a
> > > very easy thing to diagnose. The device just stops working. A lot of
> > > the logs I got were in pstore by forcing a kernel panic.
> >
> > Here's how you capture the timing of functions.  Each time the function
> > is called there will be an event in the trace buffer.
> >
> > =E2=9D=AF sudo trace-cmd record -p function -l
> > amdgpu_device_delayed_init_work_handler -l vpe_idle_work_handler -l
> > vpe_ring_begin_use -l vpe_ring_end_use -l amdgpu_pmops_suspend -l
> > amdgpu_pmops_resume
> >
> > Here's how you would review the report:
> >
> > =E2=9D=AF trace-cmd report
> > cpus=3D24
> >    kworker/u97:37-18051 [001] ..... 13655.970108: function:
> > amdgpu_pmops_suspend <-- pci_pm_suspend
> >    kworker/u97:21-18036 [002] ..... 13666.290715: function:
> > amdgpu_pmops_resume <-- dpm_run_callback
> >    kworker/u97:21-18036 [015] ..... 13666.308295: function:
> > vpe_ring_begin_use <-- amdgpu_ring_alloc
> >    kworker/u97:21-18036 [015] ..... 13666.308298: function:
> > vpe_ring_end_use <-- vpe_ring_test_ring
> >      kworker/15:1-12285 [015] ..... 13666.960191: function:
> > amdgpu_device_delayed_init_work_handler <-- process_one_work
> >      kworker/15:1-12285 [015] ..... 13666.963970: function:
> > vpe_ring_begin_use <-- amdgpu_ring_alloc
> >      kworker/15:1-12285 [015] ..... 13666.965481: function:
> > vpe_ring_end_use <-- amdgpu_ib_schedule
> >      kworker/15:4-16354 [015] ..... 13667.981394: function:
> > vpe_idle_work_handler <-- process_one_work
> >
> > I did this on a Strix system just now to capture that.
> >
> > You can see that basically the ring gets used before the delayed init
> > work handler, and then again from the ring tests.  My concern is if the
> > sequence ever looks different than the above.  If it does; we do have a
> > driver race condition.
> >
> > It would also be helpful to look at the function_graph tracer.
> >
> > Here's some more documentation about ftrace and trace-cmd.
> > https://www.kernel.org/doc/html/latest/trace/ftrace.html
> > https://lwn.net/Articles/410200/
> >
> > You can probably also get an LLM to help you with building commands if
> > you're not familiar with it.
> >
> > But if you're hung so bad you can't flush to disk that's going to be a
> > problem without a UART.  A few ideas:
>
> Some times it flushes to disk
>
> > 1) You can use CONFIG_PSTORE_FTRACE
>
> I can look into that
>
> > 2) If you add "tp_printk" to the kernel command line it should make the
> > trace ring buffer flush to kernel log ring buffer.  But be warned this
> > is going to change the timing, the issue might go away entirely or have
> > a different failure rate.  So hopefully <1> works.
> > >
> > > If you say that all IP blocks use 1s, perhaps an alternative solution
> > > would be to desync the idle times so they do not happen
> > > simultaneously. So 1000, 1200, 1400, etc.
> > >
> > > Antheas
> > >
> >
> > I don't dobut your your proposal of changing the timing works.  I just
> > want to make sure it's the right solution because otherwise we might
> > change the timing or sequence elsewhere in the driver two years from no=
w
> > and re-introduce the problem unintentionally.
>
> If there are other idle timers and only this one changes to 2s, I will
> agree and say that it would be peculiar. Although 1s seems arbitrary
> in any case.

All of these timers are arbitrary.  Their point is just to provide a
future point where we can check if the engine is idle.  The idle work
handler will either power down the IP if it is idle or re-schedule in
the future and try again if there is still work.  Making the value
longer will use more power as it will wait longer before checking if
the engine is idle.  Making it shorter will save more power, but adds
extra overhead in that the engine will be powered up/down more often.
In most cases, the jobs should complete in a few ms.  The timer is
there to avoid the overhead of powering up/down the block too
frequently when applications are using the engine.

Alex
