Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64161D4651
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2906EBF2;
	Fri, 15 May 2020 06:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD16EAD0;
 Thu, 14 May 2020 07:35:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D78D4A29;
 Thu, 14 May 2020 03:35:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 14 May 2020 03:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=7vioA6goNNPKB0hsrRb4EAfBFv1nscdZKSfRlI+L9Uc=; b=Zz/kQ7W4
 OkUPzgL6ILnbJyu8ccd9rq0546AVuoZFb/T3krFQBl//d7l+pZzzzUalaFXrsRpz
 ne2E1wmNdaTSiHpP2x5SdTRbc5BuhEQgfw+bYXiCcJO+CyGF44ARofhLcPpc0iLr
 KFhdCQepdhZGaUUNk8A8kmIlALXSe9LzlYTJNbswu3GIeJ55l++KE3Q7uzF+g23m
 /oBKskKtgvNVAHz2qR60H0GWN+sH7HgIzIfSvvoZ1Pp8Ffp7o5SxGTiaEMbvadPX
 ebL/GBC7zT9qPhGkEWi4jKLha75bXRfeFrltgWD6Ufk0m9G4lHsvf0WPV7m1mjWh
 u38BYO5WVTostw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=7vioA6goNNPKB0hsrRb4EAfBFv1ns
 cdZKSfRlI+L9Uc=; b=U2PGJaUkbvTf72oUIdkbxuZTNdM555pOFlQhcsbH8DfLM
 dvGxIP3Vv0TfUIqxnbkJK9YYFwUkLo2WQpeJCyUoGz4QnOy9FnebCmh7gHm7SrS6
 4fyFVfKKNlub0jIAssGU9/Qw3iN1149hjZmBReNblaq3hDGrfRViIFYgMMJCZbRd
 YeakdG6NmX6CjknCp/HHKJH8TpDL/MsKbTv/WdIMUQC9kFYWxYv6mWi+1LLFt983
 bbfJVPbLwn2vL6savGAjZkvsaPZg73BlJu8e4dvVIalkS45PeUHjAkRu2t4GTyxG
 d+aT9lqE6/KAPhfXOVvwPRu32fRiAA1PQMgUGzfxA==
X-ME-Sender: <xms:0fS8Xh2Cj78P4WrZJyujMivR6qRBqxhHM7RO2fQ2HlN9dM0qBH_6NQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleehgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0fS8XoGQst9QyXeM2Vn-6XtEzl3caGE_GjFmbo60SnoGg__QMBWjYA>
 <xmx:0fS8Xh7FJ7nJXk1qcshUT3wqMcYUlVeorspQlhT3nmw_zQfKEH4D0w>
 <xmx:0fS8Xu1Nk5HcngT4i59re1mP6oj9MF1keWBll97mSmBgzyNckW_mqQ>
 <xmx:0_S8Xv08Vf4UtX6DgoLigmCmIS8JM0skGzk4GCvmHzVnozzm_7apYHFwy4o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB767328005D;
 Thu, 14 May 2020 03:35:44 -0400 (EDT)
Date: Thu, 14 May 2020 09:35:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200514073538.wvdtv5s2mt4wdrdj@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Content-Type: multipart/mixed; boundary="===============1620871962=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1620871962==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l6obwcfj2mvvexgd"
Content-Disposition: inline


--l6obwcfj2mvvexgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Here's this week's drm-misc-fixes PR

Maxime

drm-misc-fixes-2020-05-14:
Just one meson patch this time to propagate an error code
The following changes since commit 5fe89a6acd668cbd1817fcdef5caa9fee568c2e8:

  drm: Fix HDCP failures when SRM fw is missing (2020-05-05 14:01:53 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-05-14

for you to fetch changes up to c54a8f1f329197d83d941ad84c4aa38bf282cbbd:

  drm/meson: pm resume add return errno branch (2020-05-13 12:00:37 +0200)

----------------------------------------------------------------
Just one meson patch this time to propagate an error code

----------------------------------------------------------------
Bernard Zhao (1):
      drm/meson: pm resume add return errno branch

 drivers/gpu/drm/meson/meson_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--l6obwcfj2mvvexgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrz0ygAKCRDj7w1vZxhR
xf4dAQDJD7YWNhijRUUaz9QktHmagRcAMSyeWlPxkw+NkcmrbgD+L8XzB+YZWBr5
+AoPLMGsNN4izpxR1ccx7Eo2za1B2ww=
=1FgX
-----END PGP SIGNATURE-----

--l6obwcfj2mvvexgd--

--===============1620871962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1620871962==--
