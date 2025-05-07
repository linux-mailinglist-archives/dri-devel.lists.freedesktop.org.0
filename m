Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19ADAAEC5D
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B2510E883;
	Wed,  7 May 2025 19:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNPydKhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B6810E1E7;
 Wed,  7 May 2025 19:42:24 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-30a8831e462so34896a91.0; 
 Wed, 07 May 2025 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746646944; x=1747251744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTze7T/nMPYLGfndPbV/+oBYxD1sIAoMG3LrG1Olm08=;
 b=WNPydKhC+g2uLlSGbKYxq3G/TpBqWRpOSZJprfKcDk+QkXzMJkodzKCRXDCwdx81gs
 J6PJgHIlYcPiCNspOJujOFREdI85uz64+FQPqWviebDv5JOlhUI8qIeb6i28W1s7J66h
 ShcyEIv88YmuJvO36fgGwqYLBTF4EtPCg8dJqi5Sxd10rvmSxjBcRI6V5zj8L5ip/Kcy
 TAl0qtZ/juhQyLdz1pMs8c01p0pRzLNlKVXGkbKBPEKKneePgdqk24q5K4eL5B6YW1up
 RSiAx8OVE5MiIctL/bzfFjYB20meSuVLIA1+lr2Bx/OsnuPI4gkhXcPL9034lUAnAH5i
 yhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746646944; x=1747251744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTze7T/nMPYLGfndPbV/+oBYxD1sIAoMG3LrG1Olm08=;
 b=lA+zp2L1LPu15txA7qPrX/x6aS46a6gw6BBCnzUtfFP7ZrvsspU98tTHZfzAL6QXYR
 i9lNOXU6EBhErC8jrOTy0uilvTNJs7SJrpLXs8DPHI5PZlTweiiyJZ/tg0+kzBKF3Gue
 F3GMKAisxpDEDHTT+SVf1BFlHYPLVB5YE5qX0SXAMstcu7qhGY9gRyYrfnsD9Rh6GOKs
 rv4Nb+iaLrxVHXqZl9I4l5H3jhKVTviEqGND/eZOi3gG+aizy6H5e+auu3kvYIi3Gz/0
 VD+FfvTBC2ybqUE2dMuAmDxbbz4W2jjY9ONwKLQ4MAQDUKRF7PiBTlIzhMgcuQrp25eU
 3uFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDrY7H5MEeYWbY7KvNqHuFG99Bxqpb99ezB+IQBYv1MQK2bSi+p8gHgQw/2TX8x8aJr+ElX4zr1MNN@lists.freedesktop.org,
 AJvYcCWni/ajtNSuEy6H4OErMsmju4V9QaKSiUWTiOCV8YFhibPcFipp9ylCmZwvke1HVrw0HS16x21D@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7X9ZmxvlnGnN/zfYKolCH1eMiXYSoYZdA0Qp+35Nc10nCcaU+
 xk6qu1wtDKvsr9YNmSsV+NCf79EXAM6Of1+A23Qs0azhBwiZyWLhNcQzF2Wp6KIkFgHLEcrIAxP
 2z86j0ZqVWClmnuc9d309LxYMljY=
X-Gm-Gg: ASbGnctiXELgxx09OAtcNrslRK/0r4+zI132FlqJxVoSXjMIV9womEHC7fmWEIzRZNT
 GJvv/uCGWQTI+f2+KkfCM5l0JipYPaUwmndAc3adRgQ4Uws6FyqAu5UL+XS/cgYs4KHKB0IpJJm
 i7zaxPurW41rFdSngwsOkY4A==
