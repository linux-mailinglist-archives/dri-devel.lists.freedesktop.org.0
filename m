Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F21276A8A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B896EAB7;
	Thu, 24 Sep 2020 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1247D6E900
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:27:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B18D5C0103;
 Wed, 23 Sep 2020 04:27:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 23 Sep 2020 04:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=7T7QXEn/2rftvLggghlnS9aGECh
 JB37LxGCGbbm8eOk=; b=cucSkwiSFqG2Jgq8dPZPbzjE7Rg+3+cn1KVNOQee4oW
 wb1K/QkQugTr12AL5wjzL5sulJHELzVd7d441uZdoPS0LyNzdrR3ljFUpJemY1NL
 jtTYP9wwwCybjvIMNWQf/LkixytKb97xToMeM44T27nwWP5Dc4ajKO1tEng+pPbi
 tUw+lMWL/xUYbA1cln7Gn4VHUC3Py6y6tF+4fiJ1B1g0P7b5ekCnPVO3bTuwFA1A
 aK1BgJn/HEmzdnvvCUEDD+28fqK4BfeL5J605VkOa5uHbHY0ggYg0l9t4S+VpIxD
 tJO1JW0Kv70HxHc7gyaU3FlOaHkQs7SeYmAMDZX8erw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7T7QXE
 n/2rftvLggghlnS9aGEChJB37LxGCGbbm8eOk=; b=qgdwA3wdvl2fD2NEOI14Fx
 ihe7A2b6DvNrxSB/EuJbB/uME9jxqo4+XJj8Rjn3DJBGzWnoPfEOGQlYYY9/j5h7
 1ZWDi+ZoIIy5JtYF9h78Urt1CgzayUtGXIt9Ahra8kMeTdAW3WEoQLzp+Gm5Xte7
 hLM73KwL2uGy83Wrv5Cf7Y5YcXCdgy0T6w57Ikt0Jqi6+zYJV0SgmMNGMWp2JHFU
 uZeKo0z0MpDzlS6QFoDWtN4B2UPIBXS5qQ/CRZUNWOYxGhP2Qz2psOguphNYv2Tr
 ub5shVAGV609DpssKYt+oFoCr2R0h9+7SxEmf27AISUc8S2JPNnO+rSbsYtmSSGw
 ==
X-ME-Sender: <xms:-gZrX73fAtB221bvb_YcDzyL52AdHvYzqIuV8bxJFRl9qM7LM8HaWA>
 <xme:-gZrX6Etb5YQhzxfgZq7hKNIcRIWqptVagYp0qpJHSasA84gHJF0v4qNFgAWtjxy1
 xMs0wcV4Y9A6nTqdMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-gZrX75rIZZHSYDZs33tiFaArcwdBo9MSoRR991x_2twtrvAdqMwiA>
 <xmx:-gZrXw0AE0_rfw_wZa1EyR_iwvEnI0KIPcOOxbgGkb0IhvNZjQ8UjA>
 <xmx:-gZrX-F3YkveWOtiMNRL9RZFqXmTNI5n-bIxOUy8iJK3cbNDcuNwVA>
 <xmx:-wZrX7MDHWePfw9lblsaNCQB-cSD2qrl1vSP4eXUJ2dxrK-QTZdC1g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE21A328005E;
 Wed, 23 Sep 2020 04:27:37 -0400 (EDT)
Date: Wed, 23 Sep 2020 10:27:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs instead
 of active
Message-ID: <20200923082735.zbwz5mdrkgdnugby@gilmour.lan>
References: <20200918145918.101068-1-maxime@cerno.tech>
 <CAPY8ntAHcPzZqS77-9=4Rz-vpu9=3LL8xM2Kwa28spb1vLHv-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAHcPzZqS77-9=4Rz-vpu9=3LL8xM2Kwa28spb1vLHv-w@mail.gmail.com>
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0914415309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0914415309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tkwoz5hzds3dzeu3"
Content-Disposition: inline


--tkwoz5hzds3dzeu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 04:43:20PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> Thanks for the patch.
>=20
> On Fri, 18 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The HVS has three FIFOs that can be assigned to a number of PixelValves
> > through a mux.
> >
> > However, changing that FIFO requires that we disable and then enable the
> > pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
> > just the active ones.
> >
> > Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied, thanks!
Maxime

--tkwoz5hzds3dzeu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2sG9wAKCRDj7w1vZxhR
xbXYAQD3GFGAsy8QQKDPiApkaPz1pl2BUuIIsasWGXVt8m/dSwEAxkvbtFPZPLg8
g79oxBCYeFrXdHlciExYWvAIDU82Rwg=
=4Yta
-----END PGP SIGNATURE-----

--tkwoz5hzds3dzeu3--

--===============0914415309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0914415309==--
