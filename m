Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FA8974C0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 18:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C8D10E219;
	Wed,  3 Apr 2024 16:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qKAjOElX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8C10E219
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 16:03:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42E2CCE1304;
 Wed,  3 Apr 2024 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2043CC433C7;
 Wed,  3 Apr 2024 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712160179;
 bh=ZLGaUAlxN/MigLlqe2ufbLD2YOZsHZFp4bFiSC6MH6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKAjOElXcZoBLG39OjeFDtAe2thsVwavvdRrcX1AjPU+cqi9PmtBpCEYzLrwih/oR
 eSU0wk+bz2v+2LK3+f6q9dxRqhSHvOfgKBGaRYuQfUqLWxCNgH1g9fvIZhfMbd8PA/
 +iu8advVlG1DA5wyhnTkclFCV8CFeiayaSUVYV+VRsU2O6tUfOrFv62opxuBTlod56
 ZM/3RekTzbklkBfKriSNPUDOeSNvscNothpVnVLxuvUVtJM2+Of5n6O8tHHb3O3i8A
 5lGWkKZ77j3MG2BX+BwMoDP09Km1X821j4Zp2crONXSYIkxsJaLZH2Jwswv3VUE/Ou
 1wQaQo8ITmUuQ==
Date: Wed, 3 Apr 2024 17:02:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, adrien.grassein@gmail.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
 marius.muresan@mxt.ro, irina.muresan@mxt.ro
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: lt8912b: document
 'lontium,pn-swap' property
Message-ID: <20240403-cadmium-pasta-eadfdf62f387@spud>
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402105925.905144-2-alex@shruggie.ro>
 <20240402-sheet-retread-025759b22faf@spud>
 <CAH3L5QooAXDYAxOdMkPrW1mx04ZgTv_kMU5VSAby9J3Hb_RFOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OIKG09sfb1D7G0KQ"
Content-Disposition: inline
In-Reply-To: <CAH3L5QooAXDYAxOdMkPrW1mx04ZgTv_kMU5VSAby9J3Hb_RFOg@mail.gmail.com>
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


--OIKG09sfb1D7G0KQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 09:16:31AM +0300, Alexandru Ardelean wrote:

> >
> > > +    type: boolean
> >
> > The type here should be flag.
>=20
> ack; i'll change the type

I prob shoulda said, its "$ref: /schemas/types.yaml#/definitions/flag"
instead of "type: boolean".

--OIKG09sfb1D7G0KQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg19rAAKCRB4tDGHoIJi
0oqRAP4hwY3sOX9ShDng3WIfjEJxfjKASqN3casNhSiE07qADAD/aGzpCVx8FUez
kIQGC+Nx5ySg7iMHlwiZt2/u7rE24AI=
=xnpK
-----END PGP SIGNATURE-----

--OIKG09sfb1D7G0KQ--
