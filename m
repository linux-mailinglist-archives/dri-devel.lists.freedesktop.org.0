Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164E3A5BD
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2A189362;
	Sun,  9 Jun 2019 12:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13B891FF;
 Sat,  8 Jun 2019 05:11:00 +0000 (UTC)
Received: from chianamo (n58-108-67-123.per1.wa.optusnet.com.au
 [58.108.67.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: pabs3@bonedaddy.net)
 by smtp.bonedaddy.net (Postfix) with ESMTPSA id C49E6180041;
 Sat,  8 Jun 2019 01:10:54 -0400 (EDT)
Message-ID: <24d1a13799ae7e0331ff668d9b170c4920d7d762.camel@bonedaddy.net>
Subject: Re: [PATCH 2/2] drm: add fallback override/firmware EDID modes
 workaround
From: Paul Wise <pabs3@bonedaddy.net>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20190607151021.GJ21222@phenom.ffwll.local>
References: <20190607110513.12072-1-jani.nikula@intel.com>
 <20190607110513.12072-2-jani.nikula@intel.com>
 <20190607151021.GJ21222@phenom.ffwll.local>
Date: Sat, 08 Jun 2019 13:10:51 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.30.5-1.1 
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Content-Type: multipart/mixed; boundary="===============1058750152=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1058750152==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bpYT9ku/9oKoEROB5ndj"


--=-bpYT9ku/9oKoEROB5ndj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-07 at 17:10 +0200, Daniel Vetter wrote:

> As discussed on irc, we need tested-by here from the reporters since
> there's way too many losing and frustrangingly few winning moves here.

Tested-by: Paul Wise <pabs3@bonedaddy.net>

I've tested these two patches on top of Linux v5.2-rc3 and the EDID
override works correctly on an Intel Ironlake GPU with a monitor that
lost its EDID a while ago.

I'll test that it also works with an nVidia GPU & noveau drivers later
today once that system is available.

https://patchwork.freedesktop.org/series/61764/

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-bpYT9ku/9oKoEROB5ndj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAlz7Q1cACgkQMRa6Xp/6
aaMi+Q//UJMU9LZGRUgS7CLCu9aZDIbXy5nZ9tGjVhJKxx/mHsfFRsxMIrxBt0pV
bisxaCn+zL8aqY/vWRpNL/EdHyl7R5pSmpxuOrKb/GX0vBk9bO40IwEJu9QdHWgQ
oL0TXkUAHa4erVFNJIqQ/+Zm6bXjlD85rpRGFqaPffhHxD5gdwmZh0nd2kEjIC3/
zlpdfE6Ip5vxLUzFt0hwcqmbSLp9YHL+XlGySwV27aG3HucVxp6eZl8hms3q/GPk
0PTpfZfZRVb/u3DIoB/hdgMn0RiKPdoYJ7/QT6g2mhA0gvK36mdz/0LAOhG5BstZ
LhKHTJZsZWnEBk+i5hkGbNGnPmfaCrG5H5qnl2u6Zi+illfLQ1P8tRbN9iRL2YVp
9l2d2CRCqcq42ANglgjXNS46DlnessW9JWY9GBph4n6RWm4WPHL96H8swpLClCWV
4PJOG8tLGfcATGdEZY42Id8VYTA+csEwe1GT7MaP4/gqbBqcuLoa7xwAdmZZV/H/
mxcwWuf6uyUIFXR2UDNFySw5g6Z+OLduVoKwj7ZZIbqcGyIlH80eq4jEUnfoliP0
P9kk3OD3/QWOfEg0ImFFqRR3v/yAvc71aj4oTXmg4HM8O6OnUaVsdE83AQxPv9/f
gWYMxt+yVPNke7cNyMqxa88dN1664HH0yxU0MldnySf0ST7hD+E=
=hCLl
-----END PGP SIGNATURE-----

--=-bpYT9ku/9oKoEROB5ndj--


--===============1058750152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1058750152==--

