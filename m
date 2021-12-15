Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DC475A51
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 15:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C983C10EBF9;
	Wed, 15 Dec 2021 14:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA7E10EB9C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:08:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id E9CB62B0024D;
 Wed, 15 Dec 2021 09:08:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 09:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=m6yMRlUpraLi1xtxRrCa3cMeEFx
 gKk31Q2bUedXIMts=; b=B37uD+8zlRC+bFTMc47tywug9eQZUJ4wHpviRhr6hiv
 Yz+BGwPwnMqRZaRP5D1H6SgDoWeBwenUXqiG70lsiGGAEqwY8mMXCJ4KuWL/CzDt
 0brDNMzZkBnCeKXF8MHi5Jjx1Cex9C4X/GwvYZRQhun4FGta6TZEBJbdLMjwxXFE
 cxof6lnHhgvCmt0OnY68u0nIEcGGADjVTvpZXIrlssx1RRSJWj1J3SoArRSvAEb5
 idFQhXxQbjtO/bxUvo5QecNbHD8SKcikiKw1gQtGxS+TH8nlwJsyLaRGrhfhrT/U
 Z+lO1nbWGhbk+z7J54K0xQPXkU93fdqSRMIJqf/VEDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m6yMRl
 UpraLi1xtxRrCa3cMeEFxgKk31Q2bUedXIMts=; b=NDzjqOhyUQ3yep0d6mzjgg
 s15xsYgk7ahAemCRQAwPuR2uBHoN5Z6gBsUiU3IPiH1rAsFoMZnsD7BIgQAZXGKn
 D7/QGW8CNhxP38WTjK/jIPYbW/8suW6jf5AK3rVD7KLTLEtHLQuMq+357sfnm5mZ
 NF0Ie2hMER4/0s4aGkLYcT29n/kcAufZLvMz+npzPUzvj1iBgYvaklGHKOKB3F4Z
 1ZB8E6NLUhqP5LAS2CSHBD/GObqaFJNq4B8oPSUW76Dg1OjMl7hCPGtrlrfkjIi9
 WtCA0R1eQEQdne4wE895otZKIeeHPgZQjK2/kdy534W75tOuTYUwfFFnvqa+yRjQ
 ==
X-ME-Sender: <xms:5_a5YfFlBM_ETlcRr45TthbytsE392r5Yu8PxCHM96q_5v0Shzh67w>
 <xme:5_a5YcUJmFiGNN559BnqmJi08P6VS0wz8Cbq7gXI0dMcZYqrHbHdufoTQA7gUECBD
 ePA1IZ5NCykDsz1ULw>
X-ME-Received: <xmr:5_a5YRJ_fyDfCJ7vPj_AANJ55GVyrlwByA16kvBbgT6MuE2fc0Abde-4fxxmwyDLQ746pCaJuey4CJ4gItyG9zlfPKvotl_c3_VttII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5_a5YdGy7mdmcQS0_NBjnLjEFbunQ0NdG0riJ2eqs4AKcE0L7pxe5Q>
 <xmx:5_a5YVWtOQjfqj57BCKYIu05wAGZCn_KsZ7nnpFNH-OXk36wP7CbJA>
 <xmx:5_a5YYPHi1MW2GywVVvK_TSgijbFKzZXEdHpPwEhlVkDk5qju9JvSg>
 <xmx:6Pa5YaUoOLLRRSR3lHAZA1ehQl0qWsuRjFF119zkBT0Nac2DgqtdZfti5i0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 09:08:38 -0500 (EST)
Date: Wed, 15 Dec 2021 15:08:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/3] clk: Implement a clock request API
Message-ID: <20211215140836.bpxyau4atm74sfkk@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lg2pqwgvtun7kcl5"
Content-Disposition: inline
In-Reply-To: <20210914093515.260031-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lg2pqwgvtun7kcl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Tue, Sep 14, 2021 at 11:35:12AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>=20
> This implements a mechanism to raise and lower clock rates based on consu=
mer
> workloads, with an example of such an implementation for the RaspberryPi4=
 HDMI
> controller.
>=20
> There's a couple of things worth discussing:
>=20
>   - The name is in conflict with clk_request_rate, and even though it fee=
ls
>     like the right name to me, we should probably avoid any confusion
>=20
>   - The code so far implements a policy of always going for the lowest ra=
te
>     possible. While we don't have an use-case for something else, this sh=
ould
>     maybe be made more flexible?

This has been posted around 8 monthes ago now:
https://lore.kernel.org/all/20210413101320.321584-1-maxime@cerno.tech/

I haven't had any review on this, and I'm struggling to see how we can
move forward. Given your initial reaction, I'm guessing you were a bit
reluctant at first with the approach, if so, can you share *any*
direction in which I should amend that series to support similar
features?

Maxime

--lg2pqwgvtun7kcl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbn25AAKCRDj7w1vZxhR
xXPHAQDOqQ4yaKrzcO5kvJncig3EqvvGSCVhhwqr3YlVw4JwogD7B2wtLggYl6h3
hip/UU8FeqCCPB/OZzacWJicCo8cFQo=
=PF1A
-----END PGP SIGNATURE-----

--lg2pqwgvtun7kcl5--
