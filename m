Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4417532A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C010E7CF;
	Fri, 14 Jul 2023 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8D210E7CF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:11:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKCxY-0005DB-0v; Fri, 14 Jul 2023 09:11:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKCxU-00EIO8-Gu; Fri, 14 Jul 2023 09:11:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKCxT-004kNA-SW; Fri, 14 Jul 2023 09:11:19 +0200
Date: Fri, 14 Jul 2023 09:11:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <20230714071119.vtc2sqrscrfixj7s@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
 <vnn7b2vk76j4ooccelibkbkblduz5uvjryzfi5vmseljxl3dhq@5ckosntec72j>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dd3e5jxajyoqj3mw"
Content-Disposition: inline
In-Reply-To: <vnn7b2vk76j4ooccelibkbkblduz5uvjryzfi5vmseljxl3dhq@5ckosntec72j>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Sui Jingfeng <suijingfeng@loongson.cn>,
 kernel@pengutronix.de, Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dd3e5jxajyoqj3mw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Thu, Jul 13, 2023 at 05:47:54PM +0200, Maxime Ripard wrote:
> So, on the record, we have 1 drm-misc maintainer, 1 intel GPU
> maintainer, 1 amdgpu/radeon/dma-buf maintainer and one former drm-misc
> maintainer pretty much against, or at best skeptical. And you don't have

So now it's proven that the people who at the time when I prepared the
2nd series have mainly criticised that I did the crtc rename in several
patches instead of one are pretty high in the food chain. Yes, there
was a strong "no", but the others were (at that time and in my
understanding of their public mails) ok with the idea. So I still think
the suggestion that I ignored concerns isn't justified.

Today I'm not convinced any more that sending an updated series was a
good idea, and I excused me for the misunderstanding it produced.

I experience your mail that underlines your allegation heavy-handed
without considering my reasoning and excuse as aggressive, too.

I'll put aside my effort to improve the drm code now.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dd3e5jxajyoqj3mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSw9RcACgkQj4D7WH0S
/k5cFwf+IltqqL9itAETgJg8XQ4ke/GvZYWypJuK09QxxTg6cVXWjNV4jb3W/H4i
aNV2OMaBCvrPsKP0bTLibAQRSmSpdPm3bPCuUAdjr7Bh7xMOI4Ab+s1L4mpE/X+9
sHqnEnF2KL0gQQIJKMlTlSBxwdYB2roccPBwg4uO73pvmDqSqcVFZ/MnduWBhiJ0
/rKbD99UXg7I4uhy3XaWyZOW4MaAoJlgF27WrUaTYZiiC0551H6wC09l7FTXZGdY
E3HmuijwczIrEtwCoEf2IjcfeMncGuFptgq86NU4nAng3794wlKcrE50OYZ9uC71
X5jKSWS71d0jhwHzrzAMMR8+cJHzig==
=CM77
-----END PGP SIGNATURE-----

--dd3e5jxajyoqj3mw--
