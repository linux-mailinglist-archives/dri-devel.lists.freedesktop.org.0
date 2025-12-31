Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB0CEB9DF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5940410E0D6;
	Wed, 31 Dec 2025 08:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M9iJiLFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1910E074
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 01:13:01 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so88369545ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767143581; x=1767748381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IeQcQUJ0nVxM8AF8UlKdRHzbwF3mIH0Sw6rdC7jjj/k=;
 b=M9iJiLFsYZ0IcgsujagUp78F+p/SD/l/OoCFTB7smRm7ucM/K4+BLHaIZVRXHfhlL4
 yQHZYO0xOpC+dK+tz5jCz+8am2dg+9xaG4UWOVJjwloNfGcDDdoD3T/RwmFqghdCrmEc
 C1DrI8CKEhucvnfgU7wuTGUmwv+B6lR6WNKGnA+Xr3MPYwzm7qEkLx+fn7kB5wTnCJfs
 yB4qpskgyG80sFUAdYzRUFmY1OC0ebwhTm0siIeOV6VHXE83+nCH3Vks/qcAYYBCu+N6
 Z2sBkIrGW8lDPpuoBvy7vj+7z481hl4pAcp2mgshq4lrm1Iwb9SX2WLS26HalrKvxco7
 9GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767143581; x=1767748381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IeQcQUJ0nVxM8AF8UlKdRHzbwF3mIH0Sw6rdC7jjj/k=;
 b=DyYQGAkwI8AvSeMEyCcB3hwgzUFIXxSeMAnTZtGrdwLEMF2SzdqhZOwcsXzZGL5Hnw
 Gn9M+nwv1Bcpngx++zefScsKtOhhGGftipPBgOoveDHkyCP0E1ydJFnNmTtkTvyHMl5P
 4cEd25z1uTfJKM0p7Fll02USqD2PtZ7DTSx4mk3t/fMs921FnMFW/tjf0B1rwb4ulkpx
 U4xa12h3NaHpKBhotGVgeDDEerDW/Vbd4/+UolaNwrgreq892T9BPSNQtBwp93zlvOl8
 6AmPYAPfFmhzQZsPpPF1IUX0tgkO+iRSRPQGOgoIoeASzJYuTf7P9LoVMj/B+5Twwp0L
 azfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwzlUpjFs8wVI61hErFH7mzvzIKQWvapm7eG/VpWLZhSqZgJ4Xmh69kfeC8jCyGUf6BD0Ca5Xaq/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp8KYL8+XtG68C7DoO6APANxBwTHqRhXka7AnELP6RzWQ04PYe
 LvVtGFPjtmBJfNUxZknVBFFAha7uWMqwRqOQqx9tM/ynj/D77NQEy5TXqr23hSsoy7d730g2dKg
 OR2d5MxUHkZvdA9rY/Gnb9vtn3MJoyqU=
X-Gm-Gg: AY/fxX4wB0cPXS9FCodsyowgkuBCofUQQQlopFB6Mxu2Saf6nGR3I1wgvS4S9j6buDi
 /ieGQb2kCD/ls0TK6con66kxYc90b23BCTm4bPFo2vC3o4YvvHRDAtkMHAdfBbsBQYedY5aqTAP
 yNkf9VamO5nQ0esOGxByYr6Gn1XxyVqJBFkgH9KjzkvCbLowAhjSHjc0kuZnMI1WDmWynX2DaMx
 o+H2+txbESIDS9Dw6n1G8cuDBA2Ziip25fPO4SVIekrFTU1j+4wjfrFY53qrQ4r/lct2HCJZIsA
 tAyt5pSZbU+/cF3A6eGGQ/lVOrtFICAYxcxBLtZs
X-Google-Smtp-Source: AGHT+IHbJxSw1M3musp0bYbX/SCruq7+cMntd+0nwNFLBVEvPaHZrydSXj/YPxC7Mx1rvics9S2yxNHLP1jgYX4iRyk=
X-Received: by 2002:a05:701b:240e:b0:11b:95fe:bee3 with SMTP id
 a92af1059eb24-121722e8c4dmr20769496c88.37.1767143581083; Tue, 30 Dec 2025
 17:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20251215225305.3820098-1-patdiviyam@gmail.com>
 <c3253bfe-e967-48ae-9376-a65ad1d53419@gmx.de>
 <CAM19b+s73Fo6Ej85qk72UPn12VQ_iFAYpHv7K=wOapb0-+1XBA@mail.gmail.com>
In-Reply-To: <CAM19b+s73Fo6Ej85qk72UPn12VQ_iFAYpHv7K=wOapb0-+1XBA@mail.gmail.com>
From: Diviyam Pat <patdiviyam@gmail.com>
Date: Wed, 31 Dec 2025 01:12:49 +0000
X-Gm-Features: AQt7F2riJ6pSzSd-igUXfxPmknjpaTscQSQNu4tgJyw4w_cn6eGpa11dBIMkTUU
Message-ID: <CAM19b+vFf9YJGdtysuG+DrxLnnvbcbzhR_Ad5PzR4q4zkVdWzg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: xilinxfb: request memory region before mapping
 framebuffer
