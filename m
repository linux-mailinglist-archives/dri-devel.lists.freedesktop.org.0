Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54705706F6B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65210E094;
	Wed, 17 May 2023 17:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DFA10E094
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 17:28:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D88DB6347B;
 Wed, 17 May 2023 17:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3619C4339B;
 Wed, 17 May 2023 17:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684344523;
 bh=C3rhU6ql3cfx2nqHQAamUs5eDbPSPa+ws3rxF+aWa1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RD5m7lY8p7R/XOcqyBVFFZfqAIWQot+4Wz9y1pVEPguZz2/zJZLnuJutREWwZWyNY
 8dvbV1paGoF2P0cxi6Uhrp5PFkO1JcmumAbu0u+pR+SmGiC96WQYfYVph3FNqAyNJO
 g8+KA1tA0og4KZkEz20nLQ6lUA4RKKJ6JKWYCuSSoKkLOb7jU/skUjv2Sq9R7JC12Y
 k6wrrngs03G61v7aIAMQsOHNgQxLFr/Av1eu2qQt6F99nsjB89kk8KazKnTkI3+bzA
 0ttHn01LOdkGQ/rvn9VobAo0bcVV9/GLcaQWQ0AhBh8CG/27P16Ji+ywYPDyAASVPX
 W5hLvuK5Yeb2w==
Date: Wed, 17 May 2023 18:28:36 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <20230517-deceptive-filtrate-9acd07071371@spud>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DPep3TX9ZmccIKnm"
Content-Disposition: inline
In-Reply-To: <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Alexandre Bailon <abailon@baylibre.com>,
 krzysztof.kozlowski+dt@linaro.org, sumit.semwal@linaro.org, bero@baylibre.com,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jstephan@baylibre.com, nbelin@baylibre.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DPep3TX9ZmccIKnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 05:04:00PM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/05/23 16:52, Alexandre Bailon ha scritto:
> > This adds the device tree bindings for the APU DRM driver.
> >=20
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>=20
> mediatek,mt(model)-apu.yaml
>=20
> >   1 file changed, 38 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.=
yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/D=
ocumentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> > new file mode 100644
> > index 000000000000..6f432d3ea478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AI Processor Unit DRM
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,apu-drm
>=20
> const: mediatek,mt8195-apu (or whatever else).

Aye, and drop the references to DRM in the title field too (and add the
vendor name?).

>=20
> ...besides, I don't think that this patch even belongs to this series? :-)
> Spoiler alert! :-)

Well, I do not know what this means - but if it is being respun as part
of some other work, a description field should be added to the binding.

Cheers,
Conor.


--DPep3TX9ZmccIKnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGUOxAAKCRB4tDGHoIJi
0tq/AQCEx0ykFfDTB4Fn6jIhxnkBk2YlIWinWZykIWz+PlyIaQD7B+GkFiVdN1GH
F6vvIFXtMcll02nyunl0Xx5gYXvbzAQ=
=+2H9
-----END PGP SIGNATURE-----

--DPep3TX9ZmccIKnm--
