Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356977D3DC3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF610E217;
	Mon, 23 Oct 2023 17:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85A910E217
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCC7E62654;
 Mon, 23 Oct 2023 17:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAE8C433C9;
 Mon, 23 Oct 2023 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698082312;
 bh=RoIE1xXK4oaL8rcaDxktETkJEouLHhkNssWXuP5Epe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqlLv54Os7Roj262+yZrxTxWxk6jTaW36NOHexBdLV1QrnXB3c7ChlTjcUyjiEM4T
 UhJxniIAuRLa6zq8WeZEzE/EPPvALijyHrcJ0fxP9UKlcFAz8SZhkugcYe4uzDniEc
 q5oeD+2GNT1qf8TxI7nm5Qho98DiuSuUX/g0YUFjmiGqFpOMis7QWLeURZLUutX/Z5
 +BgQxoD9TM8KvjdN/Qn8+evhg6A+xFMCrShDuqJT8UNIIus5cxc1PARM0W7kAH8LFf
 WY70VXysTuqxjD2S4sEEAFJ9Nx54Sv3kfej8hH868br2TwO6daWLNczPwP2qbjYoad
 PsVgcZ6Yn1Vsg==
Date: Mon, 23 Oct 2023 18:31:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 02/18] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
Message-ID: <20231023-reshoot-liquefy-429aacb68694@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ARUire+fEKHR8b9F"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ARUire+fEKHR8b9F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:40:02PM +0200, Alexandre Mergnat wrote:
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

This commit message's first line is too vague & the second doesn't make
sense. I suspect something as succinct as "Document the display colour
correction on mt<foo>, which is compatible with that of the mt<bar>"
does what you are looking for.

I suspect this is going to apply to the rest of the series...

Cheers,
Conor.


>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 8c2a737237f2..9f8366763831 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -24,6 +24,9 @@ properties:
>        - enum:
>            - mediatek,mt8183-disp-ccorr
>            - mediatek,mt8192-disp-ccorr
> +      - items:
> +          - const: mediatek,mt8365-disp-ccorr
> +          - const: mediatek,mt8183-disp-ccorr
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
>=20
> --=20
> 2.25.1
>=20

--ARUire+fEKHR8b9F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTauAQAKCRB4tDGHoIJi
0rG1AQDVNLCTauTO68aeJeXwZERo8tQp+TLgjwiLq+AqZulyQwEA9uXOZb3JrBGq
ZdzQoSqOFaugEQ+Xa3te/HhYaNLcNwM=
=fTxV
-----END PGP SIGNATURE-----

--ARUire+fEKHR8b9F--
