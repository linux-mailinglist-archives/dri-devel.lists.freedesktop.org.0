Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177010E40D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 01:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882989CBE;
	Mon,  2 Dec 2019 00:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3603899B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 00:16:08 +0000 (UTC)
Received: from fw-tnat.cambridge.arm.com ([217.140.96.140]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ibYpN-0000Ca-Q5; Sun, 01 Dec 2019 23:40:33 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8277ED01F55; Sun,  1 Dec 2019 23:40:31 +0000 (GMT)
Date: Sun, 1 Dec 2019 23:40:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: Avoid duplicate -supply
 suffix
Message-ID: <20191201234031.GA1998@sirena.org.uk>
References: <20191130150958.5AE2668BE1@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191130150958.5AE2668BE1@verein.lst.de>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzi/0JJQQWaVU1jcJ/FHMVwPw63CkT0tSF8a4M/WpKI=; b=w//aAh61ykZJRZbxnd8CmoIhW
 p2JR2v/QwtrthyiP/QKtOPlzIFJlp/Xs+eJ6XIRFTI0sHzE+fDi07Z6puZhoKrCs1BW5j8VV3yaMz
 gXq9z1d3bQz0rBXMzjBQ3cY8Yao3a10qq/b1x+VtL4rjn7sZSaAk9b0qSRqQHCUwe0iwU=;
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
Content-Type: multipart/mixed; boundary="===============1290685027=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1290685027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 30, 2019 at 04:09:58PM +0100, Torsten Duwe wrote:

> IMHO that commit message should have ended up somewhere under Documentation/.

This is documented already in the generic regulator bindings and
has been since they were added, they specify that supplies should
always have the suffix -supply.  The commit you reference was
part of the initial merge of the device tree support for the
regulator API.  Including the -supply suffix in the name used
internally in Linux would create problems for all other firmware
interfaces that map names differently.

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3kT2wACgkQJNaLcl1U
h9DDnwf+Pu8HsFTRHn+oQCC+CTUDGly0rUOkON9gxYo9aEDHqQPMiq6ngu1/h149
EXOP+pB8emR0Ex6mEY9o6pzHIi7kd2oyFef34iX4Q0rIWI8YHgQ4BWz4YU9Sotuf
46BC2XxkqJinJu5pjSC4vvIuj/FEWAokCdKewGlpX2oxtrGBMqQv59U+Mvd4FIEt
V5ZcAEJmGOnWWTtX355KX2MeZQLMsOnwFwn5sUNeothUZ9AnZFu3C2SY63OZU/nB
P7cI73jRH7FocF+nnKX/wxycR6vWUHKQIY63Etd9ISN1V9oS22vguWqK4AXoUHdT
EtzXryMuWTCMeQVHRRKH+WtxOdHCCA==
=HbWV
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============1290685027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1290685027==--
