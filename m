Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CA90C4AD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDD610E5BF;
	Tue, 18 Jun 2024 08:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTDnU/kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0310E5C7;
 Tue, 18 Jun 2024 08:01:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6f7b785a01so272285166b.1; 
 Tue, 18 Jun 2024 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718697698; x=1719302498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEfgk2fYUwOCyIZltP8v1hQ1jJKysr4pnr2KfmirBu0=;
 b=VTDnU/knqib8DiBmdRRdrBLv44PyoezLe4Zj/233mQTSKjMLrnd8umf30NRrUH8nkP
 jiQbU3hrQMZOAREo/ZQxSE1Ecx83EKlH61mEmOuOMr1LssSefHMnixUQ4M6i8lpbaDLB
 YZNceqbwGPhQkLMrZF59gCkBC4QsiwSZbH3xqyEvZM5VV+tAYQAyyTzKkWbPpIrlUH9/
 CdTLtV7J7yQCHqqFgR+bonNg+q1dBcrnvmH0O8qNJseRnrBnrDbZvJ+rF5zBZ1TmOOCd
 izD7TlbeW5aH0m5epGL52OW2moRJeXeQBy3vyXuGCDw4ML6i2OVdT2wlZ+l4oJ038BRX
 9Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718697698; x=1719302498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEfgk2fYUwOCyIZltP8v1hQ1jJKysr4pnr2KfmirBu0=;
 b=loX4V7cHBZ55dwAgeFCp/c/mnvGuXjX+GGUCZrTLh01MShcdGkF3HjMPjMK0tD5adk
 gT1duDxtQzzW32xDScEuVbYZlWiyGko0BmbdfZc7/XZq0VySEYilMmrrVl9TkZ+x5BhB
 BLKDZMKPfLOVAZ7erSlfeutMjqIIWqmHXbwWIyGuVUrKpxiLnURbr7ZTlU5LtANCbfUT
 MxUWwJrUCBaCl5zZm1TKTqnLQ59BhjvYFufQVlUNKYuEp+9jQF0Su33ej2Ea+h/dcuh4
 bJKSMbwqBJDhxIaW4s45yo0p06YFY0lJBYxR87wZZMs86Erolj+zgLKB8T1+IpVFm0oX
 0q9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKoqLTIx2cbJEj8p9Ped9Z1osUpapGHyyorg2z+I/1flox6Ch8tL7ZTiYLosmy1Jd2SC3Pcv/15rwwIhtQ/B16VeFGNLl9rP9iLw==
X-Gm-Message-State: AOJu0YzV7Z7PcWTjreDdITfT/rSO50GzbRYDSNGsiY/ShpNfe51QxNZs
 hemy9KqohUuuZuZQFoGucEXrVW7g4CY3nAV4ABRE+sI2xNs+UfkDbVTNGwEA2d1fGsce2vd3Xiw
 cCRpg1+9IbeJIoc4elXryqazcPaQ=
X-Google-Smtp-Source: AGHT+IHd23BvSCzQlm7Tuey+57rzDaK5qYGqzZqCpTK+jC9NgfLORX/DZ664KaPmEqX41xGojin54yrzfjR9mkTpEyo=
X-Received: by 2002:a17:907:c24d:b0:a6f:96ac:3436 with SMTP id
 a640c23a62f3a-a6f96ac349dmr115982066b.11.1718697698117; Tue, 18 Jun 2024
 01:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
 <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
In-Reply-To: <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 18 Jun 2024 16:01:26 +0800
Message-ID: <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
To: Dragan Simic <dsimic@manjaro.org>
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org, 
 Philip Muller <philm@manjaro.org>,
 Oliver Smith <ollieparanoid@postmarketos.org>, 
 Daniel Smith <danct12@disroot.org>, stable@vger.kernel.org
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

On Tue, Jun 18, 2024 at 12:33=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> I see the problem that initramfs need to build a module dependency chain,
> but lima does not call any symbol from simpleondemand governor module.
>
> softdep module seems to be optional while our dependency is hard one,
> can we just add MODULE_INFO(depends, _depends), or create a new
> macro called MODULE_DEPENDS()?
>
This doesn't work on my side because depmod generates modules.dep
by symbol lookup instead of modinfo section. So softdep may be our only
choice to add module dependency manually. I can accept the softdep
first, then make PM optional later.

> On Tue, Jun 18, 2024 at 4:22=E2=80=AFAM Dragan Simic <dsimic@manjaro.org>=
 wrote:
> >
> > Lima DRM driver uses devfreq to perform DVFS, while using simple_ondema=
nd
> > devfreq governor by default.  This causes driver initialization to fail=
 on
> > boot when simple_ondemand governor isn't built into the kernel statical=
ly,
> > as a result of the missing module dependency and, consequently, the req=
uired
> > governor module not being included in the initial ramdisk.  Thus, let's=
 mark
> > simple_ondemand governor as a softdep for Lima, to have its kernel modu=
le
> > included in the initial ramdisk.
> >
> > This is a rather longstanding issue that has forced distributions to bu=
ild
> > devfreq governors statically into their kernels, [1][2] or may have for=
ced
> > some users to introduce unnecessary workarounds.
> >
> > Having simple_ondemand marked as a softdep for Lima may not resolve thi=
s
> > issue for all Linux distributions.  In particular, it will remain unres=
olved
> > for the distributions whose utilities for the initial ramdisk generatio=
n do
> > not handle the available softdep information [3] properly yet.  However=
, some
> > Linux distributions already handle softdeps properly while generating t=
heir
> > initial ramdisks, [4] and this is a prerequisite step in the right dire=
ction
> > for the distributions that don't handle them properly yet.
> >
> > [1] https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephon=
e/-/blob/6.7-megi/config?ref_type=3Dheads#L5749
> > [2] https://gitlab.com/postmarketOS/pmaports/-/blob/7f64e287e7732c9eaa0=
29653e73ca3d4ba1c8598/main/linux-postmarketos-allwinner/config-postmarketos=
-allwinner.aarch64#L4654
> > [3] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?i=
d=3D49d8e0b59052999de577ab732b719cfbeb89504d
> > [4] https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be=
512f6d8f4489054668ad
> >
> > Cc: Philip Muller <philm@manjaro.org>
> > Cc: Oliver Smith <ollieparanoid@postmarketos.org>
> > Cc: Daniel Smith <danct12@disroot.org>
> > Cc: stable@vger.kernel.org
> > Fixes: 1996970773a3 ("drm/lima: Add optional devfreq and cooling device=
 support")
> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> > ---
> >  drivers/gpu/drm/lima/lima_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lim=
a_drv.c
> > index 739c865b556f..10bce18b7c31 100644
> > --- a/drivers/gpu/drm/lima/lima_drv.c
> > +++ b/drivers/gpu/drm/lima/lima_drv.c
> > @@ -501,3 +501,4 @@ module_platform_driver(lima_platform_driver);
> >  MODULE_AUTHOR("Lima Project Developers");
> >  MODULE_DESCRIPTION("Lima DRM Driver");
> >  MODULE_LICENSE("GPL v2");
> > +MODULE_SOFTDEP("pre: governor_simpleondemand");
