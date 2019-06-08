Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20183A5A9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1704C89306;
	Sun,  9 Jun 2019 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC90889233;
 Sat,  8 Jun 2019 05:48:37 +0000 (UTC)
Received: from chianamo (n58-108-67-123.per1.wa.optusnet.com.au
 [58.108.67.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: pabs3@bonedaddy.net)
 by smtp.bonedaddy.net (Postfix) with ESMTPSA id 10C00180045;
 Sat,  8 Jun 2019 01:48:33 -0400 (EDT)
Message-ID: <0667fc81810f2da5110c7da00963c93da90a6cd7.camel@bonedaddy.net>
Subject: Re: [PATCH 2/2] drm: add fallback override/firmware EDID modes
 workaround
From: Paul Wise <pabs3@bonedaddy.net>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <24d1a13799ae7e0331ff668d9b170c4920d7d762.camel@bonedaddy.net>
References: <20190607110513.12072-1-jani.nikula@intel.com>
 <20190607110513.12072-2-jani.nikula@intel.com>
 <20190607151021.GJ21222@phenom.ffwll.local>
 <24d1a13799ae7e0331ff668d9b170c4920d7d762.camel@bonedaddy.net>
Date: Sat, 08 Jun 2019 13:48:30 +0800
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
Content-Type: multipart/mixed; boundary="===============0022786101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0022786101==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-gCmOviOCfWkL5Vf5iN5c"


--=-gCmOviOCfWkL5Vf5iN5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-06-08 at 13:10 +0800, Paul Wise wrote:

> I've tested these two patches on top of Linux v5.2-rc3 and the EDID
> override works correctly on an Intel Ironlake GPU with a monitor that
> lost its EDID a while ago.

While testing I noticed a couple of things:

While everything the GUI is the correct resolution, GNOME is unable to
identify the monitor vendor or model. This is a regression from the
previous edid override functionality. It looks like this is because the
edid file in /sys is not populated with the EDID override data.

I got a crash due to null pointer dereference at one point, I'll try to
track down when this happens.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-gCmOviOCfWkL5Vf5iN5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAlz7TCsACgkQMRa6Xp/6
aaNqGhAAna9/HB08ZoGq/hpmTWLlR7LzL7iAV4ooRMur8rg8hSxZ4OQFewlsIkZ1
O3LveyPZJXqkc/higW/xwtnkhI4qq4W3IvwhTYwRkPiEVhnoi1wTuGlSa75mO/lt
VTDse6tRtVZGdFjs19aeIg3lslOzVfZt7GlX4XWggipQ2jvA0MY7g92OWaRsc04r
ogcN/ygzrM94m13IubI+2lFDl0AC6rAmbzjtiz5Rqwv/OzkhTZ2spJhj/ILm8dVQ
Q7B7QD6717FDShJ0M9XmqSA2M3amUIeqdDXfDns2dC/7ncZPOUYpPVZ6nbp77Mao
pLaDh38zFhEFHCf+bUl1AdNsRkFylgKRwVrV3Y/z4F76fg5wAtZ6i2zuUzxY7xta
QUT6a17irglQAxxzln+wx5hPBFxycD5dHBuxZE2WxTcmsz503ZjLSKS1lNTMrV+U
gulP3UufxJnEpOAbO6BAjSp/3rwCjCDVDZBwGFDiImbbA3E5I4g+y4SmKGiei2cn
kxcoY9DTdG+V5RI+pqKMFA+8FsmV3P8W89OyMZPbbyakug5/rCIiPO8Qebsmg3X6
87dGX7z1OgvHNaPpvnQgSyb8OlkSyn9Y/up2hoehYgtQHwkTrx3Du/hg2cmPG2E5
VmEz2jFYAI/KHB0uPIkTmX9/OqFsetoXPuaIAKiPsVVOaeTugo8=
=Kmhb
-----END PGP SIGNATURE-----

--=-gCmOviOCfWkL5Vf5iN5c--


--===============0022786101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0022786101==--

