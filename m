Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60B29FF98
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85BC6E984;
	Fri, 30 Oct 2020 08:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5C6E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:27:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4197C5C00D1;
 Thu, 29 Oct 2020 05:27:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 05:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=UzAu8NK8uIq2npbopT5aSGfEzHe
 1C9AHKEoq7ZMMT24=; b=J9Y+17LWSq5sLr3lWihKFgecDRhbvet5hzGUekXPVkz
 HiVEs63Kc6BPCVIk7y/AAUv0SyN+gVQLmnhCOknqleIL0HsGdfaeD7piseqH4yK9
 n7Albm0vtT9pXhnQS5FeDLOiEngLEftLJJ0S+cSEiC9Va/j2XzWKuQE1RUNxBdHk
 io53aldGOdOenHMkEbICQp9YZzQVz4ZVJ6cq4wBGEOcFhGoC1zLlwj/M+PxlC2hD
 LdmVqXTMppAZrv03lky7mSJOxlZmLYYeYA+KrLhQC2PsGHh6OQbvKcQfgTc480pX
 3LQ2bZmWHNreEMAHbHUa/H+7VOz7EX8dFzwA7KmQddw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UzAu8N
 K8uIq2npbopT5aSGfEzHe1C9AHKEoq7ZMMT24=; b=d9spZqnRdN7ZjrAM3DYgLs
 cysh5L4Oya0EqwzHjWcduG2YS/YcS2aOHYRcqApT5vCFFXB27oaYoxg1L3j8Sz0Q
 OOgp+OuOXWrN39O+s185nNkH4sBw9EP996RlqV8vfE3fp13/skADXzBIZITzmind
 JzqQS3hj9rtaGxsSg0UtZorQ9ZO7qXlwukXrihjfZtAipuKLe0/wZS6h6UF/NEGw
 +ifA9ofPPLQFBhLWYq0HCjXvWDcuf6UEz4i6IwxtwcUPdft1Pr8WRVnoQ5MsxbYQ
 df15Ozs/JzlQhz1oKmboqGNrvPAvqLyMmjVVQPiKtMDx4j2Y3iiUbly3qNzKzezQ
 ==
X-ME-Sender: <xms:74qaX94ARh7U8OOh-tLPcyyMiJGPnrvi4CGO5Qr8Ef09sbrbyYUxOw>
 <xme:74qaX67uM2HFnUH-P6GKCC9qXNlU9aHBqYJ63TiaRljvs3770rPL7_xGeDhb2icja
 JX5ZSs7I-xUXJG12mU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:74qaX0dMVe9XkAd3rQ66Ktrn2CHJsDYVlO5sCWeAWZhsXwCu096Xug>
 <xmx:74qaX2KwMLKPPSO0R-ivxZR8dywjdws7bsPUJxqRI6b_9kJQ7CO1MQ>
 <xmx:74qaXxLqzm8KWGtgp7d96nNqb83nwmvQI4Zx0T6idF7YWZKbhdi-YA>
 <xmx:8IqaX2qATm-nPHN4oxMWnVSSl9ChEa59g8SPM0Czq9te9gczaQsEAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A16D4328005D;
 Thu, 29 Oct 2020 05:27:11 -0400 (EDT)
Date: Thu, 29 Oct 2020 10:27:10 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Add a name to the codec DAI component
Message-ID: <20201029092710.iyijg37jezwh5vff@gilmour.lan>
References: <20200708144555.718404-1-maxime@cerno.tech>
 <CAPY8ntDgx67bba2NtNVToEZaLrX5cmrdTB51=0L7qV5F5UOJiw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDgx67bba2NtNVToEZaLrX5cmrdTB51=0L7qV5F5UOJiw@mail.gmail.com>
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0617986438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0617986438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gxkmhv6yu6yulli4"
Content-Disposition: inline


--gxkmhv6yu6yulli4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 01:30:32PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Wed, 8 Jul 2020 at 15:46, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Since the components for a given device in ASoC are identified by their
> > name, it makes sense to add one even though it's not strictly necessary.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied, thanks!
Maxime

--gxkmhv6yu6yulli4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5qK7gAKCRDj7w1vZxhR
xYqOAP9JvMVugjx3JTtjlRitnxpJDOXVgxCuJwNKbLmGzuZLywEAl8tNYMEi6+z/
tqgqUfkOPzH7GnrCTZhiPW7Yq08Qlwk=
=nRwf
-----END PGP SIGNATURE-----

--gxkmhv6yu6yulli4--

--===============0617986438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0617986438==--
