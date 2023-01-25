Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C767B1B6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8F10E78C;
	Wed, 25 Jan 2023 11:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5721610E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:41:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5C7B614C7;
 Wed, 25 Jan 2023 11:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E044DC433D2;
 Wed, 25 Jan 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674646887;
 bh=BSf4VdDu/Cipkbp8RNs0rNyAzPjqHzof5Fj9ZYA48xM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfilqO/eKu/QoPePHTTuTn8J1r0Gfr8WyYnJTWSK83NPY89Lt3LaqRMiaWnnxEdz1
 5GfmqGH8yJFKJlrPMbcp84JgDUzRLc2uldIX4k89jTMcPIFXHFbL6PPgMyEPoohaU3
 uAQ2xL2z2Rjhzaa8w1lCI5+i1z2YED4iJtXXyaxZ0XqaEafwrnSL76HnHSEhWrfZh2
 BSVoMTAFP3PkmPkb7Kyti1fKVYFgPbZvpPHr2csZ0HOGM4Do6P0nTDzzOAj/HPpgzU
 RU4p1z0AJO7YjLO6ciSZmTplImSf9p4ZS2V0k6wbLHUb3lAFakk5haqH41gWo/0kO1
 OKWEJLNDmmlsQ==
Date: Wed, 25 Jan 2023 11:41:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9EVZQJEV8i5vdgp@sirena.org.uk>
References: <20230124230048.371144-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YLw58GmZKH9QcKuc"
Content-Disposition: inline
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
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


--YLw58GmZKH9QcKuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:00:48PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.

Acked-by: Mark Brown <broonie@kernel.org>

--YLw58GmZKH9QcKuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFWIACgkQJNaLcl1U
h9C5IQf9Gj9QI/FW6Xw+gMpDw41zL45NSAa01ZJ7G8XkRAaJNWXTMWR1sZKiK4XJ
5rjn6QJUusYQuPpRmgG2DjO115ttDY8PNNWUlbpHxdQ+0dQI/dzilsrEFOrFXH1S
PcEA3qn6o7eU3ICxhOnhcJzf1auMMUeq0hHtfjHxHLhgxeJZ13yZA61DnR9uShhF
DT2ZXj0DrflrKoX2haOnuhvLc0Rx5qV+O3LfPBcO53OdCgjkAkmW2Jll2UrtTUIc
9+G5v1R2fy/qBGUUQSzfPcTESH8bAwxpdP3i61xeoUYzaRNM/K4F/00nXADmY71w
uWdFdQq7y1nxrTCAKIbIk2i8KCJlTg==
=IpOI
-----END PGP SIGNATURE-----

--YLw58GmZKH9QcKuc--
