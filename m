Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D1831C9B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 16:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690D10E82C;
	Thu, 18 Jan 2024 15:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027A510E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 15:31:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55FE0CE1B3F;
 Thu, 18 Jan 2024 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A758C433F1;
 Thu, 18 Jan 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705591892;
 bh=4wA+UWwUt1juxH0gO+qlw0qBSnENNfKQfAfESA3JOVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oYgMK7mKWk4ZpaH3EseK8Uu7+VHlxzes9YSDMKw0MQl6vDz0aE35z9l5zA3rAJHxy
 BsMNnOdU+x1zZVU5ULw4Vi++4+idxP+fxaG4rDIVsNy0FceRSO1rQZ1d9c14jWDNB3
 VDjGwfjyA/qljuvGO80OcVYJV44ejuOioTJ6QpooEQkxKNn5zMXO0DG1ZGkDY21vs2
 lC3EVqEUqTc5/+e8ceuNyI/SV87N55LGVlxR7gw6+Ar7IueUmvo7ELbdeYy9R3OR1u
 aBeUpNP3Xwd53UP2qVMZAEDmGH1Ag1xLa9UCQlATBEv9FG6HnJaQ/Hea1i9hhhKBnO
 L3p63L2WnYYIg==
Date: Thu, 18 Jan 2024 15:31:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Message-ID: <20240118-unscathed-flail-be2e49abc56d@spud>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uK+u7gbhbDVqB0jo"
Content-Disposition: inline
In-Reply-To: <20240118092612.117491-2-dharma.b@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux4microchip@microchip.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uK+u7gbhbDVqB0jo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 02:56:10PM +0530, Dharma Balasubiramani wrote:
> Convert the existing DT binding to DT schema of the Atmel's HLCDC display
> controller.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> changelog
> v2 -> v3
> - Remove '|' in description, as there is no formatting to preserve.
> - Ref video-interfaces as endpoint.
> - Remove ref and description for bus-width.
> - Add new line before the child node in example.

> - Remove 'example 2', as it is not required for just one additional prope=
rty.

Rob's comment on the previous version was:
| Just 1 extra property doesn't justify 2 examples.
|=20
| In any case, drop the partial examples and just have 1 complete example=
=20
| in the MFD binding schema.


--uK+u7gbhbDVqB0jo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZalETQAKCRB4tDGHoIJi
0oMyAP9+Ll8fdXViDHTVjFHNGPWzChucZsZdKY7aRr7jkFYBhAD/Qt7JIQGWHJ89
hYQiygsvwed2ijEO9ueMCNp10XQMzw4=
=FSle
-----END PGP SIGNATURE-----

--uK+u7gbhbDVqB0jo--
