Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DD57C6F8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 10:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BFF10FC06;
	Thu, 21 Jul 2022 08:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC4B8A0B4;
 Thu, 21 Jul 2022 08:55:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D9B75C00CE;
 Thu, 21 Jul 2022 04:55:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 21 Jul 2022 04:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1658393754; x=1658480154; bh=x2QLaDW1A7LN307zRDJlQJ22UL9Q5VqHQVE
 nUYylB2w=; b=XMRHkhtDps8QXaSamyC/FUiNoj3odfUX/3bSN/1e3LLvRErSMPS
 YoUYVe+h8i/IYCrm3Xkd6Kp6dl802bOH2Hts76aixnyF9dUhtdDJhg/r1qIQ2ZAa
 ygOGRJydHGYxLvnfXGQsAUI24xYq1vZ53k1xe+tg5+r7j0KDDYged9zVqF6nTaq1
 2rU/ggj1YXhkSwBDrkvXN6tYCXrACV1Swq4gaHqAFgwKuTYT2CfUoOFUpRew0SwH
 T6qNNUa3pkXQ/0LXwBUz8JLyd+ZU4Jih210A4Zock+PxFe2XAl9FsBl5OlemGpEi
 1F8mqxuva36E4FNpOREWvnh1B7Xc/g04dXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658393754; x=
 1658480154; bh=x2QLaDW1A7LN307zRDJlQJ22UL9Q5VqHQVEnUYylB2w=; b=d
 EKiOcDnSOppvtA0xQ2i+W6WFN5sVd18+ojhtHse78rRohfQ9b1XaDp2sFfxajWjr
 DkD3YQbBH4NNnb0beE7dcg3jaPkcmaDj3sQzkVLM+JOhtRWT/TOftAg/VAZV6/rZ
 sJrQHsEfBSjXihGKcJslbfMwVasAKoNTfQ4h+xyG6kdMoYVHMnhEYNTiBtLX2mpJ
 8lfe6V+363I1eJ0JW3jVU7AVIrOGdMmMIVoEMXkXbhNDeLxRBrFXXV/0wPbFXdcX
 VUnP7F/ChEOW/8clvpBizUQ6eTqsXgJi/+oXQrXDa896WSb0VkHi/pZwdtM1kEkN
 HDxxOvGy77VMZVwMF51Jg==
X-ME-Sender: <xms:mBTZYlU1ChJomYPm9vjx95sndZADNU4ygOHfrr2v5XZw_4-uBdweyw>
 <xme:mBTZYlkvlQJB2dYr3EAShNFyB2_Gb4vRGc53DU3zeURGZJHVoQbYN8zo-2F89bxma
 kdwMbq3wulLhbO-Kkc>
X-ME-Received: <xmr:mBTZYhZ3e-37pDadkFair957Pr1lwjkQ-0UErexefz7koBJ_yGb1H4UHVekurMi21DYCLZLUmWNxjN6xBZpQ5oZ8OJaqkOnTM6D7OWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:mBTZYoXkuivqnS6y2h2Ittu7oEoRwaG8dUtbCAy8GuLpbKJUgUdErQ>
 <xmx:mBTZYvmOwsS0GHLw_7sKfn15fSsn4PMhzpU1akIObCKzUfxuwlxkqQ>
 <xmx:mBTZYlcyvc_VAW5K9bz6QUq-LVWLFTiXQwbTO9n-JFdxbyYjARsYkA>
 <xmx:mhTZYofRvjP13Q08LfLEwxiAOu9k64YB5ly4RfyhoZb5ulBCY2Jq8w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Jul 2022 04:55:52 -0400 (EDT)
Date: Thu, 21 Jul 2022 10:55:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220721085550.hrwbukj34y56rzva@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zrmldompvljf74bg"
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


--zrmldompvljf74bg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-07-21:
A scheduling-while-atomic fix for drm/scheduler, a locking fix for TTM,
a typo fix for panel-edp and a resource removal fix for imx/dcss
The following changes since commit 925b6e59138cefa47275c67891c65d48d3266d57:

  Revert "drm/amdgpu: add drm buddy support to amdgpu" (2022-07-08 14:24:30=
 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-07-21

for you to fetch changes up to 02c87df2480ac855d88ee308ce3fa857d9bd55a8:

  drm/imx/dcss: Add missing of_node_put() in fail path (2022-07-20 10:12:15=
 +0300)

----------------------------------------------------------------
A scheduling-while-atomic fix for drm/scheduler, a locking fix for TTM,
a typo fix for panel-edp and a resource removal fix for imx/dcss

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/ttm: fix locking in vmap/vunmap TTM GEM helpers

Dmitry Osipenko (1):
      drm/scheduler: Don't kill jobs in interrupt context

Liang He (1):
      drm/imx/dcss: Add missing of_node_put() in fail path

N=EDcolas F. R. A. Prado (1):
      drm/panel-edp: Fix variable typo when saving hpd absent delay from DT

 drivers/gpu/drm/drm_gem_ttm_helper.c     | 9 ++++++++-
 drivers/gpu/drm/imx/dcss/dcss-dev.c      | 3 +++
 drivers/gpu/drm/panel/panel-edp.c        | 2 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++---
 include/drm/gpu_scheduler.h              | 4 ++--
 5 files changed, 17 insertions(+), 7 deletions(-)

--zrmldompvljf74bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtkUlgAKCRDj7w1vZxhR
xXjDAP9m3ymjq8EktYQeyc7sfn5+fJ7cqjTLP7oD8YVcnclSZQD/eInD3Y5FfCHe
YZoAJZJXwtwMP6lXHHsvYX/s1ZnrrAE=
=LGcA
-----END PGP SIGNATURE-----

--zrmldompvljf74bg--
