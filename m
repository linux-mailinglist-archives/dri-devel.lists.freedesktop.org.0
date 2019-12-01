Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1910E69D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DE789FAC;
	Mon,  2 Dec 2019 08:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2129 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2019 00:16:07 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57239899B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 00:16:07 +0000 (UTC)
Received: from fw-tnat.cambridge.arm.com ([217.140.96.140]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ibYs0-0000D8-V7; Sun, 01 Dec 2019 23:43:17 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id F39EAD01F55; Sun,  1 Dec 2019 23:43:14 +0000 (GMT)
Date: Sun, 1 Dec 2019 23:43:14 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: Avoid duplicate -supply
 suffix
Message-ID: <20191201234314.GB1998@sirena.org.uk>
References: <20191130150958.5AE2668BE1@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191130150958.5AE2668BE1@verein.lst.de>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 02 Dec 2019 08:00:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y+YocW9orHvV9zikoLObuAfWi6xlRkM1P7X3xHWkE6o=; b=rQRagpSPPkWnw25pYnEUpkSzP
 Qv80O0dT6QvXfI8sqJv6+RZ8IeCdJ9aIasfzSfO/MG70fcQry5gHcFhh0RBnNsaqi4toMQnkfOhN5
 bLR3osmW55V1YLew+er8HTttNkTrLfzWkZRz+GoHH9FK/wMzlRm5P2+FoEmmIL/e+BPK4=;
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0427933905=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0427933905==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 30, 2019 at 04:09:58PM +0100, Torsten Duwe wrote:
> of_get_regulator() will unconditionally add "-supply" to form the
> property name. This is documented in commit 69511a452e6dc ("map consumer
> regulator based on device tree").

Sorry, I meant to also say:

Reviewed-by: Mark Brown <broonie@kernel.org>

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3kUBIACgkQJNaLcl1U
h9CJJwf/ZxLeDNnXDabQ8Ss//w+jap3oTWDLJlQovAiaGTbGkTh73eZMKUIxsgeh
1R6v/i/w+IEa6OjRmD6hrjo5glFG+IWiXaVzQQ7MMm0xmzCnTSLHyyzAxcXH2BM3
jsNEshH0/UaWgeHK1Vt2yjRoiZnvB1CzMdVsqJuKC5mZ7OBBsscMk0YYvB9TQRKL
pNGGnxrrevoOnr2Hgl/EPfT8ErwuZgqSfKJWdHK00sIRaKsNzWrZSaQ+mpVhsvoX
7kV4cxWtgTD4GUNSZBUjON31LYtgMqQf/k5UUAqpUFlXy9m3Crt/r4rBy3ghQVfy
i5VFhJsCQBOCiWKLYf3RxixrpxwbAg==
=ildJ
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--

--===============0427933905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0427933905==--
