Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02146D9B83
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D503210E123;
	Thu,  6 Apr 2023 15:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0546810E123
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:01:43 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a44so22332432ljr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680793301;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvyqHyK95ToY0CfCOKPkl2MVwFdxvU7YS4EHaygIWl0=;
 b=LCbaRmloHSHAD/h81UtwUssE8Se57K0bDLQs7T5srtMcmjwAGODGPh8aw8OLMn9Tro
 WAbZ0x2a3eqLXZtXLmd/Vkj/5ASPVycWjlkNAx+LxMvC7H07yWfG3gVpJncCxwykEtoO
 IX3wHz3jzDXjdfmLRHNY9vDuQiDicSaYv78FECx/4ULgII2ouCOzsGmdKg/ha5pNpJR4
 /tzdVUnm4G/aWs0C8jrEG2O/svCJ7hgfDX/jEA+f6OXvK3qh72ccj2+/Ij1qrzAUFYF0
 H1zna86E7RCimpDF7H90sur4evVEYWx5eoVqAQPzwBsiN1nBuzveaEPqLrawcgVKDcya
 p8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680793301;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XvyqHyK95ToY0CfCOKPkl2MVwFdxvU7YS4EHaygIWl0=;
 b=3higdYPEFo5CvqrGQRQRbvewg8foycj0R/VP4Ca/zk7V0IrRg6WWTvTASdz2Vz48cT
 HdLFwpNbTzhPBD7NH1FpzFs3AyST/huNNYjy7htKfe6aFsAHZIBx3kJ3J4PB01fvFN7z
 G5fEMSUqnQjWW3IpsZ77rmIPH1Zulwm8rLp8dDFfU9byrIW7eGkJgarcrUAWYFdvkZVY
 /fLeI5B2sw9zFCCjp7yqW6nmFnJ2NVT8hKShGGkz0gst2RST75b1hkjaHxNvxAO+TQck
 ReXgL5nXbZuWxjlCldSTMs5NmTH9NH8Z9IZYi/ixdNq4cBlbAUth1a65r7MrT6Iut3+L
 fwzg==
X-Gm-Message-State: AAQBX9cFBtYGOZBIv0VJPi3dE0UKVgTEQHeoO3RbN7zwPFpc3FjwwFfr
 J9X5ScBZfJyNyn9jHypfe0VhKBHkUYc=
X-Google-Smtp-Source: AKy350Y7FRkZZqVVQwqdiTdp5Kg4L9sbe8C6Qb9PpCN78/OhuU4h+BPwZKk94vBlu6oFRAj01XUXbg==
X-Received: by 2002:a17:906:74d9:b0:92f:924b:e8f4 with SMTP id
 z25-20020a17090674d900b0092f924be8f4mr7720409ejl.4.1680793289393; 
 Thu, 06 Apr 2023 08:01:29 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ww7-20020a170907084700b00947a40ded80sm916152ejb.104.2023.04.06.08.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:01:26 -0700 (PDT)
Date: Thu, 6 Apr 2023 17:01:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.4-rc1
Message-ID: <ZC7exbolgfqCEB1V@orome>
References: <20230406121404.967704-1-thierry.reding@gmail.com>
 <ZC7EnnQZ0LBpC/cV@phenom.ffwll.local>
 <561c74a9-8fdf-568f-f5f2-d0c80d651ce0@kapsi.fi>
 <ZC7PPvFL/rKwhakQ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dJDy93k115q6UTp/"
