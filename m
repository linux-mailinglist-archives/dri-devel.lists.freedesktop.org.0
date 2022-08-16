Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0005956D6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D329ABD5;
	Tue, 16 Aug 2022 09:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDB211AEAB;
 Tue, 16 Aug 2022 09:44:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CDB663200077;
 Tue, 16 Aug 2022 05:44:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 05:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1660643044; x=1660729444; bh=WscAaNRAWQ+33jBBmkmwDzL9w5j/D56lNRW
 m0HIQ25c=; b=MxeO+hWuWal1CBfQQisQw6Om0XOvmHGQSYLNf+D0FfHuogDVCHQ
 xDwW2YoFA1rWIsUSD/FxTCxfPWiZtIbvJkOZV6LIvm+GVod1+co+bYV+5yOAR62h
 QfjoUKBvN3iSRkmlEvsQY/aSZ1W5BdRg39Byri5+4i7U8lu7G5nYHe05FxhXVsDw
 I+iwNK/KhdGXcU0CJEVku53INRixGeAkb/hU6YRzt2KOL/sHQMABGI3esXF8pRJK
 SLEBAGLDomlhH0X3vnuR/ks7eEbELGQpQ1kEVR5t12/dy+N6Ug+hKu9/uCRCWD0n
 kG0RtyE2j63ybBz0XaujufZCkuY2w6ZcUFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660643044; x=
 1660729444; bh=WscAaNRAWQ+33jBBmkmwDzL9w5j/D56lNRWm0HIQ25c=; b=n
 CTwmp++zc15DvxDjfi5WEAz4SQaFJXwnd/gMwbSOTfVN87eXa6Ozq3tVwe9fEMGQ
 Uba6ws5LrBCH1DGmfy73Wze5ij3hOBgVAtrHCwVsij1WjrNzobiiufmpdN1ViW7u
 FP7eQFGzfC6Jr/HEd30t4dkiggnmGpGxkL1jokJB1whHkd8bOYXGkRfPMMiCtPHO
 GPxU0h9aTZhSKnfkDqi7t+ZvMwkwZuN3CyzqWccIljva5/YiS8zq9Loc7OLoKA8u
 qFZLxyEA4JYXelwzzPtN7T4fIQYraVAa+wvnVWaaCPpn4C7CAYPWqEyjBNA/nDZA
 UxPdlAUpO4pbe+2gwT00w==
X-ME-Sender: <xms:42b7YrCh0zjd2SCm-iT_ToPrzxwzrfv57L8kGDiqDQeCWS8VqAMIPQ>
 <xme:42b7YhgUlkulZ15NwCmXGwThdQ8rSC0BJVumg7Kdy6rL5hRKLAyP4-5efv-jSW7H5
 G3pi0q0rY0C-iJNlPI>
X-ME-Received: <xmr:42b7Yml2dFJ49XESJLRE-Zcnjlw875zMiyMtfkwx51UaAx38oxzD8XOkYxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:42b7YtwsqDkqL6qOqRH8zekjQhS9IhWd1zHGIkuHFPDKdN_c-6AxFg>
 <xmx:42b7YgSG_AOp8dLDFuZLgyl7AmGPkRdmnGTsGMqAAdt9vDkdYSKkgg>
 <xmx:42b7YgZEgxd2zYNJdeqDAkXQott31aJb5T-5q39jPt009yCV506mUA>
 <xmx:5Gb7YlKhYMZYsc3oup1Ek2v3ek3G1SrLcIB860JOc-Qvjz6CqDG7NQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 05:44:03 -0400 (EDT)
Date: Tue, 16 Aug 2022 11:44:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220816094401.wtadc7ddr6lzq6aj@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yec7wwkblx45tsg7"
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


--yec7wwkblx45tsg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's the few patches that got stuck in drm-misc-fixes

Maxime

drm-misc-fixes-2022-08-16:
One patch for imx/dcss to get rid of a warning message, one off-by-one
fix and GA103 support for nouveau, a refcounting fix for meson, a NULL
pointer dereference fix for ttm, a error check fix for lvds-codec, a
dt-binding schema fix and an underflow fix for sun4i
The following changes since commit 66cee9097e2b74ff3c8cc040ce5717c521a0c3fa:

  nouveau/svm: Fix to migrate all requested pages (2022-07-28 16:43:31 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-08-16

for you to fetch changes up to 82a1356a933d8443139f8886f11b63c974a09a67:

  drm/sun4i: dsi: Prevent underflow when computing packet sizes (2022-08-15 09:09:49 +0200)

----------------------------------------------------------------
One patch for imx/dcss to get rid of a warning message, one off-by-one
fix and GA103 support for nouveau, a refcounting fix for meson, a NULL
pointer dereference fix for ttm, a error check fix for lvds-codec, a
dt-binding schema fix and an underflow fix for sun4i

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/ttm: Fix dummy res NULL ptr deref bug

Karol Herbst (1):
      drm/nouveau: recognise GA103

Laurentiu Palcu (1):
      drm/imx/dcss: get rid of HPD warning message

Liang He (1):
      drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()

Marek Vasut (1):
      drm/bridge: lvds-codec: Fix error checking of drm_of_lvds_get_data_mapping()

Samuel Holland (2):
      dt-bindings: display: sun4i: Add D1 TCONs to conditionals
      drm/sun4i: dsi: Prevent underflow when computing packet sizes

Timur Tabi (1):
      drm/nouveau: fix another off-by-one in nvbios_addr

 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |  4 ++++
 drivers/gpu/drm/bridge/lvds-codec.c                |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  2 --
 drivers/gpu/drm/meson/meson_drv.c                  |  5 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c    |  2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             | 10 +++++-----
 drivers/gpu/drm/ttm/ttm_bo.c                       |  2 +-
 8 files changed, 38 insertions(+), 11 deletions(-)

--yec7wwkblx45tsg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtm4AAKCRDj7w1vZxhR
xZYhAQDEUmfn5kjUIsjbnPIpSALKrgFCiwun9oSeF9UcHSka3gD/eMvMnE6XQCgG
5boGbDD0X06Hjywp06KxRColbAF6MAg=
=3VGQ
-----END PGP SIGNATURE-----

--yec7wwkblx45tsg7--
