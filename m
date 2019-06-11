Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8871941CC8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DAF8925B;
	Wed, 12 Jun 2019 06:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E78916B;
 Tue, 11 Jun 2019 08:28:26 +0000 (UTC)
Received: from chianamo (n58-108-67-123.per1.wa.optusnet.com.au
 [58.108.67.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: pabs3@bonedaddy.net)
 by smtp.bonedaddy.net (Postfix) with ESMTPSA id 049E5180045;
 Tue, 11 Jun 2019 04:28:22 -0400 (EDT)
Message-ID: <ccbdb69d48c02f5622e3024023c34ab109c7d21f.camel@bonedaddy.net>
Subject: Re: [PATCH 2/2] drm: add fallback override/firmware EDID modes
 workaround
From: Paul Wise <pabs3@bonedaddy.net>
To: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <87blz5zsy9.fsf@intel.com>
References: <20190607110513.12072-1-jani.nikula@intel.com>
 <20190607110513.12072-2-jani.nikula@intel.com>
 <20190607151021.GJ21222@phenom.ffwll.local>
 <24d1a13799ae7e0331ff668d9b170c4920d7d762.camel@bonedaddy.net>
 <0667fc81810f2da5110c7da00963c93da90a6cd7.camel@bonedaddy.net>
 <87blz5zsy9.fsf@intel.com>
Date: Tue, 11 Jun 2019 16:28:19 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.30.5-1.1 
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Content-Type: multipart/mixed; boundary="===============1311488647=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1311488647==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-c35UfbQyP6uwxguJIFrZ"


--=-c35UfbQyP6uwxguJIFrZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-06-10 at 12:32 +0300, Jani Nikula wrote:

> Right, I've added a call to drm_connector_update_edid_property() in v2
> to address this issue.

Confirmed this fixed the EDID override data.

> Can't think of why this would happen; the backtrace might offer clues.

Unfortunately I wasn't able to capture the backtrace.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-c35UfbQyP6uwxguJIFrZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAlz/ZiMACgkQMRa6Xp/6
aaME6xAAgQ6HaPss/vW7UEEznsB75s56CHKChyKyQQL0gGi946fDAuXF/qMePo6j
+Y30sLvl5AoyQZPt6gWxIz97hrLnW0HgbI3ojlg+JwdpC4dwfpmJn+XnNwxf3Vh0
Eo+uVnDqvckqY0IcOjd+Mfzn1z5rMY4tB8MjB714Cv9SXVnsIQzPClzfHXUOZOTN
qTqYwEQJLbTRcQBh5D3ZXddy/Qzya9LJTvVXoLbw54whqXpXX3YzkMYBXozMjnT8
uEzogm3wPrlcZLr/3tPEn8oHqHKbuqrz2HBb4CY9PjMVQnIDihWW1rtAO41wWaxI
llRjcmhxt8zb4LNMoQM6Vq2cFQmRL9LWkhCoLBXTPkazuj+IQCbIwPqSJL99Tkr6
C8Kdu/9OVPB/9ENAEOTTqs6ftYoLeJPghb6Oi2QOSZtvmyVDI6uJ1A3SwhUIbD7u
htZF9m7N8wktL/rjlQKhXexYGdVju4Ap378jABnD6JVUlTR/RspGLAUcwN3evZeL
FrUYfvapmb9MkSYDguz3rYaWCtuOM1P9WEELsA6fae+pFQi5v93sm1ndpEC99l3X
pZ61zsoFgltd0WDAo2LKwyIrc05HGrwMbeh5IDvNzSldBZiCZmnxov5S613ZYq9o
IcSrRHtphDdhsc1vnuxZUsUoFzduCdNFYOCNxbPCSVppqMQKV20=
=SE3Z
-----END PGP SIGNATURE-----

--=-c35UfbQyP6uwxguJIFrZ--


--===============1311488647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1311488647==--