Content-Disposition: inline
In-Reply-To: <ZC7PPvFL/rKwhakQ@phenom.ffwll.local>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dJDy93k115q6UTp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 03:55:10PM +0200, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 04:18:46PM +0300, Mikko Perttunen wrote:
> > On 4/6/23 16:09, Daniel Vetter wrote:
> > > On Thu, Apr 06, 2023 at 02:14:04PM +0200, Thierry Reding wrote:
> > > > Hi Dave, Daniel,
> > > >=20
> > > > The following changes since commit e8d018dd0257f744ca50a729e3d042cf=
2ec9da65:
> > > >=20
> > > >    Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)
> > > >=20
> > > > are available in the Git repository at:
> > > >=20
> > > >    https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-=
6.4-rc1
> > > >=20
> > > > for you to fetch changes up to 2429b3c529da29d4277d519bd66d034842dc=
d70c:
> > > >=20
> > > >    drm/tegra: Avoid potential 32-bit integer overflow (2023-04-06 1=
4:02:33 +0200)
> > > >=20
> > > > Thanks,
> > > > Thierry
> > > >=20
> > > > ----------------------------------------------------------------
> > > > drm/tegra: Changes for v6.4-rc1
> > > >=20
> > > > The majority of this is minor cleanups and fixes. Other than those,=
 this
> > > > contains Uwe's conversion to the new driver remove callback and Tho=
mas'
> > > > fbdev DRM client conversion. The driver can now also be built on ot=
her
> > > > architectures to easy compile coverage.
> > >=20
> > > Neat cleanup on top might be too look at the generic fbdev stuff, jus=
t as
> > > an idea.
> > >=20
> > > > Finally, this adds Mikko as a second maintainer for the driver. As a
> > > > next step we also want Tegra DRM to move into drm-misc to streamlin=
e the
> > > > maintenance process.
> > >=20
> > > Amusingly the one patch that dim flagged as lacking a 2nd set of eyes=
 (no
> > > a-b/rb or committer!=3Dauthor) is the MAINTAINERS patch, would have b=
een
> > > good to record Mikko's ack for getting volunteered :-)
> >=20
> > Haha, admittedly I was a bit surprised to see myself being added to
> > MAINTAINERS so quickly after talking about it with Thierry; but yes, I
> > submit myself to the duty :)
>=20
> Thanks for confirming! :-)

I guess I tried to rush it so that Mikko wouldn't get cold feet. =3DP

Thierry

--dJDy93k115q6UTp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQu3sUACgkQ3SOs138+
s6GlCA/+Ofq++2mtKjBwi8X3f2KO4igoWaK4QH6TdaYkoQRg06oH5b29qeTN47CA
FGvlMOvlVDaQbFWp4LVnpbFcQamUaQ/3Jby0Lj4xPnow3TLuJS7XoIC4y0SaidsQ
A3/TXuCbklLy7D2qvs7giGyEZcwg3pNxrEf1LEegta3CID0SVV5sO/SFOARFR5JB
vLITy2Gh77ODQ5uB377fBB2nM4KNEe41MQywfhC4ePGWGD+A6JIpY1udyoUTPnSm
EGNPcig+PbAb/pTkfnnvW3QT1FvVywxt4FUHMH1kii3H7E+wJmk0nBFfn5bpCYKa
G9xWL7nnCczLXnS9P5jnu+hpz1FOpm2alj3fpl0fYc6uelsvgBHN15YPWghbhhX9
8Us5h3gZ/iIVw5KdumEO9NpO6v8izKBLNkUBYUs3LxPFAN2mCZa30WQ4DWrv4CVQ
t3XnGSB0vcLRKFMVTLQ/HuRJivVgo9VgjQ8GkPkuk62bhNleABUktHGSwTOR4zkI
nsjTw1K5fcTjjp4TdcG84kC5xg3u9p6GlgS2HlMlelEZ1AWvYhnIjhKeXzAZO5sE
piZWXPIgWXLx9pjS8AjH378ObAH79tR2zIAHilQZ1AzfsP0vF2OjFhrlo2IWDO91
A1DOIJWBpF7HB/Q0NyG50GSUWIT6In9QrGAhF5Qk15bRfm5QShM=
=KD58
-----END PGP SIGNATURE-----

--dJDy93k115q6UTp/--
