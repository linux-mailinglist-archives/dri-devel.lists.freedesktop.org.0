Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CA3AB76B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17F6E915;
	Thu, 17 Jun 2021 15:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1026E915
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:25:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AB605C015C;
 Thu, 17 Jun 2021 11:25:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 11:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Sj38CVBwD/q4Tn6QawviFV8yZQr
 OlwmiLUOLqpXxNx8=; b=4GAqFDoMKYI+3xdwI9qgL3LhOOnO/ZNUTHETJSyyfjy
 CWhlZ1YWKogjvp/NWS8fZ1Vl2Oqynicahj7bElyS9dn7EHf3IUGmVUpSVrbP7ieg
 J1iq36SnNhrfTauW5DhYybpY6pP4CYLVfk8ssBAzCTen+M+agbHaX2GeuaVfeIM9
 MnPK1mjpXt8YeDqaM3QR01ss+Rmn/7v8Lr/cijIWWi06a96f/6u4qeA9fRQbOjrJ
 89KDRHa/DOeGRXpenAz12PI33B8iDYd4g1ZJq6b8jCCQrsRu796S9Y2ZgF9SuQnG
 nHXNZqg93NttaAGpgsFpeOrzL79HeQ61WC6FBmMu51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sj38CV
 BwD/q4Tn6QawviFV8yZQrOlwmiLUOLqpXxNx8=; b=cQUtMz6+ZX0c9I3OjL/d06
 9Lh8+i9IkyAqQXFg73POinDg283dPWm+20Yt5zP7LQEBPraF/++D1sAO98RzhYsd
 MoeTR/KjOi+6O8uzkQkmkwzsYHRVvdnadYDMcYpX9Nai2/DBg1TiiO1NilAx2ArL
 SVtbr27Eoqek9cDhGWAeloNQFYTF3HfZo/Gjuhf6vb7BzobwnMAkWlN/vy5Un9xF
 fcO6fP48+UBrwol+gt8mJyAYTmb2Tj9ilYl/+cCGW9RzHx1SYHearNhGfnnlVddV
 N7rlB9Oi+tEo3vhAoz7QT7AaDab0dkVMrcgWjdx2LulEkwfHHDx4QrTnLPJJpsDA
 ==
X-ME-Sender: <xms:fWnLYLaIS9600yDgK-9QdpIs5WJmXT_F9YlCkqATDbYG7qkL75v4UQ>
 <xme:fWnLYKbVuqZ2boRHpUb9i_NiAD84cL2T44K0KUNAUDagP9I5reurRTbgFSIBCb2Xs
 3EclAZZ2_pnORwEJwQ>
X-ME-Received: <xmr:fWnLYN9z6LnOBiRi1DfFvuJNgqlh-DbDWHo7URKMbMBgTTTOpMDFSl9-pxXSrsPxW8DTvhawY7_90DjYKEY7eXqN5aqzg38szUjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeehuddulefgteekfeetfefhueeuteeigedvudekleeikeelhedtteetleek
 ueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fWnLYBoci3jDebyoWWxtF-AzjkrHRXhOw2zTvPyE52IO66kjvLmylA>
 <xmx:fWnLYGoXtv7WIafqYxwJInYfRcL-nFlQobEkV1p6ecD2VbvPEjwmbg>
 <xmx:fWnLYHTQLw8JIfMxKr1sxluc4Dgj0o-u1sMLMsHrK6ozz7qB71y3GA>
 <xmx:fmnLYN3nIOMM0x86zlv1FLAmacf9tCz4FAJ7b9D5EfNGiF4LTgjN4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 11:25:48 -0400 (EDT)
Date: Thu, 17 Jun 2021 17:25:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: hdmi: audio: ASoC: error at snd_soc_dai_startup on
 fef00700.hdmi
Message-ID: <20210617152545.slgm5r7y2pur7mv3@gilmour>
References: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
 <20210604090215.cpvoryvwrfzj5ikx@gilmour>
 <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q3o6ybqjwppil4m4"
Content-Disposition: inline
In-Reply-To: <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
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
Cc: alsa-devel@alsa-project.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q3o6ybqjwppil4m4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Jun 12, 2021 at 12:04:08PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 04.06.21 um 11:02 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > I would assume it's due to this:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/vc4/vc4_hdmi.c#n1083
> >
> > It pre-dates my time working on the vc4 driver so I'm not really sure
> > what this is supposed to prevent, but my guess is that it's there to
> > avoid someone using the audio card before we have a display detected and
> > connected, and its capabilities known (the first and more obvious one
> > being does it support audio in the first place).
> >
> > It's nothing new though, maybe it's the error printing itself that is?
>=20
> i'm sorry, i forgot about this discussion here:
>=20
> https://lists.freedesktop.org/archives/dri-devel/2020-December/292701.html

It looks like there's no discussion on that link, is it the link you wanted=
 to paste?

Maxime

--q3o6ybqjwppil4m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMtpeQAKCRDj7w1vZxhR
xXb8APkBObTYDL60D0JYHFhpQEOmcZQK72m+0bKLB15fsvHiPQEAroCeReJ1LM5D
O15ZFpwR7XKy/zq0BXMQnohkX2TJQwI=
=b4vV
-----END PGP SIGNATURE-----

--q3o6ybqjwppil4m4--
