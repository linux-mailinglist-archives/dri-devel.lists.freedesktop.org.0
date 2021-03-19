Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBCE34198D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 11:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B60A6E9DB;
	Fri, 19 Mar 2021 10:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3096D6E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 10:09:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60ACC5809E4;
 Fri, 19 Mar 2021 06:09:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Mar 2021 06:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=c1oEkHmXPfWAso63ln8XcFTTQ3O
 vn3g9cD7k3OPFdQ0=; b=NAOLUuVXNL2Y+HB5/dTjL1Irf0Q7zwqb7VmkjAb5hKh
 5CoPSzZ1gz9XkOolYWQBii4Cc/EVBIWetI9+5HdIPHQduK0Gqirlf+0dlkbDVslC
 tysl1aTKu2OIX0oRCmS/eVLCkJHDfWmM7OGA7osyfwt4sjTEOzrN+5YuObzoi1pl
 QeaVy+ueOlwcp6FD4vUX2Lxx6W/HXp5FS5sK3eJyoKqyvlIxEv2XbJ7HdJiyJFZW
 dMVo1jWGyHyLz9GTsJklGGnVbaqrTDxsxshojWtABvQyn7m139ei3DpMReogzBs5
 rEP+/PI4CXZiPgK4YvzQs8W7tc0fx0kATqmEMGcb1Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c1oEkH
 mXPfWAso63ln8XcFTTQ3Ovn3g9cD7k3OPFdQ0=; b=VIy4nxyWJnYuaFXq8OUEnd
 X60tsjbJd0wSXg2zjTCIACr4xEoEP5hQtjaE1/sXoag/cAx8HjFjW0zNGgQe1HXm
 8gzeCKvAuhwg8FlOQsWBe+iEyQzBKEkTaR+fsWuU32wjRDaT8xO9pNW8w66I5jt8
 Dr5G6eHU1ZwdQqdFLqUPP8YwFweBFT5PgI+w/rAEGVD2X4yuu+qFlgApJAYD41BQ
 wQtQ1sIuqk8sIPXfz20HjaE/vcgDjmBsJddao1HR9r2SBzotjWd6kDTR/F8gN5OB
 CyfPy/hpDi8vn25FO0ZBVct3A6//LgAWxy1FL399t8/7f1eyypae0pMxnonrz+LQ
 ==
X-ME-Sender: <xms:SnhUYEB7XJv1REeh2bGleOPcd_6w_d76l3YdmL-qsxxbb_xjM3vGOA>
 <xme:SnhUYGgWEqTuFUyepGiIVJ6XlB2mFAn39EMlWfurT6ogpvamLBrVy12hg7_jH6HMV
 VN3pBb9ofT5dCOUi8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S3hUYHlSFev33LqRxL8o3LIaczo5zTRL7XZlHv_6wodbL8zGTWBU2g>
 <xmx:S3hUYKw_nHp0L37U5x9JemlHjWNnpDOOqVeKMuTQSqk_WeRY6n5JmQ>
 <xmx:S3hUYJRoj6zVFnEKQjCZxskCdyeHnyQY8gTH4GBoR-mxmGLYpsSrLQ>
 <xmx:TnhUYIIKDD_2WTz4fzfLuhy0XgDonRumIr-sYtk6NiLVd4Ce3oOHZA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF1631080054;
 Fri, 19 Mar 2021 06:09:14 -0400 (EDT)
Date: Fri, 19 Mar 2021 11:09:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
Message-ID: <20210319100911.ckouygxo5krpc3qp@gilmour>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-3-maxime@cerno.tech>
 <38906681-737b-462a-d10d-7fb9def141d2@baylibre.com>
 <3312709.MrizLCItEp@kista>
 <18084f61-1cc6-2b88-f551-25fbccdc100b@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <18084f61-1cc6-2b88-f551-25fbccdc100b@baylibre.com>
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
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1980212745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1980212745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="22fpjkpix5fdtenz"
Content-Disposition: inline


--22fpjkpix5fdtenz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 10:44:56AM +0100, Neil Armstrong wrote:
> On 18/03/2021 19:31, Jernej =C5=A0krabec wrote:
> > Dne sreda, 17. marec 2021 ob 17:08:07 CET je Neil Armstrong napisal(a):
> >> On 17/03/2021 16:43, Maxime Ripard wrote:
> >>> The atomic_get_output_bus_fmts bridge callback is there to list the
> >>> available formats for output by decreasing order of preference.
> >>>
> >>> On HDMI controllers, we have a fairly static list that will depend on
> >>> what the HDMI sink is capable of and the BPC our controller can outpu=
t.
> >>>
> >>> The dw-hdmi driver already has that code done in a fairly generic
> >>> manner, so let's turn that code into an helper for all the HDMI
> >>> controllers to reuse.
> >>
> >> This code was based on the capabilities of the DW-HDMI IP, copying it =
as-is
> >> doesn't make much sense, we should be able to filter out formats the H=
DMI IP
> >> doesn't support.
> >=20
> > HDMI standard has pretty strict requirements which formats should be=20
> > supported, so cores should have very similar capabilities.
>=20
> Yes for output formats (we still may need to filter out 420, 422 for exam=
ple),
>=20
> No for input formats, since it depends entirely on the capability of the =
transceiver
> in terms of format conversion.

Yeah, of course, that's why I only moved the output part to a generic helpe=
r :)

We indeed might need to provide additional filtering to the output though

Maxime

--22fpjkpix5fdtenz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFR4RwAKCRDj7w1vZxhR
xU8VAP949yMAPUOClQtftpssbr+EWXjQY08DIzfUu6gXlLYEWwEA3ci+mwXM6xN9
YkHJCJxWxZuHJdifsxe7UNT3iCpHTgw=
=x1Rc
-----END PGP SIGNATURE-----

--22fpjkpix5fdtenz--

--===============1980212745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1980212745==--
