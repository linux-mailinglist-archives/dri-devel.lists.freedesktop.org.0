Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D563797CD83
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3310E747;
	Thu, 19 Sep 2024 18:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bta19Z4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC87710E741
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:21:23 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2db6e80555dso189932a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 11:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770083; x=1727374883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MrYY6KXrN1UOAxqtI8px2dOYmvL0jSPY/p2rOj/QCs=;
 b=Bta19Z4nrUqhieWnRAOReTEi9IFzeE1CLrAfsR5UTB2WR9G8D0FskK+SAJLDjiWMBf
 IPIb0gRC8crVXzUqgZGlWAvf78YPYcLn55LM/nnHGKa/NdXqQ1TLc52iyK/0r7+pcjOO
 K/HZzDMUVi+88dBDVw3RJriwqu8bAj/oxS6wBZBl4UOGtONxZdqJDHYfetu/yf9WrV9f
 XHatKzsI2yi4hduAiCQT5gaL06VFWKNlvys9125DVHT7QIRnRX5oSL9WvARRDbTjn0gM
 0LyoUIcmJ0Bh1Foj9aBkdOlb/IsCgW0bfvukPSPmOJw8kJ1cl9iA65ucUAchTNfu7Asy
 8bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770083; x=1727374883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MrYY6KXrN1UOAxqtI8px2dOYmvL0jSPY/p2rOj/QCs=;
 b=RGECJjItugwucg+EBwCDVsU8w03l0mh+m01nREfJuS/f/9BwKzsOsCKlXS+VBTJ7QA
 CszHilmeihfrz5mhN9dgOHzE7z+E8+C0VAx/Fts/T6TtGqYBub+YyjHdEkK72eoU35Cw
 Ki72bvLOW/gb2dcRtziLVUD8dKTyBSTD4bj+o0uVp9zpuzfcmcVY0Ae9up4WL+ktB6xF
 0KAYD9C0RD1sRXODTQ4vNxgTEDCrhs05knrGTTeyohjFZGAz/fnXI4ZRUivU/+lMP1uq
 AMs0A+TTWerbEf+hCSeUjNKb9EtCB7ckUWFpgZYSjqJpVIfUfztWrzLVWMEHEhQAQfdo
 0ytw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM5pEJ1sR3Xuqe2pPouGEVMARkaAISShZcca3d7/pnvp93u10+Io2klVEKrluTb5DDY1zNpGmUOgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8euW5PXJLYgfRAhxxaE7t7hkSU0iBD9dT0k3QsGVdCTWUR0o8
 +LO4ymlsRDYpLs2wSzNEFqOgKSZdifJ3a3RI0gQsyitQkjlSdaunZk1nUMLuGkOdf2IBKKb6bez
 aUDon5WKH+bkAmkq679lIqfJ7HQ4=
X-Google-Smtp-Source: AGHT+IEXXeIM8dNWFS4VPSURU5IYVIU2PDmNudByY32B+86hWDh8xiL2RTOEsF12kexHYet16PlAcE3UBN3xeJ+F2Lg=
X-Received: by 2002:a17:90a:fa4b:b0:2da:6fc9:1a52 with SMTP id
 98e67ed59e1d1-2dd7f17bb60mr186649a91.0.1726770083232; Thu, 19 Sep 2024
 11:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240919171952.403745-1-lkml@antheas.dev>
 <20240919171952.403745-3-lkml@antheas.dev>
 <1cbc0cda-549a-4333-9045-470c51981af5@amd.com>
In-Reply-To: <1cbc0cda-549a-4333-9045-470c51981af5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2024 14:21:11 -0400
Message-ID: <CADnq5_N63ncHDdr+=xB5RqYZXnMjjrVCgqTDz0zmPdSP98ip-A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] acpi/x86: s2idle: handle screen off/on calls
 outside of suspend sequence
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, luke@ljones.dev, me@kylegospodneti.ch
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

On Thu, Sep 19, 2024 at 1:35=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> +dri-devel
>
> For those joining late; this is the full series for context.
>
> https://lore.kernel.org/linux-pm/20240919171952.403745-1-lkml@antheas.dev=
/T/#maee308be5349d8df25c8ccf12144ea96bbd4cbbd
>
> On 9/19/2024 12:19, Antheas Kapenekakis wrote:
> > Currently, the screen off/on calls are handled within the suspend
> > sequence, which is a deviation from Windows. This causes issues with
> > certain devices, such as the ROG Ally, which expects this call to be
> > executed with the kernel fully awake. The subsequent half-suspended
> > state makes the controller of the device to fail to suspend properly.
> >
> > This patch calls the screen off/on callbacks before entering the suspen=
d
> > sequence, which fixes this issue. In addition, it opens the possibility
> > of modelling a state such as "Screen Off" that mirrors Windows, as the
> > callbacks will be accessible and validated to work outside of the
> > suspend sequence.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   kernel/power/suspend.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> > index 19734b297527..afa95271ef00 100644
> > --- a/kernel/power/suspend.c
> > +++ b/kernel/power/suspend.c
> > @@ -507,6 +507,19 @@ int suspend_devices_and_enter(suspend_state_t stat=
e)
> >
> >       pm_suspend_target_state =3D state;
> >
> > +     /*
> > +      * Linux does not have the concept of a "Screen Off" state, so ca=
ll
> > +      * the platform functions for screen off prior to beginning the s=
uspend
> > +      * sequence, mirroring Windows which calls them outside of it as =
well.
> > +      *
> > +      * If Linux ever gains a "Screen Off" state, the following callba=
cks can
> > +      * be replaced with a call that checks if we are in "Screen Off",=
 in which
> > +      * case they will NOOP and if not call them as a fallback.
> > +      */
> > +     error =3D platform_suspend_screen_off();
>
> It's a bit muddy; but I wonder if calling
> drm_atomic_helper_disable_all() makes sense here.

I think we either want to call this after devices have suspended or
it's something the drm drivers would call themselves once they have
turned off the displays as part of their suspend handling.

>
> > +     if (error)
> > +             goto Screen_on;
> > +
> >       if (state =3D=3D PM_SUSPEND_TO_IDLE)
> >               pm_set_suspend_no_platform();
> >
> > @@ -540,6 +553,9 @@ int suspend_devices_and_enter(suspend_state_t state=
)
> >    Close:
> >       platform_resume_end(state);
> >       pm_suspend_target_state =3D PM_SUSPEND_ON;
> > +
> > + Screen_on:
> > +     platform_suspend_screen_on();
>
> The problem with my suggestion above is what would you put here for
> symmetry?  drm_atomic_helper_resume() doesn't look right to me.
>
> Maybe it's a no-op from DRM perspective and the drivers handle it.

if suspend is aborted, this should be called after devices resume or
from the relevant drm drivers.

The question is whether platforms with multiple GPUs care whether all
GPUs have their displays off or if just the integrated GPU matters.
Maybe after all PCI display class devices have suspended?

Alex

>
> >       return error;
> >
> >    Recover_platform:
>
