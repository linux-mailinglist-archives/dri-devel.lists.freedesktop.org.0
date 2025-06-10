Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00330AD3CB0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AB910E49C;
	Tue, 10 Jun 2025 15:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oksrL1/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A573C10E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA3B4A513F9;
 Tue, 10 Jun 2025 15:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18015C4CEED;
 Tue, 10 Jun 2025 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749568888;
 bh=E1xqj+u3vf1FQ4JfQQLgsK2d1JGFFQy+vq6VMPj9YVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oksrL1/YngNECF96m3avQ+YGC7rZcfdVOSkr1F7L17EpDj7HxIjIU6TuJfabOslPm
 2kSVH0OmyaJf6II4wLaQ2Lewmx1ZcqauQ680kLk0dpw0ZjFpVysUcGRaZC5Ku82B6y
 ljkYQ3d/3EdV/tI7XmtDh/o6YJrsKtQty2p/ZwPSeHzgelbN+yJGxFA+BFBNIl1Ne1
 XSfSAb9xi3CUrtQAg3ld+EzBT7YzXeV82JBy10eeYra56J+WirDw0XNyl5I1GP9hOA
 53DT07/IoNQ1drNvCqPqptH3qNe5YmWLoOgF7tf+lYKYSk6ASAMS9p+xT779oNHa/e
 j+b1V38mqCkVw==
Date: Tue, 10 Jun 2025 16:21:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
Message-ID: <20250610-outgrow-reputably-a2141617d2db@spud>
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="glvRYTcO4HsikMOq"
Content-Disposition: inline
In-Reply-To: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


--glvRYTcO4HsikMOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:19:05AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) So=
C.
> The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> driver changes are needed. The existing `renesas,r9a09g057-du` compatible
> will be used as a fallback for the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--glvRYTcO4HsikMOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhNcgAKCRB4tDGHoIJi
0ihBAP0caHWmTlCMBGf10BqmonncXuuqquzAPIjevbfMbJqjpgEAq1e/Lwlsz3zH
nPa5REoaGnuz3tHm/EBSbKhqaJWDkQ4=
=I3B8
-----END PGP SIGNATURE-----

--glvRYTcO4HsikMOq--
