Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE8AD7945
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 19:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6DB10E0AD;
	Thu, 12 Jun 2025 17:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IYhRx5uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D975A10E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 17:48:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1CEB844395;
 Thu, 12 Jun 2025 17:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F1C4CEEA;
 Thu, 12 Jun 2025 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749750534;
 bh=wKdC1kaW6Mz233y8IwinugA1rK2mMjZiCz1ANtUBJaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IYhRx5uvnkonjwx441vp+/Wbc1KUGF5fLeUz0yapovSRXtUE9d0oU47qdib5SoNdz
 c+znyu7L5vjxn40sguLyeUxJK8zTWYddIiTOYBH0oojVTXxbyD0TAAWB2Z5GtOmKi6
 4jwiEdOtSHxm6ED4WuwTXPiicz/ff/8rNBCFfCCIqFSynnQSh93eRvPjdbZQJqd0mv
 V3F9lyarWqguOPA/XuFDbZdcrnv/GeRy9edy8OKg6EvHPAtEZdU8RJ/OxQCCX0OzVV
 WEa6NgQSuuylo7d7NCfLXzacCHasClNsWa6GUx/zgHtWxRM2axSnBzp7a6IGvZveCj
 v7JJnuCK3iGLg==
Date: Thu, 12 Jun 2025 18:48:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <20250612-banjo-mongrel-37125f8f0414@spud>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
 <20250612-lively-duplex-ff45181ffd5a@spud>
 <0a89c2b2edee38fc910d2ec88760f2e5@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SP8a+pJLs3oRR5NN"
Content-Disposition: inline
In-Reply-To: <0a89c2b2edee38fc910d2ec88760f2e5@disroot.org>
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


--SP8a+pJLs3oRR5NN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 05:10:23PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-12 15:30, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 08:22:41PM +0530, Kaustabh Chakraborty wrote:
> >> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
> >> compatible and devicetree properties of this panel driver. Timings are
> >> provided through the devicetree node as panels are available in
> >> different sizes.
> >>=20
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Okay no, even this one has the ID wrong, ugh :(
>=20
> >> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
>=20
> Will apply tag after fixing it.

Thanks, I didn't spot it here either.

--SP8a+pJLs3oRR5NN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEsTAAAKCRB4tDGHoIJi
0lvOAP0ZozR/t0mHA2fg37mJyEOtYJBvVqBNr3GGVvmJf1RvWQEAtKjgMPW8lp0M
hb6IZjaUkNbKWGE63IHTZaQGsyQgUAI=
=kQDe
-----END PGP SIGNATURE-----

--SP8a+pJLs3oRR5NN--
