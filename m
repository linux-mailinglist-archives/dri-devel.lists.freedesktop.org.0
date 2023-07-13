Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77A751FB6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 13:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7610E677;
	Thu, 13 Jul 2023 11:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F7510E677
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:17:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 846E160C4C;
 Thu, 13 Jul 2023 11:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776FAC433C8;
 Thu, 13 Jul 2023 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689247067;
 bh=HqaIeDQ+3665Dtz59up57HXzB1pj8dJE+Cp43GbEhqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hONLq0mbnmqZWeiAAWWIiZpQK0l/v3ILzNEFzTB0yoSjK2vo9wK/9YSDLssjN6tf9
 2BiLLX9mjwFBkGwIykZDL7BwJh84at+Mt1kULfl4R8Gz2i4jXaw2wQSinXMG9fHgvv
 lJXRJATpE6T2m56yU7XRo+bhPq1NiuZ87267mfYqhZvsFk+dXF5m9oMPUk3fibLhif
 6JRYxPDLaqfnMlHcmjUmCJKQEoRG7AhglEeotbfTZEDAYtrQ/+xyuyp/friTp0RsG5
 dwBl2Lg3dKLBX+6cU05UBSaqowAZ1a+nyWsfsSpohizTxB3AXsWSAAf01vm5zCQfkV
 l8dRsMwF+vLKA==
Date: Thu, 13 Jul 2023 13:17:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7w2fmwott5ttnbp5"
Content-Disposition: inline
In-Reply-To: <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
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
Cc: Sean Paul <seanpaul@chromium.org>, Julia Lawall <julia.lawall@inria.fr>,
 kernel@pengutronix.de, Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7w2fmwott5ttnbp5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:39:40PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
> > On Thu, 13 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de=
> wrote:
> > > after most feedback for my series "drm/crtc: Rename struct drm_crtc::=
dev
> > > to drm_dev"[1] was positive in principle, here comes a new series.
> >=20
> > I find it obnoxious to send a new series within 24 hours of the first,
> > while the discussion is still in progress, and it's a misrepresentation
> > of the in-progress dicussion to say most of the feedback was positive.
> >=20
> > This is not the way to reach consensus.
>=20
> Let me tell you I didn't had any obnoxious intentions when sending this
> new series. I honestly still think that the feedback was mostly positive
> to the idea to get rid of struct drm_device *dev. Most discussion was
> about splitting the series and the right name to use instead of "dev".

And then you have a former and current maintainers that tell you that
they'd prefer not to merge it at all. Ignoring those concerns and then
sending a new version right away is, if not obnoxious, definitely
aggressive.

Maxime

--7w2fmwott5ttnbp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZK/dVwAKCRDj7w1vZxhR
xV6IAP9bYwVHxHGS+8ML0Zftf3L1hRbLiAmP7JQo/Bt8uzqO9QEA5LF2INvIWjqg
02+AaJyWjL9sEszkKdXeoLA2fJSBNwM=
=csj0
-----END PGP SIGNATURE-----

--7w2fmwott5ttnbp5--
