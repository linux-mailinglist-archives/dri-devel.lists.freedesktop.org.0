Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20A35F01C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AE86E8F2;
	Wed, 14 Apr 2021 08:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EC86E503;
 Wed, 14 Apr 2021 08:52:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6D7E61812;
 Wed, 14 Apr 2021 04:52:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 14 Apr 2021 04:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wxcWEHSJyeaZ3zgmjWVlSxbwjSS
 D29C7DDdFOPNXTck=; b=UN21bEzG2nwJtyNX4HZwwV08M0DXQH0lQJSAoexn4q+
 1N1hyzwJ+68/T2T5Md22ibhz6oAmRnK4p79GvU44GKQgkNhe8/20UQ5BvoTGqE9h
 hAXfR0wFzKewygZRoglwsSrp4pKCq0gkiEcEyZHOKrAGIT5cOGOt7KAB0XIXtRni
 pJxPaWiOUvRTWIgTDUtR69xAH+MEyOBJBi/uFn41nD1keq1iyLOcIMHJkJgWQNFe
 VPNz9pSeZa1Lf0Zz/e3aSxBAp7wrV0vCWsVpviHSfJDqp/jo0zT94p+Trt7k1iLF
 Tj1HC2P+weM6Z231ouF/t/i+s556ySv9f/x+jqufkIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wxcWEH
 SJyeaZ3zgmjWVlSxbwjSSD29C7DDdFOPNXTck=; b=QZvjGWrai3d+JDGss2Q+4L
 yBBpqJZE0RZzP54r7va+pn1UTeNsW7g0Kt8hvipMM1hgVoTveE8kFKEY+T6UNEJI
 sgDrBE18B1ha0mwvWONvrG5flupF0bCvflgUTOQVYBuzJh+5mzPyeqz34dpGOWNY
 M/9LbF7bvOW8JtCYNmJYJwJZWNNrOYgIW2QUO2FjRJEMKALGhJlilh1b0zDwDrg/
 f6YB60p+fyW4MLBq0BBhWUCqQRCmxq6c0c4gLgG+tM3wF85q8M2E4Y2pjkx/PTB6
 n+Nnv2I5UUNmH6tdsLoUksrUqer2bV+KNjd+hYF/TrJhB2wZSHD5awe3MS1IfvZg
 ==
X-ME-Sender: <xms:U612YKuVrVudLiuRJgLicaSSs5l9WoI-USmMBDl9ihJeP54LN6bDSg>
 <xme:U612YPd3-ogNkzqeC-B0Gdkw6LHPJSbYewfduWI-3l-nwQdSx8ZXFYoB4vAs-EDPQ
 yDdXs1Eu5MGSHGEvYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:U612YFxWgRvaTGCeRtxXg_jp8Ap9ZvziW1G5Z62rGURboJnqXKhnNg>
 <xmx:U612YFPZW5PzFgU252mXve0cHEpUnLyZKzJ0Vnw0L9bLv808qBjs6w>
 <xmx:U612YK_eI9IfMBnRJmi1kUNUx4m0tcabu4PDQx4mzB8ZbymjdDlY1Q>
 <xmx:VK12YKy7Jz_PRWcYTzmDnSJ2HGRAlkv0pIqB4EtVhirJmyYcRfAg_Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C34D8240057;
 Wed, 14 Apr 2021 04:52:34 -0400 (EDT)
Date: Wed, 14 Apr 2021 10:52:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 12/12] drm/modifiers: Enforce consistency between the cap
 an IN_FORMATS
Message-ID: <20210414085233.npcjjkjmbnwkuxdh@gilmour>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1219150038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1219150038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vg6am4vh62hbd3l6"
Content-Disposition: inline


--vg6am4vh62hbd3l6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 11:49:03AM +0200, Daniel Vetter wrote:
> It's very confusing for userspace to have to deal with inconsistencies
> here, and some drivers screwed this up a bit. Most just ommitted the
> format list when they meant to say that only linear modifier is
> allowed, but some also meant that only implied modifiers are
> acceptable (because actually none of the planes registered supported
> modifiers).
>=20
> Now that this is all done consistently across all drivers, document
> the rules and enforce it in the drm core.
>=20
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--vg6am4vh62hbd3l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHatUQAKCRDj7w1vZxhR
xeRVAQDcfPnlaUrJorJEcAMlJ2iouxJ/rubzs7I33F0tsaxoVAEA0VPDw+WXDNSK
ugQu7Pa4w+G8x1HTeFSvwLlG5CEdagw=
=RTMn
-----END PGP SIGNATURE-----

--vg6am4vh62hbd3l6--

--===============1219150038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1219150038==--
