Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51125A01F92
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 08:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7110E4CD;
	Mon,  6 Jan 2025 07:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXHaAf+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C6810E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 07:10:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-304e4562516so18316001fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736147369; x=1736752169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WN0eHlvRZLqUth7fdNmiixC7R1slFhIulRWIs6eGyhw=;
 b=SXHaAf+awpLa2iVuIPwKvl42ORezcwR25Hg5oMc72ohVRfVa6q1oQBJWho3QS1yreO
 r1LXhYCDxKu8+NDHktKEn3wTvQFb1JbgCGw5Tx2MHKYcglP2MSRM1YaWQFWxCMRBXcYF
 WM5cHGujW7ZJrnY+qt7b5f4nIuG1/1p9D3Yu+S98nK9IioRtwg+5IHV1v3yX3k47jUHp
 EMFP/MsctbFrPesuHO+LFJ5nPoasNfhy9s8W42jsNBjQza04Ko2Zs0RQi7fNJ/xT9he8
 iKli18lT7nuQI2I7kopCj+MKUDup6kKevhBmX4hGveMhCbmgPh3QdewI65XtGnlK7KRX
 Xj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736147369; x=1736752169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WN0eHlvRZLqUth7fdNmiixC7R1slFhIulRWIs6eGyhw=;
 b=cb+J+2nhFCvp4aYtjCa9Uw5Q2UNB09YlI8+YUIdf2k7bYNSFkzKXAPIdWmnjAmg4iZ
 3a4cb6nD75K5CLv5ogsqOZWDTsrzRKoFDyyD/41yls1WVwsn5v0KdHG8ADfDOEtQIF05
 BYtUgz2Auue4QzLN1lsnjDKJjx9cefrGPp5//KUcAkpaivmOy9fXGenGyVF1JnE+SAiS
 OxnKJaRS2jmUxuekPQJuOqcC5Lt+KoaRxenaWuxkIJVrRZusEyJ9BVYkVzJ8RrVD6M+g
 hnr42OgZo5FXP4fAlAF98cgWQuSEMT7TXRvT+p4vAR6LOfItTysxHENsmCaZ+cScjdRN
 2T1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Zf8od+bdl2dFPNNQH4AfjioqOJTSa1usGmzO/Q/GBhQJ/icN2wBN2DObMvAICA6Ju6gyYJB0JXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvmGu4qwUU6yp/1UmZMfxGKt1QmkEz4+7iPbFaUA28Z99dyuSX
 gCqaLwXvL1iNW4WB0wpzZ1c1o2suzUfR+9yosxWl71/0/PeoXc3ywVB9eM76xvBEh1/2p5glXRW
 7p0V7UC9LDY4CGdJ1pklM9RUZxrvxvQvIKDOY6Q==
X-Gm-Gg: ASbGncvSuwAcv6TdnowgCGomz5q+bwBqM5N3c+uL/nuCNNGkyY1zeYZ1ZNOe8tJJQSA
 d+AibBMrXwOpOT0dWkpETnW0r9datYVNSE8eYOC5V
X-Google-Smtp-Source: AGHT+IGMkHPDNbs/bcxbVow/ye0IVS3X1UdnCWKNwdCTlSfAO5AKScoqQ8hW426T+yLCtzoA1OcxbNuBrD9bCPI5FGY=
X-Received: by 2002:a05:6402:390b:b0:5d0:e461:68e6 with SMTP id
 4fb4d7f45d1cf-5d8024822a5mr53462948a12.17.1736147016283; Sun, 05 Jan 2025
 23:03:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
 <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
In-Reply-To: <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 6 Jan 2025 15:03:23 +0800
X-Gm-Features: AbW1kvaA-CPbm5BMeJ4LfWbuB6jOL4jyphKqrcXwDCyIAy9vEeDfIzAZz8-C9Mw
Message-ID: <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
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

The last reply email was incomplete, sorry for the incomplete reply
due to my mistake.

On Thu, Jan 2, 2025 at 9:32=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
>
> Am 02.01.25 um 13:55 schrieb Binbin Zhou:
> > Hi Thomas:
> >
> > Thanks for your reply.
> >
> > On Thu, Jan 2, 2025 at 5:07=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Hi
> >>
> >>
> >> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> >> [...]
> >>> +
> >>> +static struct platform_driver ls2kbmc_platform_driver =3D {
> >>> +     .driver =3D {
> >>> +             .name =3D "ls2kbmc-framebuffer",
> >> The driver is mostly a copy of simpledrm. Why don't you use
> >> "simple-framebuffer" for your device name? You could use simpledrm
> >> directly then.
> > Ah, indeed, the driver is based on simpledrm.
> >
> > Initially, I also tried to use simpledrm directly, but it will fail in
> > drm memory acquire.
>
> Could you point to the exact call that fails within simpledrm?

If we use simpledrm directly, the following error occurs:

[    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
0x200]: -16
[    8.312681] simple-framebuffer simple-framebuffer.0: probe with
driver simple-framebuffer failed with error -16

The reason for the failure: overlapping resources.

https://elixir.bootlin.com/linux/v6.12.6/source/drivers/video/aperture.c#L1=
75
>
> > Because although we register the driver in platform form, its memory
> > belongs to pci space and we can see the corresponding pci probe and
> > resource allocation in Patch-1.
>
> I don't understand. Graphics memory is often located on the PCI bus.
> What is so special about this one?
>
> > Therefore, we need to use aperture_remove_conflicting_pci_devices().
>
> So there is already a device that represents the graphics card? That's
> what you'd remove here? If you only add that MFD device, who owns the
> framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why does
> aperture_remove_conflicting_pci_devices() not remove that device? I'm
> somewhat confused, because the logic in your driver mostly looks like it
> binds to a pre-configured framebuffer, but some of the code doesn't.

Perhaps the use of aperture_remove_conflicting_pci_devices() is wrong,
as there is only one display device for the LS2K BMC and there will be
no phase conflict.

When I tried to use that API before, it was partly due to the error
above, and partly because I referenced that other display drivers via
pci_driver.probe() would have it, just in case I used it, which was
probably the wrong choice.

The resources for pci bar0 are as follows:
BAR0: e0030000000/SZ_32M

0x0              0x600000  0xf00001c    16M            32M
+----+--------------+--------+-----------+---+-----------------+
| 2M | simpldrm |           | IPMI      |     | video env     |
+-----------------------------------------------------------------+

The mfd driver registers the ls2kbmc-framebuffer and ls2k-ipmi-si
devices according to the resource allocation shown above. At the same
time, the ls2kbmc drm is bound to the pre-configured =E2=80=9Csimpldrm=E2=
=80=9D
resource in the above figure, which is passed through the
ls2kbmc-framebuffer driver. In addition, the resolution is read from
=E2=80=9Cvideo env=E2=80=9D for the time being, and the resolution adaption=
 is planned
to be added later.

> Best regards Thomas
>
> >
> > Also, since we are using BMC display, the display will be disconnected
> > when BMC reset, at this time we need to push the display data (crtc,
> > connector, etc.) manually as shown in Patch-4.
> >
> > Probably it's not the most suitable way to implement it.
> >
> >> Best regards
> >> Thomas
> >>
> >>> +     },
> >>> +     .probe =3D ls2kbmc_probe,
> >>> +     .remove =3D ls2kbmc_remove,
> >>> +};
> >>> +
> >>> +module_platform_driver(ls2kbmc_platform_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> >>> +MODULE_LICENSE("GPL");
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


--
Thanks.
Binbin
