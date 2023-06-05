Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39615722A47
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564A810E2D4;
	Mon,  5 Jun 2023 15:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EBE10E0A4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 15:08:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 635F861726;
 Mon,  5 Jun 2023 15:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EDBC433D2;
 Mon,  5 Jun 2023 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685977686;
 bh=TUnJ2BXVl10ANhL4RWDXm6wNiv5IcJXcwpqMUue5pMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lu1c1KUbihrACAZM1WwkhlEc2SjxpozUb7R3/hWKHvBodTdd+k0vJ5jHNVZXF7p1H
 QU3OOUHV5iizqplgo9tz1Dz35cYSjVLP3YTdvbq7Pte0BR42A9FB3izWmoLYQ/WPmU
 WaB8MfFZ8jnXjGki1AOPR3+JKf8zViE5lAmSX+qhF4uceYl5PPvtlxJ4GFihhnqNYV
 A8s2MnOm0bdNu9FSRpHmpRf8SyqX9fUOZco5cs8CuHHut1Xh2S+Q/TwxQmHfs6keLJ
 5nkpG3ii+iNTrkDUNsOEdLouO9FAzIZIPvbfSBuLV8yFpoL6E1hw6EdqkNin/Y8Hx5
 D7A9VBTkXHo3g==
Date: Mon, 5 Jun 2023 16:08:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Paulo Pavacic <pavacic.p@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add fannal,c3004
Message-ID: <20230605-untracked-trillion-d30cb9cb77c5@spud>
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <20230519142456.2588145-2-pavacic.p@gmail.com>
 <20230519-emerald-void-066fad80950a@spud>
 <CAO9szn2sYRezCUQKFZ_qsVfne0gpWoirZoE-HpWTPS4G1U5fNQ@mail.gmail.com>
 <20230605-handyman-rebound-0c10df9dfaf2@spud>
 <CAO9szn0crQzy0L2Y-NZGKEVbpspxZMkO0oPpYr1WMS081ZxKRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GT4Wjy9c0rngJLum"
Content-Disposition: inline
In-Reply-To: <CAO9szn0crQzy0L2Y-NZGKEVbpspxZMkO0oPpYr1WMS081ZxKRw@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GT4Wjy9c0rngJLum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 04:56:13PM +0200, Paulo Pavacic wrote:
> Hello Conor,
>=20
> pon, 5. lip 2023. u 16:43 Conor Dooley <conor@kernel.org> napisao je:


> Sorry this is my first patch, I still don't understand, why should I
> add `maxItems: 1` to the 'reg:' ?
> Isn't  part of the code:
> > required:
> >  - compatible
> >  - reg
> >  - reset-gpios
>=20
> making `minItems: 1` redundant for reg properties?

I went and had another look, and you get enforcement of this from the
dsi-controller binding if extra reg entries are added.
Sorry for the noise.



--GT4Wjy9c0rngJLum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH36UgAKCRB4tDGHoIJi
0oonAQD3lGSB2k18Pg6DEw5Bz+u2pdmbiD39MplQ8K9WA5ojCgD5Aco+KHU0HRlL
h6BQhlYAo5Sm6sACbPSTCiSyVp/qIwY=
=RxHH
-----END PGP SIGNATURE-----

--GT4Wjy9c0rngJLum--
