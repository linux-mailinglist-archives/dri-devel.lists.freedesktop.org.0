Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421BF1A0902
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509646E5B6;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E37689B48
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:48:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D4D915C012E;
 Mon,  6 Apr 2020 03:48:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9dE5bWb5CFznmhgfvUj0JT/i+oL
 ZRqx99hiVJKGJev8=; b=sUMK2eukssn8Vj5xGJ5MJZwnVTcgj4H2PewWVGBDeyt
 IRw/wy+8TBFmbWmNIPzbnS6Or9AaDkbD2wnWif+j1STBzIXcs7Ty/cY5A556zC8H
 XZuRGC0K6iv5b+m/+6fry3/AYhuvq8g2Zzykr6dyOlePEZC/RgwXTV3DcRGyXrcu
 tXnWA7CT5vBb8EB2buOqS9CknX8A2iTz3XiX0SwrGyerqBJpybS1bgcv84IkE/Yo
 neN0Z3Us3siL8LjgD8i60UdlLzbvzF2OTdPV2b4HV3UjFW/RKyzayARYiNv2LybU
 k5eW46gSzJP4CA1fx0U4tF7bVz1B4Ie38fUgX3qLABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9dE5bW
 b5CFznmhgfvUj0JT/i+oLZRqx99hiVJKGJev8=; b=4FZB4ymQjBcPA/lPa22nOp
 OLMdTG6EAu1U4u0k2taMqYf9DCdpsHEQ2+UOTLkBkKCG5yQrZhMOY5/EVgDtUIeT
 3BTW8BJ0fPzlbPJQl5ZvCEObU+l1te6E24bWaVOl/kfS4ya+5BUfsVG8C/Zy3fxy
 YNT3/G9Kwz3VRlHgS9kCYai9J9V845/WEkv6CKFklyJYag4eR8IIR8EnASevDmSA
 aRkcoaw8p7XTIxm+x/nw52BZJ2E3Dp8OPPFAn7w7AeZKTnLVjod92UmAmbCfDIa8
 p/5DUQEIEdZE2sPb4SdVa9+7Kc/3OEWaeSwYXOgmAEY5yt9aMex2VzP8wqwHE9Ww
 ==
X-ME-Sender: <xms:sd6KXiPJLwhfky8gJMakibJwFxu0dki7Kpxpwxn04XuZ0rFwaFA8Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghruf
 hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:sd6KXmDkUx7fMORrhY4XtheuPsUjCTCtlQol3P7BhDxp8YUsh-MCxQ>
 <xmx:sd6KXmTCjPynQqFGc70wKWfuK35JwZ2CTTWdDd9J1KK9XFKjTwSqxQ>
 <xmx:sd6KXgY-819YkUAJhSKDjAemPzQ2gm78AQAaGM8SeOXzgJ7Dt24h0g>
 <xmx:sd6KXquM6cY5Z474XCVgg6YveTMc-2DBvSJM7fpKw5X-aJ7bFqSpPg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68A783280060;
 Mon,  6 Apr 2020 03:48:01 -0400 (EDT)
Date: Mon, 6 Apr 2020 09:48:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: bridge: thc63lvd1024: Convert
 binding to YAML
Message-ID: <20200406074800.bp6tjfxgglpkb3n2@gilmour.lan>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1300650444=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1300650444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="edo3jwoybu7hb67r"
Content-Disposition: inline


--edo3jwoybu7hb67r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:23:17AM +0300, Laurent Pinchart wrote:
> Convert the Thine THC63LVD1024 text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--edo3jwoybu7hb67r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoresAAKCRDj7w1vZxhR
xSXSAQD5loxMEjoJbrkv9S4ccq0Co+MCoI69F50dOsVXcggs3QEA4i6kYYbRToqm
GhoTBP/bvZybvpC7J152jhnbS/VJ8AA=
=N++E
-----END PGP SIGNATURE-----

--edo3jwoybu7hb67r--

--===============1300650444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1300650444==--
