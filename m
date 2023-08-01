Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082176BEF4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C010E1E1;
	Tue,  1 Aug 2023 21:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18310E1E1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:07:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 175F56170D;
 Tue,  1 Aug 2023 21:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17414C433C8;
 Tue,  1 Aug 2023 21:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690924048;
 bh=K0rsCfWkpm4/DZighE9w0PX9rgV/Bm9df7670wIl4FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgouPXXIzW0OROEdXovJXLRxq5PEsymVh6oJhJR0SpjVfvYJawFd4TNgXvJY5HaQ8
 sq6xjOvapf4D+xf6vXlFcv8hEkhn/8tGlxDq0rdbgHAenJF5GwJURcJiaWgtQjLY/L
 0Y0eJ/1uYzXUj/lwbjffZ6S9CqS7kmXg/wMM9naTX21Tja6KQCPycu+2hx00IaTJ8w
 42bO/zujh5psu9kDxa3oOx1te1j5nokNZqh0j+OD0GX+/SWoSqUGFUS2xYRbWJdNKD
 3LgZsAKykdIEkTIano3ByN1OlhQivydK4Tp7T9oc4Yu61jKBKRmG0t+ZrqUUSuqrpE
 GdgW19uV1k1kw==
Date: Tue, 1 Aug 2023 22:07:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Jagan Teki <jagan@edgeble.ai>
Subject: Re: [PATCH 05/14] dt-bindings: display: rockchip-vop: Document
 rv1126 vop
Message-ID: <20230801-residue-tractor-5c63e4447f2c@spud>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
 <20230731110012.2913742-6-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ndrRpp+GVoLa+YWP"
Content-Disposition: inline
In-Reply-To: <20230731110012.2913742-6-jagan@edgeble.ai>
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


--ndrRpp+GVoLa+YWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 04:30:03PM +0530, Jagan Teki wrote:
> Document the VOP for Rockchip RV1126.
>=20
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

There's no commentary here about compatibility with other, existing,
devices nor did you CC me on the rest of the series. How am I supposed
to know if appending to enum is the right thing to do?

Ditto the other binding.

Thanks,
Conor.

> ---
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
>=20
>  .../devicetree/bindings/display/rockchip/rockchip-vop.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-=
vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.=
yaml
> index df61cb5f5c54..b339b7e708c6 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> @@ -31,6 +31,7 @@ properties:
>        - rockchip,rk3368-vop
>        - rockchip,rk3399-vop-big
>        - rockchip,rk3399-vop-lit
> +      - rockchip,rv1126-vop
> =20
>    reg:
>      minItems: 1
> --=20
> 2.25.1
>=20

--ndrRpp+GVoLa+YWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMl0CwAKCRB4tDGHoIJi
0sMRAP94AAcG2k+QdviKRNxL+Z2cWoicgNyRkc73TT92zzHevAEAju+k5rogAoDj
aGIjmgDauCja1IFZGjTf7DzL03fFXAE=
=mxOH
-----END PGP SIGNATURE-----

--ndrRpp+GVoLa+YWP--
