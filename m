Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCB3163D1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 11:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39FC6E162;
	Wed, 10 Feb 2021 10:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD2E6E162
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:29:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7A5D61E8;
 Wed, 10 Feb 2021 05:29:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 10 Feb 2021 05:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vSJktypk+0gSWXPCPFGKpFcPuoX
 wRrsOYAYhT/imrH0=; b=M38STHTwDPw1JYBSTUwPHk7j7dWhAVO/DedfkPZOfHv
 +QXofmdRlbkfMYkUAHhsQvGbt8/ISAbf1PI/FEohwXO/qtFHiJr044I32f6bkaUb
 jwxSbGxS3r+r508ME/+5RRLar6mWI1XdIZWxYx59o0lsZ2rA0an8zNprPukyAYX0
 8FVJnlzq6g4TgXof4wosdSkL9e6bupZP5Pbpu8pQHn0icgJNhvKOCCs/4aN8bfyM
 +wCve5xFsFlJ8wmy4RssoC8dtH5fc2GvVMuAS7Tl64UthE+gqdDNF5OAMDHv8lnH
 chyB2wEzubToP2L5y8tgLIJ4hN1qOj1Dl66K6PDnw0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vSJkty
 pk+0gSWXPCPFGKpFcPuoXwRrsOYAYhT/imrH0=; b=ECzMHNW2q5v4WI2SGmHaCn
 9vBwlnvtg2HbLp/MLibWmSPoNeojC29Mz9LG2gGv/1DN6CJM2qe52Uj18lHCCh3C
 49VldFfVxUMDPWjB+rxX6eny8vV7tRzGh3aBXzn4ncNdEQWh0x4mq4ktDbZSKia7
 62KfQqkl4AKpUmznc3MMdgTqn0SrSJ482CIZola7CoHj3A/FjiB4MUHhoBh1+71h
 bDNBlZk6gdTHXBsaOFi91fDBlywlu1q9xPh9vKycA/48DqIY9UaBMzk0xGPt/cFW
 I/UhqEh6QxM8eoZudDJRmkVJMjBoaxfWruuPTPWMPFptHxBIhHynKFNbqs0JAC8A
 ==
X-ME-Sender: <xms:crUjYNY1W0bqMzDIWym36U6_1sMDJwgfcL0o5PKOOgSuPq7AJJ0ePQ>
 <xme:crUjYEZMcmTNlq_S6ymB4XeUKiYOMACExtdCemY5ZZK7-DVMeee7YvQLi4kxxwoAA
 wCjzhSEcT5UXRh_nts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:crUjYP-1GXGz2xWw4xMfjdXfMLLXquBOSu2xGfrLJREX4TwM65EeVA>
 <xmx:crUjYLoDbW_x-j1qrpoKi-SgxHGKKEF3qAe-9gLxfws-2i9uwSngtg>
 <xmx:crUjYIp2f1rnWfoU1MaAs5PtL7yAU5VSyAhGdzzvXwBjysXMdQqRSw>
 <xmx:dbUjYP2GErLeImKD1qOFYywyyOuPrROKOsE3SkoNPm6rAQeqQ1MfEWKsD48>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1C57240057;
 Wed, 10 Feb 2021 05:29:05 -0500 (EST)
Date: Wed, 10 Feb 2021 11:29:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: mturquette@baylibre.com, sboyd@kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag
 check
Message-ID: <20210210102904.xyr6bftn4ueuu74z@gilmour>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
 <20210209175900.7092-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20210209175900.7092-2-jernej.skrabec@siol.net>
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0932735393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0932735393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4bswe2phsqldjycj"
Content-Disposition: inline


--4bswe2phsqldjycj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

On Tue, Feb 09, 2021 at 06:58:56PM +0100, Jernej Skrabec wrote:
> CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> one. Fix that.
>=20
> Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when all=
owed")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

This is a last minute fix for us, can you merge it into clk-fixes directly?

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--4bswe2phsqldjycj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCO1cAAKCRDj7w1vZxhR
xemkAP9EZrTfS3MLqZS0TFmQCpjpepJKYBSXfVmBrrhQUnpdtAD+IqB9xEG1je9U
b0OFT5usCtuJSpLSoRk9oXA3Vo4z8wQ=
=eVo7
-----END PGP SIGNATURE-----

--4bswe2phsqldjycj--

--===============0932735393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0932735393==--
