Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAA39D60C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D176E3BB;
	Mon,  7 Jun 2021 07:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A8D6E3BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 07:32:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD815580824;
 Mon,  7 Jun 2021 03:32:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Jun 2021 03:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=iTa+y0N0gtlf3iHx3Vp8wzEBwfT
 M+qphJDAO6uaASDk=; b=upXtelfGNP4zIkMuLQpQEsegBbThlmVmchEKWtxbGoI
 DbpbUXAt1tQ/vBZqn1KZNCNVKEDgZeG4Yr32OevpE+Pc8LY2YS/pfSqeqPD2miey
 p89N1hlHZ/e5KiofGpiF/BLYGriNyjhApzu73FdBxojeQxNgcelY27Ho1Td/LgpD
 PXLU3ren+wP1jSI2xabAA78ZhIX4ifoWngcyEFdSPf6cNBro24rPHes6SpqK8haV
 zEAsG2kkhmzzV68+DBqu95JMg/NqgxB4NBXIULywPIle/+ysINymLjB6bO7LNXNx
 fxeyxPxjOw/GoM5T7y7vOKTFSAtX/hpDeciNqvf/Drg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iTa+y0
 N0gtlf3iHx3Vp8wzEBwfTM+qphJDAO6uaASDk=; b=EypXqm8rV0BrBA2F3FKF6z
 TUGmbapnyaXzcFLShcoTjZUXwqppz0Oeq4M1eFCtXH/uIxedklWDVNIikSBiFPEs
 kRfEoiKEPM4Uul+wRaEtZMzuYMVPFX9QRR/nd3LKzNHMEI3L8wRrK01AkKpYahGA
 FU//+Byv5Lh/Mb2KcT1xZK2MKuX4NS8fZlvczRkQmV3s6uPqX9gCTAmKtCdoD5HK
 ed4bwnR7+PuOBnp3KE2eWNNWfcaU+oE76UjQyTJcdT/205qDRC5LxSW7lFPdZPmV
 +wHkzwJff9FSph12mhBril4XssjaMl2sF671G20tyBGfN/08cevCD9SkBQMLNGxA
 ==
X-ME-Sender: <xms:n8u9YP_0jGV94TZMsWl3i_qcuooEMplT1aUoLA8CCd7n3d_b_nazSg>
 <xme:n8u9YLuGKyZkKHFKavdvaTHghZ6_cmQBXjj_DZyQOJw_NJtWTy2w5jDImt-qkn2Tj
 qqZGY2oGtYeptNnIvo>
X-ME-Received: <xmr:n8u9YNC3WLH8UeNQM5bZ9d0kARcnSgYVi4D7_3ZzBpsbLNZ3o1n_AK0RhylPsZHwF3haPFklS5-ragIuWoUVUOaTmJSGTOW7r8pN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n8u9YLePjlAzVN30h5uAMqKHeJ8au3vWM_275hcZP4zwni2J2jEhgw>
 <xmx:n8u9YENfyczcV_kQWztFDVWTpWIhQUfLl_YZJx3bkth8loxs5VdxIw>
 <xmx:n8u9YNld_onC3lp-hEAjqNl797OJ-v1Xl8VoCrzxy_Q3LVmV__R_Cg>
 <xmx:ocu9YAmOifJ6GcjoOetI8bKrnlDqnOdJwFWKBSq7stqy-cBVpCJTwQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 03:32:46 -0400 (EDT)
Date: Mon, 7 Jun 2021 09:32:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
Message-ID: <20210607073245.dhzoqhlrwtfpx2kq@gilmour>
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
 <CACRpkdbVyMBEAr0n1+d3KSwV5J3spgfW6US9vwz1=2f34Ep3dQ@mail.gmail.com>
 <20210604080139.sccm3fggd3jvkkpa@gilmour>
 <CACRpkdb0Wg8MoOrJxvjkTkncpyOHE1E7oYWWMOzJoxTxWN2R=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tpvvduoxobevavxs"
Content-Disposition: inline
In-Reply-To: <CACRpkdb0Wg8MoOrJxvjkTkncpyOHE1E7oYWWMOzJoxTxWN2R=Q@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tpvvduoxobevavxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 11:45:36PM +0200, Linus Walleij wrote:
> On Fri, Jun 4, 2021 at 10:01 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, May 28, 2021 at 01:57:56AM +0200, Linus Walleij wrote:
> > > On Mon, May 24, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > >
> > > > The new gpiod interface takes care of parsing the GPIO flags and to
> > > > return the logical value when accessing an active-low GPIO, so swit=
ching
> > > > to it simplifies a lot the driver.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > Thanks for fixing this!
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Is it for both patches or just this one?
>=20
> I went and added Reviewed-by: to 1/2 as well so you can merge the
> patches. Was simple enough even though I'm not a VC4 expert.

Thanks :)

Applied both

Maxime

--tpvvduoxobevavxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL3LnQAKCRDj7w1vZxhR
xe/2AQCEpsPhJ7q9jqxliErOEw41mpGow27Jlohb2I9sdAC6FAEAoufdgysTtl0S
5PF0gBMgWyBSMUuc1dyJbwXw6En4BAc=
=1cdn
-----END PGP SIGNATURE-----

--tpvvduoxobevavxs--
