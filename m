Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CBA705FA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1676C10E5CD;
	Tue, 25 Mar 2025 16:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gOhWXQzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08AA10E594;
 Tue, 25 Mar 2025 16:04:24 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6fedf6aaed2so49130487b3.0; 
 Tue, 25 Mar 2025 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742918664; x=1743523464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsymUyAwd/7+saRMvKt7vls4TQ6B6dvAPD1as5mOOSw=;
 b=gOhWXQzm0N/uMtapJLKqeWF17SbKKTZaTnu01K2zTqoOPuyGUYeWycolWxnadZYUDy
 5cwSpEDss3V3kLYgunGBjtqFngjwfJlwNUAcGFIKs4S1pxQ3bH4C6bE9mi3Z7lbY8TLE
 qrcJOs4VstreUxCSmS2RfgeoXMb9YWpmHoB5j7zIVOVyaJZixqDhafkihn6+fcQC/ykL
 wNyVEGkyG3md1ujPenbvcHZlms00ez8B8eq3h65407vSgoajQgQJXzxHuAbq0LX7XZac
 xpTu2LryFyXmUB9vnOsVqSr4umsi+eAWXowFDWv5nasSiBbubHzojupqM3rRp4yZRCz1
 rg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742918664; x=1743523464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsymUyAwd/7+saRMvKt7vls4TQ6B6dvAPD1as5mOOSw=;
 b=hjK+kXyz3BA5gpuXsPkA+Kjtu4LDUOdSPV4YzzTbGNBFNBEaPL13iXzDmXR5vd/WVc
 df0bFQuvuPUr8uri4jCxP0Qee6E4v1FalmEbfgwN2di6yPmwcrDAbTB+MSHkNlrJK4VD
 yWYRb0YgUS8J0Ouwkj59QaJmIrD0l02eYnGBAfXaWPNZuRY1ebxLW2jUgnF8ZjBbwqZt
 LHoOpmd4A+jA+mS+yY8hLxlUEK2gmJ52t/44wc6AbDFX4aFFmuL9e/3ZRNc5b2Y7CPLj
 2b1DdfbXOUa03dElXY0RYXrqSDxOSyc+pbmYcEr11XUqgGv1Lw5yTYpwpngX2+NYjdjm
 1sQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3C5gIv3JLTPdU4CJIsAhVvKDzVGxeKNcuWLa1j4O3UO9rVlnd2DCXw4hunDkapeh/RKhh52G7B5D4DvRAqg==@lists.freedesktop.org,
 AJvYcCW9OOxt5QtmiKYDxOvEmkNLa1m30Nnde6qZ1IYv4IRrr0rLVWwHehQgJhB0lGRxDiBAFNPoCEEmZEtrV2OdRBKmng==@lists.freedesktop.org,
 AJvYcCWBuL7BqCu5CslWk0WrQcbISOEjBe74QVHXh62nn1O87RC7GwrlV8RT5Qxlww8OjYrZH1qDDVR3iyFc@lists.freedesktop.org,
 AJvYcCWwWnKJy5YAsCE2XDqavW16F3Msqh/8Or6fVKonOhMthe/+TD6Ph/Z7GRIUNLevh9Bk5VZ+CWak+pwu@lists.freedesktop.org,
 AJvYcCX3N/VX7suUOU1U6RqUSdNsexUB79T2/dN2cmRaorSm581B2dhqAR7eaXwSvoSxg3cA/IPSIegy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbuhFjL34erdx1ejAWXKA9nQ8r8Fio//OUwsuUHpg2XQxBnsjU
 Aoslt74ejNJ2k8KjWIgLCvBggoOFLGOZ6ujlfLJJfqPZ625L9MHE957EVTTacmV/bHvwH72PyhP
 ZIhqI4/TlrmcuX944v54OoWL/1Fo=
X-Gm-Gg: ASbGncsXR4Mz+qrnbOeW4a4J9bwnCnV8ttQoVX+ii49a8tKtTmJurYqUTzvpvXZhLho
 xVAZkSqhEdI9OWV31RgD/PYl2CiNQdCVPJODZAJd/5h/UNr83U0Fiu0DWwKb0d+AQDnp+wczJwb
 C5/kA0g4bMuiy6mp00SaHBh/nb
X-Google-Smtp-Source: AGHT+IFuO7/KsoWda68hHwMp3dp3vTaBY41RtEIHi5DSJzf7/I8Ad1hcWmGz5xn7HPqn5/pt2dj+MfILAPOJgzT4I1k=
X-Received: by 2002:a05:690c:8d02:b0:6fd:33a1:f4b with SMTP id
 00721157ae682-7020fd4fc2fmr5275767b3.4.1742918659083; Tue, 25 Mar 2025
 09:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-17-jim.cromie@gmail.com>
 <b2d9acea-c2ad-45c7-9853-8fac0957c56f@bootlin.com>
 <CAJfuBxwBZ0a630YH2gbwz971ehZWASH6yXfRrdVCWBNGqA=mMw@mail.gmail.com>
 <a6824252-87be-458f-ba4a-b34bf86d67f4@bootlin.com>
In-Reply-To: <a6824252-87be-458f-ba4a-b34bf86d67f4@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 10:03:53 -0600
X-Gm-Features: AQ5f1JquBnQ-iGybb_4LD4MxqKJLiDkxofsnIfISZQzupn9eWPMArOPgVB9U_e4
Message-ID: <CAJfuBxw4BuVDh5+xdp5vunQt1=P-5AeSQHtRW16rU4SJLFgK8g@mail.gmail.com>
Subject: Re: [PATCH 16/63] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Mon, Mar 24, 2025 at 9:07=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
trimming

