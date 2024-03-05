Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B08720B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06820112B05;
	Tue,  5 Mar 2024 13:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lP6/lebH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9D7112B03
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 13:47:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-29a6dcfdd30so4266119a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 05:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709646454; x=1710251254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdMAZiRIAHsJUc1Mjq85NsXecYABbu9svdLTciq/OhY=;
 b=lP6/lebHhCwgwNOlb6jJxMCxREB/SKzoVC5dn/E+9AK5ogXL/zGzEir+20PPnYuk4r
 LM7X4wZ3Z2NSeldBpGuSC0/qNJeaLqw8FtUdhcyAbGcwh/1TpA23zGQvGU0i0wS5Rp1w
 5q2J2J03VliJPJjx9r83G5KscGSFMwYzMFkrjfTPo6H4P86rP6G+V0SD+IR2vHbPBRG2
 j+Z40/WzGvhwXsIVXEimJ4jOMMFH1Gxar2Q/+89rwNgNNkfkbx64n10KaE1Ehv8SRxWV
 HVs3JOplTjy2vNCf3y5lfx7U30UcM8gSsUbM2GvWJhA2LqhzzW7VaJLUL1Pn45gxwFZ5
 EaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709646454; x=1710251254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NdMAZiRIAHsJUc1Mjq85NsXecYABbu9svdLTciq/OhY=;
 b=SoKcE33TkgU33EuRcV1T35FwmqL6JQMY696umdf4QGG+tphSoxNVUvlIZOrVE3nfmd
 MDTAHG1QvvZOv1WTjUmNdOFjErb2+HL+VJGGkdhkk7Nc2jwYuMDzKiDu6wIY4rP/l0/D
 R9bLI7KSMNvA9Gbc0ICs0N6umuOtGm3EW+J3FBnRlm3im9u7yle8dSfW1PLxVl2wmXEg
 ujeAkwe230e1eG45pR0tHDkbtoWEG/ftoG4oM9xsqDrukM0SXdYpj3fPJHSnJaw/UQHV
 B79zAbz4OP46CIpPhSJeyIcaolLHehUUQonGELtHKJIVKlrERmYR9vTjwvF4KH7V9cBL
 27SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3v6uRTF1AWYs1VeXMagrsFqFUfDsgQw0m/aea3cml/93YsyZklskL+oBYfDPNV6t24rHQzLkBFqAvHnrMV6FEwxVLQ27PkO1F64d8Xb04
X-Gm-Message-State: AOJu0Yw9aeU2+uIwuZoWcGAzX9EVn5VuwPSZc+SOa0a5OyaG/iALH85q
 1CG6poT1He5W7XKpN8fEgGOsK4quLYz/GvsckuGdo5ZVx8CterapBF8KboZV/mw9h4D3tPb+9n6
 9rSo0QyUDf8Kdgps6i5jmuAgteXI=
X-Google-Smtp-Source: AGHT+IFIyTA9lyBuwaMRD+Ynxt5VrqnElevZJi9yhFl7HItD+Z67hgXbxvk0yLdnGIfu0In26xytbWEI6KxA1jrOO28=
X-Received: by 2002:a17:90a:f191:b0:29b:2a8:9a89 with SMTP id
 bv17-20020a17090af19100b0029b02a89a89mr10234445pjb.21.1709646453778; Tue, 05
 Mar 2024 05:47:33 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <76065296ad514898e2b8c29cd921c104b3692ae0.camel@imgtec.com>
In-Reply-To: <76065296ad514898e2b8c29cd921c104b3692ae0.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 5 Mar 2024 07:47:22 -0600
Message-ID: <CAHCN7xJ6uEghqDcUTKKQg7Lcg8uF55rz=vEHF=1xHRYfsDNGsA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nm@ti.com" <nm@ti.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>
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

On Tue, Mar 5, 2024 at 5:58=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com>=
 wrote:
>
> Hi Adam,
>
> Sorry for not responding sooner. I've recently just returned from paterni=
ty
> leave, so just catching up on everything.

Congratulations!

>
> On Thu, 2024-02-15 at 11:22 -0600, Adam Ford wrote:
> > On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@gmail.com>=
 wrote:
