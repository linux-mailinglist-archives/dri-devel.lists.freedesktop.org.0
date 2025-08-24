Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E268FB332A1
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 22:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B462D10E0C0;
	Sun, 24 Aug 2025 20:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="XiB2IHar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3110E0C0;
 Sun, 24 Aug 2025 20:47:00 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 10B02BDCA0;
 Sun, 24 Aug 2025 23:46:59 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 33AB8BDBD7;
 Sun, 24 Aug 2025 23:46:58 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id AF92220681E;
 Sun, 24 Aug 2025 23:46:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756068417;
 bh=bscbJOJkECDNTYehRBInDP2nwEapRVElaNUCYN3pI9k=;
 h=Received:From:Subject:To;
 b=XiB2IHareb11C+3Gn8dNiHL+xcD2P+o+mOYyURREJg1rOk7qWgxpw0xbXVQWmD2YV
 TtrY3O/ge2rKALWs0sUHAbN7P5S3fQk4WaVJTlUJbxxmoJ07ErSzfzgO5GwVnPTXsS
 svH/1GdIFfXu6Nt2djTpgwoNVWX+87eqHJJh7xfgE8a0b6dMnyvn0pfFx9h0jnk1Jg
 a0nexCeIqHjSqguPZxHx5br4ltq7VrnhoG4GXMU+PSMyezFYleSHsLCvcGMieopCkJ
 9YZ2wUEDYS5xlBUOZKrYh4cWWpSC60gdE91/njAYR38tFck1THylvU8u88u8w5+L2w
 LfrBbI71uQZeQ==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3366ce6889bso4744751fa.0;
 Sun, 24 Aug 2025 13:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSFObTZQzNh/t8kUkCtFDC73Shmv5aTdVLOpCLu4CQP6l4DLB1ruXKaPjBEmungMI63oXz1axIgj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn6zLIQavb1Wj233+ZQUbYc6WZ3+ZodVbO57wVuuev9BVKi9bB
 2InJ9CfJiOyzT8fIpaF+yYwZ7Wpc8N5ZITUSunS7tJvoFj267en3bZFJ+LUmK+dzY8ZFKaENinR
 o89p2ALX4LvqtYWxayaKVzrOM2486v8I=
X-Google-Smtp-Source: AGHT+IGq+M/un/eA9G+NxrS5XoH3rm/WeiErkBRLPEMVsWi7W0+9qPNYzWgQlFg7ReN5HgILpm94RluPgx3m2FZIKr0=
X-Received: by 2002:a2e:b8cf:0:b0:332:5fc0:24ae with SMTP id
 38308e7fff4ca-33650ea1a4bmr22003791fa.15.1756068417234; Sun, 24 Aug 2025
 13:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
In-Reply-To: <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 24 Aug 2025 22:46:46 +0200
X-Gmail-Original-Message-ID: <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
X-Gm-Features: Ac12FXybHxfycIfFrHpU8NueZUrTyJ5g6lHyxY9Fijnu3DO4sJrwYjQh5GW80N0
Message-ID: <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Mario Limonciello <superm1@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee <peytolee@amd.com>, 
 Lang Yu <lang.yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <175606841788.1039050.10100352328189007768@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On Sun, 24 Aug 2025 at 22:16, Mario Limonciello <superm1@kernel.org> wrote:
