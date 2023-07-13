Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF375240E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24D910E6DE;
	Thu, 13 Jul 2023 13:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 98758 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jul 2023 13:40:24 UTC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B310E6DE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:40:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A69E620004;
 Thu, 13 Jul 2023 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689255621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGYoOaSKxY51onSk/WTE6QjV/NN/bIt7tTX8a5xgjlI=;
 b=X383JZ0gGwDL/C/U8WWETSLICmoHzgGyXYu96ZjJOyJIvGBWAhvNt+f866Av+DRxKd64w5
 uotKNMq5XfmJUIonHK51aAI3CJY6XgwDoI1Mpm4oTHH9s7eK6W28OOb3xWEbsRwPn898mw
 xdV/fGeJLoFCCSMbhqLHgYTfMgzBWdICdNkzKgx0E62f1ZwCotoOYXzY4guzDJ7mtS+sC3
 70c7wH/I9wVyxDqGJVG05V3Fczp/FggC3XQH3m6peBJNeymwZydq7ZCFPXv0ncSMWUr20L
 ZE242guj0U+vIvIr6HfaWgnxqDfDs3JR0YonW0+xUJYC7X2V9mZAR6am7OFsYw==
Date: Thu, 13 Jul 2023 15:40:18 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <ZK_-wroLky0R-BWp@aptenodytes>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <87v8eof4w8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mySbPAC1X1XXf4eH"
Content-Disposition: inline
In-Reply-To: <87v8eof4w8.fsf@intel.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: Sean Paul <seanpaul@chromium.org>, kernel@pengutronix.de,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mySbPAC1X1XXf4eH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 13 Jul 23, 14:05, Jani Nikula wrote:
> On Thu, 13 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > If you say you consider the idea bad or too costly to implement, that's
> > fine. But pointing to other areas that are bad shouldn't be a relevant
> > reason to shoot down this effort.
>=20
> I did not point to other places saying they're "bad". That's your
> opinion, not mine. I don't think the drm usage of the dev name is bad,
> and I pointed out drm is not alone in using it.

For what it's worth, my personal rule is to use a prefix to dev if there
are multiple variables of a whatever-called-device type, and just call it d=
ev if
there is nothing else about a device.

So as expressed before, I also don't see the problem with drm_device being
called dev, which I find a lot more descriptive than drm.

There's a general pattern that is usually applied to devices (not just drm):
- struct driver_specific_dev
  - struct subsystem_specific_dev
    - struct device

So I always find it quite clear which type of device we are talking about
when accessing a dev member of one of these. Suggesting that the name dev is
bad for something that refers to the subsystem-specific dev in some
subsystem-specific object kind of implies that it would make sense to have
a struct device called dev in that structure, which adds more confusion as =
this
is generally not the case.

So I would also be happier without this change.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--mySbPAC1X1XXf4eH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSv/sEACgkQ3cLmz3+f
v9Hjlgf/Ttt85dTaFRcNvL3DQ0Ed9boyFlvkCoJw2HzJm5BXmTi0+/PovYfn6rqR
iB22dUeh8aSqEHrrzP6BG3xz7IuADd7iB97dKTAQS/nJiZKB4JPYsIEseLb17gYx
FTj4jBURqnwLFL23HB/pM0nJrXjrxn/HmNdNzbeAI4qkda1yIWrbWjddu9zYZet9
avlHKy6FtZ6cYtzXpjXx87OHW09Iw6wE/1tPplabCPiyM/tB/cJM8aP3Yl1Il+A9
hETkRlDVKBoMKDfrAsguBN28qZn1bNR9rJODSONW/eTdnX9thWccI05STFGcjtfx
oEEk7V9lXLAkCbfRTu9rhXmmfxFYVw==
=M6mV
-----END PGP SIGNATURE-----

--mySbPAC1X1XXf4eH--
