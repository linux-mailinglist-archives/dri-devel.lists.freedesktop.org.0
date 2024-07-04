Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82429927B61
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 18:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7132D10E073;
	Thu,  4 Jul 2024 16:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F5RzLPrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66B10E073
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 16:44:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C1DD9CE38AA;
 Thu,  4 Jul 2024 16:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB9DC3277B;
 Thu,  4 Jul 2024 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720111444;
 bh=hLebRaAM36NHuqbUZi6dU7R+OUVeX5KaSf0xNzbyg6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5RzLPrqO2U+dzI9F3fWtgHf6lPKonEtman3EV29DVll0B2d8sA04N3akCP5KlsSa
 duUR87C8W3RFefmVKx+UrFslYxTfoivs5Wx8DIYQC6LZEYMTz69kW5W5s0qpsr+BbS
 oVyP6otxODUUMkJ4BwL2HNeWh4j3bZwGcWY5GyC5Dpu19WrUCBnUcvbZu694xEsmGJ
 u7bObgwgZcCIHgLhejvF6MjtZXAvNw3HTHOrTEzHq/GFLNOAdbMqtRGxB9FnDhCuuS
 H4mD/zxL85WQKf68n/fWAZgczj8giZIeIdn3xguL0YITi637nw6tTJ8VrfdIRwIQsR
 R2jcpebMXhETg==
Date: Thu, 4 Jul 2024 17:43:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Message-ID: <20240704-garage-thrill-6834f7ef079d@spud>
References: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0gW4uFFvq9OjeSPs"
Content-Disposition: inline
In-Reply-To: <20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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


--0gW4uFFvq9OjeSPs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 04:55:54PM +0800, Zhaoxiong Lv wrote:
> The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
>=20
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0gW4uFFvq9OjeSPs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobRTwAKCRB4tDGHoIJi
0rbAAP4sgBrY4rADyU1gV0eK2FbqhUeamyhGPsRhlmomx6rdmQD+NhzqQZ9nkf2g
4TV+3Fr6wPfefh81lEQwAm7FjMGf7w8=
=cB44
-----END PGP SIGNATURE-----

--0gW4uFFvq9OjeSPs--
