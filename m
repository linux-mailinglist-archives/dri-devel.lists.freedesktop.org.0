Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537AA07640
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1816F10E134;
	Thu,  9 Jan 2025 12:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a1r1mGBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2399510E134
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:57:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so1171130a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736427374; x=1737032174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEz38DtTOWq2njzGUgwlj9ewqqxd3JoGkoly/wJ2398=;
 b=a1r1mGBat4C2mUYt9xfsDN4sVXVutstFr6aYfKXNNHdC7LRsOQd2osu+2MF69/7OsS
 XQygTN4MN7ofvlCFX6GgiunCda3vQcnDOC4dRFdRiAjjP4vNA7ZoZc4q/b5LFMiDk3aW
 XxYXPtUdZCZImwM9ItLu9kJ/xrVxKy8dab3ae/waKqcLHWeBh6p56+7Mi+yDqQ/XdjgY
 Z5IVJkx6AMn1uRvFTZEB8x0oZB9poBSPJaeb7aPNyr2vl/gSJmAM9Es5K+FtEPAdD+ht
 +rvTz3+X4sWVrmmeeoUFxfXitCBvImIYXL5LGj0lSAGplzsKchFwpLZGrJ93Ak3ZaLVN
 ijHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736427374; x=1737032174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEz38DtTOWq2njzGUgwlj9ewqqxd3JoGkoly/wJ2398=;
 b=m8CbxKCcE9QVFf5gGlezmzMzZwA6HRnjaIwgx3slvff4+K7kKQKB705luP4HnizPw0
 3aH/EXISwdoQUVgivSPymkgXaiIk/6wXJjA31Llx1PB4ld06IICAk3Dkp3J1ifbIWyoE
 rbdRia0pWpebAB2aYJPtcTVce5dUErJWZ6K9odB5mfG+A8fN8vx4NabtFrmPplLT2gye
 TnYGyTdssX9Srp4ObB1fful+kT0QA42v3r0pJpYVDIyXxgbh2kGqxOt8TA3mMC3gGsxc
 DZ0EMrYtWRRS+wLc2tIxoWK1UCqORwr2ilD2WjXKfUiVP8BRYt43wcEFLyMNGnDH2zHt
 l53g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFEubip9p1RW3ysSAqr/ulpa7q/F4sr4Dtgeeq3leckdM9tuMFRI5A9kzYh40y9iDZfjxDEnq7/Zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuIM4udTWdvUDmHiC7s6pyNt5VrSpsWVvdiM4fsqfG3iRl6q4q
 iLHBdPOk/Hv6qvXSGLeQozP8UONk8VDZ3GneGR5G2G6gLUxWGt94Plcty52qKdeNbFsrJPTP8nY
 bfArpZcUpjRiirMaQeDTwPsvkR1w=
X-Gm-Gg: ASbGnct20mSLvKZbnBX+eFqIbhbvGrWrFi2kbra9wjfH14luyuGQNDPdJj2Kz/T0wdq
 PAxNzCWYOt2p3c7FlkMdaKaEhAlyhhCa/IluONE2D
X-Google-Smtp-Source: AGHT+IFVbyh6UP8WoK4yZ81Vp8WbecdQUVFZqRCepllXETdu2aj5PHKb14SluGR7PQhfJwfA5AYrx5mYDmAL84OvN+o=
X-Received: by 2002:a05:6402:278f:b0:5d0:e63e:21c3 with SMTP id
 4fb4d7f45d1cf-5d972e085d7mr5917553a12.14.1736427374081; Thu, 09 Jan 2025
 04:56:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
 <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
 <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
 <392f855c-4474-4e12-8bdc-3baf43d34e13@suse.de>
In-Reply-To: <392f855c-4474-4e12-8bdc-3baf43d34e13@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 9 Jan 2025 20:56:01 +0800
X-Gm-Features: AbW1kvb83mK1OYk5q5Dc7_3GC4pnKl8oLMmBZm6vTEKRq7fQQd39kBPeQAPHqu8
Message-ID: <CAMpQs4+_5v23z3bkT4ykPE_PkgZYUTGKM82xcGnyj4US4O4TCw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/ls2kbmc: Add support for Loongson-2K BMC
 display
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>, 
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
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

Hi Thomas:

Sorry for the late reply.

