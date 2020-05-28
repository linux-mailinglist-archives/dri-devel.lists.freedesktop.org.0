Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89481E6F6D
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BBC6E838;
	Thu, 28 May 2020 22:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647126E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 11:09:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B9E65817FA;
 Thu, 28 May 2020 07:09:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 May 2020 07:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=+s86+cK7gN9PLvlRSKhy0WKh2+J7H0/31/AiNdZTdZY=; b=BTrig9Qt
 p8mq49BtZ3G8nNJP6JP9BtrJN6bp291HAQT8JgX9uH8w4vr5nVEnn2hhoyHJto3D
 V9ZBg1Vcd0vyWbniWmvhO9pmxMwQHMGf7FOupAbCifvZTzmffXXKIXDscOmmKTte
 vbKulNc1y95kuen/eO8CH6gyk9jRHTugWft8MiFSedCiVDvcvq+ZnP6tObJz/zeE
 gxcfu6ENkoIV2GkOT0yHdTaP5lurfy0Ob8K/46ur8+I63AS1olZkZmDk4tIoE7iq
 TsySkuvI4gOF/oD0IV4k5QLuOKGHQsbeDrbqxJgfn5A+lQh5WLsYBr4Eh3a+m/Gt
 R+5eLAEJxP30zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=+s86+cK7gN9PLvlRSKhy0WKh2+J7H
 0/31/AiNdZTdZY=; b=j8Wbhp3Hsf2+fF+hEfSN8uVduTJcs81846ERasNX2OHqd
 rhvUSt6Q13idwmgxts8mgxOajjXjg3++P/LSDcVTtt8RqDfFqUaVclVgf9fNzAuT
 gCbK0E7hIjGe7jcUA/qUOVlVQDdhqbuNooqyWyU+auKtgNWzVThgdJOCm2bwhEfU
 EWE7NatUSS3JQJdVon1lKnt5mC/9IMSlDMAfRfoQFe57XVRFY379UcPSie1vZSkB
 dLyHCmOA0JkAxXlKQTRnWWmmm8X9fnttmiVifQM0qGh6O9liQCnG2sH59+dFW6Mf
 9G9F3FjuVS/3vvLDQQGSe2wKJuwDL7p1mQR9LOLpw==
X-ME-Sender: <xms:-ZvPXqeoHQZSpkpEhoxkwGOiCgv2qO9P3sEBpajYQMxXXv8TcmKcPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-pvPXkP1ENSzt7Mtbmbt-QTLJYplWtEkSZ6hwdfSs7NDaQOq5z60mA>
 <xmx:-pvPXrj3trI_TqqhUEVzvDV-NABu_xEXg8A1bSGcj-wNFcxuAM8tOA>
 <xmx:-pvPXn81-qwUC06KqZtw8QqHnjF-j-3a-aGtLp8qHnOyhIne_7lvjA>
 <xmx:-5vPXj9W_i5ciJloLC5eaKh2z3ysjiQZfoVYb0p9k5uVDvQHNLlD5Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B74A93280063;
 Thu, 28 May 2020 07:09:45 -0400 (EDT)
Date: Thu, 28 May 2020 13:09:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200528110944.hanv4qgc6w7whnj3@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Content-Type: multipart/mixed; boundary="===============1403590556=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1403590556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eza5ig7hrp5rv5nt"
Content-Disposition: inline


--eza5ig7hrp5rv5nt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR.

Thanks!
Maxime

drm-misc-fixes-2020-05-28:
Two ingenic fixes, one for a wrong cast, the other for a typo in a
comparison
The following changes since commit c54a8f1f329197d83d941ad84c4aa38bf282cbbd:

  drm/meson: pm resume add return errno branch (2020-05-13 12:00:37 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-05-28

for you to fetch changes up to abf56fadf0e208abfb13ad1ac0094416058da0ad:

  gpu/drm: Ingenic: Fix opaque pointer casted to wrong type (2020-05-17 14:16:15 +0200)

----------------------------------------------------------------
Two ingenic fixes, one for a wrong cast, the other for a typo in a
comparison

----------------------------------------------------------------
Paul Cercueil (2):
      gpu/drm: ingenic: Fix bogus crtc_atomic_check callback
      gpu/drm: Ingenic: Fix opaque pointer casted to wrong type

 drivers/gpu/drm/ingenic/ingenic-drm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--eza5ig7hrp5rv5nt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXs+b+AAKCRDj7w1vZxhR
xW8FAP9QdaTat2slUCH6fw0E1j0HPwUNLYYEG59uoIULne3AvgEAsCWGrgDpRQKY
qBN5MTujAFYyLPNckbWQUI+ZDRPKyQo=
=byX/
-----END PGP SIGNATURE-----

--eza5ig7hrp5rv5nt--

--===============1403590556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1403590556==--
