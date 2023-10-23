Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE67D3A29
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0410E20B;
	Mon, 23 Oct 2023 14:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8CB10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:58:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id 625325C036B;
 Mon, 23 Oct 2023 10:58:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 23 Oct 2023 10:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1698073095; x=1698159495; bh=W/
 0WC7RItMawrgL8SpGn0ORkdhr0XPCHb2iIFurmGk8=; b=r4GRNYVss2a6WBCuRW
 MDQ3LUTC9wccr5VVmBkD0SwP7Ab6QtXQLcXeF72aNQ0Lzhk1mnghKXlCrMz11O1C
 gzE+CGBBg1xt4aFSWhgG5Yax7rtaMGYEcpzRwyk7V/2j1udnuk5svn8qLSv+0v4p
 /enz2jzJ7wmmDGjeMVQLoMUTpMuXtj1BGQWG5LD4AdvA5CjKpHPm1ziYd83bewtf
 4/2oTaA4Ks4aF/qTqjf1c9+MpASo1STtqhStbQT0hiBgLy906ia1tJ6uj0Haz1Xt
 kNdXO603RDgDzBGoOy8Vkoh07C45+YBQY2uZOLfXJfbOTmhsXk4M2xQZ0Z45Cf7d
 k4BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1698073095; x=1698159495; bh=W/0WC7RItMawr
 gL8SpGn0ORkdhr0XPCHb2iIFurmGk8=; b=V9zBYozFVd47ADENJks7U1WkD/VH4
 BvOdmo5VJWyDWLowJRe5n2/Opr45y8zxzwvBdfU0VRruiP54rZyU0ACilL4fxvqT
 Qk59KTtyc6EpZGgwY1xCR54vtztDe9KfU5bSIrfrpUV1bYDbldVJ6S7t2Y6JZCJP
 MZwICe9Loigh6J7dOC61/ie1MZyZ8fLYD48HG6XCsyHlzgf2ws0ntkCPVF4XW5oU
 MlSEcR2dSOFvlIRa1MaLsvCYxcDZzP4+wF6qA7N+vHJML3beH5qMl8jlPujQo6WD
 jguv3vXv5sxKYvxigZVCRxpy0FetH0ymjp0zyK5D3iedez1lAqjZkTT/g==
X-ME-Sender: <xms:Boo2Zc2O5MjwxvcKUTzUAGBYFtNZVuTXr1or8uFJ6SRdA_-U4BpX9w>
 <xme:Boo2ZXEXj5TQBbKocTNT-7jYp3yEozz5H-TgInjj2UZUPLP-MVMD99v_ho2ZR6hg2
 R7UYUQuRXbQaiwX4fc>
X-ME-Received: <xmr:Boo2ZU7ZiGFHq9yCE5E1YiOiZtCSIhSMO9QzmM883EbsOvUH9g8c_nb-SGbS2N1salQ6QBeSVy_H-f5y-81dpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeeigdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdfgudekieeguefhleehfedthffggeefgfduueeihfeuueelkeevtedviedt
 vdeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Boo2ZV0GTLdO2YUbhLV4smAfFoWLPxBB94iMNb2AHC0mAxG3qNAhUQ>
 <xmx:Boo2ZfEHFhnfTl5ifqcPS5squGswNMpTERoJj0GQh_a3AIkx3KIlMA>
 <xmx:Boo2Ze-DlkqRGIFJC_JbpchdMddVy6vZp44_6gxX_2qM3m26n4mPXw>
 <xmx:B4o2ZQM5qJD-nUDPprIYYWQYPEELnYMnBQThMCgzEsyrKdBzVbppNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Oct 2023 10:58:14 -0400 (EDT)
Date: Mon, 23 Oct 2023 16:58:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 3/9] drm/vc4: hdmi: Add Broadcast RGB property to
 allow override of RGB range
Message-ID: <tnkfcgkoobxyyhnsmoyayohip73wl6axnd7liefsvof6qwgovd@ropob4set3nl>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-3-bdd54f66884e@cerno.tech>
 <CAKMK7uFQ8yJLKgTrQdmhwmq9uL-hbUsfUeU6cxWdB2AW3i4vOg@mail.gmail.com>
 <fwcn3vlgxq5uygi32pyjuktj62wa7zvdgu7xxlpqr7an3kjn7i@25axhlrrkk6z>
 <12669999-295f-40c5-8c58-ba3ed26efb16@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kg5ejgqcqfwxthnd"
Content-Disposition: inline
In-Reply-To: <12669999-295f-40c5-8c58-ba3ed26efb16@xs4all.nl>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kg5ejgqcqfwxthnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Oct 19, 2023 at 10:26:40AM +0200, Hans Verkuil wrote:
> Hi Maxime,
>=20
> On 19/10/2023 10:02, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Oct 11, 2023 at 03:23:18PM +0200, Daniel Vetter wrote:
> >> On Mon, 6 Mar 2023 at 11:49, Maxime Ripard <maxime@cerno.tech> wrote:
> >>>
> >>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>>
> >>> Copy Intel's "Broadcast RGB" property semantics to add manual override
> >>> of the HDMI pixel range for monitors that don't abide by the content
> >>> of the AVI Infoframe.
> >>>
> >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>
> >> Stumbled over this grepping around, but would have been nice to lift
> >> this into drm code and document the property. It's one of the legacy
> >> ones from the table of horrors after all ...
> >>
> >> Shouldn't be an uapi problem because it's copypasted to much, just not=
 great.
> >=20
> > We already discussed it on IRC, but just for the record I have a current
> > series that should address exactly that:
> >=20
> > https://lore.kernel.org/dri-devel/20230920-kms-hdmi-connector-state-v2-=
3-17932daddd7d@kernel.org/
> >=20
> > Maxime
>=20
> I've pasted a snippet from that patch below for a quick review:
>=20
> >  /**
> >   * DOC: HDMI connector properties
> >   *
> > + * Broadcast RGB (HDMI Specific):
>=20
> Full vs Limited is actually not HDMI specific, DisplayPort can signal thi=
s as
> well for whatever it is worth.

Sure, what I (and the original patch I guess) meant is that it's only
ever used on HDMI connectors these days. If that ever changes, then we
can update the doc.

> > + *      Indicates the RGB Range (Full vs Limited) used.
>=20
> RGB Range -> RGB Quantization Range
>=20
> > + *
> > + *      The value of this property can be one of the following:
> > + *
> > + *      Automatic:
> > + *              RGB Range is selected automatically based on the mode
> > + *              according to the HDMI specifications.
> > + *
> > + *      Full:
> > + *              Full RGB Range is forced.
> > + *
> > + *      Limited 16:235:
>=20
> It is very unfortunate that this is called "Limited 16:235" instead of ju=
st "Limited"
> since for color component bit depths > 8 these values are different.
>=20
> I have no idea if it is possible to add an alias "Limited" that you can u=
se instead.
> In any case, this should document that it works just as well for higher b=
it depths,
> but with different limits.

I had a look and it doesn't look like the property infrastructure can
deal with aliases. I'll add something in the doc

Thanks!
Maxime

--kg5ejgqcqfwxthnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTaKBAAKCRDj7w1vZxhR
xWptAP42g9P7kv2iPbu4YrraFGmwXRYdv9Jwnqj1JWzCfk7IegEA6Id6EjqfGIDt
0180BH6z4cwus4NL2P4Cz/1Ox5aj7Q8=
=OIoh
-----END PGP SIGNATURE-----

--kg5ejgqcqfwxthnd--
