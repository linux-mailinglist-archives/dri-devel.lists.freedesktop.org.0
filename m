Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACF89C7B2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80D91126B7;
	Mon,  8 Apr 2024 15:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lnwO/Skq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B81126B7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:01:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a51a1c8d931so377704666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712588499; x=1713193299; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PRN1sELqu0ogiTDUrC+ULOZosF4sbROYULaypNrLxRE=;
 b=lnwO/Skq6USZddTCuuelPB1z96xaoQrmSUEB832rgHOkrmf29oOiIyvErJN/jNKXwn
 nFg+Ob/s8wlwz1rerUvXlI+GkD89E6tTU+0InrIW8bUIskA3LYX8h6MCViuYDuB1UEc5
 zTSZq8WbM/h3lc/zAz524i+TeY7eoaBd16Ur4BMgnF4WSSjyzre5b7ilMviyLeUI0Jli
 8fAAx0cimKRITGVFu9MQF4TM42PZzoNsNuqGv/jxSalqIahbXouYOv5+c6pCXoOYDtFb
 HjXPNnQuhA8ZFCDmSuFBxqPJZHtfltpZ3Ivknd15Q44PoqD6mdDa2faBdH+N0Q915/eW
 YpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712588499; x=1713193299;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRN1sELqu0ogiTDUrC+ULOZosF4sbROYULaypNrLxRE=;
 b=Eur8RhkTBgWi2Z+e+x002fMRjdiWyM8eoYAJff1/GzNKOXwDdVgSIyOxfPO4NODiZE
 NWRPJIe81y5uCSifrFq9/MpvU6E7vRI/e7p/v8If8EuJI9e/TLnC0Q0ip0b6jN3Wp0kb
 Wjp0CvMCdBj6OqXkZSAKOQCF8sZiDNUlM6MZ9AtAHE6MyIb7AlqdVg5O+KfRaPcVlxIO
 ed9X+2q2BBMXw0Omt2VEVu/789UqfuuiZcWLvhkTyFhtQqJXh90ZvbRijKh0jjhiAsB3
 Oc2oVr3hsFsrVCwXGqNJeidhbh53b3ZM+IfOTnuU/yZ7pjsQ3kgkcI1tyoMSo5Vo2aG1
 ss/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvGU4q/pyj0Z8ATb4htQSmipfBxhaSUeQ2zpgLTag/Zer0JbfvtumDK+165q12pYshKlFzPiybWEIoTW+gbqx6jWKLySt4qRloOf86MnqI
X-Gm-Message-State: AOJu0YzEvi918tcwDyMcupWm39SaRX7P/pftI/pEVVlcXdLReUtZPs6V
 gmRQvO5TDnZIEQpLvQIp3olm4+ctHs5TR+tl0xFW0lO9TNnWez+q
X-Google-Smtp-Source: AGHT+IFwYnWXgAf/PUSsxKAWo8N9fb0i5uBvSP+a6/cyOg6oSHtufOrwyScmxnUsaq5JkB2TN3vnaQ==
X-Received: by 2002:a17:906:4550:b0:a51:c52d:e530 with SMTP id
 s16-20020a170906455000b00a51c52de530mr3121905ejq.34.1712588481286; 
 Mon, 08 Apr 2024 08:01:21 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 dr20-20020a170907721400b00a518c69c4e3sm4513886ejc.23.2024.04.08.08.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 08:01:20 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Mon, 08 Apr 2024 17:01:20 +0200
Message-Id: <D0ETY6KYVYO6.1L2QGS0QIE77O@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240314154943.2487549-1-thierry.reding@gmail.com>
 <4ffa428a-e6cf-4716-ad7b-02c126d66772@nvidia.com>
 <73a71381-7c8c-4d0f-9fa4-3d9511c9bfbe@nvidia.com>
