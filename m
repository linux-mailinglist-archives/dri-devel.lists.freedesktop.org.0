Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD7A01D2E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 03:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD3F10E55A;
	Mon,  6 Jan 2025 02:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAosUyZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28410E558
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 02:04:52 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so12593577a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 18:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736129031; x=1736733831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlWS4YvO53NnHzw6pvNdcFFPAPIg3E65lSWjybM2Ieg=;
 b=SAosUyZv+B4MA3ejsqJWZITTGScHalsxjZhy5I/Ds9s9Hu8PB0Z2E2r4RK91PakZE8
 0cwHV/Hu1I6n9Xd7qGBa692K7CFdowEpBbkVRzomDzaLLrz0Fmpa3defTAhFeLmFhuil
 mhyj1a98BHRwlImxLeZMD/0zEyc8cEWyeMHaIYB6OS4B3yFDHZuSN2H4ZhVbEC66rBG5
 0mWuH/u8KwmIAmKJM+uSpTdaJmj5hKFIBugzZyCYpa49DhKjhCVuA5ZDXFF5QCzMMSFR
 b7qpVkxk0lq+cVS7tD1Btl7n+yrMx8ZIhfpQ0f6IA6i2DsWeEGFzrIAcpmDEQ0uLybfz
 P65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736129031; x=1736733831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlWS4YvO53NnHzw6pvNdcFFPAPIg3E65lSWjybM2Ieg=;
 b=pUmSXdI1ztkyH4xJ8ikY8hONYg5UxasFCn2dwQNAKtSWzKyhUYn3ZNhZyCvFVprO3z
 rrvjJdy3ew1vIlecMeEAPo9gfmim6CK54mGXtFyRoqmQiy1XOLooSKBjmTX1iDrCc7rx
 ifMlHwu7z/GfbbfCJutIQWbiY5g9VCEFQqOXo9QihxY6ZstJ6ZUj25luwKKwr85VvXSq
 qgppVQK/jU5onTATnOcRUKUEiteT+iXCvAZb/kBNI0TpQKUD3R28VrPKJIxYoLWJ6BF2
 RnVMWrVMF6wgy6JhO3nNaopqhNM2eNMLhddF3dsWzMn8EhcVzS+EYXloOPbfma4Ua/0a
 2piQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQa38bHLbvMRPMjFmh7P4AKUuTw7bgPwCZwct88i4MBerAEbBuawzHzffC83G2L7zz9TQJX8A95lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfFa+V2rbl6f9P/cgIEmoQORoMYaOhuaG2ylUvxgAkd6uywmuG
 HWM/Xe1E5YY4b4eS/buoxfkhVZXY2LlFGozFGydyWkZzBsdWnQ/ntPgaiviu/o4UnVnBbjDM6Na
 5lG5Ta4bGdm+3eaeJQF7t+D71xpCugZO2RpP6FQ==
X-Gm-Gg: ASbGncucV78bhlv2gyQZaUwR2ISLv4x0f+WRS3LZ84jB2wUTIYTfCAUbnan8pQUMyxx
 q6EdpaTFNeRBGyAo28s1JRAxCvsfiBwyCvHa3qKZt
X-Google-Smtp-Source: AGHT+IHp3npAFMqevwFn4zq6KYPbZvnYmmZPzwsSEsLp2V2eixfHQyRdfe0VM6iSm48wm7zTxXNLli6e9amHYTcX/ow=
X-Received: by 2002:a05:6402:1e90:b0:5d3:ff30:b4cc with SMTP id
 4fb4d7f45d1cf-5d81de39866mr52543342a12.33.1736128630093; Sun, 05 Jan 2025
 17:57:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
 <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
In-Reply-To: <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 6 Jan 2025 09:56:57 +0800
X-Gm-Features: AbW1kvYlBMzJH0hwIKgBJ-3gkJK4OQkqvI5bw9nzSAa4-sFHT3qKE49iY62ABvI
Message-ID: <CAMpQs4+0Pn8c=C6bEk=_M4f8WvXv7K6Rbcw2_ghOZmxgE88e3Q@mail.gmail.com>
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

[    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
0x200]: -16
[    8.312681] simple-framebuffer simple-framebuffer.0: probe with
driver simple-framebuffer failed with error -16
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


--=20
Thanks.
Binbin
