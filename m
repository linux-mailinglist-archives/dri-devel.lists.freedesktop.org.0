Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA6F67B1B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862110E79D;
	Wed, 25 Jan 2023 11:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7165310E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:41:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E166C614D4;
 Wed, 25 Jan 2023 11:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1CFC4339B;
 Wed, 25 Jan 2023 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674646908;
 bh=ezg2eabCWSVB4l7XhnzfHs+x1Vn9MQYl2SLTazGntOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uU/+AR2CwjeymulismW9BMOZiWHGFUxIhzBe/aKJI2+1c1gGId0ABjLtUTu03obBG
 0TFOLM7sjKuh6JqE19PasKUw/fvnXB7YE0xCaFg5WiyMAIKVkKtlhBM5bqlPOX0vF2
 jqOIv4Lzg2mbrHyFDTB/sT/C2DMoFJbEIIYrevZ3CAW7a2KiT9E0Re7km+4HgBgIOT
 zZP2aSxEMoUywBiSAljmGYeT2e7Ev0v8lhU58lq5FU2XR7xxT3c3QzPrbzSP8csD9I
 Q2YYEKrr+65C+KSNc3vZRbtDtiQJKw0dwU6Ei7YFxw7oqI2CdfL95Y8MAebk/UDJgf
 Dh8XnNgakkOTQ==
Date: Wed, 25 Jan 2023 11:41:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9EVexQ3yAN1n1NF@sirena.org.uk>
References: <20230124230228.372305-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j0ZYRAV1FZ0iGu90"
Content-Disposition: inline
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-Cookie: Serving suggestion.
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jassi Brar <jassisinghbrar@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 openbmc@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--j0ZYRAV1FZ0iGu90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:02:28PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.

Acked-by: Mark Brown <broonie@kernel.org>

--j0ZYRAV1FZ0iGu90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFXoACgkQJNaLcl1U
h9DUcAf7Btv4DlmnSpwnSwLLZLZjLHnfTWVpZJ81qaPCs4SvmkBNiQxX1s9Vld21
8O/QaZxTRJp7+kru4tljDPFtPWIPRvcqVwgCtUoOJ2AIEKapcFBMVIh7nidnnNjs
+LXDzG2e4va5huH2/ghU9TQwULN6X3M3UY8y/sq604qT0koHoN9zoZo5idZF7BSQ
/GVeXQzXzB3UgOLv0hHuuQ9sD8QDIHfNn7ThUEPWhDwvinpB7VqkiIOD8nrr9mhr
AdbkpaWOi2iv3A5BgxyGFDMufybabjkqztUT54muSHZDxbCjU7vUe/fyyK1NEQGa
sgZbeoPjsTAlgN0ytBYi1aQSUR2wLw==
=DSza
-----END PGP SIGNATURE-----

--j0ZYRAV1FZ0iGu90--
