Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2D52E630
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761F11B5C9;
	Fri, 20 May 2022 07:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09CB11B5C9;
 Fri, 20 May 2022 07:24:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BADC5C009A;
 Fri, 20 May 2022 03:24:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 May 2022 03:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1653031451; x=1653117851; bh=y0hR1ue6jS5tg0Hg1kvK9gws77xvoUst8VR
 DTja2wFM=; b=KdqTZhLlJNprfgcgla209PDzpFidvkILQ7QTcaqPwyEzrduCZQG
 H/4Sx5mGZp15Mru/s14QxgSwTJs89BwUeoVaXawjVgTqwAmBo6+pMmusAKFDtYM3
 5OSO+AXgSvBDGLIvED08sDkod5eI1mRIT6Rdt1AhRxbKziEPcDxc+CM/yOSJBVbl
 rVFHNQLfzudFqaz0wlBPZD3zzovwKHnZGAyUseqYN1wSXtuWdG/VpfknWFygdi0W
 XeQUZ3HjOZ14EZ5AqzpiLufy12Fxg8/N/R2XmWdkYq2y5oDI6SuwgqXG7T0GZnI2
 RZ8JDNudRHFgdAPrOUYT0eXO7ORH6x75ukg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653031451; x=
 1653117851; bh=y0hR1ue6jS5tg0Hg1kvK9gws77xvoUst8VRDTja2wFM=; b=S
 1oy42tFIq6KUQMU1VfJvMcX3pJDk/T4GPD1nG9Q9KcFALXx3cNFWfwRQMMW0EGMb
 cz5qLKpFg4xKGo7wmOUaeb4ewCKZunR80s6pziYgf2ZIG/bVx/4qxKZRCfnv2x72
 Ddq2J76R6KsO9wmnajpFKGX6GxDCm5TUT9dnAwt+jV/+oWujTefLzbcXNIxwy0vo
 muQ9mcmv1oM0Fkh8jignhNn/0Oq15a1/slqTzg6YHmWmmTx4RoEnvhthin8ORNni
 BHn9H+5UoEAcRqnPNqmTgZ5xGp7aIcvFLt3FsiGbLRJgn719qg9BLFGgnMs6PZkA
 cSOZC7H5Cr0sUwMad9U6g==
X-ME-Sender: <xms:GkKHYpon6-OBNEW5A-iDPoKQJopq5pqoGKxYCwIh7cft2gJx1aDOWQ>
 <xme:GkKHYrpUoqYZN2BZIibya3eLNq3KCjapfm3QtWJ0pLSZsWF5UssxAgh1dnBxwW7ON
 OVnsetEHCHeUc6YLj8>
X-ME-Received: <xmr:GkKHYmOHFSpMWcmMKp7rpyyWMzFu_Sa6nPW9KsxiqbBwh0ErSzUHZxIu4DB4TclB1sQCA4e1CrNUrLjdttFl-HCxxV5TsglWWaC4MgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedvgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:GkKHYk4D9TCtX3h67twGOrv6sHIsuIx2nVzzIGlpWRg8y5yHTcZvSg>
 <xmx:GkKHYo5AduU_0cCUjH2XVW89xsFFWmQ_S2LOu2L9jZOI73qz6mBiZQ>
 <xmx:GkKHYsisJxk1dKy5zufndQ9S8Huu0j7NkQaUv1UvvhNQdGl48VkKpA>
 <xmx:G0KHYlwSRkBdxjvtMMIx1cNRIlTE6CxkTQxqnFlhHWHctr7pNaHUFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 03:24:10 -0400 (EDT)
Date: Fri, 20 May 2022 09:24:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220520072408.cpjzy2taugagvrh7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xkj3vlzyym3dkn4i"
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


--xkj3vlzyym3dkn4i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-05-20:
Fix for a memory leak in dp_mst, a (userspace) build fix for
DMA_BUF_SET_NAME defines and a directory name generation fix for dmabuf
stats
The following changes since commit 6fed53de560768bde6d701a7c79c253b45b259e3:

  drm/vc4: hdmi: Fix build error for implicit function declaration (2022-05=
-12 11:01:19 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-05-20

for you to fetch changes up to 6e03b13cc7d9427c2c77feed1549191015615202:

  drm/dp/mst: fix a possible memory leak in fetch_monitor_name() (2022-05-1=
7 15:56:18 -0400)

----------------------------------------------------------------
Fix for a memory leak in dp_mst, a (userspace) build fix for
DMA_BUF_SET_NAME defines and a directory name generation fix for dmabuf
stats

----------------------------------------------------------------
Charan Teja Kalla (1):
      dma-buf: ensure unique directory name for dmabuf stats

Hangyu Hua (1):
      drm/dp/mst: fix a possible memory leak in fetch_monitor_name()

J=E9r=F4me Pouiller (1):
      dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace

 drivers/dma-buf/dma-buf.c                | 8 ++++++++
 drivers/gpu/drm/dp/drm_dp_mst_topology.c | 1 +
 include/uapi/linux/dma-buf.h             | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

--xkj3vlzyym3dkn4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYodCGAAKCRDj7w1vZxhR
xbIXAQDPI2RIRsXs5vC75o6PdobUUsjcUmphdA0d8Z9UD4SoEAEAtLb1ObAsjB19
spKHOFrvoCiA5wb2npVaKUrmgQj1FAE=
=KpOG
-----END PGP SIGNATURE-----

--xkj3vlzyym3dkn4i--
