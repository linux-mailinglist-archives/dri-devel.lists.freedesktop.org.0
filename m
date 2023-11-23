Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF037F65D8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BB10E323;
	Thu, 23 Nov 2023 17:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242810E323
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 86044B82FB5;
 Thu, 23 Nov 2023 17:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCABC433C7;
 Thu, 23 Nov 2023 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700762305;
 bh=CdkOgAhi6Qq7XsTQoNuQykYy+5qMsC9bpVDo0+HhVbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpctfeS934De2qrTgc70kNtdR1pySjxVIyIzRZheu5z6vRJYfKnExafV35mIzkBxH
 1+YBgrKmrvaBzLzWwUTYaa9VXs8U6kIaE8CCKELK7kibLFZQs+/8lzUp49mBaVQd/2
 i8i1RmPaiN+Sm5o7t6tQLI1+9BMJ8AWUBZB4fBl3X48a0qZ5xhZYgzV3P5wetPIXZM
 bnKH38/zANHbTfTffAKRyPCU6eHqUQSeEgNy8DvWZf603i+medwJkqfaFTopl9ci/x
 dOKVVLgM9RYvUw68ta/YGkNc0xmO1atfyx88NklO9NeExxPR8Z+omnBE8TrrsHBKSU
 mReTgJd/JJUUw==
Date: Thu, 23 Nov 2023 17:58:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/3] dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
Message-ID: <20231123-civic-monoxide-ca1d06a02df3@spud>
References: <20231123-drm-panel-ili9881c-am8001280g-v1-0-fdf4d624c211@pengutronix.de>
 <20231123-drm-panel-ili9881c-am8001280g-v1-2-fdf4d624c211@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3USh3Aw49Tg1AKz5"
Content-Disposition: inline
In-Reply-To: <20231123-drm-panel-ili9881c-am8001280g-v1-2-fdf4d624c211@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3USh3Aw49Tg1AKz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 06:08:05PM +0100, Philipp Zabel wrote:
> Document the compatible value for Ampire AM8001280G LCD panels.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
81c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.=
yaml
> index e7ab6224b52e..b1e624be3e33 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -16,6 +16,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - ampire,am8001280g
>            - bananapi,lhr050h41
>            - feixin,k101-im2byl02
>            - tdo,tl050hdv35
>=20
> --=20
> 2.39.2
>=20

--3USh3Aw49Tg1AKz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+SvAAKCRB4tDGHoIJi
0qeaAQCjWZTzaBOgpkzNDPLNrEqSsvJFC3A59Kabqueyk4FabwEAra+EwipZjA+v
uFx8gvNb+kSnNnuv71U0VaHhuVwSBg0=
=iB4D
-----END PGP SIGNATURE-----

--3USh3Aw49Tg1AKz5--
