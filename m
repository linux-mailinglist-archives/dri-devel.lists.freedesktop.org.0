Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699519A48B2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5910E9A3;
	Fri, 18 Oct 2024 21:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VwuPK+vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA810E9A7;
 Fri, 18 Oct 2024 21:07:35 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e2da8529e1so357322a91.1; 
 Fri, 18 Oct 2024 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729285655; x=1729890455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GilArzcu4Hbn+I4UKAApN9Owi+SU2WsB5zAzUG0U1kQ=;
 b=VwuPK+vRui4gw3z08Wy522i6ifU8HEURM0nKuQPD7XWBQYsQOZCtBR4mF8dKK4jJaT
 lYYlZX0AdhvxrO4BPw1aT6nUyF9Hr45SnkLK7n22pipM97duXp0QBsfPR8vJLtH0ukXj
 LnxLCuFk0cAU5yvG4NQibIIxoh+is383c1LGb1yEzlxQZTuC/VzBtAv7bZbxzJzvyCnn
 PQQBgcLgNT4LmRW36LGET8QJDeM2au2tm57i1xnIpYCHpLWlPxR2gso60ZmOsZd9fYHO
 pbF/PaGsGsLYvvJvzBO1LubeNFnr3JSMrb0756fCtbbEVrpV08jDWdrPCNBkervE8UH5
 W0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285655; x=1729890455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GilArzcu4Hbn+I4UKAApN9Owi+SU2WsB5zAzUG0U1kQ=;
 b=MW/atw/JTpso3vPBCZNvHkrV/Xn9hoq4oKRBNn4QW1P2EE+tIZ3IkUlbeTaZDllpt6
 qri2Ne/j2J6Jlesm7iMu/BjspTDvy90Zz9PuwHER+QHb7VG0pbpUzApiQoljde0pzj/G
 HiaaazpvD8TMyeN6RcNpsp8MkwgSihp7Rd+BaWSyODqOhjHivFbkPygTZM7cts12g98m
 nj0r92TfQGI72Z6DYWcsY5OSU0lYd5yFMrN4J1dAuX0GxYVKVRWhUq8bpmCdt6D1Jiav
 cSJwpu+z/v+H6m73/lkQTNcAYSYqQrAlME3XI92gblQefGXw67aJT7YHn96P2+ZmQwUO
 xAZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7OTeD7teN3x+0DUjTpMk92cTQBKF3sNYyc7wsx5os2knY5jA3DE+8fYh274GfcYbEeitPfucllcY=@lists.freedesktop.org,
 AJvYcCW/wh6BI2CjDQH4DeH1yN7vewB8XpNQmdNhZub1OT16Nv4MdWlum92cFJamfPRLpEkkjFFcKF64nLg=@lists.freedesktop.org,
 AJvYcCXGSByGWUniqzSIo1mAoT63CQeRCioI29WEuw6RisylzkZDUKZnsM8AXgWugWU8LrGQxUIuEAzIwmFl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA+VTJ3hlMNrdWmRDYBCp5hZ9Pw//UzmrcbOB5McU3a1CBFmzj
 wdOqPUPIADKtdya/rLgSr5sq98BgW8Pu1QJglvieZHRQhyKbpuG+PCqhzWLxtg/NiudM1Xb7UBB
 /ME1QkVm1PVq+V9CJHvrcgtCX7eg29g==
X-Google-Smtp-Source: AGHT+IFwr7vwyC0hDdtyxQgt8YmggDPsbKGu0sdvg54UaQ0r5Dm5gv6GH/d4TyHy+/nYRP9nYoWc1g99caCbKP4i6QI=
X-Received: by 2002:a17:90a:1784:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e5616c5312mr2012101a91.2.1729285654958; Fri, 18 Oct 2024
 14:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com> <ZxJ3DJWY9Lsc9Mn4@intel.com>
 <CADnq5_M62YZRvBT7sQwrZTiHrUsifaqqgrWOD_z+YY=EiBtEcA@mail.gmail.com>
 <3fac9971-8d26-4d52-badb-2b14b3f84263@igalia.com>
