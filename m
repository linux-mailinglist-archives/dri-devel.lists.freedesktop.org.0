Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A114BCA4AF
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F2E10EABE;
	Thu,  9 Oct 2025 17:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PCCETPWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006810EABF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:01:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BBE5E623C1;
 Thu,  9 Oct 2025 17:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3E3C4CEE7;
 Thu,  9 Oct 2025 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760029276;
 bh=aMf++jwj8QFA9sKQnz+f+0P/SV7dw4FDOkJnsMu2xSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCCETPWSyIoHtesMP73HgaIIM4lNd5BH3mpIB5GbDos26H+m8xNIGbTfmG4NP42nM
 oy7HC0QVrtmSjLArjLpxhFD6r0L6NHCpJcbrsjCshygAsmPm2uFwKQAMQ1+7HNJsFx
 2aYHPAWl3nyidOB4zC6516LLapqfSdJnJ8uYySsBoBSmJ2Bd1GyCzrPYPPgKKIOF/p
 tTxcbZzE6+hiScv1UdyFHMcwrVFvxfSd7P4Zvh4PjnWL0ZrBeNp6yM+ztDFXu3AlnU
 09lnoXeYpN/odoVBf4AukdPCkeZfDaKdfcyqZkktPw7owr9xD1dywyFTdTpJ04ZjSl
 vwYtHinJwA0dg==
Date: Thu, 9 Oct 2025 18:01:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Message-ID: <20251009-primer-speckled-7071ab2b0b0a@spud>
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-2-clamor95@gmail.com>
 <20251008-safely-reach-9274474a2ec8@spud>
 <CAPVz0n2pbAS3Qjm9WQGvcuJhkNnyjGCyJtVi=VMuUgPoQNE+wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XkuHu91RJ5hQ906D"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2pbAS3Qjm9WQGvcuJhkNnyjGCyJtVi=VMuUgPoQNE+wA@mail.gmail.com>
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


--XkuHu91RJ5hQ906D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 08:06:20AM +0300, Svyatoslav Ryhel wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070=
wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > new file mode 100644
> > > index 000000000000..0a82cf311452
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> >
> > Could you make the filename match the compatible please?
>=20
> Filename matches compatible, -XXNN after lg,ld070wx3 indicate
> revision.

Then it doesn't match!!!

> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: lg,ld070wx3-sl01

--XkuHu91RJ5hQ906D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfqVgAKCRB4tDGHoIJi
0tm2AQDRbBchJP6yN1cz4q5/UPJ+qaCeDoWF6fS6DznaqyPrbAD+NiGhOdJxJ+6d
6IzdZBjXu637FUo5ZnafwHCz1p2rXAs=
=7uMp
-----END PGP SIGNATURE-----

--XkuHu91RJ5hQ906D--
