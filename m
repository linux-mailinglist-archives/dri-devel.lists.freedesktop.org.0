Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EB76D125
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130310E0D9;
	Wed,  2 Aug 2023 15:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ACC10E0D9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 15:12:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 306D5619D7;
 Wed,  2 Aug 2023 15:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5B7C433C7;
 Wed,  2 Aug 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690989140;
 bh=xZJ60KhjGlCXAjVcQyAig/Own6TKqmNUYONhjp4eRKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARRQ6fosNAQroEW3lWfbXzEVtm38OnSt+tVAjAMqxJTq6UkL+7jOV2qlCI8YsucCW
 9uis9PajnhhsXsfxrBcLL3ozhLm4p3qtRbgxKqnxwIIDLgI4NLcelEFgSgKaUvtCeY
 U+sEu03a5guX851zT06Dk9dYWZfUib9viPFXZSHuhIq8lzfpLT7cMGDHyB2bYngD2N
 I/0T/X8DI6LRziJJQDBBta4Cr3VlAW8AD9O7/thnoWdjZyqNOV1RRFYTIhK4niFiO9
 gUOR0/1GMxfV1pt53Fy3wirbIrauQXfk3lSk9Sri292D/eALqHdCn/25rR7IIPiz34
 wGl3cqkw+Y8CA==
Date: Wed, 2 Aug 2023 16:12:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jagan Teki <jagan@edgeble.ai>
Subject: Re: [PATCH 05/14] dt-bindings: display: rockchip-vop: Document
 rv1126 vop
Message-ID: <20230802-kinetic-doze-cc4c014fd65f@spud>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
 <20230731110012.2913742-6-jagan@edgeble.ai>
 <20230801-residue-tractor-5c63e4447f2c@spud>
 <CA+VMnFyh-ctPbf_j=CEXxPNKY+sUymV64Sdqqs-kY7dTojQYUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WeTEyi+GuWka5zrg"
Content-Disposition: inline
In-Reply-To: <CA+VMnFyh-ctPbf_j=CEXxPNKY+sUymV64Sdqqs-kY7dTojQYUA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--WeTEyi+GuWka5zrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 08:07:55PM +0530, Jagan Teki wrote:
> On Wed, 2 Aug 2023 at 02:37, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Mon, Jul 31, 2023 at 04:30:03PM +0530, Jagan Teki wrote:
> > > Document the VOP for Rockchip RV1126.
> > >
> > > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> >
> > There's no commentary here about compatibility with other, existing,
> > devices nor did you CC me on the rest of the series. How am I supposed
> > to know if appending to enum is the right thing to do?
>=20
> I had past comments not to add all people in the entire series and add
> one relevant developer on respective patches. On that note, I tried to
> CC the developers only involved in the respective areas. But, you are
> CCed to the DT patch that affected this binding.
> "[PATCH 10/14] ARM: dts: rockchip: rv1126: Add VOP_LITE support"

> Please let me know if I missed anything.

I suppose you missed saying in the commit message that this is
incompatible with existing vop implementations? Don't need to CC me on
all patches (although it is useful), but please let the patches explain
themselves if you don't.

Anyway, I went on lore and had a look, so with an improved commit
message,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--WeTEyi+GuWka5zrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMpyTwAKCRB4tDGHoIJi
0tuWAP9mY7zkacp6M47unEG/3AvV43m4BEtY1X+hyTMYIPMIzAD7BzYIayp+DNjp
P5LIeT4KksQwpyU+R3sWinH07SzTVQI=
=28Ak
-----END PGP SIGNATURE-----

--WeTEyi+GuWka5zrg--
