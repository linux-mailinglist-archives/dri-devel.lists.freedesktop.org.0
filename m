Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3C750BF4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E59710E562;
	Wed, 12 Jul 2023 15:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF4510E562
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:10 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-345d3c10bdfso25237235ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689174670; x=1691766670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msqLe5PTi/RJjz0zGmFtuZl54shK0e/9aHVckdeov8Y=;
 b=ZwR6kvFbCVIiYIqLyK8sslMDplutGOgQBqsfhpXNSMGGzKWcS4dT7HQUefiF9M6tqo
 Juo4jvnJ8kF2SOCJoUtWhPvs9Rh13MMjUrpOpOs4qMdjSMbIE0vdEjiEYpBeSgoiIvTO
 WgTTy+mNU/m3hp78a8hfyoUKHqXDVLN08IbBjIlS1GP+svKRSom/TiWpJbfvBV2eQl+6
 Q43ktbF3SoRANB7F8qJIpxopEAweg5AfsFJPxyq0e4J76ZgXZGvww7DsLMlnU1dHdXO2
 C7nfgameaEvoaFptGMMTV1+B7y66FtvmuKKkt4SdajdTyPMk9XlUnPKlNqn/YORTbHp7
 MjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689174670; x=1691766670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msqLe5PTi/RJjz0zGmFtuZl54shK0e/9aHVckdeov8Y=;
 b=PLeD0xhBfk151gTEHPiwxok1Yfv5BX0w4Bv6LtV29XFqcdOHYQiButezg+klIrxyCO
 J+fmYHr5xI/oEmMBGYRhmvkqYDlsWylZM0F1a/uJe/nW7pkGSi2v+n8CwGzY1GuHnAyX
 dKZhhNOLpnKENNgBFm9i7MUi61G968ez+PEYRFXNJOWKEWrMZR1OBQW8lxSKXVzSIhaq
 Rp0+7mED+BtYimesc/H6GUtxXbRqSBpKvBrLTdfb4LLLKLjnXVJK3Uwr7bb3TXmoSFI1
 ZdfP/iZ2c7xgTjF66DXz3/wnGotI77GSyWkqNF1iD64B4HGKzufS6PAKrmgJLh2nNo1G
 IFcw==
X-Gm-Message-State: ABy/qLbQHKWkpkIH2kgrz6O5rSdP2o73g7MKphgvrFhLHHxbTv3FVSyq
 NIPI0U75Tfvfu3D4vQY0kBV6ZQMlGeUgH1nvKQnjU1FvWSDImJrx
X-Google-Smtp-Source: APBJJlFzhfSux1saHBHeMbvRFgDf8RpRA+yP+dMWk/qpNk9P4hOahH82o8ENSi42PSiXtjc/T1rmbqfcwPr3b+VE/ds=
X-Received: by 2002:a92:d201:0:b0:346:5a8b:5415 with SMTP id
 y1-20020a92d201000000b003465a8b5415mr9939617ily.30.1689174669823; Wed, 12 Jul
 2023 08:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
 <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
 <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
 <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
 <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
 <CAO9szn1QdB5WGshuyCOGqb0qbBWHqoikeiMkk+bNGhAF5TX5ew@mail.gmail.com>
 <45488dcc-226e-1e7c-c681-c1d9be17bcbb@denx.de>
In-Reply-To: <45488dcc-226e-1e7c-c681-c1d9be17bcbb@denx.de>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 12 Jul 2023 17:10:58 +0200
Message-ID: <CAO9szn3scWfrP3mB8QnvPewZegV0=6iD8PE2bOS09HuN6gywmg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Marek Vasut <marex@denx.de>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Jagan Teki <jagan@amarulasolutions.com>, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

