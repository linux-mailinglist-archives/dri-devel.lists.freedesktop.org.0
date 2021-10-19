Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8C4337FF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 16:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CE66EABB;
	Tue, 19 Oct 2021 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847066EABB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:04:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D490F5C0258;
 Tue, 19 Oct 2021 10:04:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Oct 2021 10:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Dglbe9JCz+OBBWlXCLJUoWRjkcA
 yLH9jB+jNJFQLhDY=; b=mD52oCp1pSkcRJ3+Jr+xXKf2d0X0hKs2lHFXZyVK1LY
 XAoC8HtRBxoeCXg9jF8hLPQacbsajllqtq1XrSqb4UaPpq0ARuZUMOFAxnenAb7m
 jVu2eGxjIMSjnwfR3+gDNaDPx9LTMaAt+mPX31orRR/QRyXYxIlC7Xo0oqkWX2EK
 qgHQExz0F7amWWyEdetQBHzOrwMAfrgyJ01yz1iJiVAcIGIv4Z6HShHAuGmKbklp
 VP5sRMFMO9ow2jioLx3CPaY1U0hSNRGHK3wPL7ljx2yCM7SoJ3CYCj+PNZgIOOYN
 bc76OGi4G6jfDtW0fInanyY4sCd3ihPFM6jYiwrkevQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Dglbe9
 JCz+OBBWlXCLJUoWRjkcAyLH9jB+jNJFQLhDY=; b=PqfdZ1UM8M2dcEQZ9gws54
 q4TIcgyoKic9VS0Om4LBrfncjyLGCtXTlYkO4hjWvVmEYa79e2ptDbYw0DCcJ3Os
 Edd+kVHPGCNbpbRVUleA0q+p+Vjg7qg8QYCMEiTbWhP4NxAqbAbRLPfni57m3z9a
 jmxAElttLtbYb4G5+IsYYgy6q7jlOpPedSUzRDxmquCp7XACeUkbEMtIZ/LmQagD
 7kJRbeZsXrMCtHLwm2WocDyMnT1uqGjuu6KU6U33PLVorTX1IND4J7YlUGbQfA91
 bzZHFYjT3SXIv/C1fMMOLyr6wwYf0RIUMjdt8fbjXhM3+//wIQ5tLekJZyW6C4mw
 ==
X-ME-Sender: <xms:adBuYQBHs2Cs8MlpvOkz68egbF-XB4ZgJH1gyV0HMKhgfy085GmAqA>
 <xme:adBuYShXFfqxK1iBWzK390IwEk5F-nOwBEGOMdB8IQBSNwoaXJDHNSBG45C6_lGyL
 KM5dip2tVUwNDauaUY>
X-ME-Received: <xmr:adBuYTlkpKe6zwmik6X_rT4sy0401evkSxonT-dyOvXhThDc6G3kDqJ4qoCoKbU3FM6vhQKyb6KH1KyxKSqb2Rpg3KBZkbQTxwp83aXW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:adBuYWxOeSpIbkWQ6Lp0YETg2skvQ4fRl0ItdT4csd4oPUB8JxOE7w>
 <xmx:adBuYVQw70FicCru9zgsRGyBHTKawuOI7ZKMic67NNJxehpZx9nmJA>
 <xmx:adBuYRaomd43eYv_HivXqUvt3_1x_YI1azzAzlr2EtwbaVlZ1PTr9Q>
 <xmx:adBuYQd0yPPXO_CQzuItdi-qWQuEgn_kWV4GOde0ugbqR-swptrAuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Oct 2021 10:04:24 -0400 (EDT)
Date: Tue, 19 Oct 2021 16:04:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <20211019140423.k4dlamfwnzmrmbob@gilmour>
References: <20211018084707.32253-1-contact@emersion.fr>
 <20211018084707.32253-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ua73y7a33bocpc6q"
Content-Disposition: inline
In-Reply-To: <20211018084707.32253-6-contact@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ua73y7a33bocpc6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 08:47:30AM +0000, Simon Ser wrote:
> If an hotplug event only updates a single connector, use
> drm_kms_helper_connector_hotplug_event instead of
> drm_kms_helper_hotplug_event.
>=20
> Changes in v4:
> - Simplify loop logic (Ville, Sam)
> - Update drm_connector_helper_hpd_irq_event (Maxime)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--ua73y7a33bocpc6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW7QZwAKCRDj7w1vZxhR
xQmQAQD4drodX/1a9vuqFr/FiIqoT1+YOsM7ewyLZoXaBFtPUAD+Oqo1+YxnpelN
GUSEwozSEv2VyYiHhyIhp4Bl/t231Qs=
=k/16
-----END PGP SIGNATURE-----

--ua73y7a33bocpc6q--