> >>> +     __section("__dyndbg_class_users") _uname =3D {                 =
   \
> >>> +             .mod_name =3D KBUILD_MODNAME,                          =
   \
> >>> +             .map =3D &(_var),                                      =
   \
> >>> +     }
> >>> +
> >>
> >> I'm not sure I understand properly how __section works, but can we use
> >> multiple DYNDBG_CLASSMAP_USE in one module? Can we also use
> >> DYNDBG_CLASSMAP_DEFINE while also importing an other classmap
> >> DYNDBG_CLASSMAP_USE?
> >>
> >
> > Yes, its supposed to work that way.
> >
> > I havent tested that specific scenario (yet), but
> > a _USEr module, like test-dynamic-debug-submod,
> > could also _DEFINE its own, as long as it honors
> > the class-id mapping it is using and therefore sharing.
> > The on-modprobe conflict check should catch this condition.
> >
> > And __section (ISTM) accumulates entries, typically static struct var
> > initializations.
> > AFAICT, scanning the sections is how these { scoped statics } are
> > often reachable.
> >
> > For example, dd's _METADATA_ builds a { static _ddebug } for every pr_d=
ebug.
> > They all go into the __dyndbg section (renamed with _descriptors suffix=
 soon),
> > in the order their respective definer objects are linked.
> >
> > include/asm-generic/vmlinux.lds.h  then places the __dyndbg_* sections
> > into DATA, along with lots of other freight, for the various
> > mechanisms they serve.
> >
> >
> >
> >
> >> If not, does it make sense to allow it (for example MFD devices can
> >> touch multiple subsystems)?
> >
> > We have another use case !
> > Do you know your way around that case ?
> >
>
> No, I don't have other use cases, I was just thinking about possible
> scenarios of the "include multiple classmap".
>
> So, happy to konw it is not an issue with the section, but do I
> understand properly the code (completly hypotetical example): if drm.ko
> defines classes 0..10 and spi.ko defines classes 0..4, it means
> driver.ko can't use both classmap? (I don't have such use-case, and
> maybe this use-case does not exists!)
>

It sounds realistic on the face of it, so lets break it down:

1st off, drm drivers/helpers are full dependents on (core) drm.ko.
they are the "subsystem" users I considered.

This dependence is "+1" by _USE ref'g the exported DEFINE product.
If that dependence doesn't suit a situation, it doesn't quite fit.
The dependence dictates module-load order, amongst other things.

So it follows that spi.ko would never be a dependent module on drm.ko,
if there is a relationship, DRM would use spi, and whatever classes it defi=
nes.

Suppose spi.ko DEFINEd a classmap:  with ENDPOINT, TRANSPORT, BULK
categories of pr_debugs,  those classes would need to map to different clas=
s-ids
than DRM_UT_<*>, cuz the callsites only have the classids, not the
name-->id mapping.

if both DRM_UT_CORE and ENPOINT had class-id =3D 0,
then both these commands would alter the same set of pr-debugs

  echo class DRM_UT_CORE +p > /proc/dynamic-debug/control
  echo class SPI_ENDPOINT -p > /proc/dynamic-debug/control

Thats not as troublesome as it might seem:

DRM's DRM_UT_<*> vals are only exposed to userspace
by the existence of : /sys/module/drm/parameter/debug,
cuz it exposes the bit values in >debug input.

and this already changed DRM_UT_<*> vals wo anybody caring.
0406faf25fb1 drm_print: condense enum drm_debug_category

DYNAMIC-DEBUG-CLASSMAP-DEFINE() has _base arg,
which offsets the natural/obvious 0..N range to allow sharing of 0..62 rang=
e.

The outer edge of inconvenience in coordinating class-id reservations
would be N providers and M consumers. ATM, N=3DM=3D1.

Say DRM  used 2 modules defining classmaps:  spi (as discussed),
and (pure wag) gpu_engine.
Those 2 modules dont really have any other connection, but would have
to coordinate
(but maybe gpu_engine needs spi to control its cooling, and would want
to anyway)

DRM (or any classmap-definer/user) is also free to define a 2nd "category"
enum to separate the user facing aspects of DRM_UT_*
from its name->ID mapping (very internal)

Also:  "classnames" are a public-namespace; theres nothing
to stop a module from defining their own version of "DRM_UT_CORE",
and getting their pr_debugs enabled/disabled along with all of DRMs callsit=
es.

Such a use-case would be obvious in review, and would want some justificati=
on.

WAG:  a _base arg to the _USE() macro could specify a local user offset.

Theres a saying:  if youre explaining, youre losing.

How'd I do ?

> The only solution I see is to add more stuff in the _ddebug structure
> (for example a "classmap identifier"). But for now, the current user
> will be DRM, so we don't really need to fix this issue right now.
>
> I just found a possible user for dyndbg classes [1], it seems to
> implement something similar.
>
> [1]:https://elixir.bootlin.com/linux/v6.13.7/source/drivers/block/drbd/dr=
bd_polymorph_printk.h
>

thats a pretty impressive stack of macros.
I like the componentry and assembly

One thing that puts it out of scope is its use of KERN_EMERG, CRIT etc.
dyndbg is just KERN_DEBUG

Also those #undef *DYNAMIC_DEBUG*
explicitly unwire  dyndbg apparatus, and plug into __dynamic_pr_debug direc=
tly.
Making it an interesting case.


> > Note that DEFINEr  & USEr calls set up linkage dependencies,
> > As long as these are consistent with other module deps,
> > it should work.
> >
> >
> >>
