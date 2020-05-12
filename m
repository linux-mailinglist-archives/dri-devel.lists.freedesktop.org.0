Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE31D0BA2
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD296E9C9;
	Wed, 13 May 2020 09:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 12 May 2020 16:32:27 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95BB89F07
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=DneXZyNgduTx2SLCBr8A9YLM2Qwt
 eKTZ6HnNLlcUNt4=; b=V/YZAt9kfF1+byG7Ty1CxFTntMrWURjcLXX/5tUetQCZ
 NxvS54NB7Jx6xl6TupFApmFpv8/oy9n24w6wm4IEG6wUF4Ssg78wZa2ZStW3t2ZN
 xsIQHQgzE/NiFH7NErumXzAa/K80ujoeFnZ0BfMp72pcWk7+J7T8EORNU0czwho=
Received: (qmail 3009102 invoked from network); 12 May 2020 18:25:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 12 May 2020 18:25:46 +0200
X-UD-Smtp-Session: l3s3148p1@ufF06nWlYsggAwDPXw2aAE67cgFBY+HL
Date: Tue, 12 May 2020 18:25:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200512162546.GG13516@ninjato>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
 <20200417101446.GB3737@dell>
MIME-Version: 1.0
In-Reply-To: <20200417101446.GB3737@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1395533467=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1395533467==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5UGlQXeG3ziZS81+"
Content-Disposition: inline


--5UGlQXeG3ziZS81+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 11:14:46AM +0100, Lee Jones wrote:
> On Thu, 26 Mar 2020, Wolfram Sang wrote:
>=20
> > Move away from the deprecated API and return the shiny new ERRPTR where
> > useful.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/video/backlight/tosa_lcd.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Applied, thanks.

Thanks! I don't see it in -next, though?


--5UGlQXeG3ziZS81+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66zgoACgkQFA3kzBSg
KbYypBAAm3XnZir6qWFmr4Qj+5zgB/2ULqZE2wKu+zzkI2XF+aRrZbsYLcKdS/Vr
HFdO63UIyU+G2pm+5lxGpbusoi6UxnMJaYvxhlSLaj0PZIG4UKVnIdfRpeTiSXlG
7kV5Azbjhj1lecmgDd0vNhMMkOBDms8/UqUdjshWLl+Nq8z2z+M7MqndXzoNZIW1
mEkQ2+/Myls16BimytTzH5lSTk2LEjL+8GNfIYSj7HOvb4FHuSLg5oZSNfdIuny7
9Xrhh4C18ZZHlCVpauJu7zpuUcvwhoxUBvU1T8wIHXrVqOBUGSzfBk/3hZ1k2wiw
QtBBJZ2z2/nhYINxJ8YQdD4cwVUvTVft9iXfzNTW3o6gD+YTJnhTwjmRrQcYfZC7
Phs/lID6bgCaZDjBED4xZASvQCiDIG0g7SDQlT5sM2Viydy8y3XJvCYasDWcOaxL
zBg/pRgr3099DtdgHv4qPn5lJwz48DRYWISiiNuJmtSxDuFYavAYe8Cbt7i8KYc6
GF26HlYJh+g1h3E4EzjOmHfgm5s9tPU/Tayxni9OlgjUnPYuuWA8vqBLd6qUbP4Q
LpBt75bPUbNlD+HYzq7LwDiUdfrm/Q4WycK/VSk1Xejh4gfclg9uUjSey+oj52Rq
v7NQALUhYKWB+CHGz0w7WkZwalpZtRNA/j4yhEXEz4d0nTUaA7M=
=+eIt
-----END PGP SIGNATURE-----

--5UGlQXeG3ziZS81+--

--===============1395533467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1395533467==--
