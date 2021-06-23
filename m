Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681A3B199C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889586E8C0;
	Wed, 23 Jun 2021 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A526E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:10:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 857315C0160;
 Wed, 23 Jun 2021 08:10:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 08:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=llEm6nat4Bv41Z1K0NDn0NTJYpX
 sDeAwkp0lRdT5UZE=; b=1hwVytH4G8e+zQPn8/WgHYfAWSdRXOtEtvGJcS7bYS1
 TgKsW+rQwije9Ov4nDA2XNB6BH6ANUcIw36m04Ef3egfgG9nVKArPW5JrqRaXoKj
 tL8rwG051aP1F4/6XDEgDVar/TZZebm2/5Xe1s64HZXXkI0J3pG4DjiRa1PSz7eo
 fh1gR2wQpn2/U9T5f66FjooXULrHgzf44ulF8OOx/05yIj7z/uVBYPu17yePzVGq
 0r15uq1ngALDGjAWegW2oOaJ5Cd/+DWxHSZwtZ9Ve69cybYrzA6x1HzvlsLf4vWK
 0UB3OfB4CYeRTeHAVUrfWwOl54i+zdRbry9Icx68ISw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=llEm6n
 at4Bv41Z1K0NDn0NTJYpXsDeAwkp0lRdT5UZE=; b=t7FjRe82xtDfo4bpOgwPGV
 5AmRTlKEDKHKtdmIRgN8/L4NMei1D+r6AtCtgrqe9htOfRB2LSriUV5ZjdcLnqGW
 FiejitO/RuEG4B2XXA5ZjInMm9sbXDMhX70f241/7tHZcfjAKEuWLIFoI1GUDiOk
 sjxaWNlOdStcS0NdGm5Cn6hr7PAOj9vH8OxTRSX0Kg/msGxQigGqEdAmsUxuPNe8
 MUk0YCV06cK2XItHAE2VqEqaez2jUgItongxQU8mc+aP1OmVAUbn9KcLmI+sZPjE
 Ti8BGhNIY2uIitgxtMxFr6qFBZnqCOlUORG73YDaobVv7AcLswOPceueV7nVc6hA
 ==
X-ME-Sender: <xms:xSTTYONMgwCKBH4v9ut-uRX7GWSVKOq4vuEdPDa6eJc0LSSpyIQ3sA>
 <xme:xSTTYM_KNTLdkxgD7Ds3Y36grfMRprqNWPyn80tONYDhseQycDRD0DTdsFzC9letA
 8ATN8fhJCQbw2klntA>
X-ME-Received: <xmr:xSTTYFSsUSWeWMsqGAbIIz1TaNV-UOz_s_EnOH84kZ5t9o4N3z6MiciCwDoA8jvUMlRy8dhT7yFsqz6T4WqNd8SUOY-reo2WVgmO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xSTTYOtD7T7hMIVx2NZS1MqJh8H6DyQeLZ3j66HIACGfPBb6Bq5XJQ>
 <xmx:xSTTYGfR8pinShrTBpLKTN3XFi2-R1U5xFZHDC1VMdaHyeNuIcmlQw>
 <xmx:xSTTYC1PYCWLFiVqN54golbLVA_wfRwUysix1WjNGjxTQgb_nQzuVQ>
 <xmx:xiTTYDFhmA-FPkP-kRcyC_Qi0bFPHUCMU1XMGXOV_bp38Sn1ck7bfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 08:10:45 -0400 (EDT)
Date: Wed, 23 Jun 2021 14:10:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/3] drm/dp_helper: Rework the drm_dp_aux documentation
Message-ID: <20210623121042.2p73bu62pcdukgwk@gilmour>
References: <20210616141529.630719-1-maxime@cerno.tech>
 <YMubV1Ats+cQWaCx@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wlxdhyvpfy3tndib"
Content-Disposition: inline
In-Reply-To: <YMubV1Ats+cQWaCx@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wlxdhyvpfy3tndib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 08:58:31PM +0200, Daniel Vetter wrote:
> On Wed, Jun 16, 2021 at 04:15:27PM +0200, Maxime Ripard wrote:
> > Split the existing documentation to move the comments on particular
> > fields next to them.
> >=20
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > Changes from v1:
> >   - New patch
>=20
> On the series:
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Thanks for doing this polish&doc improvement.

Applied all three, thanks
Maxime

--wlxdhyvpfy3tndib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNMkwgAKCRDj7w1vZxhR
xVN5AQCw1qhizi/uaOrTz4MBCAA+gEs4RKoHTWh/Egpj62WSogEA9cThGwMt4OaS
oteucUoD49RVhdXjnmn9P8P3vp/kzAM=
=FoX2
-----END PGP SIGNATURE-----

--wlxdhyvpfy3tndib--
