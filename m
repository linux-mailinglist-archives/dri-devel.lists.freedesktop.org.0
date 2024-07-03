Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3692650B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BAB10E977;
	Wed,  3 Jul 2024 15:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="USk2/5lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E9E10E977
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:38:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2C3962344;
 Wed,  3 Jul 2024 15:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63660C32781;
 Wed,  3 Jul 2024 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720021116;
 bh=IUGlUTqqMt36lhKlUUU0HiC749ze4B7y+O/XaXPqxNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USk2/5lmfMLCZ2yyGOjcbK16lGP4IC521UCNwrSz2FxTPZEjxz0PzN/RChvVCuHnZ
 tMfm9YA5LNyCDfoKddznIGNxOKgDUkSeJuDb8LLFxmcdTsyuwxSThOXUua59juAPSo
 IEae4duFuB8IB6KOgRC7X2RddGP082B8EnTIEvIGnqFRJObs578WNnBTaHA/U/5gFN
 PSg/sZw996zMuNG0uQyqfq9sGjlxToKSdUxwyUfuXFyNABJ8IUGwO9ZCBi+jz1u8E1
 xa6NdOPOZHybO1oVNR40sCgru51dtM3sL5Cr+RlAaWzEELbY9RQH2cXTR+QD/bsLWV
 +vhh9z9uGV6kg==
Date: Wed, 3 Jul 2024 16:38:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: correct Anbernic
 RG35XX panel example
Message-ID: <20240703-cataract-suitor-f930bcc83aa8@spud>
References: <20240703103710.31169-1-ryan@testtoast.com>
 <20240703103710.31169-4-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DqxTy8vnaiFFu2zC"
Content-Disposition: inline
In-Reply-To: <20240703103710.31169-4-ryan@testtoast.com>
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


--DqxTy8vnaiFFu2zC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 10:31:46PM +1200, Ryan Walklin wrote:
> make dt_bindings_check reports that sck-gpios and num-chipselects are
> required for spi nodes, therefore add these to the example.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

I forgot to reply to, or somehow didn't notice your reply to my comments
on this patch. I would just drop this change as I think it's a tooling
issue. I checked the version of dt-schema etc that I have here locally
and there were no complaints with the binding prior to your patches.

Sorry for missing your reply,
Conor.

> ---
>  .../bindings/display/panel/anbernic,wl-355608-a8.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,wl-=
355608-a8.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,w=
l-355608-a8.yaml
> index dde3600f0189c..bbe016453c9b2 100644
> --- a/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-=
a8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-=
a8.yaml
> @@ -40,6 +40,9 @@ examples:
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> =20
> +        sck-gpios =3D <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
> +        num-chipselects =3D <1>;
> +
>          panel@0 {
>              compatible =3D "anbernic,wl-355608-a8";
>              reg =3D <0>;
> --=20
> 2.45.2
>=20

--DqxTy8vnaiFFu2zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVwdwAKCRB4tDGHoIJi
0oCgAQCzrSTM8OPo0HV+21dnRdqoWFh1d6zw3BEtHr20zqHtKwD/a4e438/Ioc+W
GqRDr7AcM9XI9VTnTCsC2ozY7og6aws=
=TfRi
-----END PGP SIGNATURE-----

--DqxTy8vnaiFFu2zC--
