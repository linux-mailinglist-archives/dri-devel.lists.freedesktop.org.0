Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03273CEA542
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760510E36E;
	Tue, 30 Dec 2025 17:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D/gv5CsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826B110E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:38:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b7697e8b01aso1857776566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767116290; x=1767721090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nolWSOuoFIaXAYcCPhxst3FAfIBqfx/Rjg/ljjtqTE=;
 b=D/gv5CsRiAN2pomEeNK3rU0emP0F7kxeLKwj2HzeTMlvXyYP+d+K+IKwFSjDFUEDny
 RfvvLpggFWLUVsAaIw5hKkGaZKlYeOLpN9jgSJqvpqRLAIeia/YczUHv7Vql6bzjEWWB
 DXBQsMtL+NNmv5BI5yYBupoOEZJJzn/hygV6QZSAsYx3UuLHRxOdU308+TkL+HZ+j2/L
 AqUp5C7BJHz81CCz/JpyIbv8YBAZuutBOucnGZqxwwJAmhFZp8Xh8xRg6Rm+HlkyULO5
 ddE1qvaWP7oHsqdbq/opPZNvvpLluXCBfpwJdI6B92vWbA0rFuuchHamRtfuqDjLoM0e
 5UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767116290; x=1767721090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2nolWSOuoFIaXAYcCPhxst3FAfIBqfx/Rjg/ljjtqTE=;
 b=k3qiz4ynwlF6+I/KEw4sgi4xjmVMWyBx7cRP7AhKly58zjcAYJJqzmBM0KOj9MMSMK
 uFT9GpMPcNcPKvys5DcKQR8jn2v04Ofol1K+jCuUibkbsGltVpyprdwG9z/ygEKC5wYQ
 quQvSZi3XuyGg9RL3P1PvTBNLqGCHYrdvo0n1xcnyfybini9H0ZNkJphYhpk81BLWZjL
 SsR463qeqy9yJWa15k63vn5xR6JnfPCMWf0yx322D1L/mNdaWhTS1Mf004A0CmCBcM5f
 rLQ5dvgEopdI8Obut/GLYjffd0YEkXoKuYX+a0T6dWTjNs0vKfLPmGBBdF4uHcVbcz64
 a0CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6sokp7RbwItLst/mtnRTGsPxcpizkejHAPV3c1reG8XzYMEy8f1N+Z9gI/6WXEgpQnViC0OIFQ2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZwHQY6FfnrtPOLnkcK/wScK6T2SU25Kj44kqmruQdM/JCUtbO
 +kybSsmBi6HhNSgZuOitAb/fWSDlxTSgj7ewq2ajUX+qSZsH6kk8LTlWWUSR3u+M9E6n2oQxLkX
 l51nkfxzsPVjbXYYkw2xuEpmahiOX7HMa03AC
X-Gm-Gg: AY/fxX52jVx48mPbD2GDs7uzJOxTiO+LLUBZ8hbnBr6n2FrYGgolVS9PjCIPuhZZ6Ag
 lchfhglmW/V0gQ/iKDo9/6ttWw9YfsBZ0Y8v1S+uaRHROvj/2OKjJ5yuLSV05NxpuabSSmaPlAN
 3LvKK/HDtxDV2mwjuwoP6DW9O1kPwgO7cNyWEw7GALAbG99BTl3NieeztpKMxl9P3qgKzRG3tgL
 SGS0biEfb455aIcI0CSP/4+0KZ3FPq2QuLBVj4/k227svvGP1IzWJnvs7imjfO2Df4=
X-Google-Smtp-Source: AGHT+IG29GCB+85RGznyF5Nts59q17FmzE7nnqfJ9n5p25kGcRIPfwDRriQ1f9CxzxrhWvKr1L0YE91ol4FQdxIlnys=
X-Received: by 2002:a17:906:6a17:b0:b77:1d75:8b78 with SMTP id
 a640c23a62f3a-b8037180282mr3736122366b.53.1767116289637; Tue, 30 Dec 2025
 09:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20251230091037.5603-1-jerome.tollet@gmail.com>
 <cdc74618559002ea59915631661be8f4d64c8724@intel.com>
