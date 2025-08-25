Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73051B3408B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BD010E46D;
	Mon, 25 Aug 2025 13:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aurj17Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5D10E46D;
 Mon, 25 Aug 2025 13:20:46 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-246180dc32cso5656835ad.0; 
 Mon, 25 Aug 2025 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756128045; x=1756732845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=916cKpaTV2Bv5e55+QyisJcXuFvxyvvYLkcNcyrZ+IU=;
 b=aurj17HiXjB+1dmRgw4dIzHrLJYOjQFM6GOlZUoj9EsmYZVB2pFp6g1sS1XkTYTcwO
 nzRffQ8tgZUg4Rmkcgari+f4GZfZYCmGwMJ1ui9AHBicpCPsrzUvBWLqtEDUH9ajLxqO
 eBleezwme9ykDxbIQ9cx1fsK/Y+29lUtSygcNY5HDkImk4KXWDr9K9FCYzntZKmQCSPm
 MXGnsOP83oognCZCMMH3ai0NPo4okDi+zszVs9nxll/Sh4I0Bh14P4Top6zuQ/I6va1X
 Oq/nbdlHVQdNGbOzp2u+E16EcpITqRAksQYD98t0utnqRUqeyqXvDh+NZ7QDqsUuDZ1Q
 owLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756128045; x=1756732845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=916cKpaTV2Bv5e55+QyisJcXuFvxyvvYLkcNcyrZ+IU=;
 b=KrF2ADd6BHVR7c6WtJgASHzG7x/up68USIHu4gV4A+gNnBf1MsruJk59YnabAWdQhn
 UCv5PZkHKqv8Ps4qO5Ms3lp3oY/I7jBdy3cesTZjXgOGIcILOpOrQ3sgEXM7zDI7Kbby
 gBuoB49RCJlNGg+FBvPhlU6RfmV4ZhZllpMGSKMORuzJnm2zzy61soMyZBhJQU4dLnds
 Ur1lmZo92Tx9fjJqdNKSTGIzBR2ROPg/bkphzKynOgAki1UnLS1OJxudhl4hUSWX8yoB
 0009kA6BC1FtjjAiKXJ8ATSslriH4PxlcxU0pr1y1NZEuuM6F2/MkjO+5pNVdpjOFVpJ
 IijA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV43jhKB69itB52VGUp53eAXVF7j5buKoAIsS3Z5Jjppy6RLeTZ1sSWRMTtgP0/U8ryY4uSxPAMYb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPLS2yP58/lsyKuevfJItdI4oBfWIevEHhOFrRKrfip+qUw45p
 ieonu0RfuVKfQXblCRXxehX9cU1KfoqzTgPKiPjsCazEGnyx0qrnh/nM65J4Np0jQIoXbTdSxGI
 Ga3d84DhEDKT0m8HV/C0kvN9ceuuw16g=
X-Gm-Gg: ASbGncuGUcWuuWp+Z+C/jjmT2XSffeK1fK/pX+tKxwy0RfECnJuaCwHUsQl3XmzU3QG
 aSToAWomenImJ9V9Ti+7y7mObxlC0m8Mkg5JDr69yW4BTknFqdCk36ErhZbZr4QDfq08ghVKeBw
 RhNeXu6uIvO+ebKZZiTktBWl/WhS1etYhByzehAOmyAZsG3aEqO28T1ooUffYdgPSMN6CbfcJ3+
 GcqiAo=
X-Google-Smtp-Source: AGHT+IEp690PmFStsDku5/163lfuuDDvEXli97fVC+XPZoOICszQaEs/1MIHJeldfcPUn4tOqKL5URu27qf/JROkx7o=
X-Received: by 2002:a17:902:f689:b0:246:b3cc:f854 with SMTP id
 d9443c01a7336-246b3cd0030mr32444395ad.2.1756128045433; Mon, 25 Aug 2025
 06:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
In-Reply-To: <20250824085351.454619-1-lkml@antheas.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Aug 2025 09:20:33 -0400
X-Gm-Features: Ac12FXyzxE6yqBetaHXfNUckoXVIwxpDLayzpsZI8RJGbQIPFJAGin3Yt7lWFrs
Message-ID: <CADnq5_MEhMha47V25SK4cZkd8TLcizR_y0si2n9jSDjJTXeoRQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
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

On Mon, Aug 25, 2025 at 3:13=E2=80=AFAM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of the
> suspend resumes result in a soft lock around 1 second after the screen
> turns on (it freezes). This happens due to power gating VPE when it is
> not used, which happens 1 second after inactivity.
>
> Specifically, the VPE gating after resume is as follows: an initial
> ungate, followed by a gate in the resume process. Then,
> amdgpu_device_delayed_init_work_handler with a delay of 2s is scheduled
> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> causes an ungate, After that test, vpe_idle_work_handler is scheduled
> with VPE_IDLE_TIMEOUT (1s).
>
> When vpe_idle_work_handler runs and tries to gate VPE, it causes the
> SMU to hang and partially freezes half of the GPU IPs, with the thread
> that called the command being stuck processing it.
>
> Specifically, after that SMU command tries to run, we get the following:
>
> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to D3ho=
t
> ...
> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
> ...
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command=
: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe failed, =
ret =3D -62.
> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed out
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command=
: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable jpeg=
 failed, ret =3D -62.
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command=
: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret =3D -6=
2.
> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3hot
> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed out
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command=
: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
>
> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the GPU.
> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5,
> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is the
> PowerDownVpe(50) command which is the common failure point in all
> failed resumes.
>
> On a normal resume, we should get the following power gates:
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param: 0x=
00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) param: =
0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) param: =
0x00010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param: 0x=
00010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param: 0x=
00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: 0x00=
000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: 0x00=
010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param: 0x=
00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param: 0x=
00010000, resp: 0x00000001
>
> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
> time of 12s sleep, 8s resume. The suspected reason here is that 1s that
> when VPE is used, it needs a bit of time before it can be gated and
> there was a borderline delay before, which is not enough for Strix Halo.
> When the VPE is not used, such as on resume, gating it instantly does
> not seem to cause issues.

This doesn't make much sense.  The VPE idle timeout is arbitrary.  The
VPE idle work handler checks to see if the block is idle before it
powers gates the block. If it's not idle, then the delayed work is
rescheduled so changing the timing should not make a difference.  We
are no powering down VPE while it still has active jobs.  It sounds
like there is some race condition somewhere else.

Alex

>
> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vpe.c
> index 121ee17b522b..24f09e457352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> @@ -34,8 +34,8 @@
>  /* VPE CSA resides in the 4th page of CSA */
>  #define AMDGPU_CSA_VPE_OFFSET  (4096 * 3)
>
> -/* 1 second timeout */
> -#define VPE_IDLE_TIMEOUT       msecs_to_jiffies(1000)
> +/* 2 second timeout */
> +#define VPE_IDLE_TIMEOUT       msecs_to_jiffies(2000)
>
>  #define VPE_MAX_DPM_LEVEL                      4
>  #define FIXED1_8_BITS_PER_FRACTIONAL_PART      8
>
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> --
> 2.50.1
>
>
