Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1D72290C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF4110E08D;
	Mon,  5 Jun 2023 14:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88210E08D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:43:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FBF960C4D;
 Mon,  5 Jun 2023 14:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8008FC433EF;
 Mon,  5 Jun 2023 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685976219;
 bh=HTJSadZWF7SLKiMGfv9EXQYASZ1ZrbukpqV/os4ftPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZZD4FB642a/zNeeKDGYJD0PxclIQ3zj7I4h9fg6dQj68H0ksOHMNcQq+EdSWevTt
 NJgf31NwMBRrMRp5U7OYICKVMLgdE6jMn7zn1R+y7xtQJUw8L3fGFU92wvqJsiY/Ih
 x7soiIi7cOKKJa3XGfRXjM/NHrZvJrQ6sv0gGo5Mvb9S4rOrCR8k+2BgrSea0BX+QU
 vdVcmq3CfCnq0VaCl76i+UUTM+5EXDseao0DSrO/Y1Yr2DnV7JmqgD6mOXkb3zBmIG
 8nifdGmdoGFK0VDTOVz/lpJggz1SdMA6QSwUKwdWOrRth3hG3OGl5CYgAxtPGkiPPm
 +CYO3S2r7X3xQ==
Date: Mon, 5 Jun 2023 15:43:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Paulo Pavacic <pavacic.p@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add fannal,c3004
Message-ID: <20230605-handyman-rebound-0c10df9dfaf2@spud>
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <20230519142456.2588145-2-pavacic.p@gmail.com>
 <20230519-emerald-void-066fad80950a@spud>
 <CAO9szn2sYRezCUQKFZ_qsVfne0gpWoirZoE-HpWTPS4G1U5fNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nQ7uVUKzJWHOOXKP"
Content-Disposition: inline
In-Reply-To: <CAO9szn2sYRezCUQKFZ_qsVfne0gpWoirZoE-HpWTPS4G1U5fNQ@mail.gmail.com>
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


--nQ7uVUKzJWHOOXKP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 04:33:15PM +0200, Paulo Pavacic wrote:
> Hello Conor,
>=20
> pet, 19. svi 2023. u 18:41 Conor Dooley <conor@kernel.org> napisao je:
> >
> > Hey Paulo,
> >
> > On Fri, May 19, 2023 at 04:24:55PM +0200, Paulo Pavacic wrote:
> > >
> > > Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> > > Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> > > DCS initialization sequences with certain delays between certain
> > > commands.
> > >
> > > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > > ---
> > > v3 changelog:
> > >   - renamed yml file
> > >   - refactored yml file to describe fannal,c3004
> > >   - added matrix URI to MAINTAINERS
> > > v2 changelog:
> > >   - revised driver title, now describes purpose
> > >   - revised description, now describes hw
> > >   - revised maintainers, now has only 1 mail
> > >   - removed diacritics from commit/commit author
> > >   - properties/compatible is now enum
> > >   - compatible using only lowercase
> > >   - revised dts example
> > >   - modified MAINTAINERS in this commit (instead of driver commit)
> > >   - dt_bindings_check checked yml
> > >   - checkpatch warning fixed
> > > ---
> > >  .../bindings/display/panel/fannal,c3004.yaml  | 75 +++++++++++++++++=
++
> > >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> > >  MAINTAINERS                                   |  6 ++
> > >  3 files changed, 83 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/f=
annal,c3004.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c=
3004.yaml b/Documentation/devicetree/bindings/display/panel/fannal,c3004.ya=
ml
> > > new file mode 100644
> > > index 000000000000..a86b5ce02aa2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.ya=
ml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/fannal,c3004.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Fannal C3004 MIPI-DSI
> > > +
> > > +maintainers:
> > > +  - Paulo Pavacic <pavacic.p@gmail.com>
> > > +
> > > +description: |
> > > +  Fannal C3004 is a 480x800 panel which requires DSI DCS
> > > +  initialization sequences.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: fannal,c3004
> > > +
> > > +  reg: true
> >
> > Are there no restrictions on the number of reg entries?
>=20
> What do you mean by this? May I have some example if possible?

I was commenting on the lack of minItems and/or maxItems.

Cheers,
Conor.

--nQ7uVUKzJWHOOXKP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH30lgAKCRB4tDGHoIJi
0lsLAP9+CTvXC/zgIcFgiFLJzGtxQzLLeTQaXoaW4152gfRbWAD/XNUI3DAx6XIn
65u/o0sBnBl5RLLBxQIrAK9k2gdYugg=
=PaM0
-----END PGP SIGNATURE-----

--nQ7uVUKzJWHOOXKP--
