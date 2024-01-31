Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB59844481
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C88E10ECBF;
	Wed, 31 Jan 2024 16:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7E10ECBF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:31:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8E490CE16C5;
 Wed, 31 Jan 2024 16:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1BEC433C7;
 Wed, 31 Jan 2024 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706718652;
 bh=jV+IW1BRHUg+D+REntsLJtRkUxqONiKUmtqDsV82itI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udG2ZcRDmMPjbK6aF+4k7fsWHwlpGxyg8XCxDbLkppGdsq6L73vhfSAYtMyv4wK6H
 IYkOX8GbR9Mm0ccp4sIcyKJzgdetiCpZ/Z2qrVrvhSBxihAI1IJ7T0cZIX/k+Bs2Yf
 Avm64pVoXKnvHC6NT3YcaUAfhj6DkPmYYt4zR/D3jgBMlB9r86XcS/7T75NP86FSRy
 tAhMSWdH528agAjz7fh/aVEVoAVzqx5x/+cU048NmS9NZSgOzWOLX3Evk2rr0S8uQs
 4AzUMKoulmjNSNkA08hpSTv7lQGII9EXVs4w7dVCIZ1gMPxSkaO6KLlfRgDLfV8FZF
 f0rEik7hgaleA==
Date: Wed, 31 Jan 2024 17:30:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <e2spje6iew6skzrhrcgr23g4dc7l7rjoq77ki6oupqborfl22b@owmd2sdzcdaj>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
 <NTZPR01MB1050AC99C38D2136D0354F3DEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xv7z5ay3ishmxaq2"
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050AC99C38D2136D0354F3DEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xv7z5ay3ishmxaq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 08:57:21AM +0000, Keith Zhao wrote:
> > > +static const struct vs_dc_info dc8200_info =3D {
> > > +	.name			=3D "DC8200",
> > > +	.panel_num		=3D 2,
> > > +	.plane_num		=3D 8,
> > > +	.planes			=3D dc_hw_planes_rev0,
> > > +	.layer_num		=3D 6,
> > > +	.max_bpc		=3D 10,
> > > +	.color_formats		=3D DRM_COLOR_FORMAT_RGB444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR422 |
> > > +				  DRM_COLOR_FORMAT_YCBCR420,
> > > +	.gamma_size		=3D GAMMA_EX_SIZE,
> > > +	.gamma_bits		=3D 12,
> > > +	.pitch_alignment	=3D 128,
> > > +	.pipe_sync		=3D false,
> > > +	.background		=3D true,
> > > +	.panel_sync		=3D true,
> > > +	.cap_dec		=3D true,
> > > +};
> >=20
> > I really think that entire thing is to workaround a suboptimal device t=
ree binding.
> > You should have two CRTCs in the device tree, you'll probe twice, and y=
ou won't
> > get to do that whole dance.
> >=20
> Hi Maxime:
> I tried to modify it according to this idea Found it too difficult In ter=
ms of hardware,=20
> the two crtc designs are too close to separate, and they are even designe=
d into the same reg with different bits representing crtc0 and crtc1.
> It seems not easy to described the 2 ctrc hardware by 2 device nodes
>=20
> The idea is to avoid a whole dance
> I don't know if I understand correctly about whole dance.
> Is it means I create 2 ctrc and 8 plane in the dc_bind?

It looks like you just sent the same mail?

Maxime

--xv7z5ay3ishmxaq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbp1uQAKCRDj7w1vZxhR
xTVnAQCPu+rxm42307fHf03GbrgNfJK7FjrljEfpxkkKMR2KHgD/TaZnj2hQnMsv
I3q4pY+SX55x7qpgGeeIIDvyLXESOQE=
=S6wD
-----END PGP SIGNATURE-----

--xv7z5ay3ishmxaq2--