> > > On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > Hi Maxime,
> > > >
> > > > On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard <mripard@kern=
el.org> wrote:
> > > > > On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrot=
e:
> > > > > > Using the Imagination Technologies PowerVR Series 6 GPU require=
s a
> > > > > > proprietary firmware image, which is currently only available f=
or Texas
> > > > > > Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, =
to
> > > > > > prevent asking the user about this driver when configuring a ke=
rnel
> > > > > > without Texas Instruments K3 Multicore SoC support.
> > > > >
> > > > > This wasn't making sense the first time you sent it, and now that=
 commit
> > > > > log is just plain wrong. We have firmwares for the G6110, GX6250,
> > > > > GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at =
least)
> > > > > Renesas, Mediatek, Rockchip, TI and StarFive, so across three
> > > >
> > > > I am so happy to be proven wrong!
> > > > Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g. R-Car M3=
-W.
> > > >
> > > > > architectures and 5 platforms. In two months.
> > > >
> > > > That sounds like great progress, thanks a lot!
> > > >
> > > Geert,
> > >
> > > > Where can I find these firmwares? Linux-firmware[1] seems to lack a=
ll
> > > > but the original K3 AM62x one.
> > >
> > > I think PowerVR has a repo [1], but the last time I checked it, the
> > > BVNC for the firmware didn't match what was necessary for the GX6250
> > > on the RZ/G2M.  I can't remember what the corresponding R-Car3 model
> > > is.  I haven't tried recently because I was told more documentation
> > > for firmware porting would be delayed until everything was pushed int=
o
> > > the kernel and Mesa.  Maybe there is a better repo and/or newer
> > > firmware somewhere else.
> > >
> > I should have doubled checked the repo contents before I sent my last
> > e-mail , but it appears the firmware  [2] for the RZ/G2M, might be
> > present now. I don't know if there are driver updates necessary. I
> > checked my e-mails, but I didn't see any notification, or I would have
> > tried it earlier.  Either way, thank you Frank for adding it.  I'll
> > try to test when I have some time.
> >
>
> You may have noticed from one of Matt's emails that we now have a set of =
repos
> (linux, linux-firmware and Mesa) in our own area on freedesktop.org GitLa=
b:
> https://gitlab.freedesktop.org/imagination/
>
> We'll be using this as a staging area for work that isn't ready to be ups=
treamed
> yet (including firmware binaries).
>

I tried to play with these a little, but it seems like there is still
a fair amount of work to be done on the 6XT series. I tried to add the
device tree support for several Renesas boards, but the series was
NAK'd due to an inability to test it.
>
> > > adam
> > >
> > > [1] https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/p=
owervr/powervr?ref_type=3Dheads
> >
> > [2] - https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/commit=
/fecb3caebf29f37221fe0a20236e5e1415d39d0b
> >
>
> This is now the place to get the firmware for devices that aren't yet sup=
ported
> upstream:
> https://gitlab.freedesktop.org/imagination/linux-firmware/-/commits/power=
vr/?ref_type=3DHEADS
>
I've been following several of these repos and checking for software
updates in both the Firmware, driver and userspace layers.

> With the firmware for the Renesas variant of GX6250 being found in this c=
ommit:
> https://gitlab.freedesktop.org/imagination/linux-firmware/-/commit/fecb3c=
aebf29f37221fe0a20236e5e1415d39d0b
>

If your group thinks they have stuff they want tested, I am willing to
test them on the two platforms I have if I am CC'd on anything.

Thanks for the work your group has done so far.  It'll be nice to see the w=
ork.

adam

> Thanks
> Frank
>
> > >
> > > > Thanks again!
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-=
firmware.git/
> > > >
> > > > Gr{oetje,eeting}s,
> > > >
> > > >                         Geert
> > > >
> > > > --
> > > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@li=
nux-m68k.org
> > > >
> > > > In personal conversations with technical people, I call myself a ha=
cker. But
> > > > when I'm talking to journalists I just say "programmer" or somethin=
g like that.
> > > >                                 -- Linus Torvalds
