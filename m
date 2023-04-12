Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48C6DF808
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEEE10E813;
	Wed, 12 Apr 2023 14:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F810E813
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:10:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 68600582A85;
 Wed, 12 Apr 2023 10:09:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 12 Apr 2023 10:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1681308597; x=1681315797; bh=+6
 c91CjmYIxtUqQXd3hOvEtB9DdbEY6oIma7Y8N/Mjo=; b=ib7pWYB1n6aJSdrpJQ
 fY5o9y+RlaIb0qfrmsZSmlILn6qzjK9sSETdoq0/hb36Y4zhDs7vUX8e/m3CX8cP
 aiRH2h0Bv0MYH4qsODXwgzQYDD2p5a7gZQvi5GMY2MCHoSGiN8GZ5f78iOohcV6J
 vgAsGGKmlt0Dsl3YFMGXHlUnjA1XTET8FHRQ06Z87e4JInI2XyMbXEi2l6Kfszzd
 DLR88XpeOdzXVuqOWfJWsTnWRH8vCvYdVQ5eXC9MoNsDrinFg7GwnyCBxkTu7BN1
 hWGYHHcprJJeYU7A9R5MfecL+sfwZjCV3iMo3V3JmyrAhjEsOfMmL93ohOCj1okf
 JzkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681308597; x=1681315797; bh=+6c91CjmYIxtU
 qQXd3hOvEtB9DdbEY6oIma7Y8N/Mjo=; b=KJ7yfzAf7FGIldi78fa7VdpD4gtBS
 +wv58kmjpp1ujCZD9slNbsIFzGgIAll3f6UpPJ7KfsngSI+3WSBqC6xK9enuFBVl
 3pq37O8Uch5OJokDOImpb0TfUwgZzSBVm47bzA29iMVenfXZ1R/AZLKA/dlpwiqP
 f/S79HmOwJAZ0IWVIyND9NU2rL/LCmyB8YfqIkhFP4qDLtFs0b8uIGouvJ1sVyLe
 PBGZN/v+mdJXlEWE4dY1AptiSEBeYABovZijA4/PtVOV9A9zEtXtdRSfVD98a/3g
 6vJShHBPDrIOvIrkWQG2p4wEwg3uQvPruFkIMzeWqHmxBUsUgbUbGMXSA==
X-ME-Sender: <xms:tLs2ZJpBTlMGip7gemGbWvS9eqAkGh2wXIx8bMNT1LeL3DSXkPu_MA>
 <xme:tLs2ZLpmMBXeDvXkyrXUopU5fEFJOI7ur0jDGeHSH1sfH0njaU1XLNGdGDazS_zza
 u-wwavp-4MqQqeqncI>
X-ME-Received: <xmr:tLs2ZGMxv3iyT60FneNHurZn82fdudL1lj5CBeUHNTERRHmWXpWfVDq_RVW-dYLp5GnGaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tLs2ZE5l7tWY-V0RnN7o93rPkSLvTkU0SVwIBEKbVR2efbWVKcy1oA>
 <xmx:tLs2ZI76sIllvjSJjroOScwTSXL_PRFl53guYRdscUSLb3XosmGxGg>
 <xmx:tLs2ZMjeREEh2x1jCp2OZO5chhrGzVhDAZbN5spQAtGljPt1R06IAg>
 <xmx:tbs2ZO68eIfU8Qj4ZKOWun3RY5gW_kwFiGEUawEvKMr8BiNld2NLDA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 10:09:56 -0400 (EDT)
Date: Wed, 12 Apr 2023 16:09:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <qrjzn5dy7qasjubovofyzsazakiqpsjyyt2av6kfbqq7mqcdqe@bvs2egtopbqs>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev>
 <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
 <pu3vdz4gnkwgn4thg6tndbnvfroevpnq75bqbfv7yyrh4gkv63@xxl3dsjf2ih3>
 <CRULBWW4VCWG.3KS7HX7P1G4P6@void.crly.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gw23oqhzikhjtwgb"
Content-Disposition: inline
In-Reply-To: <CRULBWW4VCWG.3KS7HX7P1G4P6@void.crly.cz>
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gw23oqhzikhjtwgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 09:14:59AM +0200, Roman Beranek wrote:
> On Wed Apr 5, 2023 at 5:03 PM CEST, Maxime Ripard wrote:
> > On Wed, Apr 05, 2023 at 02:34:11PM +0200, Roman Beranek wrote:
> > > It turns out however that the new dclk rates can't be set exactly as
> > > requested without touching pll-video0*, tcon0 now therefore gets
> > > reparented from pll-mipi to pll-video0-2x which, as it further turns
> > > out, breaks DSI. While simply forbidding the video0-2x mux option see=
ms
> > > to me as the right way to go because there's not much use for it with
> > > non-DSI interfaces either besides the opportunity to power pll-mipi
> > > down, I'd like to run by you first.
> >
> > Sounds reasonable
>=20
> Okay, I'm unsure of how to denote that in the code however. Should I
> just comment the parent out of the table and put an explanation in
> a comment nearby? Or just erase it? I couldn't find an applicable
> precedent.

I think that forcing the parent at boot, and adding the
CLK_SET_RATE_NOREPARENT flag should be enough.

> > > * As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
> > >   retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
> > >   in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
> > >   The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
> > >   294 MHz though because it limits itself to 6 MHz steps.
> >
> > We could also address that though
>=20
> Should I include it in v2 of the series, or leave it for later?

I guess you can include it into this one too

Maxime

--gw23oqhzikhjtwgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZDa7sgAKCRDj7w1vZxhR
xcbdAQDlABOUSRin2TeBWh2nNqjI2tuMlU0bJZQjxFS9a+mQiQEAv5twOP7R+ugi
y49VRW9d7AF34brzpVy7yy+Tzffp1A8=
=0sQH
-----END PGP SIGNATURE-----

--gw23oqhzikhjtwgb--