sri, 12. srp 2023. u 15:42 Marek Vasut <marex@denx.de> napisao je:
>
> On 7/12/23 14:07, Paulo Pavacic wrote:
> > Hello all,
> >
> > sub, 8. srp 2023. u 14:53 Marek Vasut <marex@denx.de> napisao je:
> >>
> >> On 7/7/23 17:26, Paulo Pavacic wrote:
> >>> Hello Marek,
> >>
> >> Hi,
> >>
> >>> =C4=8Det, 6. srp 2023. u 17:26 Marek Vasut <marex@denx.de> napisao je=
:
> >>>>
> >>>> On 7/6/23 17:18, Paulo Pavacic wrote:
> >>>>> Hello Linus,
> >>>>>
> >>>>> =C4=8Det, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro=
.org> napisao je:
> >>>>>>
> >>>>>> On Wed, Jun 21, 2023 at 5:09=E2=80=AFPM Paulo Pavacic <pavacic.p@g=
mail.com> wrote:
> >>>>>>
> >>>>>>> A lot of modifications to st7701 are required. I believe it would
> >>>>>>> result in a driver that doesn't look or work the same. e.g compar=
e
> >>>>>>> delays between initialization sequences of panel-fannal-c3004 and
> >>>>>>> panel-st7701. I think it would be optimal to create st7701s drive=
r and
> >>>>>>> have special handling for st7701s panels. If there was a flag for
> >>>>>>> whether panel is st7701 or st7701s it would end up looking like a
> >>>>>>> mess.
> >>>>>>
> >>>>>> What matters is if the original authors of the old st7701 driver a=
re
> >>>>>> around and reviewing and testing patches at all. What we need is
> >>>>>> active maintainers. (Added Jagan, Marek & Maya).
> >>>>>>
> >>>>>> I buy the reasoning that the st7701s is perhaps substantially diff=
erent
> >>>>>> from st7701.
> >>>>>>
> >>>>>> If st7701s is very different then I suppose it needs a separate dr=
iver,
> >>>>>> then all we need to to name the driver properly, i.e.
> >>>>>> panel-sitronix-st7701s.c.
> >>>>>
> >>>>> I had in person talk with Paul Kocialkowski and I have concluded th=
at
> >>>>> this is the best solution.
> >>>>> I believe I should rename it to st7701s due to the hardware changes=
. I
> >>>>> would like to create V5 patch with driver renamed to st7701s.
> >>>>> Please let me know if you agree / disagree.
> >>>>
> >>>> If I recall it right, the ST7701 and ST7701S are basically the same
> >>>> chip, aren't they ?
> >>>
> >>> I'm currently exploring all the differences. There aren't a lot of
> >>> differences, but there are some.
> >>> So far I can see that default register values are different, new
> >>> previously unused registers are now used and there has been some
> >>> reordering of how info is placed in registers [1] (data bits are in
> >>> different order). Moreover, instructions to some commands have been
> >>> changed and meaning of what data bits mean [2][3]. Also, new features
> >>> have been added [2]; there is now PCLKS 3 for example.
> >>>
> >>> You can see few differences in following images. Same images were
> >>> attached in this mail:
> >>> [1] https://ibb.co/NmgbZmy - GAMACTRL_st7701.png
> >>> [2] https://ibb.co/G79y235 - PCLKS2.png
> >>
> >> Ouch. I wonder if this is still something that can be abstracted out
> >> with some helper accessor functions like:
> >>
> >> if (model =3D=3D ST7701)
> >>     write something
> >> else
> >>     write the other layout
> >>
> >> Or whether it makes sense to outright have a separate driver. The late=
r
> >> would introduce duplication, but maybe that much duplication is OK.
> >
> > I would like to create new driver because panel-st7701 seems to be
> > outdated and is using non-standard macro (ST7701_WRITE()
>
> There is no such macro:
>
> $ git grep ST7701_WRITE drivers/gpu/drm/panel/ | wc -l
> 0
>
> There never was such a macro used in the driver either, are you sure you
> are not using some hacked up patched downstream fork of the driver ?

I meant ST7701_DSI() macro; It can be replaced with
mipi_dsi_generic_write_seq from kernel 6.3. Sorry for the confusion.

>
> $ git log -p next/master --
> drivers/gpu/drm/panel/panel-sitronix-st7701.c | grep ST7701_WRITE | wc -l
> 0
>
> > ) and for me
> > it is crashing kernel 5.15.
>
> Have you based all the aforementioned discussion and argumentation on
> year and half old Linux 5.15.y code base too ?
>
> If so, you are missing many patches:
>
> $ git log --oneline --no-merges v5.15..next/master --
> drivers/gpu/drm/panel/panel-sitronix-st7701.c
> 5a2854e577dc2 drm: panel: Add orientation support for st7701
> e89838968ee44 drm: panel: Add Elida KD50T048A to Sitronix ST7701 driver
> c62102165dd79 drm/panel/panel-sitronix-st7701: Remove panel on DSI
> attach failure
> 49ee766b364ed drm/panel/panel-sitronix-st7701: Clean up CMDnBKx selection
> c1cdee9b685a1 drm/panel/panel-sitronix-st7701: Fix RTNI calculation
> 57b2efce45ef5 drm/panel/panel-sitronix-st7701: Add Densitron
> DMT028VGHMCMI-1A TFT
> 42542c7904cf2 drm/panel/panel-sitronix-st7701: Split GIP and init sequenc=
es
> 83b7a8e7e88e7 drm/panel/panel-sitronix-st7701: Parametrize voltage and
> timing
> de2b4917843cd drm/panel/panel-sitronix-st7701: Infer horizontal pixel
> count from TFT mode
> 82f9cee25598a drm/panel/panel-sitronix-st7701: Adjust porch control
> bitfield name
> 1ba85119afb5e drm/panel/panel-sitronix-st7701: Infer vertical line count
> from TFT mode
> 779c84fea3dbd drm/panel/panel-sitronix-st7701: Make gamma correction TFT
> specific
> 7fa8e07128ed6 drm/panel/panel-sitronix-st7701: Make voltage supplies
> common to ST7701
> a6c225be3da7e drm/panel/panel-sitronix-st7701: Enable DSI burst mode,
> LPM, non-continuous clock
> 6f481afe220d3 drm/panel/panel-sitronix-st7701: Make DSI mode flags
> common to ST7701
> 79abca2b39900 drm/mipi-dsi: Make remove callback return void

