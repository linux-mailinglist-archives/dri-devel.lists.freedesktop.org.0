Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5C687D64
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9D910E4FF;
	Thu,  2 Feb 2023 12:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA9E10E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 12:36:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A5135C01A7;
 Thu,  2 Feb 2023 07:35:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Feb 2023 07:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1675341359; x=1675427759; bh=IREj8xiYXF
 SvaOGII3wZaYBfzXE6G6YLNvJrsrDdUc0=; b=IdRBat1RV7IFes6NlrYHVOHe6R
 c/Ou8L72PSqPtSf/RjiyaJjon/Yz0cFbJ9jRAj3Pqc/6irRBZkqK1y3svsOM5HD4
 7n6wUqGj0nzfMxLse/92VpSV9XRctNgOL2Wr7bY3T6OAll3k7dhmLXnMtVsmr0Un
 3y/PYefyDfXRlMNyB+Br8vc7XEiMfIYBNqaFhWYBvgqcqLTqlOAm/IW54feJmTuN
 bwmuHG1Sk1aB2bnEm8SuDttxaehK00vYh8n/AUvns8JrfmntDESDN30BqzzICdkA
 F+gF1R12Mln9asHymyxmvQ3ATNiHTlHJ6kn7f/0f/2qKU1S6E2YS7xDrAPvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675341359; x=1675427759; bh=IREj8xiYXFSvaOGII3wZaYBfzXE6
 G6YLNvJrsrDdUc0=; b=epMgYXLE+JVrAxRYe7zjxVYYxgGa9TrOKLFKYecyWh/u
 cMj/GEhPuc7uoJrtAnNlCPxMA7J+KgCtHPO1Y66/Xh5pRcr0kvYiQvOxn5fOhHL6
 l+VVXpSDPssWieS8cC8zso6cGOxOCR1G6VAzrWPEnM2X6G7PRjYoLhfkSWBvUY+q
 pwMTg/JTp99gRTOk0qkzIKK1PW93qvQIMgPC7u0WwlQ4pYsMHZW2vq6VX+lGnyXe
 NCJr9vkQcQm7PnwamuaGECndHlu1r49lLkkWy4TDfh/kSal55+B0kyJPguZZu6r/
 iAuEf+c+1irsC4AQCZBTgU55+/Zqpkmtblk11QBHeQ==
X-ME-Sender: <xms:L67bY4j_BLJUmNWlTybnuyjQdBFgauLKC-X9skK2ncjTjhCVEatThA>
 <xme:L67bYxAZCxPgW5FYqqRS0_aGMDuwLXf8-rEvj5Hb8_rOEcT6OLv9PYMCm2Y7hpKLu
 nJe1EvEgLHVcKMGsCo>
X-ME-Received: <xmr:L67bYwFkXgYo7Zn-Nd6q4UFsqqm7iRmezql244X3xDpvQMvxr8F67sfIzTFpqQZaKMz_ETQDt_OZl_2UBKHPGVWhK9e4uBuJzx6k23CO3XCQzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L67bY5Tm2Ndj1cPhc6v6PYOPiAjB_Sunap2PHEZtRBhsKtoP58tMgg>
 <xmx:L67bY1zpNutrdhEiTQF69NBRCvaWLWVVFSSK0ZIMjIS7bLrRPcpofA>
 <xmx:L67bY36gwOXxNiBaCwno7hKAEtMf7niZSo_Lf_kW0oNUYLBdOKQJyw>
 <xmx:L67bY8lO4kKtN5tCxpuqZmM-dKyfv8cSQd4joEJT-Tu-4NdRYRoxVQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 07:35:58 -0500 (EST)
Date: Thu, 2 Feb 2023 13:35:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Message-ID: <20230202123555.r2qvjjhtqwx7e2zo@houat>
References: <20230202110312.808607-1-maxime@cerno.tech>
 <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wpjoifot43m5whbw"
Content-Disposition: inline
In-Reply-To: <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
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


--wpjoifot43m5whbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 02, 2023 at 01:22:01PM +0100, Thomas Zimmermann wrote:
> Am 02.02.23 um 12:03 schrieb Maxime Ripard:
> > Commit 8fc0380f6ba7 ("drm/client: Add some tests for
> > drm_connector_pick_cmdline_mode()") was meant to introduce unit tests
> > for the static drm_connector_pick_cmdline_mode() function.
> >=20
> > In such a case, the kunit documentation recommended to import the tests
> > source file directly from the source file with the static function to
> > test.
> >=20
> > While it was working, it's generally frowned upon. Fortunately, commit
> > 9c988fae6f6a ("kunit: add macro to allow conditionally exposing static
> > symbols to tests") introduced macros to easily deal with that case. We
> > can thus remove our include and use those macros instead.
>=20
> I like that this include statements is going away.

Yeah, when I saw that it was now available, I remembered you really
didn't like it :)

> But changing symbol visibility for tests is likewise awkward.
>=20
> Maybe i'm askin gtoo miuch for this simple patch, but can't we have a hel=
per
> macro that generates an exported wrapper for Kunit tests? Something like
> this:
>=20
> EXPORT_KUNIT_WRAPPER(struct drm_display_mode *\
> 			drm_connector_pick_cmdline_mode,
> 			struct drm_connector *connector);
>=20
> which then generates something like this:
>=20
> struct drm_display_mode * drm_connector_pick_cmdline_mode_kunit(
> 	struct drm_connector *connector)
> {
> 	return drm_connector_pick_cmdline_mode(connector);
> }
>=20
> I know that the macro for generating this code is more complex than
> illustrated here. But this solution separates Kunit and functions cleanly.
> The static functions that are exported for Kunit testing still need to be
> declared in a header file. That could also be done via such a macro.

I mean, I guess we could do that, but what's the point? I don't really
get what that wrapper brings to the table.

Also, this deviates from the existing practice we had for selftests and
EXPORT_SYMBOL_FOR_TESTS_ONLY

Maxime

--wpjoifot43m5whbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9uuJgAKCRDj7w1vZxhR
xRW/AQC/hkvXZSf9baS7vZz/FERnM4StCJZx+NdR8w6cKGnqawD/Rqyj4oNO8YRX
1XLLlGfcRVtCaM+f4ER5d2jgzpaqQQM=
=g6n8
-----END PGP SIGNATURE-----

--wpjoifot43m5whbw--