In-Reply-To: <73a71381-7c8c-4d0f-9fa4-3d9511c9bfbe@nvidia.com>
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

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Apr 3, 2024 at 12:07 PM CEST, Jon Hunter wrote:
> Hi Thierry,
>
> On 15/03/2024 11:25, Jon Hunter wrote:
> >=20
> > On 14/03/2024 15:49, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The host1x devices are virtual compound devices and do not perform DMA
> >> accesses themselves, so they do not need to be set up for DMA.
> >>
> >> Ideally we would also not need to set up DMA masks for the virtual
> >> devices, but we currently still need those for legacy support on old
> >> hardware.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> =C2=A0 drivers/gpu/host1x/bus.c | 8 --------
> >> =C2=A0 1 file changed, 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> >> index 783975d1384f..7c52757a89db 100644
> >> --- a/drivers/gpu/host1x/bus.c
> >> +++ b/drivers/gpu/host1x/bus.c
> >> @@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct=20
> >> device *dev,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >> =C2=A0 }
> >> -static int host1x_dma_configure(struct device *dev)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 return of_dma_configure(dev, dev->of_node, true);
> >> -}
> >> -
> >> =C2=A0 static const struct dev_pm_ops host1x_device_pm_ops =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .suspend =3D pm_generic_suspend,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .resume =3D pm_generic_resume,
> >> @@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "host1x",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .match =3D host1x_device_match,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uevent =3D host1x_device_uevent,
> >> -=C2=A0=C2=A0=C2=A0 .dma_configure =3D host1x_dma_configure,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D &host1x_device_pm_ops,
> >> =C2=A0 };
> >> @@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x=
,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.bus =3D &host1x_bus_type;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.parent =3D host1x->dev;
> >> -=C2=A0=C2=A0=C2=A0 of_dma_configure(&device->dev, host1x->dev->of_nod=
e, true);
> >> -
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.dma_parms =3D &device->dma_=
parms;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_set_max_seg_size(&device->dev, UINT=
_MAX);
> >=20
> >=20
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > Acked-by: Jon Hunter <jonathanh@nvidia.com>
>
>
> I don't see this in -next yet?
>
> Ideally, if we don't see any issues with this we should pull this into=20
> v6.8.y stable branch because I am now seeing the warning there. Should=20
> we apply a fixes tag to this?

I was finally able to run some finally tests on this and pushed it to
drm-misc-fixes, so it should go into linux-next and then Linus' tree
sometime soon.

I decided against adding a Fixes tag because it's difficult to backport
this all the way to the release which contains the commit that added
the issue. Adding a Fixes tag to the commit that ended up exposing the
issue didn't seem right either, so let's get this into mainline first
and then manually ask stable maintainers to pick this up.

Thierry

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYUBsAACgkQ3SOs138+
s6EmGQ//bjoMCxMd0pYChsgWJe8dvuK0jJFOJPxd7omZmt+XvFXkgFUgylUy9ZF7
S9kIppfWCKHNeKSS915ZRHYwiQh6H+8DuG7ow9DDfBa2Zrkx3AQxTPz4Q5qOaaw0
htNwKzKRWlEb2hvRhRDg2mbQVkKT/mTys64pGNieTXSsiGmN2SB9JpwAFDlKvc3i
38GShsmFLC1whXD40bOb5GAILWh9ZoJyUqDPOFwJ4vQHY4AhFkHJF9PijMNHbxIX
SExSbiuVIzvdLrIjIm3QDTn1bz+wMScGxBbYrTdEqelu3SwYJsxO3ZrxU1SkXWwD
7gg8UWuzWhn8bFyaP6WwpIkSmX/0EmWPyGspAzGZej2eJn+ifgaNKS4ENxH/Hb6l
Ta5X6KSiGjBeEzpsgAvKELat2NVrz00srK2WCGlVa86SWh4pUUVGSpjQMugDWfLT
UXwxxCySDHex8CQR3gjgAEN1CPnJyrT5UpSqIt3nTWQzLJNcPvzHdrAqxB2iZR1M
1K1DA6/FTr9L9yNTIW35L5jS9DKv0/WIZKpoONjHmWwsYxcFuADF2JxK2FpbKBKs
NLVFPn1KbppY4DNYDai/OCuJyOGb2tLvYDds2OdrkJiOGI4UddCkvZ4Hgg4xr7yk
XNrgILTMkyYT4NiSs8tKPp524RssiCLqzZb7acaO8a5FNk6qixk=
=Msdd
-----END PGP SIGNATURE-----

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f--
