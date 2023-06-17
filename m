Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FE7343AC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 22:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB210E062;
	Sat, 17 Jun 2023 20:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93FB10E062
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 20:38:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93811612ED;
 Sat, 17 Jun 2023 20:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4A7C433C8;
 Sat, 17 Jun 2023 20:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687034329;
 bh=9Zb9UAFksFY7Cy3ynj/wFUHzUz5qBHPgp+UpGMmeKMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LotxR04o8Wf7joBGdeaq8Ul9ardmmlWypp8vCP8MULOLW3ynQfkptGWdoofkBK3tR
 p4O7na8+o6MWz65Na5Tz56BYNf9BPuRHm08wD5KV6S4Lw+CIzwxOLU3wj91oZoulvF
 /oM21NPF0UC2iNHJo0YMMq5I6RkmA29Ik3ZaNWlgFoPyUAGTJbnHQhRMg/J+/nyLyB
 hHZ3yl+Ulr5r/D0VmOV/moMmfjz5r/ic/r7o9ma/H7YtDyvv4rBUgbi6TSO0ujivKy
 jmBUq9FBI0h+fJaepebdy1dCY9jztmBJc5YzOj95vWc8T68kyNgvT9UyTrGP/w0wo5
 BQdwqSB9nau3A==
Date: Sat, 17 Jun 2023 21:38:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: sony,td4353-jdi: allow width-mm
 and height-mm
Message-ID: <20230617-postal-alienate-9afb55ff895e@spud>
References: <20230617165726.279886-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OGrMT6Z9yvE6MzoL"
Content-Disposition: inline
In-Reply-To: <20230617165726.279886-1-krzysztof.kozlowski@linaro.org>
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
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--OGrMT6Z9yvE6MzoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 17, 2023 at 06:57:26PM +0200, Krzysztof Kozlowski wrote:
> Allow width and height properties from panel-common.yaml, already used
> on some boards:
>=20
>   sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do=
 not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--OGrMT6Z9yvE6MzoL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI4Z0wAKCRB4tDGHoIJi
0nrWAP0eOCIlGa1oo6zjaF71YuRF2e8/Se/IBTj1c8YHldvz3AD+POZcUdowCLo3
XoWPPKwJBlqJsOGNTLousij+OblgdQ4=
=5gXF
-----END PGP SIGNATURE-----

--OGrMT6Z9yvE6MzoL--
