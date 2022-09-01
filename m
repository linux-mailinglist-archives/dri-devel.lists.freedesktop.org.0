Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5725A9B15
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 17:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A9210E21D;
	Thu,  1 Sep 2022 15:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF2D10E213
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 15:02:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D76035C01D4;
 Thu,  1 Sep 2022 11:02:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Sep 2022 11:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662044542; x=1662130942; bh=OnCzvjXHRH
 y3N01m9+/V/6PmzsRMFO+pjDdDzmDLqh8=; b=bAWw0w7lmxKpxZhg0KSndm5IGa
 CjvSz8L9c46N144paZAd/ACxx4RaBaGy69H56TmCDTThTY+q17DurbG6LH1WBi57
 LvkOeWBf/QCQRgOUz9/cs6xYu6irXXAAaG/YrqB7zup71MCijLAXRfF7zpyfYxen
 verVO4QKyY4ydq+zoWe0hlzunBuGUK03oYQzTkGYtMhhJfKQP8sWV1DqDfatv3d1
 eTzGr+VA98WfhEYaa/CFpjW3riVnAFJNfhoDZlZSL6zOy7h460Kp8krb87wYEals
 /eI5AEU5q2y7i/KnTJuvRPp2gv0QGz0n7xjMAVaafbFqRxbbmzS8NjDbVkDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1662044542; x=1662130942; bh=OnCzvjXHRHy3N01m9+/V/6PmzsRM
 FO+pjDdDzmDLqh8=; b=jxvUFZvhqZPLAJFitpqPXFK02DNY6gEoVnbdqlzONrTx
 ZXlWjBv67U9rAioUyCZpqf8OBuYEeUrWrUBVGjtn5S2sYXlAGGwWOwY5IoKGi2ld
 rzIZ7TV/dCkMlNPBg1hToMEOaEp050WElhfHU4Stpk3fIACol/cjsfAHgXskminz
 E2eKBMyrTpqgupR7kVDXYnZwdBLfYDedW4vfZEWjSurlzx37DQ3XsLJcYDhOOvO5
 3bioGzxfv7fTnLz9Gp7TRSZLoi+ZoUf/cBIlTS9XLfw2+K04pzcV0llfK74K/e1c
 4+r/Bkaa7G1TYNOEx1ZVDwRky93ijtOQ6SirNK3qLg==
X-ME-Sender: <xms:fMkQYxbw-rm4rljKQSL-WISJRfFF6Ns2VNfijNJgy4V-IBgIHodBmg>
 <xme:fMkQY4YZylOnCpIXYs8_FWZU_rddoJUB6Z0K9JoVEBdbx6B4GlYwwTGEd04zCKDrs
 WpgulftJbcDd2EgcII>
X-ME-Received: <xmr:fMkQYz-a4_LJX6K1yRLU0fnrcqr8CwtfNGRgxbjyLso3pCzaOfUZw8Naig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fckQY_qydAAJ8qPV0HJCOf1acyfGkqS4eTRPHMY5DXtGi11fMcZ1AQ>
 <xmx:fckQY8qUOBEp165phkWFRoy5Obgf6JyxdsnVup_Pq4MaKMczhCAkYQ>
 <xmx:fckQY1Ry4wEXfEqZSIIunm04iVHBn8_4x0wDocsIUnVg-i79oFaCqQ>
 <xmx:fskQYygebStlrWoaUmohAB_yOXEftWdrJk3TmHk8TxUSPTkYlhnwfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 11:02:20 -0400 (EDT)
Date: Thu, 1 Sep 2022 17:02:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm: Simplify testing on UML with kunit.py
Message-ID: <20220901150216.gt4ozth6oz6cwgjt@houat>
References: <20220901133621.353270-1-michal.winiarski@intel.com>
 <20220901140253.6ebvykv35kyc3v3w@houat>
 <20220901144909.6rihfj4mgklk3ddf@nostramo.hardline.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v37zbd2gmhxbbh3v"
Content-Disposition: inline
In-Reply-To: <20220901144909.6rihfj4mgklk3ddf@nostramo.hardline.pl>
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
Cc: linux-fbdev@vger.kernel.org, David Gow <davidgow@google.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v37zbd2gmhxbbh3v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 04:49:09PM +0200, Micha=C5=82 Winiarski wrote:
> On Thu, Sep 01, 2022 at 04:02:53PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Sep 01, 2022 at 03:36:21PM +0200, Micha=C5=82 Winiarski wrote:
> > > DRM depends on IOMEM and DMA, introduce an additional Kconfig to pull=
 in
> > > IOMEM and DMA emulation on UML.
> > > Since --kconfig_add usage is no longer needed, remove it from
> > > documentation.
> > >=20
> > > Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> > > ---
> > >  Documentation/gpu/drm-internals.rst | 7 +------
> > >  drivers/video/Kconfig               | 4 ++++
> > >  2 files changed, 5 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/=
drm-internals.rst
> > > index 5fd20a306718..c264a9587d21 100644
> > > --- a/Documentation/gpu/drm-internals.rst
> > > +++ b/Documentation/gpu/drm-internals.rst
> > > @@ -228,16 +228,11 @@ follows:
> > > =20
> > >  .. code-block:: bash
> > > =20
> > > -	$ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/dr=
m/tests \
> > > -		--kconfig_add CONFIG_VIRTIO_UML=3Dy \
> > > -		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=3Dy
> > > +	$ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/dr=
m/tests
> > > =20
> > >  .. note::
> > >  	The configuration included in ``.kunitconfig`` should be as generic=
 as
> > >  	possible.
> > > -	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
> > > -	included in it because they are only required for User Mode Linux.
> > > -
> >=20
> > I'm all for removing that part of the documentation, but because
> > 6fc3a8636a7b, in 6.0 should address this entirely? Why would we need
> > that other symbol?
>=20
> We don't. I wasn't aware that 6fc3a8636a7b exists and had this one in my =
tree
> prior to 6.0.
> (well... technically we do need those other symbols and don't need VIRTIO=
, but
> since CONFIG_UML_PCI_OVER_VIRTIO pull in those two, it also works).
> Since docs were not updated, I didn't see any conflicts when rebasing.
>=20
> Sorry for the noise, please ignore this patch.

I mean, the doc still isn't up to date, so please send that part of the
patch :)

Maxime

--v37zbd2gmhxbbh3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxDJeAAKCRDj7w1vZxhR
xfn6AP9az1d/tvykqX2O94leJJ+WaUANxEmlxQ4simD8YMJHDwEA3+Lorxpg5ULV
d3Xg5NRITlDK7yxBCYTbbOdSjfgtggg=
=jMVD
-----END PGP SIGNATURE-----

--v37zbd2gmhxbbh3v--