To: Helge Deller <deller@gmx.de>
Cc: tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 31 Dec 2025 08:54:47 +0000
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

Hi
No, this wasn't tested on actual hardware. I don't have access to it.
If someone is able to do it, that would be great.

Thanks
Diviyam


On Tue, 30 Dec 2025 at 23:21, Diviyam Pat <patdiviyam@gmail.com> wrote:
>
> Hi
> No, this wasn't tested on actual hardware. I don't have access to it. If =
someone is able to it that would be great.
>
> Thanks
> Diviyam
>
> On Tue, 30 Dec, 2025, 3:27=E2=80=AFpm Helge Deller, <deller@gmx.de> wrote=
:
>>
>> On 12/15/25 23:53, patdiviyam@gmail.com wrote:
>> > From: DiviyamPathak <patdiviyam@gmail.com>
>> >
>> > The xilinxfb driver maps a physical framebuffer address with ioremap()
>> > without first reserving the memory region. This can conflict with othe=
r
>> > drivers accessing the same resource.
>> >
>> > Request the memory region with devm_request_mem_region() before mappin=
g
>> > the framebuffer and use managed mappings for proper lifetime handling.
>> >
>> > This addresses the fbdev TODO about requesting memory regions and avoi=
ds
>> > potential resource conflicts.
>> >
>> > Signed-off-by: DiviyamPathak <patdiviyam@gmail.com>
>>
>> Was it tested it on physical hardware?
>> If not, could someone test?
>>
>> Helge
>>
>>
>> > ---
>> >   drivers/video/fbdev/xilinxfb.c | 30 +++++++++++++++++-------------
>> >   1 file changed, 17 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xili=
nxfb.c
>> > index 0a6e05cd155a..f18437490de8 100644
>> > --- a/drivers/video/fbdev/xilinxfb.c
>> > +++ b/drivers/video/fbdev/xilinxfb.c
>> > @@ -280,19 +280,27 @@ static int xilinxfb_assign(struct platform_devic=
e *pdev,
>> >       /* Allocate the framebuffer memory */
>> >       if (pdata->fb_phys) {
>> >               drvdata->fb_phys =3D pdata->fb_phys;
>> > -             drvdata->fb_virt =3D ioremap(pdata->fb_phys, fbsize);
>> > +             /* Request the memory region before mapping */
>> > +             if (!devm_request_mem_region(dev, pdata->fb_phys, fbsize=
,
>> > +                                     DRIVER_NAME)) {
>> > +                     dev_err(dev, "Cannot request framebuffer memory =
region\n");
>> > +                     return -EBUSY;
>> > +             }
>> > +             drvdata->fb_virt =3D devm_ioremap(dev, pdata->fb_phys, f=
bsize);
>> > +             if (!drvdata->fb_virt) {
>> > +                     dev_err(dev, "Could not map framebuffer memory\n=
");
>> > +                     return -ENOMEM;
>> > +             }
>> >       } else {
>> >               drvdata->fb_alloced =3D 1;
>> >               drvdata->fb_virt =3D dma_alloc_coherent(dev, PAGE_ALIGN(=
fbsize),
>> > -                                                   &drvdata->fb_phys,
>> > -                                                   GFP_KERNEL);
>> > -     }
>> > -
>> > -     if (!drvdata->fb_virt) {
>> > -             dev_err(dev, "Could not allocate frame buffer memory\n")=
;
>> > -             return -ENOMEM;
>> > +                                     &drvdata->fb_phys,
>> > +                                     GFP_KERNEL);
>> > +             if (!drvdata->fb_virt) {
>> > +                     dev_err(dev, "Could not allocate frame buffer me=
mory\n");
>> > +                     return -ENOMEM;
>> > +             }
>> >       }
>> > -
>> >       /* Clear (turn to black) the framebuffer */
>> >       memset_io((void __iomem *)drvdata->fb_virt, 0, fbsize);
>> >
>> > @@ -362,8 +370,6 @@ static int xilinxfb_assign(struct platform_device =
*pdev,
>> >       if (drvdata->fb_alloced)
>> >               dma_free_coherent(dev, PAGE_ALIGN(fbsize), drvdata->fb_v=
irt,
>> >                                 drvdata->fb_phys);
>> > -     else
>> > -             iounmap(drvdata->fb_virt);
>> >
>> >       /* Turn off the display */
>> >       xilinx_fb_out32(drvdata, REG_CTRL, 0);
>> > @@ -386,8 +392,6 @@ static void xilinxfb_release(struct device *dev)
>> >       if (drvdata->fb_alloced)
>> >               dma_free_coherent(dev, PAGE_ALIGN(drvdata->info.fix.smem=
_len),
>> >                                 drvdata->fb_virt, drvdata->fb_phys);
>> > -     else
>> > -             iounmap(drvdata->fb_virt);
>> >
>> >       /* Turn off the display */
>> >       xilinx_fb_out32(drvdata, REG_CTRL, 0);
>>
