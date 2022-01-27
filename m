Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99C49DDA3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CAD10EF21;
	Thu, 27 Jan 2022 09:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503D510EF23
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:18:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B34C3580350;
 Thu, 27 Jan 2022 04:18:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Jan 2022 04:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=9T5RBslyEteXBKTxiCWnHx41KnlmqwYF4wb/qh
 g+Kfg=; b=gz+NlBbawCZK1DOG8BwUgjYruyApOVSjjeHVkn+AL3/CIensP0iSQ0
 Rd+MylVBNFZhuwZRNyQJPI22klaptWVx+Ke76gBeDBKxxALr2uXnsK4yqSufobI6
 18c62w3cpYF7m/7BBgBEF5GLvaHA4fDc+xATeQDui1OBi3Qi212dzHsgdALHZ4zu
 tmnMogAbIE90VT3xvjmGb/PHm4zemnbAS78AIuQKqpnjteHFXYbJnbtQvEosFGwk
 4hidLsUztQfOlj1hCFlm+3mhDmfXdlsk6gC6LgPtZZomwz0qdpp8C+OSZJ+fD/Xn
 yhSbUVXWNYbBmtF5GOh8NEPdTj6q672g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9T5RBslyEteXBKTxi
 CWnHx41KnlmqwYF4wb/qhg+Kfg=; b=ACiwWx8nT9UVs9xnAW0muyPmcsBAC2dPO
 JpXc7uZ7dyY8wguF+ciWCKDLCKNqRcScZoGIE7FC+PZnQFG0VrbZaPLpSaIRC9Xj
 b9iA3FXvOC109ykhFCi8ZGTqC+w06j/CshCbaQQ3X5yZfFCu88Def2K49lwr+msn
 q6P7NjCrY2CExOy2vXl82y28QfAsuZOSxQmoMe2AqAtPZ1LHHxjRIvSZNJDCgezu
 AuUOQYEc6aFfFMxE7Wsf4l7ee0MEdCxQWszyL9vfxZIxhKkVE0kzeHKmPw/EY17h
 yZoTwQ1nty4pkwknp405/NAjqG9kyOLkou9sYh9d3Zda+S0f28TuQ==
X-ME-Sender: <xms:X2PyYbLBPspeccnceI5EyotcWrDez0Er1EeK0U6mLBZS7Y1tzL-vUg>
 <xme:X2PyYfKAzLKk4_N93TADPVjpZpwF2PH3rJTjs5zYHtJzRYKo1uRrw5Ijfk2VlJ9Mo
 u8vpGzMTZxCJgkqmmA>
X-ME-Received: <xmr:X2PyYTurZI9jh1UFmTno-fXD87QF3Ty5NnSjylTQGZVClGDXtXRNVgF8KFETLq7N9OydaJxKxTvH0_dyzvrlaLO2Xf0ERYHzqEhr0lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YGPyYUZW-8g1zq-063gLSVyVcl6WlxMRjeGQKi6S8ZM180q-N6hMeQ>
 <xmx:YGPyYSZkUtufYmK49t1ULhao90Xx3BOxnMvPLx1S-jxkzdtF1myjGg>
 <xmx:YGPyYYBk_S9-JMyegb5ZcRJL-84ce5knLm0zcJn2c_y2RXrIrM88Xw>
 <xmx:YGPyYappdGraeNojxsp8qu34-f6YX7-sefGEkD9pbkkSIvDjGas5VQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 04:18:23 -0500 (EST)
Date: Thu, 27 Jan 2022 10:18:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <20220127091820.5ktfbovvw5bnef2e@houat>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
 <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de>
 <YfFM+6pvJLmtY0Zg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xbrmyhidxdqgdgca"
Content-Disposition: inline
In-Reply-To: <YfFM+6pvJLmtY0Zg@smile.fi.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xbrmyhidxdqgdgca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 03:30:35PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 12:38:09PM +0100, Helge Deller wrote:
> > On 1/26/22 12:24, Daniel Vetter wrote:
> > > On Wed, Jan 26, 2022 at 12:18 PM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > >> On 1/26/22 11:59, Helge Deller wrote:
> > >>> On 1/26/22 11:02, Andy Shevchenko wrote:
>=20
> ...
>=20
> > >>>> P.S. For the record, I will personally NAK any attempts to remove =
that
> > >>>> driver from the kernel. And this is another point why it's better =
not
> > >>>> to be under the staging.
> > >>>
> > >>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> > >>> features or even attempting to remove fbdev altogether (unless all
> > >>> relevant drivers are ported to DRM).
> > >>
> > >> But that will never happen if we keep moving the goal post.
> > >>
> > >> At some point new fbdev drivers should not be added anymore, otherwi=
se
> > >> the number of existing drivers that need conversion will keep growin=
g.
> > >
> > > And that point was about 5 years ago, and has been discussed at some
> > > plumbers meanwhile, resulting in the staging TODO patches to make
> > > these drm drivers to destage them.
> > >
> > > Fixing bugs in fbdev is all fine, reopening it for merging new driver=
s is not.
> >=20
> > We are on the same page!
> > I'm not at all proposing to include new drivers for (relatively) new
> > hardware into fbdev, which is capable to be written as DRM driver.
>=20
> Agree. The point here is neither in opening it for new comers nor for
> expanding, the drivers in question are all in the kernel in different fol=
der
> that is not suitable for them, but I gave up. I see that nobody wants
> maintainers to be appearing for the old _working_ code, as it was shown
> already by the DVB case few month ago.

I mean, the main reason fbtft was in staging all this time has never
been about fbdev. It was about the device tree bindings that have never
been documented, reviewed and agreed upon. And given its bindings, we're
very far from it.

That's what Noralf has been mostly working on all this time, and yeah,
it takes time but we're getting there.

Maxime

--xbrmyhidxdqgdgca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfJjXAAKCRDj7w1vZxhR
xULNAQCrENDC07h9aXPXO4Zo9zV4kHn9oaiD/6+T+S3Kdu4ccwD+L9kAd89Qtw9V
5/R0wrL1Cozn+TiEGqlFRMfAAuNuJwY=
=Dqiz
-----END PGP SIGNATURE-----

--xbrmyhidxdqgdgca--