In-Reply-To: <cdc74618559002ea59915631661be8f4d64c8724@intel.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Tue, 30 Dec 2025 18:37:58 +0100
X-Gm-Features: AQt7F2oJ8n9CKI9ed9imjR-sv8PtnMJo-IfMsfu2cnFzTCQE4hzls6Vl40Z3WgU
Message-ID: <CADN_a6MoRS3qQ-ZQXNHXbCzu8_6SoGqUT0pK=TNy5MfdmCVLdQ@mail.gmail.com>
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

  Yes, there is an existing GitLab issue:
  https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6868

  The issue contains:
  - Original problem description and hardware details
  - dmesg logs showing the SCDC timing issue (16ms between disable/enable)
  - Discussion with Ankit Nautiyal who recommended submitting this patch

  I can provide additional logs if needed:
  - dmesg with drm.debug enabled (before and after the fix)
  - Logs showing the improved timing (112-142ms) with the patch applied

  Please let me know if you need specific debug information.

  Thanks,
  Jerome


Le mar. 30 d=C3=A9c. 2025 =C3=A0 15:59, Jani Nikula
<jani.nikula@linux.intel.com> a =C3=A9crit :
>
> On Tue, 30 Dec 2025, Jerome Tollet <jerome.tollet@gmail.com> wrote:
> > Some HDMI 2.0 monitors fail to decode the signal at 4K@60Hz (594 MHz)
> > when SCDC scrambling is configured too quickly. The monitor displays
> > "format detection" error and never recovers, despite SCDC I2C
> > transactions succeeding.
> >
> > Root cause: The SCDC disable/enable sequence happens too fast (~16ms),
> > causing the monitor to lose sync during the transition. HDMI 2.0 spec
> > section 10.4.1.7 states that the sink can disable scrambling if it
> > doesn't detect a scrambled clock within 100ms.
> >
> > Solution: Add timing delays to allow the monitor to properly handle
> > the SCDC configuration:
> > - 100ms before SCDC configuration (let monitor stabilize)
> > - 150ms after DDI enable (let monitor lock onto scrambled signal)
> >
> > Testing performed on:
> > - Hardware: Intel Alder Lake-N N100 (Gen12.0, PCI ID 8086:46d1)
> > - Monitor: Cisco Desk Pro (HDMI 2.0 capable)
> > - Resolution: 3840x2160@60Hz via HDMI 2.0
> > - Kernel: Linux 6.18.1
> > - Test scenarios:
> >   * Multiple reboots (stable across all tests)
> >   * DPMS ON/OFF cycles (suspend/resume works correctly)
> >
> > Impact: Adds 250ms delay during boot, only when hdmi_scrambling is
> > active (resolutions > 340 MHz). No impact on lower resolutions or
> > runtime performance.
> >
> > Fixes display initialization on monitors sensitive to SCDC timing.
> >
> > Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
>
> Do you have a gitlab issue open about this? If not, please open one and
> provide your dmesg with debugs enabled as described at [1].
>
> Thanks,
> Jani.
>
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.ht=
ml
>
>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm=
/i915/display/intel_ddi.c
> > index abcdef123456..fedcba654321 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -3414,6 +3414,10 @@ static void intel_ddi_enable_hdmi(struct intel_a=
tomic_state *state,
> >       enum port port =3D encoder->port;
> >       u32 buf_ctl =3D 0;
> >
> > +     /* Give monitor time to be ready before SCDC configuration */
> > +     if (crtc_state->hdmi_scrambling)
> > +             msleep(100);
> > +
> >       if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
> >                                              crtc_state->hdmi_high_tmds=
_clock_ratio,
> >                                              crtc_state->hdmi_scramblin=
g))
> > @@ -3502,6 +3506,10 @@ static void intel_ddi_enable_hdmi(struct intel_a=
tomic_state *state,
> >       }
> >
> >       intel_ddi_buf_enable(encoder, buf_ctl);
> > +
> > +     /* Give monitor time to lock onto scrambled signal after DDI enab=
le */
> > +     if (crtc_state->hdmi_scrambling)
> > +             msleep(150);
> >  }
> >
> >  static void intel_ddi_enable(struct intel_atomic_state *state,
> > --
> > 2.43.0
>
> --
> Jani Nikula, Intel
