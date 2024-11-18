Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124179D1470
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A410E510;
	Mon, 18 Nov 2024 15:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4yTGIW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4F510E510;
 Mon, 18 Nov 2024 15:26:30 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7ea535890e0so686439a12.2; 
 Mon, 18 Nov 2024 07:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731943590; x=1732548390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxLNPkkdLQbSGAjECvY64z6azuuyEaYCFq24xqUSCNA=;
 b=G4yTGIW7v+OH+AsmLP+wEMHvXvOGqJTK7MKrIyrDBPDUIPd52ytBg1SbVe6PA1A4ZX
 krAvqudX7Zqpax5yLLua2ic7Vr0s0J7agE4EXIw1qJ8o/762rd85Tsxnmi2HZ2lfTXqw
 POgSFKuY6U0kgltK9iTgaVKb4Og2UjutXrmsv5SLE7la+CSgfR9ahZzG867CHXhOnBix
 jGpf6VBbJZNGBISXA0y/jPIl0bnm9sri3Dc25gPRYREJUdPE3KnrgyWgujfp5XmIu/oU
 ecllZQUis6eWdRl17yzcgHo74RQtJfFe3sN5dRjoet6k2A1wtQZZTjy9hcPNBnKUdHxO
 41qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731943590; x=1732548390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxLNPkkdLQbSGAjECvY64z6azuuyEaYCFq24xqUSCNA=;
 b=P+6v2WxEN3ixt6214N7GQvgfiLdxGjFlSUhYu0VaB/vdxPK1zvwAJLUZDtnPhP5ag5
 RR2targ9b2b+UUXl1d5D7byx5IuB/2rg/xQL9l3MU2m3ppoBAxhq2emCBfyc81Yr3Vwg
 6ikYFYVjuPdYVv3Ku2pDrvRFMkAmllMukDyHdVA5bfGRbQGot12KxQrvfWjZix+hFBaK
 syN6ypLpBCtwp2LzluvP/Uxo2pFnB1KjEehcKWMtUEvtbYMCu1uvvwMTrXtcJ04L5XGV
 DTS2yWCgu5lh544GF9ljLCgoA4/vPXNGnJiKLF9gLLSwJ6V/BBDurrK97CqizsBQDb6l
 z8BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUooGwC2tq696h6HhC4mQFQsBibX5HYN+XnrQSJwNmj3nsepIdix3JBksMb8gffDx2bs6xdOIF3@lists.freedesktop.org,
 AJvYcCVwOhsrrL93pnkb9BdoEtWhVmvhbUJUplvp4EZkE+9eKi4v+xetBf7+v/ZDg5xywB3YsiAhmfq68+Dq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpJN8kcFhhLeqXCXymoAOChMfUSVHnPRPBr9e8GY7OXCYkMxvE
 WVfAHIJVTZBKKSuAqeMkS3Bg4IBmzvJzvRYdZfwCYJ0Q1+B/YM81+IGBeZzGbuRcgjuzhrjypS3
 ACrM6hPZnTTvQI5RrZvS0vURnjkM=
X-Google-Smtp-Source: AGHT+IHk+nsIvISW+3hBwejGBc/PZwCBrs22kLEHGbh9RYjj0wMdgfHvqHkteLWeoPI3OUMObMfh4V2KUB4Wd4l6Ndo=
X-Received: by 2002:a17:90b:5187:b0:2ea:3ab5:cb83 with SMTP id
 98e67ed59e1d1-2ea3ab5cee6mr4404015a91.9.1731943589858; Mon, 18 Nov 2024
 07:26:29 -0800 (PST)
MIME-Version: 1.0
References: <039846c0278276e7c652395730f36051216fd4c3.1731691556.git.christophe.jaillet@wanadoo.fr>
 <acd637f7-a1ce-443b-8d05-d285c28cea7d@amd.com>
In-Reply-To: <acd637f7-a1ce-443b-8d05-d285c28cea7d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2024 10:26:18 -0500
Message-ID: <CADnq5_NLObja=ctv60w3uhx1yf-bZTUhR2VvtT=aUkaG4SXOUg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Constify struct pci_device_id
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux@weissschuh.net,
 broonie@kernel.org, 
 lee@kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Applied.  Thanks!

Alex

On Mon, Nov 18, 2024 at 6:25=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.11.24 um 18:26 schrieb Christophe JAILLET:
> > 'struct pci_device_id' is not modified in this driver.
> >
> > Constifying this structure moves some data to a read-only section, so
> > increase overall security.
> >
> > On a x86_64, with allmodconfig:
> > Before:
> > =3D=3D=3D=3D=3D=3D
> >     text         data     bss     dec     hex filename
> >    11984        28672      44   40700    9efc drivers/gpu/drm/radeon/ra=
deon_drv.o
> >
> > After:
> > =3D=3D=3D=3D=3D
> >     text         data     bss     dec     hex filename
> >    40000          664      44   40708    9f04 drivers/gpu/drm/radeon/ra=
deon_drv.o
>
> Mhm that's a bit more than "some data" :)
>
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Compile tested-only.
> > ---
> >   drivers/gpu/drm/radeon/radeon_drv.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
> > index 23d6d1a2586d..5e958cc223f4 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.c
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> > @@ -248,10 +248,9 @@ int radeon_cik_support =3D 1;
> >   MODULE_PARM_DESC(cik_support, "CIK support (1 =3D enabled (default), =
0 =3D disabled)");
> >   module_param_named(cik_support, radeon_cik_support, int, 0444);
> >
> > -static struct pci_device_id pciidlist[] =3D {
> > +static const struct pci_device_id pciidlist[] =3D {
> >       radeon_PCI_IDS
> >   };
> > -
> >   MODULE_DEVICE_TABLE(pci, pciidlist);
> >
> >   static const struct drm_driver kms_driver;
>
