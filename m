Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A81AA0F
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 05:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8C89B38;
	Sun, 12 May 2019 03:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978E289B38
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 03:08:09 +0000 (UTC)
Received: from [61.200.20.122] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hPeqL-0002Hd-AR; Sun, 12 May 2019 03:08:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8994C44000C; Sun, 12 May 2019 04:08:00 +0100 (BST)
Date: Sun, 12 May 2019 12:08:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: Applied "spi: Add spi_is_bpw_supported()" to the spi tree
Message-ID: <20190512030800.GA21483@sirena.org.uk>
References: <20190415085333.EA6241127A64@debutante.sirena.org.uk>
 <e87abf19-4616-01e3-5bca-5938dee39c63@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <e87abf19-4616-01e3-5bca-5938dee39c63@tronnes.org>
X-Cookie: HOST SYSTEM RESPONDING, PROBABLY UP...
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKnm5hvg394nlR0c5YqQ+wBgSMAh3RXuZ9+NRyGIqhk=; b=iPcT9ILbl7IYYCE///oan8iMC
 roYn1pPvaw0+p0a5e4LpWF1bWIqYc4dZNpGrmA6ZRFjh2O97FKQK/s9gcipqyRaGZPAxnZEN2+IOm
 /Zcv2LPSTs48HMbSKZ018sqhE7eSbR5cxBTvXjsKa9WwvoqdvkuOj2wBB0zTUVDL1AhRY=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1099525566=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1099525566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 05:50:36PM +0200, Noralf Tr=F8nnes wrote:

> I can't see this in for-5.2 or linux-next. You also gave me a topic
> branch for this, but I wasn't able to get an r-b on the drm patch in the
> few days left before the -rc5 cutoff in the drm subsystem. This means
> that the patch didn't go in through drm for 5.2.

Well, the graphics people can still pull the signed tag whenever they
get round to reviewing stuff.  The patch should end up in the next merge
window as well.

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzXjg8ACgkQJNaLcl1U
h9AWnQf/YSKH6Ojax+mi/Qg2E/gJA3mB9KtuTNWX0pU3SWbflLTEYQF3Js4fKT1m
yAWx/SPN/vkrbgzZvrqmn7N0YCba4OQlIdbXd7MXa9lfLMS3zT749gE1jxJXp3GH
yEg5E3nJfBbPAHELXFWKJvEQ1/PhUVUvzGtIMI+TgqUxlbWx4RjyD7jEzlNG3qur
vWCx7TWLX7++30cR82sAdF35fTQWL45AOFQujXEzaA7CXdR68A/ez4kM8lCuK1Qm
m+HzPhWN85pcgG2LAlMvovd86IHdTLFZ2WBZv/bDzG31Xn77dH1Gw8jAaViM6sST
a1+FeaRHSfKweF8l50b4qYoQQGPuIw==
=5dFD
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============1099525566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1099525566==--
