Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A3BB5AEA
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 02:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4FD10E860;
	Fri,  3 Oct 2025 00:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZlIS5I4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5E610E860
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 00:46:52 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-71d60110772so17740877b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 17:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759452411; x=1760057211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCpVlKn6CtsiaycmR9mmep0pvp7Jm/KhrpmquGLOTuo=;
 b=ZlIS5I4ca7f8Y+qORxHmi6Ska9BsmrfJD9TEF0Aqt2bFG46M9Siqn4r6IHRI7wHDsX
 +O71Lb0usagFWv6MnREN+1uT4ysSAOATeE/os2wIGbrao73ijVjF2oTCKmkNe5EIURB0
 IU9b4tgC3piuXloDLgPwI+rR/xMI5ipTwiXyjub+5NZ6uG3BIKn0waQNgCRd88cKZoaZ
 Z3A8GhF+EDOWaKne5tVYj+vMpVFOIE1Mifu0TWgSDi3HfWAlzEd1h47qB+a3gvRu8KKA
 unhSa6upOuJ5E/LblBzcSKTZPBh3WdnR+c9Kw1bR18Jg4C+sSnb1VTMTHjRpjDIFUhHs
 KtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759452411; x=1760057211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCpVlKn6CtsiaycmR9mmep0pvp7Jm/KhrpmquGLOTuo=;
 b=tlyS7OtEeHOSpBsjT4dPeSAaCBz8F/jEbwzojTf1favGZ+tmQINVC92f41/MDDry+o
 ko8mQMPx1GLFDUSgWexnSIfvo4g3xDBy6cxkLCHdTDikrkFMK+l9HdLCI9MsFxNfz3RT
 c2KvkoaF9FuvKoZMn4XezwveB2305nvlJmIRYEPBVA3fvi1ldtB51SGhnX5VUmQ6ibfr
 NAMB2xIeog0wEjvVPIhFhzEz1Yy/wGpwKvQHKkBnbGal5yvUE+OxLtnX8fSIuMMAeA1j
 MfDeAlsjs14vSAuX9FUDKI2JdfMNVh0N0RHoD897RT8Rw0IEX3InjLv/xPMvI0N34OdO
 t+Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcOhSr6Mr35d6WeAZ34Y1V5/7lwjvsItF9j2riXQL6/cfxavj5cU5OHWC3MSBsPgorlzMIqXALD08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPpM4n/wNtdiQ2IyKY2i4H+IUQi+cTXuW0nsOJHkE/yUcw2qsz
 RZA++8c35FRLjT+Mcb6+OlwZ2YiATIGh9kjp/O8LKIeWhuG6yGrWKU3vpfx5YiZMZgdEYRZ55DG
 1H/Wtt11QmYqzaJkGp9gwfa4RJ852hvE=
X-Gm-Gg: ASbGncsokdXIEhU38M52r5zkO9m9/fN6pwSNQKdU0Jfc72BSdmVlBERc/wBEbO9veJO
 OI1sToyyVfFDaNWfvspK0/PUu0K3qfaLdNOyCr8SPk11BCldt7l9SXcbjoQGzp6VuVGI7y9ZuYj
 VQ3GRYh4L07X2ThQwlJKCIT9b5S6coNzr/FrwgexInvracIP6iDpQI+jRulUg+7Y/3B8coYGYOJ
 j0FFz1+Zo+lwJznRsrr2s17B41Y3Gxjq+MKdxS3rPss9qxaVLo+h2k1sWS4lkfz6iFZ3n4XSDLe
 sUxIphC2AzfwCirjjlwz
X-Google-Smtp-Source: AGHT+IEkgxflzs7m0J5lByB1Z3Uo+kW2Fj5iD65ymCUQ4r3Wul/h5Hy3+msSm92r3D9So8jKB8gDA+eu/LK6yro2Moc=
X-Received: by 2002:a05:690e:1594:20b0:633:bd73:1368 with SMTP id
 956f58d0204a3-63b9a060cafmr1175668d50.21.1759452411058; Thu, 02 Oct 2025
 17:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-3-olvaffe@gmail.com>
 <c521f2be-85b2-4f4e-9e5c-6105129b3fc6@arm.com>
In-Reply-To: <c521f2be-85b2-4f4e-9e5c-6105129b3fc6@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 2 Oct 2025 17:46:39 -0700
X-Gm-Features: AS18NWBqIjju3_O0T3H14G7XSdDx9qO5JPJP-DEILwJcXtN4x4qXrCsTmpn734k
Message-ID: <CAPaKu7TT_Uph+ccNQ4q2+y9Pbmm-nLnPOgsLwEuZGnON26EStg@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/panthor: rename and document lock_region
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 2, 2025 at 3:41=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 16/09/2025 22:08, Chia-I Wu wrote:
> > Rename lock_region to mmu_hw_cmd_lock.
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index d3af4f79012b4..8600d98842345 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -545,8 +545,17 @@ static int write_cmd(struct panthor_device *ptdev,=
 u32 as_nr, u32 cmd)
> >       return status;
> >  }
> >
> > -static void lock_region(struct panthor_device *ptdev, u32 as_nr,
> > -                     u64 region_start, u64 size)
> > +/**
> > + * mmu_hw_cmd_lock() - Issue a LOCK command
> > + * @ptdev: Device.
> > + * @as_nr: AS to issue command to.
> > + * @region_start: Start of the region.
> > + * @size: Size of the region.
> > + *
> > + * Issue a LOCK command to invalidate MMU caches and block future tran=
sactions
> > + * for a region.
>
> The LOCK command doesn't invalidate the caches - that's the UNLOCK
> command. LOCK just blocks any memory accesses that target the region.
>
> [I guess the hardware implementation might flush TLBs to achieve the
> block, but that's an implementation detail and shouldn't be relied upon].
Hm, for LOCK, the doc I have says "MMU caches are invalidated." And
for UNLOCK, there is actually no invalidation when the region is
LOCK'ed.

> I'm also not entirely clear what the benefit of this rename is? It's a
> static function in a xxx_mmu.c file so it's fairly obvious this going to
> MMU HW related. I also feel "_region" in the name makes it obvious that
> there is a memory range that is affected by the lock.
A big part of this file is for in-memory page tables. "mmu_hw_" prefix
is used by some functions that write the regs. This (and following)
renames prefix other such functions by "mmu_hw_" for consistency.

Then there are "mmu_hw_cmd_FOO" for each hw cmd FOO. That's why the
"_region' part gets dropped.
>
> Thanks,
> Steve
>
> > + */
> > +static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u=
64 region_start, u64 size)
> >  {
> >       u8 region_width;
> >       u64 region;
> > @@ -609,7 +618,7 @@ static int mmu_hw_do_operation_locked(struct pantho=
r_device *ptdev, int as_nr,
> >        * power it up
> >        */
> >
> > -     lock_region(ptdev, as_nr, iova, size);
> > +     mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
> >
> >       ret =3D mmu_hw_wait_ready(ptdev, as_nr);
> >       if (ret)
>
