Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17714CF4E24
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D931810E40F;
	Mon,  5 Jan 2026 17:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qq/dNaMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655DF10E40F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:04:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso30313266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767632639; x=1768237439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLOXEY1Qri9p0nnDNgK4uA5ooysQ1vu9cJFIaTI3E5s=;
 b=Qq/dNaMPkOvdy6IeKKeHB0vXSpD8NbcrYFxHETvizkaDygP5fsF1LtM4/CYFlMpe77
 ZWPqBeQmF/m8kI/T9qUKKC5mfeA83ckFwiAD92CqEyaq/mtqEpgpIKCqAz0n0yAz+5H6
 gBZEJbp1augkpv2L6vFoYkNx/M8Wc0azjb+5vEOA6GaHeI/kC0KvLEHp48yMuJTZe+J0
 AX/KR84xkk+YIIWWa+LL2PLH+sgmse5+02+lGIs26TktiMoGKtOz8Nk8vOAIPTMiWpdg
 ycH0yh/T+eglox8eRfe6CjH2v29cil/JXGxFEs3fSXiPnprj2c6hT9g5UNpA16rG2TM8
 TAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767632639; x=1768237439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uLOXEY1Qri9p0nnDNgK4uA5ooysQ1vu9cJFIaTI3E5s=;
 b=dGhI+G3DHfNGr991CVbcMmHYFlVfKasmZbqrMk6cCFSrkM5/eslkAZgyOTJVaeMbC9
 UaggZgnUYGNEFmlixhTL2pLqWWN6boF7lTKJcj+F7KSadypwZY4NXstUZyuxZ2e93b9R
 fi6euSfdu6rINd+p5FR0bMqotnO5gdhzKQwDEK6O2WUsOrqztvm+LrXcmDBAApUvPo2h
 IMK2FPjFVFGVDRTqCiJmYQL0pyXSNtBL1sSxIs9TiHD/HrMamAhtt8dCJFS0WhoTbzKG
 EJsR4bF0vm63sbat3zONYq1nfjH0dWur86yzt+g4uHPElonl6AtSOXam4jw2DPMHwDpf
 VT+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtacipRQ7y4cNjjVITMAGKdUuYeRv7IkTDZbrXfcdHTByMRFws61Jjc/B7ulNYX6JeXgTmcvxAVts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqMFQWlcYlhpfAJ89Lj2gdx/wpodl0RL9zxIhnThlmSsqF/Muc
 HgaLH3Y7Ebhb/GfByy6is6lNqROyGN0n6eFGZavvPDazdX77IWnoPbiTajJyUDSUXkpfRAMXNWl
 kFjjhSP7LSjwBy9rJhQDCA9hQUJPkLuA=
X-Gm-Gg: AY/fxX7K1iQbwmKilLCOzpGme2aM5ANWdEFbRRE/Iq2Tt3dMkOFqGvtnEizdcSvTv6s
 Cn8eV6aVvSTC8HuGbFXNEy5okdo0T50GKwODRMX68Nowdnwn9oavzm2afYJmQmjelQgF5J6kFU0
 RCbqfSjbzsXB2JreRhCWtEdqwlhD0K+POwW/tJCfPRUC0sLhbBMeoyFlJuTIZxO8Ds6NC72kkg/
 KQ63cPc012uJEM/SmwIleQWLs89oK0uY2lOPvaRMS1bIXfAU4TsfGaCCU0ihYDq0ow=
X-Google-Smtp-Source: AGHT+IGTEm6ocQlyp52971Ybv/2thfxgj9p/qHafSBYt15TEStSleVlo5A8TijS46Uula6k32wBrM89UmOkdhKd6sZc=
X-Received: by 2002:a17:907:a08:b0:b7c:e5d6:2462 with SMTP id
 a640c23a62f3a-b8426aa6a5bmr47229366b.28.1767632638556; Mon, 05 Jan 2026
 09:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20251230091037.5603-1-jerome.tollet@gmail.com>
 <cdc74618559002ea59915631661be8f4d64c8724@intel.com>
 <CADN_a6MoRS3qQ-ZQXNHXbCzu8_6SoGqUT0pK=TNy5MfdmCVLdQ@mail.gmail.com>
In-Reply-To: <CADN_a6MoRS3qQ-ZQXNHXbCzu8_6SoGqUT0pK=TNy5MfdmCVLdQ@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Mon, 5 Jan 2026 18:03:47 +0100
X-Gm-Features: AQt7F2rDtkAnB3nm5YEUfacEbYHPmAUhLs8aaU2eAM1tYFblGnDGNjdBi_sR2Aw
Message-ID: <CADN_a6OLnGdThC54YsU8VEqBeX0JXzzrHDmB70F18wTGi8Fq0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/hdmi: Fix 4K@60Hz HDMI display with SCDC timing
 delays
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
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

