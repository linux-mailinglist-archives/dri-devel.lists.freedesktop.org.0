Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36964856ADC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E81910E25E;
	Thu, 15 Feb 2024 17:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KedpxOtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD7B10E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:22:50 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-296a02b7104so858560a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708017769; x=1708622569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCdIxf+MdHUM0w19oPm6Hp9wHlfMiiR6Tc593XFKLQ8=;
 b=KedpxOtr2NG8zBwfap0zmDKeV/unW1iMhR5wf4aZE6osf0s9FOVld54g45v0dwrykT
 rMLIQcsSr0H9RznKKq325K0vG48lpHOLXXqRN1ujzidmj58G9TZN+IYCTeivKQvdN8P5
 3NxMPtrbOOPFNMCHmpl8X9WOfxHtCjSWA1hSOxHtnMNf0U8T4BnC0WBq5eA46a6iuiRm
 A/KxvWOhFmEDMKLgKVhyA/HLIbjHBApxn9w03pnE276xAJDlT+zbY/ea0HgXgqg4TFYd
 rQzYfAuRGFc8x35sljosJSk5bqRmlqAhwQeMilIp1WN0QDQLcUDgmVE2S+AGoBYjBkph
 sqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708017769; x=1708622569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCdIxf+MdHUM0w19oPm6Hp9wHlfMiiR6Tc593XFKLQ8=;
 b=ke6kmTFbp2CAp3dn9idotI5x6SY2MMzGuDDp5yn7KLPP9n1V9q3pUdo5ZEE5R2Pnf/
 h0NkPjImJ91hj0MkCyMlUnXGzD3fLXYTkBRAqVJeoQPUsaofBq/irgyKplNL4D5l8z8R
 mtNJh4EN3rCUrH0NpKq/gNvBrZTkndie9UaofSn7t+HIL016pVDGqn6RBmO6EcNm77Tt
 PmIvLrQYAagmBBZdVrodlFxl//GNUcOP+OLZLVsaqnuobFPqu3U1zsa4yVB3zuXrbYOk
 SvpfZ20MWkIosr/IWRmdsB8+ydugW4ybOvZEbTJ61c8ECSSlftz2Hc8QUPK6fKdDqqJF
 Vn7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX227PCPEmRAsuMZ1IG56DHUtiYMjd2dvNM85c4zhLPCqc1SP90yi5d0CmPLiVWpriKsRnYtpWfmFLN5IkhtfTQ9VnUbhXvDDPPqS9RfT2v
X-Gm-Message-State: AOJu0YzI/pDuLF4K1AEtnL3NMeuqI9lKBbLBpCcnHPezle9VyJUwQEo7
 CdUDmj9AcUqUDPKJCo3rAOIfBl5MG1gPafcgTkoEjpJ7PU2tOIO8Dk7erpkpNz7Rm6N9eHXtNtQ
 Zt5QLEFixBCfZNHJD61f230SycA4=
X-Google-Smtp-Source: AGHT+IF/k0/r55Dh8x6cWEdqsL08/CFLYMXa0asdRWlpnR/QDBrP/5PA5VHD9tvIkfuojErk/doTP31/d0bkOBiqvho=
X-Received: by 2002:a17:90a:c78a:b0:299:1f85:6fdc with SMTP id
 gn10-20020a17090ac78a00b002991f856fdcmr1221911pjb.48.1708017769367; Thu, 15
 Feb 2024 09:22:49 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
In-Reply-To: <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 15 Feb 2024 11:22:38 -0600
Message-ID: <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
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

On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > Hi Maxime,
> >
> > On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrote:
> > > > Using the Imagination Technologies PowerVR Series 6 GPU requires a
> > > > proprietary firmware image, which is currently only available for T=
exas
> > > > Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, to
> > > > prevent asking the user about this driver when configuring a kernel
> > > > without Texas Instruments K3 Multicore SoC support.
> > >
> > > This wasn't making sense the first time you sent it, and now that com=
mit
> > > log is just plain wrong. We have firmwares for the G6110, GX6250,
> > > GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at leas=
t)
> > > Renesas, Mediatek, Rockchip, TI and StarFive, so across three
> >
> > I am so happy to be proven wrong!
> > Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g. R-Car M3-W.
> >
> > > architectures and 5 platforms. In two months.
> >
> > That sounds like great progress, thanks a lot!
> >
> Geert,
>
> > Where can I find these firmwares? Linux-firmware[1] seems to lack all
> > but the original K3 AM62x one.
>
> I think PowerVR has a repo [1], but the last time I checked it, the
> BVNC for the firmware didn't match what was necessary for the GX6250
> on the RZ/G2M.  I can't remember what the corresponding R-Car3 model
> is.  I haven't tried recently because I was told more documentation
> for firmware porting would be delayed until everything was pushed into
> the kernel and Mesa.  Maybe there is a better repo and/or newer
> firmware somewhere else.
>
I should have doubled checked the repo contents before I sent my last
e-mail , but it appears the firmware  [2] for the RZ/G2M, might be
present now. I don't know if there are driver updates necessary. I
checked my e-mails, but I didn't see any notification, or I would have
tried it earlier.  Either way, thank you Frank for adding it.  I'll
try to test when I have some time.

> adam
>
> [1] https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/power=
vr/powervr?ref_type=3Dheads

[2] - https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/commit/fec=
b3caebf29f37221fe0a20236e5e1415d39d0b

>
>
> >
> > Thanks again!
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firm=
ware.git/
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker=
. But
> > when I'm talking to journalists I just say "programmer" or something li=
ke that.
> >                                 -- Linus Torvalds
