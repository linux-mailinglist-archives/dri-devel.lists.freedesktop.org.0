Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E022F2300
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A2089B3C;
	Mon, 11 Jan 2021 22:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2189B3C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:57:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 548D222D05;
 Mon, 11 Jan 2021 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610405842;
 bh=nzNVDGYlZ0ANJ9Ze6s99EXMBaVbaaDlMYSL8SmAM23k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bE8DaDDgTN2MlqeQGHEW8Y1Zif7rWCpljBu28v/980ochKlm9hxHq7A29S0GwD2zM
 j7LzXVKB/7hCNfqC1S+0yEIYSyW1/YoJJ7RuOhwc/GCoKm6v93vh/caFfHLfQAYCRt
 jU+w6NI4nBhHH98cJTVyMe9NU79TvaCVjsV8AUP99pFTGEW6JtAwDjrlo5/LpWEeT7
 1wqTFiaQ2XRLVbxj9iQTuxGLhNb/TRXMVGaW1GaCKe2cdc2LTLnVFCRL3co+RVnYkF
 UlMSQwE3zgWUc946cpJ9O+kYsu8fKokuqf7ykJ7pQr0wosyosC1g7gfAMvdQrmA4YC
 kDgJZ35McYbUA==
Date: Mon, 11 Jan 2021 22:56:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8] backlight: lms283gf05: Convert to GPIO descriptors
Message-ID: <20210111225650.GL4728@sirena.org.uk>
References: <20210110120926.80471-1-linus.walleij@linaro.org>
 <20210111161930.GA3575260@dell>
 <CACRpkdZoSdYss71McN-wy5NSDE6dnonzSHmrNdVkaLw7qmS6QA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZoSdYss71McN-wy5NSDE6dnonzSHmrNdVkaLw7qmS6QA@mail.gmail.com>
X-Cookie: Too much is not enough.
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
Cc: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: multipart/mixed; boundary="===============1492024001=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1492024001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fDERRRNgB4on1jOB"
Content-Disposition: inline


--fDERRRNgB4on1jOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 10:40:46PM +0100, Linus Walleij wrote:

> Mark, can I have your ACK for deleting
> include/linux/spi/lms283gf05.h
> As part of this patch sets?

Acked-by: Mark Brown <broonie@kernel.org>

--fDERRRNgB4on1jOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/817EACgkQJNaLcl1U
h9Ck8Af+Ko3OmqgKQgxNpdnWd4y6vSp0OubqxCx8sTfI8Sba+Cm2BJb2L1xP1f6c
9rVYlI5Tm4DoaV+I/kAFmR3z6jrDK6TdG5uxmEXUp177uJr4HOtmXQKJBirbEiDI
IDwQ2mxibfSPJ9lu6G1f97oERseGjlew3DJRnU3tfDU1zLNCairJClwT4t1N9DxR
BrRp5fpH0PKJuZeWdZeT17gR4XkgyBhfcgNDprXFsaermaxYCWvZD2g3HUr1Sn4x
fNSSmHjQzrwMymsky4Sc2YLKkrw61mI87PhAMToUjggdUgqUafMVXCM7Yiz4yw2A
UtEEDSyyzbTvhFd5huDYVdFRY+yPIg==
=HLM/
-----END PGP SIGNATURE-----

--fDERRRNgB4on1jOB--

--===============1492024001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1492024001==--
