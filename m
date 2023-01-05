Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F065E63D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 08:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814010E6BB;
	Thu,  5 Jan 2023 07:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6D310E6B7;
 Thu,  5 Jan 2023 07:49:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 189B9581DC0;
 Thu,  5 Jan 2023 02:49:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 05 Jan 2023 02:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1672904952; x=1672912152; bh=jERi6VHhZyEw8Hj9FyQGp/xfIG6K+UHce3C
 ChzdMIvk=; b=Iww1pA3MGTXWPQ1eTb/OXo4Ny8+eQBU8kyo4RyvZqJqwx/dfesh
 MkOMW8cWExez8bkjiXCaxGY0r5EJUDfk/cHpkKFMZ9D97nsCX9Ksdjeycw+cc1Ix
 G16086Rcbu4cuuiZAjJU2bm8V97m482ZLtlbFwtDw+2tbcYAkblgGZsUv0uIIEFk
 15uOxWFsa1sB94G94+juba/hTaHAJBB/kAi/jjHFFqgudJUoHv27t2xWFyBkrJ89
 Pya+42IyA0IR1k1eg0Cba7e2Qv4oqfyWR4WsmzfgKiWu9TfiPYu2N2nIgu7PutbH
 TI0Ld7OUbk1OJrJOEA9R5OvqEXBCOJZRL5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672904952; x=
 1672912152; bh=jERi6VHhZyEw8Hj9FyQGp/xfIG6K+UHce3CChzdMIvk=; b=L
 tQqLQti0J66rBSPfYh88wWmne8DmrdcGQefShGHy+Zyxi/rWfqfQKuk7R96eUX+D
 XBMSUKXETPCb8uPX9A6L0J27ZOhTpyQFjkc/rh648U3+jAL9oBVC5g7YkBYB5VHy
 A2UapB1wgyqckjcWbCOPgWQEPsE8HdsDt/2MT7KssGh9nvAtPwb3w1tHqBaxTTQr
 2xFxoCutr2xpFmfVm0oNcQgrNLRQvIBA8O5dhoMPNFrEq9zsXu2Zb2eLDavnLUaS
 zeS8183024EZEfECiUFIcWvxadPyZPdH50kYyMqdQDshi7BZNTZQvF4mFqq1P+Jl
 dw1sINHv0sVSo8WSEZd6A==
X-ME-Sender: <xms:94C2Y22mmCpITFoi0l3qd6TcZM-FUsdg-KG3ecytnv4-e2TfJEYyHQ>
 <xme:94C2Y5Hm9oIYLrwsc1UmbCXw_qQ91z462ry1kl_iDbocKNU5SehlmZVE3Bxe_4uaT
 Wmv5zxwqHrgI__Mb-k>
X-ME-Received: <xmr:94C2Y-7JUtn8B1hpv3kJvToZzFt4ZNsDuHiGEKIbvc0T2DXYr6CYBWNRP6J5UMS3MI1p9FTrwxhCAeH3kPBy3I2K_DdLhr9sGC1toBDdQ2Sr9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeejgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:94C2Y30697kFJGAHOu6jutJom5DwozCskSo5WrgeY6EeSvNZn77-jQ>
 <xmx:94C2Y5H5T9rTLRmaD9RkQwhSodEOCRQO0DkzEP97eeyjt5PHmIjVEA>
 <xmx:94C2Yw8l2B4ffYmfFCOhPvGvYda4rmwBM0TgBBd5G27gXxwaFLW8yA>
 <xmx:-IC2Yy17ygS_0cldCUwdO3xSjJVA911pvvuWEe2N6mSTM_yxC2HZFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 02:49:10 -0500 (EST)
Date: Thu, 5 Jan 2023 08:49:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230105074909.qd2h23hpxac4lxi7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jgjy2rtom6zrwpcw"
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


--jgjy2rtom6zrwpcw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-01-05:
Several fixes to fix the error path of dma_buf_export, add a missing
structure declaration resulting in a compiler warning, fix the GEM
handle refcounting in panfrost, fix a corrupted image with AFBC on
meson, a memleak in virtio, improper plane width for imx, and a lockup
in drm_sched_entity_kill()
The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-01-05

for you to fetch changes up to 69555549cfa42e10f2fdd2699ed4e34d9d4f392b:

  drm/scheduler: Fix lockup in drm_sched_entity_kill() (2023-01-03 14:49:59=
 +0300)

----------------------------------------------------------------
Several fixes to fix the error path of dma_buf_export, add a missing
structure declaration resulting in a compiler warning, fix the GEM
handle refcounting in panfrost, fix a corrupted image with AFBC on
meson, a memleak in virtio, improper plane width for imx, and a lockup
in drm_sched_entity_kill()

----------------------------------------------------------------
Carlo Caione (1):
      drm/meson: Reduce the FIFO lines held when AFBC is not used

Christian K=F6nig (1):
      dma-buf: fix dma_buf_export init order v2

Dmitry Osipenko (1):
      drm/scheduler: Fix lockup in drm_sched_entity_kill()

Ma Jun (1):
      drm/plane-helper: Add the missing declaration of drm_atomic_state

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Philipp Zabel (1):
      drm/imx: ipuv3-plane: Fix overlay plane width

Steven Price (1):
      drm/panfrost: Fix GEM handle creation ref-counting

Xiu Jianfeng (1):
      drm/virtio: Fix memory leak in virtio_gpu_object_create()

 drivers/dma-buf/dma-buf-sysfs-stats.c    |  7 +--
 drivers/dma-buf/dma-buf-sysfs-stats.h    |  4 +-
 drivers/dma-buf/dma-buf.c                | 82 +++++++++++++++-------------=
----
 drivers/gpu/drm/imx/ipuv3-plane.c        | 14 +++---
 drivers/gpu/drm/meson/meson_viu.c        |  5 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c  | 27 +++++++----
 drivers/gpu/drm/panfrost/panfrost_gem.c  | 16 +------
 drivers/gpu/drm/panfrost/panfrost_gem.h  |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   |  4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |  6 ++-
 include/drm/drm_plane_helper.h           |  1 +
 12 files changed, 80 insertions(+), 93 deletions(-)

--jgjy2rtom6zrwpcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7aA9QAKCRDj7w1vZxhR
xYGOAP4tgW1mOHH2FRfU6UOL02qHE5dpFcj1RuOMD2e1vM61LAD/RdOBMVe5mwkb
sv4ePNgCkBbG0XpIQyz8J9gAPomDNgQ=
=DTqo
-----END PGP SIGNATURE-----

--jgjy2rtom6zrwpcw--
