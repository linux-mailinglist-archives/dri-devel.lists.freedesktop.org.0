Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADC1E3E0D
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 11:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B62989B68;
	Wed, 27 May 2020 09:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B26E89A9A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:51:11 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B3520B80;
 Wed, 27 May 2020 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590573071;
 bh=0vToCKDKiiwhvCQ/ZH06T4deAF0FOse4LBq9EGr0Hdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVI+eY/sUvYRSX+c+Adp5mbuGsFalnf0pXTPCNoiZDzr18dCfz9a0UVW1SQjVdQOT
 +GPqBAiQlp1MZCLnbvrTSC1VicjdfKmeCzHwVVwfMOOVW1nCw1H+fYqzrff1b1L/MY
 tRakSOtkBjQYqVrvvfLbmRmqcEhRvThMG5/cDsK4=
Date: Wed, 27 May 2020 10:51:09 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
Message-ID: <20200527095109.GA5308@sirena.org.uk>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
X-Cookie: Drop in any mailbox.
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 airlied@linux.ie, mturquette@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, sboyd@kernel.org,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Content-Type: multipart/mixed; boundary="===============1317695714=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1317695714==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 03:27:32PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
>=20
> in l3gd20 driver startup, there is a setup failed error return from
> stm32 spi driver

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OOAkACgkQJNaLcl1U
h9BjiAf9Ffv3ggcuNoWfvMQqMqMQaCF/81yq+JEuOCOw+nSFwBift/d6Q7Z7HWCh
k0/gPFT+7ED90XyQWUYuDOrUuQWiqQn8UP5p2IhQDAbvY9Zr3jnDTScTPx4FSf9m
xGGbKV0iWy7z78mHngcLf++zQtDzzZLjhK+U4CxVz5htfuOkTdDeIorLUZJnYdBH
tZKEYJ92tDX3perBnTRtca5zIEIo7JWv6ITSh6UTFELxx0D44W6NOS7z2W3kZ7HO
KeUa7lsUfxWs5hF11j959HVj5BG0CFVa/cA4o2dGd5aaDwXjeASUzngGM0DqNPhY
KPzFjTZ70Yj4eNCZVnKrXNGoe9KAoQ==
=8sEd
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============1317695714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1317695714==--
