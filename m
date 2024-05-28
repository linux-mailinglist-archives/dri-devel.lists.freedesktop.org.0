Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBC8D1F65
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307221122DD;
	Tue, 28 May 2024 15:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iZk0rrbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3563C1122DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:00:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24F96CE12E4;
 Tue, 28 May 2024 15:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3868C3277B;
 Tue, 28 May 2024 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716908445;
 bh=sX6wzAUSMEhtMUKCcCMwDsLeJBXgG/h6JdPOcH0zBOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iZk0rrbkcR6SlmZYmL1ZhTZ5I2x3VGapzHDW8/6DZvdBVfn4BadZGiN3dktPzJSCI
 kcwrzrlXbXttqUJGncV89791OAlC8LG5potYO4t8dBhQoorNaVzefDVsRanNsJ9RxP
 Ykfw6iIEt6GwGYsJpBbADjaxn0u90JG6+l2MXFadBAJX57eV+ysyHY5x/NAxx3qcnz
 2F2TdqeUXZ5bjessaGLLNJPd4/eTJCBcnotITekPcRjbGNpg83vz9geP1Hh6YXSKZq
 yq3SQxw/Z2fizgRcxIMr7RMmd1fvbz2Fn8HqKx3l+ptE7TYPQ2Sg5Q82WC3L0A7HK0
 Xt3XvI/1zVhUA==
Date: Tue, 28 May 2024 17:00:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnaud Vrac <avrac@freebox.fr>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <20240528-placid-eccentric-axolotl-cc9fdc@houat>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
 <20240528-prophetic-masterful-hyrax-563f82@houat>
 <3tiuyvc2bg3d3wz3eqrou3ngkpb3h5gamtocv74bfkkqty4qag@it5publzvl5z>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zd4whrcixumyw3dz"
Content-Disposition: inline
In-Reply-To: <3tiuyvc2bg3d3wz3eqrou3ngkpb3h5gamtocv74bfkkqty4qag@it5publzvl5z>
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


--zd4whrcixumyw3dz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 04:50:10PM GMT, Dmitry Baryshkov wrote:
> On Tue, May 28, 2024 at 11:17:56AM +0200, Maxime Ripard wrote:
> > On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
> > > On 28/05/2024 09:43, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> > > > > From: Arnaud Vrac <avrac@freebox.fr>
> > > > >=20
> > > > > The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver suppo=
rting
> > > > > DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> > > > >=20
> > > > > Since it's an I2C-programmable bridge, it could have a proper dri=
ver,
> > > > > but the default settings work fine, thus simple bridge is suffici=
ent.
> > > >=20
> > > > No it doesn't. That bridge supports HDMI 2.0 which means you'll nee=
d to
> > > > change the TMDS clock ratio when programming a TMDS character rate
> > > > higher than 340MHz. And you'll need hotplug support to deal with it
> > > > properly too.
> > > >=20
> > > > So sorry, you need a real driver there.
> > >=20
> > > Hello, this is an HDMI redriver, which simply cleans up the HDMI
> > > signal, so no programming is needed to support HDMI 2.0.
> >=20
> > I mean, if I'm to trust the datasheet, it is more complicated than that.
> > It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
> > sent on its input side, but that wouldn't happen with DP for example.
>=20
> If I understand correctly, this chip can work in two modes: dummy and
> I2C-programmed. In the former case it is fully transparent, including
> HPD passthrough, it doesn't require any additional programming, just
> Vcc, Vdd and pin straps, etc.  And the second mode is a 'brainy' one,
> when the chip is fully controlled over I2C.

Right, and like I said, the situation is more complicated than "it just
does passthrough" like simple-bridge does.

> From the Linux standpoint these two modes will use single compat string,
> but two distinct drivers: for the former mode is is enough to use
> simple-bridge (fixed to support two supplies), while the latter one
> needs a proper I2C driver.
>=20
> Does that solve your concern?

We need to be careful here: if there's two drivers with the same
compatible and bus, both will be probed. So we need to take it into
account when designing the binding.

Maxime

--zd4whrcixumyw3dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlXxlAAKCRAnX84Zoj2+
dmBQAYDLRairXfvl50HQfMZ0MQqwSkyArWU/BlsE9M+UkUNa0RpDbW8DkxqdRPyE
cpQKCaEBfjDKBRFAGSthNvbSKMTP2bSosWTBrQCeB41YlcXUtKWc5+v5AGLKidz8
ORE16/s8rw==
=iRKL
-----END PGP SIGNATURE-----

--zd4whrcixumyw3dz--