In-Reply-To: <3fac9971-8d26-4d52-badb-2b14b3f84263@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Oct 2024 17:07:22 -0400
Message-ID: <CADnq5_PmHnYDvQpGNCF_3xP0a84EKsEuMqrj0MuUC=TyKTTrDg@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com, 
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org, 
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com, 
 tursulin@ursulin.net, francois.dugast@intel.com, jani.nikula@linux.intel.com, 
 airlied@gmail.com, aravind.iddamsetty@linux.intel.com, 
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com, 
 matthew.d.roper@intel.com, andriy.shevchenko@linux.intel.com, 
 lina@asahilina.net, kernel-dev@igalia.com, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Fri, Oct 18, 2024 at 1:56=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Em 18/10/2024 12:31, Alex Deucher escreveu:
> > On Fri, Oct 18, 2024 at 11:23=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@int=
el.com> wrote:
> >>
> >> On Thu, Oct 17, 2024 at 04:16:09PM -0300, Andr=C3=A9 Almeida wrote:
> >>> Hi Raag,
> >>>
> >>> Em 30/09/2024 04:38, Raag Jadav escreveu:
> >>>> Introduce device wedged event, which will notify userspace of wedged
> >>>> (hanged/unusable) state of the DRM device through a uevent. This is
> >>>> useful especially in cases where the device is no longer operating a=
s
> >>>> expected even after a hardware reset and has become unrecoverable fr=
om
> >>>> driver context.
> >>>>
> >>>> Purpose of this implementation is to provide drivers a generic way t=
o
> >>>> recover with the help of userspace intervention. Different drivers m=
ay
> >>>> have different ideas of a "wedged device" depending on their hardwar=
e
> >>>> implementation, and hence the vendor agnostic nature of the event.
> >>>> It is up to the drivers to decide when they see the need for recover=
y
> >>>> and how they want to recover from the available methods.
> >>>>
> >>>> Current implementation defines three recovery methods, out of which,
> >>>> drivers can choose to support any one or multiple of them. Preferred
> >>>> recovery method will be sent in the uevent environment as WEDGED=3D<=
method>.
> >>>> Userspace consumers (sysadmin) can define udev rules to parse this e=
vent
> >>>> and take respective action to recover the device.
> >>>>
> >>>>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>>>       Recovery method Consumer expectations
> >>>>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>>>       rebind          unbind + rebind driver
> >>>>       bus-reset       unbind + reset bus device + rebind
> >>>>       reboot          reboot system
> >>>>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>>>
> >>>>
> >>>
> >>> I proposed something similar in the past: https://lore.kernel.org/dri=
-devel/20221125175203.52481-1-andrealmeid@igalia.com/
> >>>
> >>> The motivation was that amdgpu was getting stuck after every GPU rese=
t, and
> >>> there was just a black screen. The uevent would then trigger a daemon=
 to
> >>> reset the compositor and getting things back together. As you can see=
 in my
> >>> thread, the feature was blocked in favor of getting better overall GP=
U reset
> >>> from the kernel side.
> >>>
> >>> Which kind of scenarios are making i915/xe the need to have userspace
> >>> involvement? I tested a bunch of resets in i915 but never managed to =
get the
> >>> driver stuck.
> >>
> >> 2 scenarios:
> >>
> >> 1. Multiple levels of reset has failed and device was declared wedged.=
 This is
> >> rare indeed as the resets improved a lot.
> >> 2. Debug case. We can boot the driver with option to declare device we=
dged at
> >> any timeout, so the device can be debugged.
> >>
> >>>
> >>> For the bus-reset, amdgpu does that too, but it doesn't require users=
pace
> >>> intervention.
> >>
> >> How do you trigger that?
> >
> > What do you mean by bus reset?  I think Chrisitian is just referring
> > to a full adapter reset (as opposed to a queue reset or something more
> > fine grained).  Driver can reset the device via MMIO or firmware,
> > depending on the device.  I think there are also PCI helpers for
> > things like PCI FLR.
> >
>
> I was referring to AMD_RESET_PCI:
>
> "Does a full bus reset using core Linux subsystem PCI reset and does a
> secondary bus reset or FLR, depending on what the underlying hardware
> supports."
>
> And that can be triggered by using `amdgpu_reset_method=3D5` as the modul=
e
> option.
>

That option doesn't actually do anything useful on most AMD GPUs.  We
don't support FLR on most boards and SBR doesn't work once the driver
has been loaded except for really old chips.  That said, internally
these all end up being mode1 or mode2 resets which the driver can
trigger directly and which are the defaults.

Alex
