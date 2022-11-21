Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE876327B4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388310E2D4;
	Mon, 21 Nov 2022 15:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140AB10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:19:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0818D320098C;
 Mon, 21 Nov 2022 10:19:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Nov 2022 10:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669043965; x=1669130365; bh=IwU/+ORPNc
 FJdwYkRLc8Tov1cg+1MzhrAUgCDtEZ8+o=; b=cL9lHO9g6PmvoOLKpfjGaHQjI3
 EBsQjMGTuIUMN5Ow7V+s7UazdsDZ0Ve8lyFeKHp+4SzIogZWUOcWNS4pDmIww26G
 uQyQZKyRfp657P4cgxmrht+cXVWIg6AVGxht1CIIGLJ9nba8A/cxUIL1VtuBdLHT
 DPoZ4x2dTQDv1yWJ/CFmzRSHCLFWYRCoAkainDijf0R5TnbyPN7kGIDvUe5tlCWs
 dFPLknYPN0WfPV+OWPufdKCTWf877pvPyaIf0McxLUIH5Gv0RnY2pwRo3lGAxXbY
 9WL0xo9Lzd/k3O0NOPhFJFh32CYWNDdcjgX0RW/bNHGdDF8sABf3nPkAleYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669043965; x=1669130365; bh=IwU/+ORPNcFJdwYkRLc8Tov1cg+1
 MzhrAUgCDtEZ8+o=; b=ON1mS3ama0Qcy0IQOV5loGdhXAdGzymft2OWFUkXFxj/
 P6ztAvdKrk6TE+Nni4Qn2kkTpEJONIWJRoHQW8BIZB3o/2i34lAao8gYOazElDgb
 tGdIxkWv9bsDinntYO3c3jq7J6A1ORwGNj3E/LI6fav5lW8L0z69EbiVrHHUgJUl
 QvDOQzWvvSQG5jmNrdfZcdQDrE7xERvscfPeSvymGrogqv0+HBnWT66aWjz0N4gW
 QEX6Zr+sBQ6R2l/NS7mdaDh1sI9nVHEwhczQSVQjEPzVSTV/fHrRGHKWDh5I5inX
 o7hhbILgDMvbXLWAioe7eNC8wKJyinAoi8sbgejMQA==
X-ME-Sender: <xms:_ZZ7YxIZaKRojPmkMr_KwpI9n83kL6DhmzcIp5EY3kut5u07oPy6Nw>
 <xme:_ZZ7Y9L0ZofcPyGtJg_jECxB7el1kHRPP0Uj4o7axqPo77KLpuz1OhXrecyNBcG2l
 inC-8hfnIOfeBg98KI>
X-ME-Received: <xmr:_ZZ7Y5tBw-usgXpTUDj3t6eYoVXJsO8pbQ3T4DFNfK2Gi80z3wC3b5WZK62j5MTM4h3WUUy8ABmTjbhkqzto08JBT_O08j_taw_0Uq6lorRLGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleejuefggeevteelveekteffgeduveeiteeiueegueegiedvtdejjedvfeef
 tefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_ZZ7Yyad2_gDy45I2Oyez40fS_ZnoKNm1Y-43qNFLQR6XpuyNX8-uQ>
 <xmx:_ZZ7Y4bR_VO40F88b838D-UHkxRcEeBtu9x8KZy5WP8Kc1ZPlTBxbQ>
 <xmx:_ZZ7Y2A2v6mZVybmAtFITptx4koD-j6PJKng5agLIoWgpoyjK4FRGQ>
 <xmx:_ZZ7Y_Xtl98cfmWF0_10xD0e7cnORLim5ZGXYyE53MTM315dLdSJ6Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Nov 2022 10:19:25 -0500 (EST)
Date: Mon, 21 Nov 2022 16:19:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <20221121151922.jaal6ym7z2ejju4q@houat>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aufutovedl5p2dcy"
Content-Disposition: inline
In-Reply-To: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aufutovedl5p2dcy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 12:48:52PM +0100, Noralf Tr=F8nnes wrote:
> A couple of years ago my email provider blocked me from using git
> send-email with their smtp server. So I switched to the one my ISP
> provides. Now my ISP have outsourced their email service so the first 3
> emails gets through and the rest looks like it ends up in a tar pit or
> something, 18 hours later and 5 of 7 emails have gotten through. I have
> asked them about this, but I fear the answer will be this is not
> supported since they now don't have the service in-house anymore. I'm
> waiting for a reply.
>=20
> Today I tried sendinblue.com since they have a free plan, but they
> insert <br> in the emails so that didn't work out. They also have some
> kind of queue, after 1 hour 6 of 7 emails have gotten through.
>=20
> Does anyone have an smtp provider to recommend that works with git
> send-email and that sends out all the emails at once?

I'm using fastmail and am very happy about it so far.

Otherwise, you might consider using:
https://b4.docs.kernel.org/en/latest/contributor/send.html#authenticating-w=
ith-the-web-submission-endpoint

Maxime

--aufutovedl5p2dcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3uW+gAKCRDj7w1vZxhR
xTliAP42DZbkg/gGP8nHP2wOWsm3v/FZYdMVwNTEQquHeHM8HwEAuGuOAy3qshT5
51ek0yfLAMn0kg2lW7eA9mhqt0abiQI=
=cvH2
-----END PGP SIGNATURE-----

--aufutovedl5p2dcy--
