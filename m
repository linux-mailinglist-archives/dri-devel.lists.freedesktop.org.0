Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C164D44603B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 08:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A06E156;
	Fri,  5 Nov 2021 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8616E14D;
 Fri,  5 Nov 2021 07:43:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 702452B01266;
 Fri,  5 Nov 2021 03:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 05 Nov 2021 03:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=Efzn8vluX4PQyP9OF4+SHfXpVAWxFIj8lk5k1rdqvHM=; b=EnMY3D8U
 m9ceBwUM4/H6iCTGCp4px/G1RFgL0fjcuNBUVJ/eg5wGjpTEu5v0gLt4yWlp0AzQ
 7Jc1D/JNSYGGrvJOxK9SaEKuzA1PdqiMgvp/L3Eac7ljFQd/0IQrNJ3QCE+nL58M
 /JM2NWwXlW/FgUn3lpsYEjSTIq3ObccK4QqF3KGx4P3raR+hH7obyqr/ZRufzHfV
 VlRHNAWGTDMzX9WnFH+8/TnwJM9ynAk2mC2O0tjrk2oJPkqR9k0l3NJ5d8H6AU2u
 QOVuDc8J8YERtvgtb6AfGlRB38TmNQfnrJ434wYml658ZUwr1uP4gAZKVwD2IWTq
 8tY6Q0E8Sou86w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Efzn8vluX4PQyP9OF4+SHfXpVAWxF
 Ij8lk5k1rdqvHM=; b=aoI8idQd49lUJ8ryJbNjPpHM6fy5m4/2zMWx4lF8aewcQ
 9W3994BWT62vJREA04U11yDKoEBNvgZbtLxOtTj30HPdK0VD3g4xYkYEhTURrxn0
 vX4GkFG3fhs2Dxn240N5ou2XnR+h/xtPLifZKCKxuKmyuiV1QKuLT/+2FJa3HkaX
 i6Pk7wyeHF+kClFMUYweeytPcGu48fkLyjNXz4gcCqofh4vidlCCXovALDF5C8tK
 F72uAFJR1ZY6Z6a8+lYfPKbwUwbqMCwqrx8gfndKFrAVoyFqYTKuZJ2/ns+T2zjt
 3t5y2Q6SAkwOyCLjMezpgOMYkLqwHHIJToyDP97Qg==
X-ME-Sender: <xms:meCEYU0tyzrLCSG3ifvgQJ7xNqeJiOH21I7iXa75mfi6IBbAKSyMHA>
 <xme:meCEYfGTJ2RI_lbGfnzfmAm96ojFA6gU2XsApDY1s0D08w6NgbUyagN_uH2ZM-BfW
 9t1jSDwqiZZz2-S-3g>
X-ME-Received: <xmr:meCEYc7bUIvdoca40Ac27z6mCvP9QOnGueuFXztCEdsy89wUiDV74WgBkZ2s1jFVWmnIjOg4sADCPs34qWbxttZ967ahtXwTGqHADFuX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdehgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:meCEYd0WtIHFbERWxqetIm84uQJlExOMucWhErS7sNrvsfHABkM5Hg>
 <xmx:meCEYXEOOPzefwxF-rDms4TOR7fenxliTNUi8O-eOSGGCoAQlSySYg>
 <xmx:meCEYW9I6o_bvm9W71xJVnyD5oPqxNwQnuCXckNdq1od48rfiuL9bQ>
 <xmx:muCEYeCoILA1tuYOKwl8n2wS6zmjWKGq-lbq7UYAhBYseqjh4_LXis6sEXw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 03:43:21 -0400 (EDT)
Date: Fri, 5 Nov 2021 08:43:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20211105074318.oy6rwjr5wcw6qpjj@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pqq25x2c4mvy4ds7"
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pqq25x2c4mvy4ds7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next-fixes PR

Thanks!
Maxime

drm-misc-next-fixes-2021-11-05:
A refcounting fix for outstanding fence callbacks.
The following changes since commit b3ec8cdf457e5e63d396fe1346cc788cf7c1b578:

  fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO li=
st) (2021-10-13 15:29:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-=
11-05

for you to fetch changes up to ff2d23843f7fb4f13055be5a4a9a20ddd04e6e9c:

  dma-buf/poll: Get a file reference for outstanding fence callbacks (2021-=
11-04 09:18:57 +0100)

----------------------------------------------------------------
A refcounting fix for outstanding fence callbacks.

----------------------------------------------------------------
Michel D=E4nzer (1):
      dma-buf/poll: Get a file reference for outstanding fence callbacks

 drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

--pqq25x2c4mvy4ds7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYTglgAKCRDj7w1vZxhR
xWE9AQD+Kj/8Jmi4OqfndOFRHQ3YVLa5fzLQ17bKv8EbexKJqwD9F2Xz6eazU6r6
KMGL5gKxqPsOceKAYa0zCEjYMedsaAc=
=BFuV
-----END PGP SIGNATURE-----

--pqq25x2c4mvy4ds7--
