Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC68FE549
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF0D10E8ED;
	Thu,  6 Jun 2024 11:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bHjCTexM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3210E908
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:24:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4FED61A94;
 Thu,  6 Jun 2024 11:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0ABC3277B;
 Thu,  6 Jun 2024 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717673076;
 bh=EprWFy3aYUojw4OTl8/VwOUOB5Tyzhr6DTqvYaeWGjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHjCTexMgqLG0q0NJRNeShSQmav2UtEpe925GMyn/H2y6borAA4EnJ2KSPXwrMMoe
 IhCKaZAToEAOaZPKPL6e5yKV9xd/HeHxAX80BqtOm9PMJa5PxPO2PoNSw+enhvoTta
 YKWCKmUwGeLQ1yB7FywnaE7oXZXiO9b3lVGuG94DVknvDG+bmH/QO2RrhdH+AUyeJ+
 zEqzvh+yEehEYBv/UIM4RjFGJ96FF/iVqxaIpsJRU1Fl5NJl43290j8y6mASzk/yeo
 V3qhyQPH25Vmxz0kLRu7InFF58QW2OObaL/GxYboxvZTo+lS2oWsceKj0QUz0hkXqs
 kD+awhUitceog==
Date: Thu, 6 Jun 2024 13:24:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 John Watts <contact@jookia.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240606-smooth-industrious-cormorant-27a076@houat>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <7d9492ba-5285-471a-9ce7-c2148a388b41@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bvohql5n7i5suwn4"
Content-Disposition: inline
In-Reply-To: <7d9492ba-5285-471a-9ce7-c2148a388b41@app.fastmail.com>
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


--bvohql5n7i5suwn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 09:48:54PM GMT, Ryan Walklin wrote:
> On Thu, 6 Jun 2024, at 9:32 PM, Maxime Ripard wrote:
> Hi Maxime, thanks for reviewing.
>=20
> > Where has this consensus been found?
>=20
> As Neil notes Conor suggested it [1], and we did consider Hironori's
> suggestion [2] of using anbernic as the vendor prefix, although my
> (not strong) feeling at the time was because Anbernic is not the panel
> vendor, just integrating an unknown OEM's panel into their devices, so
> at the time I fit was not quite accurate to say Anbernic was the
> vendor.
>=20
> Some discussion was also had on IRC at #linux-sunxi [3]. Admittedly
> not a *broad* consensus, but all offered opinions were taken and the
> patch was accepted subsequently.

Respectfully, #linux-sunxi isn't the persons you should be discussing
this with.

Maxime

--bvohql5n7i5suwn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGccQAKCRAnX84Zoj2+
dl+VAX9eg/E0P6Bb9OoWI6pbYAccX0gP/c7q9X4FwvFkKKUQ68EQQl/RfsEFOJqQ
rop/JjYBgNrgCOiAuVSEtgL4WDHKYTVmXiNTWzi7dtKVe/mbsj7ugeX51wEQONR7
XCaMzwMaCA==
=23AD
-----END PGP SIGNATURE-----

--bvohql5n7i5suwn4--