On Mon, Jan 6, 2025 at 10:10=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi,
>
> Thanks for the info.
>
>
> Am 06.01.25 um 08:03 schrieb Binbin Zhou:
> [...]
> >> Could you point to the exact call that fails within simpledrm?
> > If we use simpledrm directly, the following error occurs:
> >
> > [    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
> > could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
> > 0x200]: -16
> > [    8.312681] simple-framebuffer simple-framebuffer.0: probe with
> > driver simple-framebuffer failed with error -16
> >
> > The reason for the failure: overlapping resources.
> >
> > https://elixir.bootlin.com/linux/v6.12.6/source/drivers/video/aperture.=
c#L175
>
> This error means that there's already an instance of simpledrm bound to
> the BMC framebuffer. So you already have a working display and some
> graphics under Linux without the new driver, right?

Yes, I checked again and found that the **efifb** binds to the BMC framebuf=
fer.

>
> If so, why do you need a new driver that does exactly the same as simpled=
rm?

Regarding the new driver, we implemented the BMC display based on
simpledrm. But first we need to fix the initialization failure above,
and more importantly, we need to implement the BMC reset function [1].

Specifically, when the BMC reset, it will cause the pcie controller to
disconnect and the display will be disconnected with it. After that,
we need to restore the pcie bar data, as well as re-push the display
information (ls2kbmc_push_drm_mode()).

Based on this, I would like to rewrite a new display driver.

[1]: patch(4/4)
https://lore.kernel.org/all/b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.173555=
0269.git.zhoubinbin@loongson.cn/
>
> Best regards
> Thomas
>
> >>> Because although we register the driver in platform form, its memory
> >>> belongs to pci space and we can see the corresponding pci probe and
> >>> resource allocation in Patch-1.
> >> I don't understand. Graphics memory is often located on the PCI bus.
> >> What is so special about this one?
> >>
> >>> Therefore, we need to use aperture_remove_conflicting_pci_devices().
> >> So there is already a device that represents the graphics card? That's
> >> what you'd remove here? If you only add that MFD device, who owns the
> >> framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why doe=
s
> >> aperture_remove_conflicting_pci_devices() not remove that device? I'm
> >> somewhat confused, because the logic in your driver mostly looks like =
it
> >> binds to a pre-configured framebuffer, but some of the code doesn't.
> > Perhaps the use of aperture_remove_conflicting_pci_devices() is wrong,
> > as there is only one display device for the LS2K BMC and there will be
> > no phase conflict.
> >
> > When I tried to use that API before, it was partly due to the error
> > above, and partly because I referenced that other display drivers via
> > pci_driver.probe() would have it, just in case I used it, which was
> > probably the wrong choice.
> >
> > The resources for pci bar0 are as follows:
> > BAR0: e0030000000/SZ_32M
> >
> > 0x0              0x600000  0xf00001c    16M            32M
> > +----+--------------+--------+-----------+---+-----------------+
> > | 2M | simpldrm |           | IPMI      |     | video env     |
> > +-----------------------------------------------------------------+
> >
> > The mfd driver registers the ls2kbmc-framebuffer and ls2k-ipmi-si
> > devices according to the resource allocation shown above. At the same
> > time, the ls2kbmc drm is bound to the pre-configured =E2=80=9Csimpldrm=
=E2=80=9D
> > resource in the above figure, which is passed through the
> > ls2kbmc-framebuffer driver. In addition, the resolution is read from
> > =E2=80=9Cvideo env=E2=80=9D for the time being, and the resolution adap=
tion is planned
> > to be added later.
> >
> >> Best regards Thomas
> >>
> >>> Also, since we are using BMC display, the display will be disconnecte=
d
> >>> when BMC reset, at this time we need to push the display data (crtc,
> >>> connector, etc.) manually as shown in Patch-4.
> >>>
> >>> Probably it's not the most suitable way to implement it.
> >>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> +     },
> >>>>> +     .probe =3D ls2kbmc_probe,
> >>>>> +     .remove =3D ls2kbmc_remove,
> >>>>> +};
> >>>>> +
> >>>>> +module_platform_driver(ls2kbmc_platform_driver);
> >>>>> +
> >>>>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> >>>>> +MODULE_LICENSE("GPL");
> >>>> --
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Frankenstrasse 146, 90461 Nuernberg, Germany
> >>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >>>> HRB 36809 (AG Nuernberg)
> >>>>
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstrasse 146, 90461 Nuernberg, Germany
> >> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >> HRB 36809 (AG Nuernberg)
> >>
> >
> > --
> > Thanks.
> > Binbin
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20
Thanks.
Binbin
