Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F976545B4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 18:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48710E55A;
	Thu, 22 Dec 2022 17:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919C10E558;
 Thu, 22 Dec 2022 17:43:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E2FC15C00BD;
 Thu, 22 Dec 2022 12:43:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 12:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1671730990; x=1671817390; bh=q3AYRqZTR/RNh8KR4bONU+3nNFun8nwWxDm
 CBE3gdNc=; b=E5zBpg0UfF+DZukfrx+aLOABGTUuDnei2coW3gkTS8+wVENElhY
 GePnQfzXemm6mHrJj0ZEfYmvXly84ZypWLxbbOZUgyJwX4XU6e2UuBaklcKbtH7a
 XNgYRRBcQAN69UHjVn/AqevkHJvjyrkPulFZgBf0iH/fZTrD7NSoJd/58XihKA4P
 ngUdlh4+PHrDDucnbdAG2/15WOtcaYyk6ADS6L7T53289JJQml7Q7TG8bN3oNU24
 AdZOcpUxCmIHsKDn2xeUMXcMKqb84kOD5KtRVARw6X7csFWFZ9xi2Ry7OalHf3ps
 0+Ihkoe+ulZkCMTi3DDAgxqf4zz94ng+s2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671730990; x=
 1671817390; bh=q3AYRqZTR/RNh8KR4bONU+3nNFun8nwWxDmCBE3gdNc=; b=U
 bVYsitUuQA2F1LM4aauHATMW6B7UGKkfzhoWHimq9vwPILmtvKZZ6CEmwjTaQ3FI
 QDWDmFjVmGKgPMfcZdeAkWEa8/d5oZvyiJaDu6Aak08X0FW1ewioEPJoG5Ki6qPC
 VoXP/bvtyEeXa1C8a/OOBa0iihbyRUy5ab8z/YJuud2KTJMdAJohd/voZQeFXEqR
 bUPvOh/9RQQOBr41457UmQyvAdZh8Sa9nkOed9ptQBw3Cahjs6Z2rJ0CxPvIUEkV
 hPVS4NaBQePssQqppPKmBlWdCgQDEh4gvmxCSC2Dn7KrWeT5Pij/9msyV0S9fSTB
 EEf7sR+Kjn++fZAsyy6vQ==
X-ME-Sender: <xms:LpekYyzuh_EeXPUp88JzriL1hFsJvzbdDCqPE4sFaFUHR0luTVc7vQ>
 <xme:LpekY-QMYvcn8DSzpQMy5gLT3uILcEFZj3XM86pJWSzCxwr9B3L2LHfvfU5AUF9m-
 rR3TkC-2QF_VixjMhQ>
X-ME-Received: <xmr:LpekY0Wt5P2iRfMUft9Aix1VWwzUCbiLVBqY_2SWQHCwtyoCqbTKA-yarjnYgJ7B7uBQqpvPLYHZ1kDH5YUrW8JCtJm5SO0KBIWDnFWF0HGZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:LpekY4gwiWStsNhhnMGY5uP7cySMy7G6oTduRxvGtc3ip0gr9p02jw>
 <xmx:LpekY0Cep_nJNtNTsVh9a40wfi4d3aItJw73PUmQvCm4NZbvpzz40w>
 <xmx:LpekY5J9csj3XJNwhagxfNZIvk1EMSlPcFjRqHhW8Eb1JHjg9scYaQ>
 <xmx:LpekY45AMviXHQp14qu4j0QImwUF6tqqOvpGOgzjsvcxWxUgXnBudA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 12:43:10 -0500 (EST)
Date: Thu, 22 Dec 2022 14:02:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20221222130224.wnnxpbsdd3yglu7c@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="llx323uiucsslt27"
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


--llx323uiucsslt27
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-12-22:
One fix for a use-after-free in panfrost, one to fix the error handling in
dma_buf_export and one to fix a compile error with
drm_plane_helper_atomic_check missing a definition for drm_atomic_state
The following changes since commit c4252650a8c4770b669398fe7270ed8c94fc0eba:

  Merge tag 'drm-misc-fixes-2022-12-08' of git://anongit.freedesktop.org/dr=
m/drm-misc into drm-fixes (2022-12-09 10:11:06 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-12-22

for you to fetch changes up to 4217c6ac817451d5116687f3cc6286220dc43d49:

  drm/panfrost: Fix GEM handle creation ref-counting (2022-12-21 15:04:42 +=
0000)

----------------------------------------------------------------
One fix for a use-after-free in panfrost, one to fix the error handling in
dma_buf_export and one to fix a compile error with
drm_plane_helper_atomic_check missing a definition for drm_atomic_state

----------------------------------------------------------------
Christian K=F6nig (1):
      dma-buf: fix dma_buf_export init order v2

Ma Jun (1):
      drm/plane-helper: Add the missing declaration of drm_atomic_state

Steven Price (1):
      drm/panfrost: Fix GEM handle creation ref-counting

 drivers/dma-buf/dma-buf-sysfs-stats.c   |  7 +--
 drivers/dma-buf/dma-buf-sysfs-stats.h   |  4 +-
 drivers/dma-buf/dma-buf.c               | 84 +++++++++++++++--------------=
----
 drivers/gpu/drm/panfrost/panfrost_drv.c | 27 +++++++----
 drivers/gpu/drm/panfrost/panfrost_gem.c | 16 +------
 drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +-
 include/drm/drm_plane_helper.h          |  1 +
 7 files changed, 64 insertions(+), 80 deletions(-)

--llx323uiucsslt27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY6RVYAAKCRDj7w1vZxhR
xZMDAQCGItsuYnvLgLTbh9OKkC2Cq17ewA7l/KauKCg6/TP0iwEA0qXC+6sD+TOe
1wBUcOon1Jto7I9R4/SdWj6qiVB5TQg=
=2oTK
-----END PGP SIGNATURE-----

--llx323uiucsslt27--
