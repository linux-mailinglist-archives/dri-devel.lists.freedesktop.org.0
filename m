Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C87A92741F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 12:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B95E10EA76;
	Thu,  4 Jul 2024 10:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="DgCVIFGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2027410EA76
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 10:34:33 +0000 (UTC)
X-Envelope-To: dri-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1720089270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WaeRZ2nOjo92gumscFG9YpVZTkXiyVaKUvdvkRECyMs=;
 b=DgCVIFGJBTAj+jAEd25PHvFZkbUs1LImkDzhrgReBtXijVUVkKPP1wnPw2V4WaUOujxKvu
 jJyvcjGiG7wvLqhry+l86pk0JW7Rh9tTmnqCZ9stUzB3kkBnqSTMEkcgT31X3WondIGuK+
 p0kxQBoVq3VXNRM74CpUq01obpMyoDsywt4GndWznVjvavjG1lDtEG/Zme0utAXrcRMLRj
 7UupdPzTKXI+xG/ed47jl9Gxmtq7x0KIS7cO4cntuC9vIIJ7+zog4SFdllKvn2FZgJJ17c
 9AhprNEbSOAXdN9LXFoOPFcnF/g/Jmpf3EO/Uieoogaqiix1nVJTqAcHclxVTA==
X-Envelope-To: s.hauer@pengutronix.de
X-Envelope-To: heiko@sntech.de
X-Envelope-To: knaerzche@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: kernel@pengutronix.de
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: benjamin.gaignard@collabora.com
X-Envelope-To: michael.riesch@wolfvision.net
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: pgwipeout@gmail.com
X-Envelope-To: s.hauer@pengutronix.de
X-Envelope-To: dmitry.osipenko@collabora.com
X-Envelope-To: dsimic@manjaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Alex Bee <knaerzche@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sandy Huang <hjc@rock-chips.com>, Peter Geis <pgwipeout@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH v11 09/24] drm/rockchip: dw_hdmi: add regulator support
Date: Thu, 04 Jul 2024 12:34:18 +0200
Message-ID: <17377562.Wbl12GSNyo@bagend>
Organization: Connecting Knowledge
In-Reply-To: <3615926.LM0AJKV5NW@diego>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <16078476.GIfNKF0EQE@bagend> <3615926.LM0AJKV5NW@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2562580.NADL9uRC7c";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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

--nextPart2562580.NADL9uRC7c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Thu, 04 Jul 2024 12:34:18 +0200
Message-ID: <17377562.Wbl12GSNyo@bagend>
Organization: Connecting Knowledge
In-Reply-To: <3615926.LM0AJKV5NW@diego>
MIME-Version: 1.0

On Thursday, 4 July 2024 12:00:43 CEST Heiko St=FCbner wrote:
> > Is it possible to probe for those avdd_0v9 and avdd_1v8 regulators only=
 on
> > devices that should have them?
> >=20
> > On a Rock64 (rk3328), but probably for all VOP1 devices, they're not
> > present and that results in the following warnings:
> > dwhdmi-rockchip ff3c0000.hdmi: supply avdd-0v9 not found, using dummy
> > regulator dwhdmi-rockchip ff3c0000.hdmi: supply avdd-1v8 not found, usi=
ng
> > dummy regulator
> counter-argument, why not define them in the dts?
> I.e. looking at the rock64 schematics, you want the dvideo_avdd_1v8 (from
> LDO1) and dvideo_avdd_1v0 (from LDO3) if I'm not mistaken. Why this stuff
> is called dvideo and not hdmi in there I have no clue ;-)

That appears to be a valid counter-argument ...

On donderdag 4 juli 2024 12:28:53 CEST Alex Bee wrote:
> Those regulators exist for _all_ RK SoCs that use dw-hdmi controller, as =
it
> has to be supplied in same why (as it is always the same controller). In
> particular case of rock64[0] its:
>=20
> DVIDEO_AVDD_1V8P6 -> VCC_18
> DVIDEO_AVDD_1V0M6 -> VDD_10
>=20
> So: Just fix the device tree and your warnings are gone :)
>=20
> [0] https://files.pine64.org/doc/rock64/ROCK64_Schematic_v2.0_20171019.pdf

=2E.. confirmed by Alex Bee.

I do wonder about 0.9V vs 1.0V, but I'll bug someone else about that ;-)

Cheers,
  Diederik
--nextPart2562580.NADL9uRC7c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZoZ6qgAKCRDXblvOeH7b
bvq+AP9nd2vWXEhpjpT5r1vm/NRY9bGkS/orX1vBaxZgGcwjmQEA9GlBCm3VIGIq
h8OWrwrSTdI76Uh1Eb98A1qx9ctzUAI=
=S12p
-----END PGP SIGNATURE-----

--nextPart2562580.NADL9uRC7c--