X-Google-Smtp-Source: AGHT+IGdawEqtJxVGK+JSHNRepXUXgjNBu0yjM+RsF0Eufl62wIFQjgHE5X6DJTDR4ipT4hMnCEl01mptgZsx4+0fxQ=
X-Received: by 2002:a17:90b:4d06:b0:305:5f25:59ad with SMTP id
 98e67ed59e1d1-30aac25d0a3mr2608910a91.7.1746646944387; Wed, 07 May 2025
 12:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250501211734.2434369-1-superm1@kernel.org>
 <20250501211734.2434369-3-superm1@kernel.org>
 <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
 <98d527c6-a185-40f9-8ce3-46f5d7a67e81@kernel.org>
 <CAJZ5v0i=9fpg2YxJhd+2rAx1gkqaquoExHvgMiFefn6YqVieOA@mail.gmail.com>
In-Reply-To: <CAJZ5v0i=9fpg2YxJhd+2rAx1gkqaquoExHvgMiFefn6YqVieOA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 May 2025 15:42:13 -0400
X-Gm-Features: ATxdqUFdNa1TOYCQQ4md1wN__mvI3A170baT-1F7y33oUuTC3i5KfOiznTcios0
Message-ID: <CADnq5_OUhWEfL_=hfMi8hFfMDOgR21hd5NU9TOzmePhpK5LzsQ@mail.gmail.com>
Subject: Re: [RFC 2/2] drm/amd: Use suspend and hibernate post freeze
 notifications
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
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

On Wed, May 7, 2025 at 3:39=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Wed, May 7, 2025 at 9:17=E2=80=AFPM Mario Limonciello <superm1@kernel.=
org> wrote:
> >
> > On 5/7/2025 2:14 PM, Rafael J. Wysocki wrote:
> > > On Thu, May 1, 2025 at 11:17=E2=80=AFPM Mario Limonciello <superm1@ke=
rnel.org> wrote:
> > >>
> > >> From: Mario Limonciello <mario.limonciello@amd.com>
> > >>
> > >> commit 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification
> > >> callback support") introduced a VRAM eviction earlier in the PM
> > >> sequences when swap was still available for evicting to. This helped
> > >> to fix a number of memory pressure related bugs but also exposed a
> > >> new one.
> > >>
> > >> If a userspace process is actively using the GPU when suspend starts
> > >> then a deadlock could occur.
> > >>
> > >> Instead of going off the prepare notifier, use the PM notifiers that
> > >> occur after processes have been frozen to do evictions.
> > >>
> > >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4178
> > >> Fixes: 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification ca=
llback support")
> > >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_device.c
> > >> index 7f354cd532dc1..cad311b9fd834 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> @@ -4917,10 +4917,10 @@ static int amdgpu_device_pm_notifier(struct =
notifier_block *nb, unsigned long mo
> > >>          int r;
> > >>
> > >>          switch (mode) {
> > >> -       case PM_HIBERNATION_PREPARE:
> > >> +       case PM_HIBERNATION_POST_FREEZE:
> > >>                  adev->in_s4 =3D true;
> > >>                  fallthrough;
> > >> -       case PM_SUSPEND_PREPARE:
> > >> +       case PM_SUSPEND_POST_FREEZE:
> > >>                  r =3D amdgpu_device_evict_resources(adev);
> > >>                  /*
> > >>                   * This is considered non-fatal at this time becaus=
e
> > >> --
> > >
> > > Why do you need a notifier for this?
> > >
> > > It looks like this could be done from amdgpu_device_prepare(), but if
> > > there is a reason why it cannot be done from there, it should be
> > > mentioned in the changelog.
> >
> > It's actually done in amdgpu_device_prepare() "as well" already, but th=
e
> > reason that it's being done earlier is because swap still needs to be
> > available, especially with heavy memory fragmentation.
>
> Swap should be still available when amdgpu_device_prepare() runs.

We need to do this after processes are frozen, otherwise applications
keep running and keep allocating VRAM so by the time processes are
frozen, swap is disabled and we don't have anywhere to store the
contents of VRAM if memory is full or fragmented.

Alex

>
> > I'll add more detail about this to the commit for the next spin if
> > you're relatively happy with the new notifier from the first patch.
>
> I need to have a look at it, but adding it for just one user seems a
> bit over the top.  I'd prefer to avoid doing this.
