Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9AD52CDDF
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 10:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F2A11AFB2;
	Thu, 19 May 2022 08:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469D11AFB2;
 Thu, 19 May 2022 08:06:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5BC383200939;
 Thu, 19 May 2022 04:06:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 May 2022 04:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1652947559; x=1653033959; bh=36NEu9n6vCbbb7rTJz5ZZx0qkleGrUAN5Xt
 yxUg02G4=; b=r7GzPFnTKRB6T+O92lzs3S6/dxqsvpe1nqYIu+2ggJkM1pe2RPt
 AxZNucihUgvY/w0nUOVOOf95SsV7AGF2Qumj9aA4PvBqrN+Fj6V2kAVApAZtGxy9
 EPXsDZMdV5HefavGhTiGpXqOVkXQO0zYXMkPFx3NKKrSMRArzFANjH8I2IWVIZZF
 88Sd875tZNYypgwl9pQitGYKHcHyxRcekFn4X5kEQHSs11I3sb70N0VnL0iD2Dvb
 1s0eijGeRgoXH5E7FbwffWPRR2hYmvIQzOC1m1+QBHOpZRV+gGus0SwPyk08XWo2
 AQvyiG+yXDAfpDMG47wUkM0Mwcec0PIpZzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652947559; x=
 1653033959; bh=36NEu9n6vCbbb7rTJz5ZZx0qkleGrUAN5XtyxUg02G4=; b=D
 WuMcrMQ3o2JTJAKwSf7rk9vY1pLLL6NgjjTy9+FUsNmgVOeRA3wT4nzoyKRxGdOa
 FGmFCes5LTUdJ2meY7Oxk9aFcVQpgpSKJ+EmKg/OqBaaES/SyQODPs87NtcCt/NI
 uq431YbvLyPMj057fnR20TqgdvXCp8l2cjPHvsRMvFL/3fFnHxXUA0JUqKfl4RLU
 u6LYBfHNcfKrRZyg5UkTp9C8i1VyC3L1G+qF5islVnVGkN29ZshoCatrGaej/27X
 wuyro+vVnpmsDXhnzlHHXh2xtaaqrtnmnBca2T7Boef24pgQNAi7RI+r7rga52uu
 Op9qCvQ9a59AjVr8i+CVg==
X-ME-Sender: <xms:Z_qFYk8CG9AkbhzQMLJOg5qZR9uzaM25T1ofQith2gbUp7r5BE0FHg>
 <xme:Z_qFYssRXcrA-h6FbzYQ4f_3YhcvQOINBhPLgSpYGN4ca9oaBDeQgokVN-A6l9m6k
 OPSxOBrur_tFapEH60>
X-ME-Received: <xmr:Z_qFYqBNITATkWcv1GLPoSyppuJP1_yTrGbYuaLFzXScjTgBPeqTGXJIsvifJNp9ZFLM7Dr6jicHE-R-Iil-7B0Jl6-li4_qWWJoJ5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedtgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:Z_qFYkc5T_7lCfKxdpIAIOlrCTjb20tzEP02lgm1M5TakTMDFAxsEg>
 <xmx:Z_qFYpPx6BBHM1nRi_RmkTFuLickfTuOwjCSJLHCib2lIuY0S7gNyg>
 <xmx:Z_qFYumJoypObvAWxWO1V93SOlR7UxDkGoRFog4z5iLqOD1qL5unWQ>
 <xmx:Z_qFYqEOC0TSUKDgEA5rSbsthDB7jMCFAIzjxiTunyzZ1z-ifxtCyA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 04:05:59 -0400 (EDT)
Date: Thu, 19 May 2022 10:05:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20220519080556.42p52cya4u6y3kps@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3if6d3mzxbig65ik"
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


--3if6d3mzxbig65ik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week drm-misc-next-fixes PR

Maxime

drm-misc-next-fixes-2022-05-19:
A device tree binding change for Rockchip VOP2
The following changes since commit 6071c4c2a319da360b0bf2bc397d4fefad10b2c8:

  drm/qxl: add drm_gem_plane_helper_prepare_fb (2022-05-05 12:30:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-05-19

for you to fetch changes up to 5ee8c8f930ba7d20717c4fc2d9f1ce0e757d1155:

  drm/rockchip: Change register space names in vop2 (2022-05-17 00:16:33 +0200)

----------------------------------------------------------------
A device tree binding change for Rockchip VOP2

----------------------------------------------------------------
Sascha Hauer (2):
      dt-bindings: display: rockchip: make reg-names mandatory for VOP2
      drm/rockchip: Change register space names in vop2

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml       | 8 +++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c                      | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

--3if6d3mzxbig65ik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYoX6ZAAKCRDj7w1vZxhR
xfscAP4sBPQZkrxtH1zNtkrWA+BJIN2WBHeT4U+x8LixEOvTFQD8DpGWfb1e5ktu
JuoUrW1cnH/TfK9zpLT2/JVQle8niQw=
=R96Q
-----END PGP SIGNATURE-----

--3if6d3mzxbig65ik--
