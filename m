Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5C8445A8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 18:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8610FB68;
	Wed, 31 Jan 2024 17:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0FD10F0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04654CE2185;
 Wed, 31 Jan 2024 17:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5D7C433C7;
 Wed, 31 Jan 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706720969;
 bh=dVvlpOFPokj2vNw6vrhxASEx0Sn+K4PJzSQgQWHwgBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcl8GR9ZaWoc7zLRPbldy0pSjmZ9EnduzFdn9dLAtG2imtPNJwDJYp3c2HTe6z2fX
 iZe8pSm20ECL8q0hLq4qOUp4QLeI0Q0t8ittmTizk7QZpjTnC0nnhU96Ese3uWt1uz
 jN4RgblEZePFCUIp7ImZMqlUt63qwpLDM48neQKXK/57NTgTIM9plC6g4v1c9TT9an
 OwPDXXZLMc5wK2QY7z5Tyq+3l5Q+TWzVVnPJLfqIQhQocQ42vR3r9tfF30G5fKTg9t
 bThiX20tNj0oAoU84ZqhuKH4UQKdkIM/6pOzQ/7R9qaUOofI8N2VqCQUggCltKSoeO
 Y/IlEgELsQ1og==
Date: Wed, 31 Jan 2024 17:09:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [linux][PATCH v5 2/3] dt-bindings: atmel,hlcdc: convert pwm
 bindings to json-schema
Message-ID: <20240131-ravioli-unseeing-401d093f3d7b@spud>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <20240131033523.577450-3-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aXzkUnbG7Mn0Gz+m"
Content-Disposition: inline
In-Reply-To: <20240131033523.577450-3-dharma.b@microchip.com>
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
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 Conor Dooley <conor.dooley@microchip.com>, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev,
 hari.prasathge@microchip.com, sam@ravnborg.org, manikandan.m@microchip.com,
 lee@kernel.org, u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aXzkUnbG7Mn0Gz+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 09:05:22AM +0530, Dharma Balasubiramani wrote:
> Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> format.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Same comment about the examples here FWIW.

> +examples:
> +  - |
> +    pwm {
> +      compatible =3D "atmel,hlcdc-pwm";
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&pinctrl_lcd_pwm>;
> +      #pwm-cells =3D <3>;
> +    };


--aXzkUnbG7Mn0Gz+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbp+wgAKCRB4tDGHoIJi
0uHdAQDRIWCACxF57XH7d6WwYm9HlJkxtUJkLkZJC1tH6V9gxgD/QeCytDHnwOcI
MHTiSXTTdJqrntCh1r9H2nbFvbD2ngg=
=Eynb
-----END PGP SIGNATURE-----

--aXzkUnbG7Mn0Gz+m--
