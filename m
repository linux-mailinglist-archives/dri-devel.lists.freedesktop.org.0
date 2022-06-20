Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320C551F18
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9110E090;
	Mon, 20 Jun 2022 14:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C4D10E090
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:40:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1E0893200972;
 Mon, 20 Jun 2022 10:40:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 20 Jun 2022 10:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655736047; x=1655822447; bh=Br7hHbsRje
 Bkc5H70OKA6jOsxHRC7YWAWih4n804TUE=; b=dCoM8laz43WySryP4ROQlDYxnm
 8gSCxT8aPQMcXuvyjSd/F08+hGj1CQ8Wed64TZBUzStaI9j98bj7LQy/gHTBJOo4
 MbdTR31AOW56p4+/EuVN0bdawr3XIKrQ0dlkXs9CkWRXa/En6XOLEPFky7PHNq+d
 pFapD4EMIrmqeu14ZuZDGy5aSnSO7hLYPsybTz50VjxHj9Yp84IX8PmxDd4+SOfB
 gMONVM/h+gGABJapvmRJo3e/eXr9/9jdslHjvx+t6xcQAzgrnxcsNbF5XpI4L3jW
 XxMRcu8LdZQWnGuwp9hryWwafajbCSY3ZJ4oXaGsk+oiI+aKnndj/oyLDY+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655736047; x=1655822447; bh=Br7hHbsRjeBkc5H70OKA6jOsxHRC
 7YWAWih4n804TUE=; b=go+B0hywNZiMW4yAjxlUGTOmUglQgaU8jRF0oln2YIeH
 jQyNiDQd5z2nhZJtKG/OO4SwRaI6CQs0gs/3MwHU4mwOMY+ioLB2kB5I7tRDLQOv
 p1K2FjRApUU7VzA6UQ6xdvJgSkIAkAkjJ/cBmMfISe+NRckeOgaZA6so1D0O2sdi
 qnRCtwDV7NvwntBLDToOk03cf1aiN0jI9kQsTxTm4CGe5l29FkEF8XlQWtZ59PAY
 MxvXcWWwbC+oMPVdwXh2nt5clXDFfK9jrX5MvawKrJ33xS8YxVzwMO0BPoRct87I
 jvaIamjAWWXFowj3koLSUaAEbGGNJsC/8G9IRit31w==
X-ME-Sender: <xms:74awYkyeSUSZEjKKWsNkFBD0Lw_PPtAKkocBM0005aI867JbSKHAnw>
 <xme:74awYoTKllVZeOD6EwudZiGIfaVekvIP0cIYyZoJNmWVAC3t0utz8UbECBzFZWMp7
 3B7w1yfX7gdFSnJG9c>
X-ME-Received: <xmr:74awYmUqNwyL8avnYzSG999rkfGQRTyBkPFqz4jmGzJpZCriHMMa3JZXjnYR5-ctM-Z1so2latXknxlsIu39WRt_793OjYchAE6rigg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:74awYig3k7NNU1ypgPV3G2Dv9a-dIPcrqMoUeH65lrM4dOSlw7Hqnw>
 <xmx:74awYmAwYH6ojaqMCE4LFYCnrC1bgu5qnaPBdV7_LfhePgmLUdxD8w>
 <xmx:74awYjJ10ZMxUu05oAyhyV0hM7GrS0TeXj7oToigVQyIGTRDEUum5A>
 <xmx:74awYpPpHGOttSqxTI_wMV5V34ob7Q0tVKwjpV7I9Dv6VXyPHf7YfQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 10:40:47 -0400 (EDT)
Date: Mon, 20 Jun 2022 16:40:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Message-ID: <20220620144045.xo5pdvvwvjtnijsg@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
 <20220620121836.2bxmnyrfrfgvdyd2@houat>
 <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mwssabsd55f73uju"
Content-Disposition: inline
In-Reply-To: <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mwssabsd55f73uju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 04:19:43PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.06.22 um 14:18 schrieb Maxime Ripard:
> > + * At driver unload time the driver's &drm_connector_funcs.destroy hook
> > + * should call drm_connector_unregister(), drm_connector_cleanup() and
> > + * kfree() the connector structure.
>=20
> This sentence sounds odd.

Yeah, I was using kfree as a verb which is probably where the weirdness com=
es from.

Would that be better:

At driver unload time the driver's &drm_connector_funcs.destroy hook should=
 call
drm_connector_unregister() and free the connector structure.

Maxime

--mwssabsd55f73uju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrCG7QAKCRDj7w1vZxhR
xWB/AP40pkJ+l3V1QeTYlhPiCiHVhaKAqbrC5zEHKRBiOxo2hwD+NEHYaZFINjWP
foMINxnbeoOgWsuNfeYT0iup8EkZVgE=
=wF5p
-----END PGP SIGNATURE-----

--mwssabsd55f73uju--