>
>
>
> On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
> > On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of th=
e
> > suspend resumes result in a soft lock around 1 second after the screen
> > turns on (it freezes). This happens due to power gating VPE when it is
> > not used, which happens 1 second after inactivity.
> >
> > Specifically, the VPE gating after resume is as follows: an initial
> > ungate, followed by a gate in the resume process. Then,
> > amdgpu_device_delayed_init_work_handler with a delay of 2s is scheduled
> > to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> > causes an ungate, After that test, vpe_idle_work_handler is scheduled
> > with VPE_IDLE_TIMEOUT (1s).
> >
> > When vpe_idle_work_handler runs and tries to gate VPE, it causes the
> > SMU to hang and partially freezes half of the GPU IPs, with the thread
> > that called the command being stuck processing it.
> >
> > Specifically, after that SMU command tries to run, we get the following=
:
> >
> > snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to D3=
hot
> > ...
> > xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
> > ...
> > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous comma=
nd: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> > [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe failed=
, ret =3D -62.
> > amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed out
> > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous comma=
nd: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> > [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable jp=
eg failed, ret =3D -62.
> > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous comma=
nd: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> > [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret =3D =
-62.
> > thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
> > thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
> > thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3ho=
t
> > amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed out
> > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous comma=
nd: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> >
> > In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the GPU=
.
> > Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5,
> > a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is the
> > PowerDownVpe(50) command which is the common failure point in all
> > failed resumes.
> >
> > On a normal resume, we should get the following power gates:
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param: =
0x00000000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) param=
: 0x00000000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) param=
: 0x00010000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param: =
0x00010000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param: =
0x00000000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: 0x=
00000000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: 0x=
00010000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param: =
0x00000000, resp: 0x00000001
> > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param: =
0x00010000, resp: 0x00000001
> >
> > To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> > reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
> > time of 12s sleep, 8s resume.
>
> When you say you reproduced with 12s sleep and 8s resume, was that
> 'amd-s2idle --duration 12 --wait 8'?

I did not use amd-s2idle. I essentially used the script below with a
12 on the wake alarm and 12 on the for loop. I also used pstore for
this testing.

for i in {1..200}; do
  echo "Suspend attempt $i"
  echo `date '+%s' -d '+ 60 seconds'` | sudo tee /sys/class/rtc/rtc0/wakeal=
arm
  sudo sh -c 'echo mem > /sys/power/state'

  for j in {1..50}; do
    # Use repeating sleep in case echo mem returns early
    sleep 1
  done
done

> > The suspected reason here is that 1s that
> > when VPE is used, it needs a bit of time before it can be gated and
> > there was a borderline delay before, which is not enough for Strix Halo=
.
> > When the VPE is not used, such as on resume, gating it instantly does
> > not seem to cause issues.
> >
> > Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vpe.c
> > index 121ee17b522b..24f09e457352 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > @@ -34,8 +34,8 @@
> >   /* VPE CSA resides in the 4th page of CSA */
> >   #define AMDGPU_CSA_VPE_OFFSET       (4096 * 3)
> >
> > -/* 1 second timeout */
> > -#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(1000)
> > +/* 2 second timeout */
> > +#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(2000)
> >
> >   #define VPE_MAX_DPM_LEVEL                   4
> >   #define FIXED1_8_BITS_PER_FRACTIONAL_PART   8
> >
> > base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
>
> 1s idle timeout has been used by other IPs for a long time.
> For example JPEG, UVD, VCN all use 1s.
>
> Can you please confirm both your AGESA and your SMU firmware version?
> In case you're not aware; you can get AGESA version from SMBIOS string
> (DMI type 40).
>
> =E2=9D=AF sudo dmidecode | grep AGESA

String: AGESA!V9 StrixHaloPI-FP11 1.0.0.0c

> You can get SMU firmware version from this:
>
> =E2=9D=AF grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*

grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
/sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_fw_version:100.112.0
/sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_program:0

> Are you on the most up to date firmware for your system from the
> manufacturer?

I updated my bios, pd firmware, and USB device firmware early August,
when I was doing this testing.

> We haven't seen anything like this reported on Strix Halo thus far and
> we do internal stress testing on s0i3 on reference hardware.

Cant find a reference for it on the bug tracker. I have four bug
reports on the bazzite issue tracker, 2 about sleep wake crashes and 2
for runtime crashes, where the culprit would be this. IE runtime gates
VPE and causes a crash.

> To me this seems likely to be a platform firmware bug; but I would like
> to understand the timing of the gate vs ungate on good vs bad.

Perhaps it is. It is either something like that or silicon quality.

> IE is it possible the delayed work handler
> amdgpu_device_delayed_init_work_handler() is causing a race with
> vpe_ring_begin_use()?

I don't think so. There is only a single ungate. Also, the crash
happens on the gate. So what happens is the device wakes up, the
screen turns on, kde clock works, then after a second it freezes,
there is a softlock, and the device hangs.

The failed command is always the VPE gate that is triggered after 1s in idl=
e.

> This should be possible to check without extra instrumentation by using
> ftrace and looking at the timing of the 2 ring functions and the init
> work handler and checking good vs bad cycles.

I do not know how to use ftrace. I should also note that after the
device freezes around 1/5 cycles will sync the fs, so it is also not a
very easy thing to diagnose. The device just stops working. A lot of
the logs I got were in pstore by forcing a kernel panic.

If you say that all IP blocks use 1s, perhaps an alternative solution
would be to desync the idle times so they do not happen
simultaneously. So 1000, 1200, 1400, etc.

Antheas