I will try backporting those patches to 5.15 and applying them to see
whether it will then work with initialization sequences provided in
this merge request just to be sure not to have duplication. We are
still working on transitioning to newer kernel so for the time being
I'm using mostly 5.15.

On 5.15 kernel I have following kernel panic only with st7701 from the
panel drivers I have tried:

[   20.255322] Kernel panic - not syncing: Asynchronous SError Interrupt
[   20.255326] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G           O
     5.15.77-5.15.77-2.1.0 #1
[   20.255330] Hardware name: XXX i.MX8XX board:XXX (DT)
[   20.255333] Workqueue: events fbcon_register_existing_fbs
[   20.255339] Call trace:
[   20.255340]  dump_backtrace+0x0/0x19c
[   20.255349]  show_stack+0x18/0x70
[   20.255354]  dump_stack_lvl+0x68/0x84
[   20.255360]  dump_stack+0x18/0x34
[   20.255365]  panic+0x15c/0x308
[   20.255370]  nmi_panic+0x8c/0x90
[   20.255376]  arm64_serror_panic+0x6c/0x7c
[   20.255382]  do_serror+0x58/0x5c
[   20.255388]  el1h_64_error_handler+0x30/0x50
[   20.255395]  el1h_64_error+0x78/0x7c
[   20.255399]  _raw_spin_unlock_irq+0x18/0x50
[   20.255404]  sec_mipi_dsim_host_transfer+0x1a4/0x460
[   20.255411]  mipi_dsi_device_transfer+0x44/0x60
[   20.255418]  mipi_dsi_dcs_write_buffer+0x64/0xa0
[   20.255424]  st7701_init_sequence+0x2b0/0x47c
[   20.255431]  st7701_prepare+0x54/0x70
[   20.255436]  drm_panel_prepare+0x28/0x40
[   20.255431]  st7701_prepare+0x54/0x70
[   20.255436]  drm_panel_prepare+0x28/0x40
[   20.255441]  sec_mipi_dsim_bridge_atomic_enable+0x308/0x520
[   20.255446]  drm_atomic_bridge_chain_enable+0x54/0xd0
[   20.255453]  drm_atomic_helper_commit_modeset_enables+0x13c/0x24c
[   20.255458]  lcdif_drm_atomic_commit_tail+0x30/0x70
[   20.255464]  commit_tail+0xa0/0x180
[   20.255468]  drm_atomic_helper_commit+0x160/0x370
[   20.255473]  drm_atomic_commit+0x4c/0x60
[   20.255477]  drm_client_modeset_commit_atomic+0x1c8/0x260
[   20.255485]  drm_client_modeset_commit_locked+0x5c/0x1a0
[   20.255491]  drm_client_modeset_commit+0x30/0x60
[   20.255496]  drm_fb_helper_set_par+0xc8/0x120
[   20.255504]  fbcon_init+0x3c8/0x510
[   20.255508]  visual_init+0xb4/0x104
[   20.255513]  do_bind_con_driver.isra.0+0x1c4/0x394
[   20.255518]  do_take_over_console+0x144/0x1fc
[   20.255523]  do_fbcon_takeover+0x6c/0xe0
[   20.255530]  fbcon_fb_registered+0xf4/0x140
[   20.255534]  fbcon_register_existing_fbs+0x48/0x64
[   20.255539]  process_one_work+0x1d0/0x354
[   20.255545]  worker_thread+0x13c/0x470
[   20.255550]  kthread+0x150/0x160
[   20.255556]  ret_from_fork+0x10/0x20
[   20.255563] SMP: stopping secondary CPUs
[   20.255571] Kernel Offset: 0x80000 from 0xffff800008000000
[   20.255574] PHYS_OFFSET: 0x40000000
[   20.255563] SMP: stopping secondary CPUs
[   20.255571] Kernel Offset: 0x80000 from 0xffff800008000000
[   20.255574] PHYS_OFFSET: 0x40000000
[   20.255575] CPU features: 0x00002401,20000842
[   20.255579] Memory Limit: none

Raydium driver, for example, doesn't crash. It even almost works with
few modifications (distorted screen).

>
> > Does anyone have similar issues with it?
>
> No, I am using it in production.

Okay, then it might be something with my setup, I will check it out.

Thank you for your time,
Paulo
