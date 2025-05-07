Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BFAAEC7B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7395A10E88F;
	Wed,  7 May 2025 19:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IGja+R7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DC410E88C;
 Wed,  7 May 2025 19:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE7425C4AD4;
 Wed,  7 May 2025 19:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE342C4AF09;
 Wed,  7 May 2025 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746647521;
 bh=8UXHITbnpJM6PGSsCMutJakGyZCR3U+g9d/i4lUaMSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IGja+R7DerLgbM1nGnaYqkX5WNJU9eH3PZpxTJxyzhQuf4DLmvg9uvuLHCgsLZIgF
 IbFvD+vfettpCwkacehf/dtKvVKoXm6npSRMG0qP/TCHyn8g2UFUsubYUIBlYDcXSo
 CF5fYcHT0LM0EgyKj8zsIIl/2onobMsL6nOfGGlg34O4NfM9xtsXFFBvn0TyTz+mJg
 fX/pEbPH8H5uKtpVUrTc8L66bD5lYwXFhbXx8+TNWT9eN0c3M+FAH7QLxPc+jLiZF0
 M9fUjicSCc3U9puqoy7Mi6WIbNrJJ8E0JcRvlawAyrN7BtWt5DcNxAUmkLTl2XfpSl
 YX2emchPcvf5w==
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2db78ef7f69so202467fac.1; 
 Wed, 07 May 2025 12:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjbtKnWXJvd4Mshe3OudI362Cqn5gJQSq3PiCYVvHl+5GbiYf9h3lw9uvS6AbUf7mK9kONbhdO@lists.freedesktop.org,
 AJvYcCWoQtlM4gPUPohEaL/zupEhQztU9zDIJNz+o5FjaGWlRRDaQMhanNdh/+1jvprlDwnfxGJ65KgKWfy0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmLziMzBjuLfknHY8vJM0JGRGjN41/Rx0rd7w1PC+teMsvSC2O
 XYVCRieLviUrru/dUQOTo5jmEBtCojbHNorhGpIpcq3eHP5qwRVXVK+Bo0nwpQ/bVtJ9HLeXGs1
 px94XWX89QAlh9FEyZZD530nAtjw=
X-Google-Smtp-Source: AGHT+IGGGZX/hdpZW5IJ3SWC8UlQ18MdpKGngHbkD9CKi8EZlOB5Dkw8IaRqKVVKoZlIkkomMMc/Kb8wkvI0iYO9jnQ=
X-Received: by 2002:a05:6870:8a0e:b0:2b8:f595:2374 with SMTP id
 586e51a60fabf-2db819f620bmr530393fac.36.1746647520896; Wed, 07 May 2025
 12:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250501211734.2434369-1-superm1@kernel.org>
 <20250501211734.2434369-3-superm1@kernel.org>
 <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
 <98d527c6-a185-40f9-8ce3-46f5d7a67e81@kernel.org>
 <CAJZ5v0i=9fpg2YxJhd+2rAx1gkqaquoExHvgMiFefn6YqVieOA@mail.gmail.com>
 <74428a0f-754b-4f85-bca3-48216613c208@kernel.org>
In-Reply-To: <74428a0f-754b-4f85-bca3-48216613c208@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 May 2025 21:51:49 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hLKqcjD=jgyAr_fZnyOYbSELO5mpu7k3sviBB7pXaZ8A@mail.gmail.com>
X-Gm-Features: ATxdqUFE7OLbaddxpL7NcD4or0XeWJ5lOnaFDdnA9DcRdzkDiLPMOsQ7b-PG9Fg
Message-ID: <CAJZ5v0hLKqcjD=jgyAr_fZnyOYbSELO5mpu7k3sviBB7pXaZ8A@mail.gmail.com>
Subject: Re: [RFC 2/2] drm/amd: Use suspend and hibernate post freeze
 notifications
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
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

On Wed, May 7, 2025 at 9:45=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
> On 5/7/2025 2:39 PM, Rafael J. Wysocki wrote:
> > On Wed, May 7, 2025 at 9:17=E2=80=AFPM Mario Limonciello <superm1@kerne=
l.org> wrote:
> >>
> >> On 5/7/2025 2:14 PM, Rafael J. Wysocki wrote:
> >>> On Thu, May 1, 2025 at 11:17=E2=80=AFPM Mario Limonciello <superm1@ke=
rnel.org> wrote:
> >>>>
> >>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> commit 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification
> >>>> callback support") introduced a VRAM eviction earlier in the PM
> >>>> sequences when swap was still available for evicting to. This helped
> >>>> to fix a number of memory pressure related bugs but also exposed a
> >>>> new one.
> >>>>
> >>>> If a userspace process is actively using the GPU when suspend starts
> >>>> then a deadlock could occur.
> >>>>
> >>>> Instead of going off the prepare notifier, use the PM notifiers that
> >>>> occur after processes have been frozen to do evictions.
> >>>>
> >>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4178
> >>>> Fixes: 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification ca=
llback support")
> >>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_device.c
> >>>> index 7f354cd532dc1..cad311b9fd834 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> @@ -4917,10 +4917,10 @@ static int amdgpu_device_pm_notifier(struct =
notifier_block *nb, unsigned long mo
> >>>>           int r;
> >>>>
> >>>>           switch (mode) {
> >>>> -       case PM_HIBERNATION_PREPARE:
> >>>> +       case PM_HIBERNATION_POST_FREEZE:
> >>>>                   adev->in_s4 =3D true;
> >>>>                   fallthrough;
> >>>> -       case PM_SUSPEND_PREPARE:
> >>>> +       case PM_SUSPEND_POST_FREEZE:
> >>>>                   r =3D amdgpu_device_evict_resources(adev);
> >>>>                   /*
> >>>>                    * This is considered non-fatal at this time becau=
se
> >>>> --
> >>>
> >>> Why do you need a notifier for this?
> >>>
> >>> It looks like this could be done from amdgpu_device_prepare(), but if
> >>> there is a reason why it cannot be done from there, it should be
> >>> mentioned in the changelog.
> >>
> >> It's actually done in amdgpu_device_prepare() "as well" already, but t=
he
> >> reason that it's being done earlier is because swap still needs to be
> >> available, especially with heavy memory fragmentation.
> >
> > Swap should be still available when amdgpu_device_prepare() runs.
>
> No; it's not.  The basic call trace (for suspend) looks like this:
>
> enter_state(state) {
>      suspend_prepare(state);
>      ...
>      pm_restrict_gfp_mask();  // disable swap

Ah, OK

>      suspend_devices_and_enter(state) =E2=86=92 dpm_suspend_start() {
>          dpm_prepare() {
>              amdgpu_pmops_prepare();
>          }
>          dpm_suspend() {
>              amdgpu_pmops_suspend();
>          }
>      }
> }
>
> If the intention was for it to be available, it would be better to move
> the pm_restrict_gfp_mask() call "into" suspend_devices_and_enter()
> between dpm_prepare() and dpm_suspend() calls.

It was not the intention, but then the "prepare" phase is not expected
to do anything that would prevent swap from working, so it might as
well be disabled later.

Then, it would need to be re-enabled before the "complete" phase which
again shouldn't break anything in principle.
