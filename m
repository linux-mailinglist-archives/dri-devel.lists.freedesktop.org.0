Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD541951D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 15:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3391A89C52;
	Mon, 27 Sep 2021 13:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2EA89C52
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 13:31:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0216D60230;
 Mon, 27 Sep 2021 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632749504;
 bh=Y7TpDj/QBqC2VlX8snx4uk+a31fqoGg/z2dM9RwtnIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnndhq1ZLNDnrS4JI1a41cuT7L9dq/UQu27xBALiEGCG0R4aDPdqNjEeFfR04Mxv5
 /9+9kIrlI00L/y3hxMHlf3puV3jvA9B7HOTW7hWm/X2HI4+J+dNgdmukkkiBvZURmg
 rlp/iS1+CF296B5zqZ/zYJEklMwIumrjhAtdGafBAQTurlYD0Q9XOyT4DHIIzSlS6i
 PAcIJurcAQAxLnmNT3U+CYZ96wPihh88tBnpndW0llNNZj/y+WTh4+XG4Nri9bYXxm
 P9XNomrkGquyugt9frmrORpxtygM9rIlSL1Alr58GGcmrH2vFw/OtdOnVf3Z2J6PgE
 RyLxmNBSMf0CA==
Date: Mon, 27 Sep 2021 14:30:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: hx8357: Add SPI device ID table
Message-ID: <20210927133055.GD4199@sirena.org.uk>
References: <20210922151014.49719-1-broonie@kernel.org>
 <20210927094200.a7d73sl2k4x5xjch@maple.lan>
 <20210927114727.GB4199@sirena.org.uk>
 <20210927132417.lixg3ojhnwlleht3@maple.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Content-Disposition: inline
In-Reply-To: <20210927132417.lixg3ojhnwlleht3@maple.lan>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2021 at 02:24:17PM +0100, Daniel Thompson wrote:

> In that case what is the point of including unconsumed driver data? Most
> DT centric drivers that included this for modalias reasons leave it
> NULL.

It's mainly there because it's generated fairly mechanically from the OF
ID table - there's no great reason for it to be there while all
instantiation is done via DT.

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFRx44ACgkQJNaLcl1U
h9Bhygf/ZrAsGNGMlXufnXC4Lxqiwpr+9XQbCSi/nvdknGiuHzHfVpkmV7JvCmvk
gGPzR92SoXIbsacWvKKKXeAKI7gfhc32FpPBduy9Sh7uhvtU5FHwViHildoRql0w
AqHnzhmnRxTfHN0/kvi8A0rFo2fMObJc6g6WcJmNTcYnbN10+sZts9mPHb718bW7
BmmLbZOGRMrWE5R3CkKuEKk9zK5aAIdIub2AzdAtu/4fz3Qj+w1N07QTdS9POn0k
C0tCbeCo0oaF7mKlBgWN9bGMr34JD/OuZu6g8PIDN5E82M+6Lwdyq98/S9Qj00G8
sMe31uVf0/QUf9cVpyiEy8niSGt8lQ==
=2j3H
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
