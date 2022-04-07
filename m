Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0664F7E25
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446C10E73C;
	Thu,  7 Apr 2022 11:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3494410E73C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:38:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD5D9B826BA;
 Thu,  7 Apr 2022 11:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BD4C385A4;
 Thu,  7 Apr 2022 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649331533;
 bh=HKoHzmBqyXBZajFqSA+R+95Y52ZGliTd1RpOUedDalQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rpFJ1kBv18Zxzq1iwpmKx4VTp2Qb6ZEljpALK0eexlG7EcETuHQS0s8Z2/VHXDiyt
 6fMer+0TRPrAnDwcR137Ca1wRkSexZfyjV2g7Req0cwWDLpfx9/k5jWWZ75iGSD9RK
 zt8FQ+9nIiDecCuGJv5A8dqLlFYgNnlZYIgd3v/9cTdpzH7eOMMQOKfkTxUsW2pHEc
 lscB5kr0yc8JcSnwWn26QIIDJ/U5Ts84ygM5WSJlLjdc3kbvi+XC6J88yHNGwcZ5YR
 UMDujMR5u3qBciSoKI33MhHrcg8jrBr/XrfDp4Anu4pSDscg7GElFJz+gKNnaxNRmg
 xizFFQxwd8Jfw==
Date: Thu, 7 Apr 2022 12:38:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: bridge: icn6211: Convert to regmap
Message-ID: <Yk7NSIeYgQIK+3pq@sirena.org.uk>
References: <20220403171004.368464-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DCnpQxLE/q0CSGnn"
Content-Disposition: inline
In-Reply-To: <20220403171004.368464-1-marex@denx.de>
X-Cookie: Look ere ye leap.
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DCnpQxLE/q0CSGnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 03, 2022 at 07:10:04PM +0200, Marek Vasut wrote:
> To make debugging easier, convert driver to regmap. Implement read and write
> regmap tables for known registers, keep all known register readable and mark
> those which are obviously read-only as not writeable.

Acked-by: Mark Brown <broonie@kernel.org>

--DCnpQxLE/q0CSGnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJOzUcACgkQJNaLcl1U
h9Cg5Qf+JrNmTT8BdR2KswMQY/lEY+E3zwmzKOntMz5PRaE8DTsTmaoSPEi/7SMn
D6RIMPx5oow/xBCIEgYih2h6NOIah8YxNdFTnfdwqaZnsYZz8CII7vWsz9ZiJUD+
70lYCCtZT69denQpHzQd2WLTw23vCzHlt8SHjKRNKk1WSMDDzA84FUVqKMM8v2UQ
tESW7i31WoeXEoKPsynJ1n8w3jRkpk2CJ6CEyCAUVQMcXqA7rfjIdq5Ywy+2mwev
D8UizZ2V0yPgiMmy5tNfkLz/2atiwWIyew/lRdRHO4shhfKKndOuyseTEt76ls1s
dMWNqdxfGyrYGHCVop9vPOkYpqGQKQ==
=umum
-----END PGP SIGNATURE-----

--DCnpQxLE/q0CSGnn--
