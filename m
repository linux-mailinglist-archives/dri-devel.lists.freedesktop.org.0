Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF5895B62
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 20:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E1210FF45;
	Tue,  2 Apr 2024 18:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zk3UILeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D510FF3F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 18:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A1CAACE10EF;
 Tue,  2 Apr 2024 18:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEAAC433F1;
 Tue,  2 Apr 2024 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712081212;
 bh=TTRXcjTQZRBAmeWDXa+X4kXntSc02ooNowPmLREkays=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zk3UILeq7LQD7Zzqi1MAz8doOJLTDa0VGtC7FQOmxq41vMi/PcXRHA95ESpn8PlG3
 cE7NB7fQ2oon2r2T3lt5EhnIBTkdgV23HjLSBzVFOwmqEYK7PDxsLF2FGIpGva3QxT
 qY01BVgO0cQwVYU0DxtEzNDkkL4eCpVYZwZmy23OnREQBY90aPMsKchWxSueO86Ro/
 5wBZ7SC0HYdFtdfC0dPITJa4rA7Dcjx9ePrei9ZFNEZV7REEi9DnJi/ZguvZ2EmYnw
 /MMn//hr4crdUfy2w2gG+mSNJWdk1BK40NK+K/UvvcWAVmBhuLwfEF7dMuLbgSMzLj
 nTF7ziMN8kQ6w==
Date: Tue, 2 Apr 2024 19:06:46 +0100
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
Message-ID: <20240402-sheet-retread-025759b22faf@spud>
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402105925.905144-2-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IaeEkV6cHbiyMA0K"
Content-Disposition: inline
In-Reply-To: <20240402105925.905144-2-alex@shruggie.ro>
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


--IaeEkV6cHbiyMA0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 01:59:25PM +0300, Alexandru Ardelean wrote:
> On some HW designs, it's easier for the layout if the P/N pins are swappe=
d.
> The driver currently has a DT property to do that.

"currently", because 1/2 adds it. bindings patches should precede the
driver patches in the series, so please swap the patches and remove this
portion of the description.

>=20
> This change documents the 'lontium,pn-swap' property.
>=20
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8=
912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912=
b.yaml
> index 2cef252157985..3a804926b288a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.ya=
ml
> @@ -24,6 +24,12 @@ properties:
>      maxItems: 1
>      description: GPIO connected to active high RESET pin.
> =20
> +  lontium,pn-swap:
> +    description: Swap the polarities of the P/N pins in software.
> +      On some HW designs, the layout is simplified if the P/N pins
> +      are inverted.

Please explain what configuration of a board would cause these to be
swapped, rather than why someone might want to configure the board this
way. I've got no idea what this hardware is actually doing, so this is
being pulled out of a hat, but I'd expect something like "Some boards
swap the polarity of the P/N pins, use this property to indicate this to
software".=20

> +    type: boolean

The type here should be flag.

Cheers,
Conor.

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
> --=20
> 2.44.0
>=20

--IaeEkV6cHbiyMA0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgxJNgAKCRB4tDGHoIJi
0p9FAQDInUJtiORRgoENs/9LgrlXyxmmHlbeuiOigy2sEmDRLgEAyH6YAI/dlnFf
hGfdSbSMzrdRwU0lrpHKwxghq5nLeQU=
=9xkf
-----END PGP SIGNATURE-----

--IaeEkV6cHbiyMA0K--
