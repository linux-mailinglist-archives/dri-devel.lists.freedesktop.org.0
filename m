Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8935AA983
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD7910E7A5;
	Fri,  2 Sep 2022 08:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CE510E7A6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:08:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 27D515C01E1;
 Fri,  2 Sep 2022 04:08:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 02 Sep 2022 04:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662106102; x=1662192502; bh=oXx8G2C70O
 6z7Y/AAZDRV0BkSeYx27XRk/1S/V+785o=; b=AoNigvqd/+Gl1lrbqAJj3zRlf4
 Uz+mv5mzgXm5dv6SnTveWgJEojTFNdY3TgmnvZO0vUzy9ewsXpJ2SHyfVA7L6xG2
 9uXzBJh8xCZItDt5VMInEky88lFLt+kCHzZtW/dhkoUTmVFkJKllnNWbw4BODecl
 BORICHIGuoWFWHYavNu89rTZMAMjuljt0KD9bHABb8ijEVdoQ6haqi97J56RbQJe
 4FNRn59X/EjKlmqM4B5pYidgzaAfoIrpfYOMg3DGeJaKnwKDJTgM2JSh4Z4B0WTx
 zUJaIekrZltZVUMU6Vqu+FB3NjFbgnMZ6C2dUe7eP6ZGpfqos72XhhgHuIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1662106102; x=1662192502; bh=oXx8G2C70O6z7Y/AAZDRV0BkSeYx
 27XRk/1S/V+785o=; b=zmrjfZ1MPWS1YUuIsqTqNX9e/+ow093v35x8nLRMtfi9
 HrhCV5/rXKAvyeq3PHNHQOU5PKk0Phmf5Riv57CfRsW4N3SoKrKXE12HbZemqUeR
 U22nz+9tSQvL+CkhKnBpqyDSIVS50nT4/sHCjjo5ZAXrErYGXhEXVhJyaOuG4QKd
 FHMDHaDloo8M4WcxG0BcOcqgJaMUOt42WhjOsAhBG3lOe7ogA0U/4yqyQZGp8i3e
 7OsDc61NmPFUkeg904NEVEZJI35US9Hx4E9Rkbnu1Eeg5E7GPmL+4HSUS6Uj+Gjp
 6k5puXHIc7J/PYpe9ftSiusdabk4CahrCcdjljQNuA==
X-ME-Sender: <xms:9bkRY7Gvvk_fjYmLfEx9LpWNeCw-dVkoRKCu052gjNKz4oYGH1suRw>
 <xme:9bkRY4XwKwOhreqFx_QK-ACNNceJvifIm7tpNmG6sbSJY7e0_BgHC5OXlUpAYP3Hx
 NBPM5HxPJOIAoJpiK8>
X-ME-Received: <xmr:9bkRY9I-ydv9qTMuOheMvOdcRUY2Bpmbg_AVBrb9np8sn2wFAxP2QCoR4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeljeeugfegveetleevkeetffegudevieetieeugeeugeeivddtjeejvdef
 feetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:9bkRY5HXm61F4PcxLNK5m3rQg8z2teZN-HZOQWzL1Y2mZJC5Gp6npA>
 <xmx:9bkRYxXT9qIjLUEkWBe6eJb-wlNSxIy3FF3Kl2TTcu1Zlgw8ikPM1Q>
 <xmx:9bkRY0Na_3KoCTFKeDnS_NrgD3qAjgw5AiV4tQr85JIsexiy3hNQdQ>
 <xmx:9rkRY4MXrD0wx5qHwdfAbxRIyLEgoNzehIkf2gd_q0YkGZ_c3AvKTg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 04:08:20 -0400 (EDT)
Date: Fri, 2 Sep 2022 10:08:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
Message-ID: <20220902080817.is2dqqe5sxxhj6qo@houat>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76a7tdldm3qyyhst"
Content-Disposition: inline
In-Reply-To: <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
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
Cc: michal.winiarski@intel.com, David Gow <davidgow@google.com>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Arthur Grillo <arthur.grillo@usp.br>, brendanhiggins@google.com,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--76a7tdldm3qyyhst
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 07:33:18PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 9/1/22 09:55, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Sep 01, 2022 at 09:42:10AM -0300, Ma=EDra Canal wrote:
> >> With the introduction of KUnit, IGT is no longer the only option to run
> >> the DRM unit tests, as the tests can be run through kunit-tool or on
> >> real hardware with CONFIG_KUNIT.
> >>
> >> Therefore, remove the "igt_" prefix from the tests and replace it with
> >> the "test_drm_" prefix, making the tests' names independent from the t=
ool
> >> used.
> >>
> >> Signed-off-by: Ma=EDra Canal <mairacanal@riseup.net>
> >>
> >> ---
> >> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-ma=
iracanal@riseup.net/
> >> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusin=
g (Jani Nikula).
> >=20
> > I appreciate it's a bit of a bikeshed but I disagree with this. The
> > majority of the kunit tests already out there start with the framework
> > name, including *all* the examples in the kunit doc. Plus, it's fairly
> > obvious that it's a test, kunit is only about running tests in the first
> > place.
>=20
> Would it be better to keep it as "drm_"?
>=20
> Currently, I don't think it is appropriate to hold the "igt_" prefix, as
> the tests are not IGT exclusive, but I don't have a strong opinion on
> using the "drm_" or the "test_drm" prefixes.

Yes, using drm as our prefix everywhere seems like a good idea :)

Maxime

--76a7tdldm3qyyhst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxG58QAKCRDj7w1vZxhR
xT6yAQDBwt2ucJpi8xbfOexsSn0IwtFEfMVmlzrn0/gz/emVbgEAwWwWnzbG5bKB
w4pOcdJqPCvfrvxmbjUcFF/2yU3CAwg=
=4LKf
-----END PGP SIGNATURE-----

--76a7tdldm3qyyhst--
