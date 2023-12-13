Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE41810B4A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 08:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA76610E6FC;
	Wed, 13 Dec 2023 07:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625510E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 07:16:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4248DCE0AD1;
 Wed, 13 Dec 2023 07:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022A2C433C8;
 Wed, 13 Dec 2023 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702451767;
 bh=rjW4FqNS7dqFf2D6s0wEqUZechtIxjdG/6g1Uueb+xU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkJyYqUqmsv8rO254rdUW4eXIFC+gLoifUFXtE7qCu7DsCIBON/xSS0U0wc21QazB
 rJK8Lq60VmOKEcAS3bIh5/xesPMvfpwujc4U7mejCJcNShGXQXY+2tvEMdgA2cSOzV
 zMUrYTcAi4ytjc2q1YjCXcUYEjp5b4r4MbsUbSVpzz5/TRYnrhPrdHCwssy6siBKVA
 4g3d+lWT/ZEApSO5LSYHOKo3uawaCfiDJtwvdfr33JCmtluqt6RM8Rdz6/tufvqvOr
 tMV3BKbcKQwe5paAnsZTd+kTQI40qefYumD/PkP7gptEep5V/lYPBjk/RJk2g6gFGl
 mQbcT5pj2oZFw==
Date: Wed, 13 Dec 2023 08:16:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m7hyngpcks2t5pei"
Content-Disposition: inline
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m7hyngpcks2t5pei
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
> that and don't check the return value. This series fixes the four users
> that do error checking on the returned value and then makes function
> return void.
>=20
> Given that the changes to the drivers are simple and so merge conflicts
> (if any) should be easy to handle, I suggest to merge this complete
> series via the clk tree.

I don't think it's the right way to go about it.

clk_rate_exclusive_get() should be expected to fail. For example if
there's another user getting an exclusive rate on the same clock.

If we're not checking for it right now, then it should probably be
fixed, but the callers checking for the error are right to do so if they
rely on an exclusive rate. It's the ones that don't that should be
modified.

Maxime

--m7hyngpcks2t5pei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXlaNAAKCRDj7w1vZxhR
xdMoAP0SfIOFl6Fc7FcIbVyoWZh/iWhJLszL7a709z02B76E0QEApMmexIdN3NIS
P/kaPqH5SfyvBxS6tWkFW1spZ1vSVQE=
=f1uM
-----END PGP SIGNATURE-----

--m7hyngpcks2t5pei--
