Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2E46EF0B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853710E18F;
	Thu,  9 Dec 2021 16:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8982C89FFD;
 Thu,  9 Dec 2021 12:43:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 6D0302B00913;
 Thu,  9 Dec 2021 07:43:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 09 Dec 2021 07:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=884Bb0L2UxeHM7GQ7BHdqVO/TwBmNZDRd897QB2pAEU=; b=jyVe0+rL
 ziYFsIR+arLGCFvQC1Zd6krTS3t4D7xOLC39iq8Y4QnMa+ISomZ4QB3NRW3fqFfs
 vMOn++jMx/QJrOeSq2uBn4rrwuDgpJxw8SsWIycGKQB/kghcQ2ImGS0mhpINI8A+
 HhbLW6Sq9J4nYaIhK44bfCEOq9YtVhYbM4p1MhVimC7BQEbQSfYlOss9WYHqzJ9q
 GcUvLfbo+yIFXBgWPWZis/ubm2K1vHnx/AiNW2rJn5dz5R8AXOb4Ds4SvUiCKhkY
 1w4yHPegviuNTyOAQ/NySOzM2oxT2eDTiSu5rUOrjcVCe8ulYpRIlhJwzlAudtN/
 NMPZfwtGEzKzgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=884Bb0L2UxeHM7GQ7BHdqVO/TwBmN
 ZDRd897QB2pAEU=; b=Ebk5AOXuvK8tfn18mJ39PhzwpI1oUWs1jVfH9ZB0bovaE
 5k8fJ7bsZ09kddVjH6c/QUMO28Rd9NuLtc/XoHbz9CF7QwcaQ7rkiL+1H2hZTY1E
 u4P67zNn7VcAp0L/UlEk+XePydESLgORKXjUsiBJwebHAnqKJ0tZhWIdjr1MiJEZ
 LIGWTXETKIpmhVaR/E38Kso0gcncG/FwfYSlA5EkIG340GeJ43GYv2fghSXn6jKp
 rxLgUmOoUNXVP6Sqcxvo2N6cVFFfRGDL04yRcqDmjbsDDUKiuT2qKnriu4OEB9JR
 iQPR9l49KFXvWCK+dNvr/AQX3BzoUl5mqr7PLj5fg==
X-ME-Sender: <xms:2_mxYT3KetLJqq0HS5eufOThhkBcYtXaNa0cW1P_NPIBDlng532aSA>
 <xme:2_mxYSEGLY5gms5PdnjLoU-QcE4MOpKs09xa8LvlZAoTslaQjUI_lCypTQjFg1Zwt
 U7ce0Sy8VdEvaQA1gc>
X-ME-Received: <xmr:2_mxYT6aeThr40drLgKOKYx59-8odZrh6Iw271gu-eOL9iS6D5CaYYGHImpQcd6xY5ekq4V2rKTSyyKXetuspjxbBkv3Jz7DATVbQXZVJfZjqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedvuden
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:2_mxYY3MZYazCEHgF-qQ6EPYZr0J-iGJSh9i-i685wL2BJeYPyW3mw>
 <xmx:2_mxYWGKXsNwCkRci_k6_ri5Bq7M72mprMF3roeQ4trDfAUqQ35QmQ>
 <xmx:2_mxYZ-t5k9uwv_qov2i3IJivdRl1p2x3QIxUivygy2y3WgntA52DA>
 <xmx:3PmxYe92cPxxgpkcmz-cs_zMwRYmWF1uOipGhpXwoxrDDsRgO9n1EOSfTVI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 07:43:07 -0500 (EST)
Date: Thu, 9 Dec 2021 13:43:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20211209124305.gxhid5zwf7m4oasn@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gtauogvx2mu3t3y3"
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gtauogvx2mu3t3y3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2021-12-09:
A fix in syncobj to handle fence already signalled better, and a fix for
a ttm_bo_swapout eviction check.
The following changes since commit 679d94cd7d900871e5bc9cf780bd5b73af35ab42:

  dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages free flow (2021-=
12-01 15:30:10 +0530)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-12-09

for you to fetch changes up to b19926d4f3a660a8b76e5d989ffd1168e619a5c4:

  drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence. (2021-=
12-08 17:19:48 +0100)

----------------------------------------------------------------
A fix in syncobj to handle fence already signalled better, and a fix for
a ttm_bo_swapout eviction check.

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence.

Christian K=F6nig (1):
      drm/ttm: fix ttm_bo_swapout

 drivers/gpu/drm/drm_syncobj.c | 11 ++++++++++-
 drivers/gpu/drm/ttm/ttm_bo.c  |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

--gtauogvx2mu3t3y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbH52AAKCRDj7w1vZxhR
xXNgAP9I8uRsAQqaD/y56P3VwsSg+8CykghZE6lQleUQ7+vhrAD5AU1Mslo00rSM
6cwXc71zrz/jv/ycEm0GNPfnpqyAoQo=
=RH6L
-----END PGP SIGNATURE-----

--gtauogvx2mu3t3y3--
