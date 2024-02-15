Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36078571A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 00:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4446610E927;
	Thu, 15 Feb 2024 23:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aG6BJ/kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9910E512
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 23:36:41 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so908556a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 15:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708040193; x=1708644993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWjLph67i05d2ZmR3xPB1HBK7d3hYJuubbvWJnFa+U4=;
 b=aG6BJ/kh+2sRq9DQHmlw5Vepdifx3jfMTSdCpZlblBQ+ckPOlW62uHdXpUs9z0eMQ+
 QKcjag95fncA6WRlfKoiXxhEjPRLFVI6ZinuIpuQWqw4k7JJNbBbrddSqZvyWLudtaS7
 kgJMWXSWmuJ5MXSZE19v8v2LHE1KedRf8ugvAMOfoukpmFtUU1fVHhPMeqSxvw7Zgw7n
 Lz2wvneOcdXAM+vR0XTjPanQxNTFVYOje+nNq97jQHbEUAGIZOv0QQW0Td5QFTO+VZDk
 5jShnYVBv6UCeYVoyGV0BJZBDd+DZhY7rUUsD3CMXZZJTbG5ECBF/jfS80E6dtURckeX
 wjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708040193; x=1708644993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWjLph67i05d2ZmR3xPB1HBK7d3hYJuubbvWJnFa+U4=;
 b=lyX9cKjXipV+TjcnBgFyszRwdR4/8hbwFjAcMYsyd2HzCUIitEdrPjvh1N2FFblaM5
 80hSukb7Jwpkj6oHwaaZGBz4ClorAzWEqdAbCja8fpRF63HPqFsdHbfHXBrrnpbaRtAv
 0ZdIIIje4amFWbruyStaSxzUJnwuRpHCwaQyu2SF0tDYxjEkxPUX/b3rZyjJOKKL2r/R
 kbmPccnN3ZiG/Kw0D86wVzl2kaPRWeRk+W8VG1Zc3Bf0KXXhFq77WK/+PmnxgCprdssA
 VNz/Of2+KBsQjK87qqUqxtOaJHEJGyAUXy79Xz5EEkaZn5AaZY36sVHnT4GdvMjU7K8U
 OaMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrdDc084K0MbR9LH4FCFne5tXgc9QCp97itYpCjm7KLNXDFlUsVhr5ofIW51FbWGfk6iH32sdJRzNpOj4vTjb7KVuSMMCrcfhgOrTZDeJa
X-Gm-Message-State: AOJu0Yy22quoUb9IDW+603N5+04Rm0c4ifcxvykCdSwrfYysAVqqZ1hE
 sUFpaa/WQs6bBoyQQ3cyLsbsPgWMr9yqZp+mulyvjMORUhb3ZN55yuCM3R0GOtW8A4ZxRDbO2m3
 u8xA54I5ZE8R9bvVI4DIWDBcnQGw=
X-Google-Smtp-Source: AGHT+IG4ZEXj+p9Jo4HtkAfP65eziXRxq/kR+4m5d+LlfJQCAPYcqB/hu2liUIwiJzI/2nw5AOSdZixFpOVtCL3Z/G8=
X-Received: by 2002:a17:90a:c7c8:b0:298:e3da:70f2 with SMTP id
 gf8-20020a17090ac7c800b00298e3da70f2mr3501466pjb.10.1708040193009; Thu, 15
 Feb 2024 15:36:33 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
In-Reply-To: <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 15 Feb 2024 17:36:21 -0600
Message-ID: <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <mripard@kernel.org>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
 Nishanth Menon <nm@ti.com>, Marek Vasut <marek.vasut@mailbox.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Feb 15, 2024 at 11:22=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@gmail.com> w=
rote:
> >
> > On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > >
> > > Hi Maxime,
> > >
> > > On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard <mripard@kernel=
.org> wrote:
> > > > On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrote:
> > > > > Using the Imagination Technologies PowerVR Series 6 GPU requires =
a
> > > > > proprietary firmware image, which is currently only available for=
 Texas
> > > > > Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, to
> > > > > prevent asking the user about this driver when configuring a kern=
el
> > > > > without Texas Instruments K3 Multicore SoC support.
> > > >
> > > > This wasn't making sense the first time you sent it, and now that c=
ommit
> > > > log is just plain wrong. We have firmwares for the G6110, GX6250,
> > > > GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at le=
ast)
> > > > Renesas, Mediatek, Rockchip, TI and StarFive, so across three
> > >
> > > I am so happy to be proven wrong!
> > > Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g. R-Car M3-W=
.
> > >
> > > > architectures and 5 platforms. In two months.
> > >
> > > That sounds like great progress, thanks a lot!
> > >
> > Geert,
> >
> > > Where can I find these firmwares? Linux-firmware[1] seems to lack all
> > > but the original K3 AM62x one.
> >
> > I think PowerVR has a repo [1], but the last time I checked it, the
> > BVNC for the firmware didn't match what was necessary for the GX6250
> > on the RZ/G2M.  I can't remember what the corresponding R-Car3 model
> > is.  I haven't tried recently because I was told more documentation
> > for firmware porting would be delayed until everything was pushed into
> > the kernel and Mesa.  Maybe there is a better repo and/or newer
> > firmware somewhere else.
> >
> I should have doubled checked the repo contents before I sent my last
> e-mail , but it appears the firmware  [2] for the RZ/G2M, might be
> present now. I don't know if there are driver updates necessary. I
> checked my e-mails, but I didn't see any notification, or I would have
> tried it earlier.  Either way, thank you Frank for adding it.  I'll
> try to test when I have some time.
>

I don't have the proper version of Mesa setup yet, but for what it's
worth, the firmware loads without error, and it doesn't hang.

[    9.787836] powervr fd000000.gpu: [drm] loaded firmware
powervr/rogue_4.45.2.58_v1.fw
[    9.787861] powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 O=
S)


adam
> > adam
> >
> > [1] https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/pow=
ervr/powervr?ref_type=3Dheads
>
> [2] - https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/commit/f=
ecb3caebf29f37221fe0a20236e5e1415d39d0b
>
> >
> >
> > >
> > > Thanks again!
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware.git/
> > >
> > > Gr{oetje,eeting}s,
> > >
> > >                         Geert
> > >
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
> > >
> > > In personal conversations with technical people, I call myself a hack=
er. But
> > > when I'm talking to journalists I just say "programmer" or something =
like that.
> > >                                 -- Linus Torvalds