Hi Jani,
I've added the complete dmesg logs with drm.debug=3D0x1ff to GitLab
issue #6868. The logs confirm stable operation with the patch applied,
showing proper HDMI 2.0 scrambling timing at 4K@60Hz.

Please let me know if you need any additional information.

Thanks,
Jerome

Le mar. 30 d=C3=A9c. 2025 =C3=A0 18:37, J=C3=A9r=C3=B4me Tollet <jerome.tol=
let@gmail.com> a =C3=A9crit :
>
> Hi Jani,
>
>   Yes, there is an existing GitLab issue:
>   https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6868
>
>   The issue contains:
>   - Original problem description and hardware details
>   - dmesg logs showing the SCDC timing issue (16ms between disable/enable=
)
>   - Discussion with Ankit Nautiyal who recommended submitting this patch
>
>   I can provide additional logs if needed:
>   - dmesg with drm.debug enabled (before and after the fix)
>   - Logs showing the improved timing (112-142ms) with the patch applied
>
>   Please let me know if you need specific debug information.
>
>   Thanks,
>   Jerome
>
>
> Le mar. 30 d=C3=A9c. 2025 =C3=A0 15:59, Jani Nikula
> <jani.nikula@linux.intel.com> a =C3=A9crit :
> >
> > On Tue, 30 Dec 2025, Jerome Tollet <jerome.tollet@gmail.com> wrote:
> > > Some HDMI 2.0 monitors fail to decode the signal at 4K@60Hz (594 MHz)
> > > when SCDC scrambling is configured too quickly. The monitor displays
> > > "format detection" error and never recovers, despite SCDC I2C
> > > transactions succeeding.
> > >
> > > Root cause: The SCDC disable/enable sequence happens too fast (~16ms)=
,
> > > causing the monitor to lose sync during the transition. HDMI 2.0 spec
> > > section 10.4.1.7 states that the sink can disable scrambling if it
> > > doesn't detect a scrambled clock within 100ms.
> > >
> > > Solution: Add timing delays to allow the monitor to properly handle
> > > the SCDC configuration:
> > > - 100ms before SCDC configuration (let monitor stabilize)
> > > - 150ms after DDI enable (let monitor lock onto scrambled signal)
> > >
> > > Testing performed on:
> > > - Hardware: Intel Alder Lake-N N100 (Gen12.0, PCI ID 8086:46d1)
> > > - Monitor: Cisco Desk Pro (HDMI 2.0 capable)
> > > - Resolution: 3840x2160@60Hz via HDMI 2.0
> > > - Kernel: Linux 6.18.1
> > > - Test scenarios:
> > >   * Multiple reboots (stable across all tests)
> > >   * DPMS ON/OFF cycles (suspend/resume works correctly)
> > >
> > > Impact: Adds 250ms delay during boot, only when hdmi_scrambling is
> > > active (resolutions > 340 MHz). No impact on lower resolutions or
> > > runtime performance.
> > >
> > > Fixes display initialization on monitors sensitive to SCDC timing.
> > >
> > > Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
> >
> > Do you have a gitlab issue open about this? If not, please open one and
> > provide your dmesg with debugs enabled as described at [1].
> >
> > Thanks,
> > Jani.
> >
> >
> > [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.=
html
> >
> >
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/d=
rm/i915/display/intel_ddi.c
> > > index abcdef123456..fedcba654321 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > > @@ -3414,6 +3414,10 @@ static void intel_ddi_enable_hdmi(struct intel=
_atomic_state *state,
> > >       enum port port =3D encoder->port;
> > >       u32 buf_ctl =3D 0;
> > >
> > > +     /* Give monitor time to be ready before SCDC configuration */
> > > +     if (crtc_state->hdmi_scrambling)
> > > +             msleep(100);
> > > +
> > >       if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
> > >                                              crtc_state->hdmi_high_tm=
ds_clock_ratio,
> > >                                              crtc_state->hdmi_scrambl=
ing))
> > > @@ -3502,6 +3506,10 @@ static void intel_ddi_enable_hdmi(struct intel=
_atomic_state *state,
> > >       }
> > >
> > >       intel_ddi_buf_enable(encoder, buf_ctl);
> > > +
> > > +     /* Give monitor time to lock onto scrambled signal after DDI en=
able */
> > > +     if (crtc_state->hdmi_scrambling)
> > > +             msleep(150);
> > >  }
> > >
> > >  static void intel_ddi_enable(struct intel_atomic_state *state,
> > > --
> > > 2.43.0
> >
> > --
> > Jani Nikula, Intel
