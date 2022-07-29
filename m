Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D756584E54
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 11:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450710E100;
	Fri, 29 Jul 2022 09:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10410E100;
 Fri, 29 Jul 2022 09:45:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 67B54320097E;
 Fri, 29 Jul 2022 05:45:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 29 Jul 2022 05:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1659087919; x=1659174319; bh=Nb1XFfcUmB4xSnr2WbBKf7pSNBG/bD/tv8e
 22Ydwx5A=; b=jlr/cQUC6ZbkuF+LoVnD/U2wrP8AHeng9AcnK9iKSrb1EwHBHXO
 naX230P6xr0589d7Rx0p/fS3TjzlR2uSlxYVOIuK4czJNCQhMTy11T2mczeYOsDP
 rhLQKUj075Ks97S89XeZWw1kWXm7RJsnM0bCfPhWylQ6naFKzxW2oxPW8IUFS3mH
 r8JBzkthnEgT3UwtViVE11FqDaBHPmOk6j6kjlZxKkfac4XtW5geHgEBvvh05JIQ
 j+0FBbIDs3dkFZkLeysfDATQcq4zmr4cPP043s7jYfi97t8ZR+d4COfiNbZzT4yI
 iBAhXafr8/98XcMuWG7BZlOWDNyR2FJf4ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659087919; x=
 1659174319; bh=Nb1XFfcUmB4xSnr2WbBKf7pSNBG/bD/tv8e22Ydwx5A=; b=o
 kXPGq5e49T34YKeRSvsMAqAUMsJBYpA/w9maSNqLjKFMoXov/l+RsXAQGowokhyk
 y8Yz350naSTQbCkbOVsi2k2BKBmFgyPCtpBW/Go3ewC++ckPn7jK+jcw6YrcXprL
 zdJU83bv5GSGLHTu7/K32gqii2i0OzfOmqiGVzUeC5hxMP6iQF0i4zV6cEOMI9QP
 wAbNSsYbIBZFezINE4C0MrkJGdi6DDrnOXYlpPa456F7gTzplQx/QUbO+tRWhYnu
 5TpV55QTHhvLjc+iPB5IQY37+u6BoUtPs/qOwwu7/zczxrrsWQXq3ExNmnnQoBVv
 2MH573WgMcJoG4/XdnfYQ==
X-ME-Sender: <xms:L6zjYkjK5J9FKfOV5AvG1NLrwa6orcqCx1DfIERu-bB-ij5PPd-_Tg>
 <xme:L6zjYtDsfNSC6nJzKpf1VNay4TpNoXqNX4Id2ZZO8oIcKPXaajExhkdU9XIkpyNjN
 mU2rBD0wetu5_w5K5I>
X-ME-Received: <xmr:L6zjYsEMFF0YgvULRl0G8MtjWbWU_CUTWfd6rqaBCHfhI4vGid6VrPO4Gx9vo-pC8SJmQjFYM3Xoof_YhJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:L6zjYlRAzgmdGwu8Q9OxAbz_lKH7hM5wH0HVmu3Z7OG-fT2hQZNXsg>
 <xmx:L6zjYhygUNx3O4gerTr5ih7OrnaS7AZzKWNEeilYxljPFRVTDG-8Dg>
 <xmx:L6zjYj7w46DKDARVs5tID_Eaztj0vnweXZ6UO-GdS30lOb1tao5I0g>
 <xmx:L6zjYmpxzy5aMkgDbKvkKkVlOvxUJJsCPtOWS-HiWopmJLSctKyMYg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 05:45:18 -0400 (EDT)
Date: Fri, 29 Jul 2022 11:45:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220729094514.sfzhc3gqjgwgal62@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gkue4arypncbwmyr"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gkue4arypncbwmyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

It's a partial resend from yesterday that only had the simpledrm but the mail somehow got lost.

Maxime

drm-misc-fixes-2022-07-29:
One fix to fix simpledrm mode_valid return value, and one for page
migration in nouveau
The following changes since commit 02c87df2480ac855d88ee308ce3fa857d9bd55a8:

  drm/imx/dcss: Add missing of_node_put() in fail path (2022-07-20 10:12:15 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-07-29

for you to fetch changes up to 66cee9097e2b74ff3c8cc040ce5717c521a0c3fa:

  nouveau/svm: Fix to migrate all requested pages (2022-07-28 16:43:31 -0400)

----------------------------------------------------------------
One fix to fix simpledrm mode_valid return value, and one for page
migration in nouveau

----------------------------------------------------------------
Alistair Popple (1):
      nouveau/svm: Fix to migrate all requested pages

Nathan Chancellor (1):
      drm/simpledrm: Fix return type of simpledrm_simple_display_pipe_mode_valid()

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++++-
 drivers/gpu/drm/tiny/simpledrm.c       | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

--gkue4arypncbwmyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYuOsKgAKCRCIQ8rmN6G3
y4MJAP9FWzwxfl2685THKnGfcN79yIMwbe/2Vsi18u22AsmReQD/faDammKkpaMR
+y+rXwv/nG1+emeinO8Gk/4/0ksHgOw=
=E79N
-----END PGP SIGNATURE-----

--gkue4arypncbwmyr--
