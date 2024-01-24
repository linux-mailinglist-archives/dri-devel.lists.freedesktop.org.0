Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8183A65E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 11:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F410E52A;
	Wed, 24 Jan 2024 10:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509AA10E52A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 10:07:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E97426201E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 10:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CCDC43390
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706090811;
 bh=F/M2eWPRFVw1HXw2zrOFjUIQimflTFAcAcn/RXqu+Ko=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pmqZAUwo8eqL1vZSQ6bTmeYilZ8WgJbM66Yh8lA8wkNuyOA7fqeaW6qAMqkYGHbUN
 /OKGZZdsDLylUjg+tq9O7qXwntOJZPWLEYft93rYanbSKpz2yrl6N9xAsI/V5EcEnt
 lLi3man0xlYmbWr4Mq4ASRtbNT8S+7SoNic4sptQmi27oWQ/Q07ChH2srBIFMPyQER
 WS/DVLaxdd17mfTKLoCrMndbmziIqqrrNafRT0GKlIOjYwNjrOmJziMwSKEJ9vRAxF
 /O2kekA0Bc0Cjn4NjzzgqocrvmdQZbxtVOkw5MaPnYrcgv2ym7nsBnNt/ja/xRD3+E
 xr1uHS/PjoQkg==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51005675963so2697081e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:06:51 -0800 (PST)
X-Gm-Message-State: AOJu0Yx0d0NrRxY2X64vnXvYBE/HqlidzHC4KsWbRiA/CHbKYbXEejbZ
 79mT45ELaMEqM76stbRtjMn8KOr9ONnk05WgVtJbBwLxhk04aQCP/9eJlUqEnVmf4UZYkKrQ64p
 h+nmVYZ0zwg6tW0ljaVn6Pk66sC0=
X-Google-Smtp-Source: AGHT+IEOaiBbgCP+qJ5HpP+RSrqTriJw2MUXxhXNGwIo+AVoZkWDDtrmKW1AB9/8s5dLmoiHYGiu8Ykn5f7PuGd29+s=
X-Received: by 2002:a05:6512:b02:b0:50e:7fe3:f59d with SMTP id
 w2-20020a0565120b0200b0050e7fe3f59dmr3026988lfu.106.1706090809830; Wed, 24
 Jan 2024 02:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
In-Reply-To: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Jan 2024 18:06:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7U39cjtDQvvxGEL+yh3sr+pJ6YaiOhXEao9fwr44wPGw@mail.gmail.com>
Message-ID: <CAAhV-H7U39cjtDQvvxGEL+yh3sr+pJ6YaiOhXEao9fwr44wPGw@mail.gmail.com>
Subject: Re: drm/loongson: Error out if no VRAM detected
To: Sui JIngfeng <sui.jingfeng@linux.dev>
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jingfeng,

On Sat, Jan 20, 2024 at 12:19=E2=80=AFAM Sui JIngfeng <sui.jingfeng@linux.d=
ev> wrote:
>
> Hi,
>
> Thanks a lot for contribution.
>
> On 2024/1/19 18:40, Huacai Chen wrote:
> > If there is no VRAM (it is true if there is a discreted card),
>
>
> Why the dedicated VRAM is gone whenthere is a discrete card?
>
> As far as I know, this is only possible on Loongson 3C5000 + aspeed BMC
> server hardware platform where the dedicated VRAM chip of Loongson
> Graphics is NOT soldered on the motherboard. Probably for cost reason,
> but then, the platform BIOS(either UEFI or PMON) should turn off the
> Loongson integrated graphics.
>
> Because without dedicated VRAM, this driver can not work correctly. Or ca=
rve out
> part of system RAM as VRAM, and write the base address and size to the BA=
R 2 of
> the GPU PCI device.
> This is NOT true  for Loongson 3A5000/3A6000  desktop hardware, because I=
 have do
> a lot test on various platform[1] before this driver was merged. It never=
 happens
> on a sane hardware configuration. Please update the commit message and li=
mit the
> scope.
I will update in V2.

>
> [1] https://github.com/loongson-gfx/loongson_boards
>
> > we get
> > such an error and Xorg fails to start:
>
>
> Yeah, If there is no dedicated VRAM, the driver can't allocate memory for=
 framebuffer.
> But this is probably more about the hardware configuration issue, not a d=
river issue.
I agree, but it seems we need a workaround in the driver because there
are already many machines with ill firmware.

>
>
> > [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> >
> > So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is les=
s
> > than 1MB which is also an unusable case) detected.
>
>
> This is not expected, if you want this driver be there and run normally.
> You should guarantee that there have at least 64MiB dedicated VRAM.
I think this depends on the resolution, I choose 1MB here only because
the driver's debug info prints 0MB if VRAM is less than 1MB.

Huacai

>
> I'm OK if this patch is strongly requested, but this is a kind of error h=
andling.
> Please give more details about the hardware in using and explain why ther=
e is no
> dedicated VRAM available for your hardware.
>
>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loon=
gson/lsdc_drv.c
> > index 89ccc0c43169..d8ff60b46abe 100644
> > --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> > +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> > @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_devi=
ce *ldev,
> >       drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
> >                (u64)base, (u32)(size >> 20));
> >
> > -     return 0;
> > +     return (size > SZ_1M) ? 0 : -ENODEV;
> >   }
> >
> >   static struct lsdc_device *
