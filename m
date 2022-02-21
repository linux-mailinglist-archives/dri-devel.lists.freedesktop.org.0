Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7E4BD8C8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B9710E301;
	Mon, 21 Feb 2022 09:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75C10E300
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 908A55C0198;
 Mon, 21 Feb 2022 04:59:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=q1kPA2BMrD0cphomqNdr6qvbalAQm7j/zVKkRb
 TiEes=; b=cquZEri+85k1FPhzlnCwLr3MZMiqb5vt91LVpOhqrFMlkot9MHJ/1p
 49+wMsqYllqhMVu00Vn/mMmj4I/KGEouGD/gZYe+F6/WX0ByVTk8JO/7Q1SQvN7K
 Hmg3v/IL/AesuH4/V2uoIUKy3bMMBLlbHpwKN1pka1+2K9Io7xbM/WeT1lmLIya4
 KfVgdJWlzflURMZg3KyKne6n5fcQDMkktsj7r3s4hOjViKDMJgiTWYwBJcvaNCJo
 SknSz6diVc7naMV6T1o+LgymStkjli0hjN8tLvlrrP0Xc9UJZiV3VWplQtqMkWYS
 65Di3xucU1ZmMLiV2Cg5ybo+x6d5BSmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q1kPA2
 BMrD0cphomqNdr6qvbalAQm7j/zVKkRbTiEes=; b=CiHeJtW4M4eqKrI4PdiIs7
 AgOBW/wr44LjZprzlwixPXkwQnNEiricZcmIMAaQfqV2d1MoImBEr9L6o3YaoQGo
 XEpvvR4xI0Ll6cST4wkUnOjiog+k8HULhYjiSkNSaIrt6iLQMDNA8ftK/8J7+iaY
 DhRIciprcAhON+BqZlws07A3d354QrAs1G04UJ4/DpqfW+Y+B8ZJOZy4ZotRKNjH
 5zXLuhV3GR2desG6SSp9+rUdNBhaUHg49gJqABGaT4jKBjR/rvTsBdv5sUiGV77k
 +IFni9jZ+OftL7zPlkcsv72EqIccM1wWvEGz92euyTWyalI5ibMWL2PRcqGxLYAw
 ==
X-ME-Sender: <xms:eGITYt6vDIUgIUTM0wCjZnbdRxIq9QSvLBgH-TUwxO0bTTVgMLvtkg>
 <xme:eGITYq5xBvn0BuIxU86UvTbC_Tnq5ADC5x3MwFW0hSH_plee4b_ukRhq8r4sS56_X
 6LQL91E6jhAZMhQORc>
X-ME-Received: <xmr:eGITYkcTqXn5HcCXtqGbAT8E905jBmSBof7V4z7f8goQ0R6z-B_Xuw3Hk3Nn8sYOZNJC-spl5Ct7O_t3SFdXP9cZ36ykTBKmeMwQUrc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepiedtkedulefhffdtueeljeeijefhkeeiuedvhfetfedtledthffhteelvdejudev
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eGITYmJrplBaJEpsJZu14CLKv3_2mg35cgRqhdkJ9a6M4HNBnBF_tQ>
 <xmx:eGITYhKJ8RHvYf15XNgj0EdF8DERWkqhTkbpq_P30X_D6lDT4W-6og>
 <xmx:eGITYvwkfB5w1ghKKgcZc7zMepwXYH_22l8vNNXCVCmZm1IpknXqHw>
 <xmx:eWITYo9b78m_qoA6xEQj2JGUQiwUAXfAWsWakiV84B8qsVW3aLFpNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/22] drm: Fill in default values for plane properties
Date: Mon, 21 Feb 2022 10:58:56 +0100
Message-Id: <20220221095918.18763-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
We have a bunch of functions that create planes properties that will take a=
=0D
default value, but it isn't actually enforced in the plane state.=0D
=0D
This leads to drivers having multiple strategies to work around that issue,=
=0D
most of them being a variation of forcing a value at plane state reset time=
.=0D
Others work fine by luck, or have entirely ignored the issue.=0D
=0D
This series aims at making sure the default value set by the call to the=0D
function isn't ignored, and then making sure all drivers behave consistentl=
y.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Collected tags=0D
  - Squashed some patches=0D
=0D
Dave Stevenson (3):=0D
  drm/object: Add drm_object_property_get_default_value() function=0D
  drm/object: Add default zpos value at reset=0D
  drm/object: Add default color encoding and range value at reset=0D
=0D
Maxime Ripard (19):=0D
  drm/komeda: plane: switch to plane reset helper=0D
  drm/tegra: plane: switch to plane reset helper=0D
  drm/tegra: hub: Fix zpos initial value mismatch=0D
  drm/omap: plane: Fix zpos initial value mismatch=0D
  drm/amd/display: Fix color encoding mismatch=0D
  drm/tegra: plane: Remove redundant zpos initialisation=0D
  drm/komeda: plane: Remove redundant zpos initialisation=0D
  drm/exynos: plane: Remove redundant zpos initialisation=0D
  drm/imx: ipuv3-plane: Remove redundant zpos initialisation=0D
  drm/msm/mdp5: Remove redundant zpos initialisation=0D
  drm/nouveau/kms: Remove redundant zpos initialisation=0D
  drm/omap: plane: Remove redundant zpos initialisation=0D
  drm/rcar: plane: Remove redundant zpos initialisation=0D
  drm/sti: plane: Remove redundant zpos initialisation=0D
  drm/sun4i: layer: Remove redundant zpos initialisation=0D
  drm/komeda: plane: Remove redundant color encoding and range=0D
    initialisation=0D
  drm/armada: overlay: Remove redundant color encoding and range=0D
    initialisation=0D
  drm/imx: ipuv3-plane: Remove redundant color encoding and range=0D
    initialisation=0D
  drm/omap: plane: Remove redundant color encoding and range=0D
    initialisation=0D
=0D
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-=0D
 .../gpu/drm/arm/display/komeda/komeda_plane.c | 13 +----=0D
 drivers/gpu/drm/armada/armada_overlay.c       |  2 -=0D
 drivers/gpu/drm/drm_atomic_state_helper.c     | 25 +++++++++=0D
 drivers/gpu/drm/drm_mode_object.c             | 53 +++++++++++++++----=0D
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  5 +-=0D
 drivers/gpu/drm/imx/ipuv3-plane.c             |  8 +--=0D
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 16 +++---=0D
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  2 -=0D
 drivers/gpu/drm/omapdrm/omap_plane.c          | 22 ++++----=0D
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  1 -=0D
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  1 -=0D
 drivers/gpu/drm/sti/sti_cursor.c              |  2 +-=0D
 drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-=0D
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-=0D
 drivers/gpu/drm/sti/sti_plane.c               |  6 ---=0D
 drivers/gpu/drm/sti/sti_plane.h               |  1 -=0D
 drivers/gpu/drm/sun4i/sun4i_layer.c           | 16 +++---=0D
 drivers/gpu/drm/tegra/hub.c                   |  2 +-=0D
 drivers/gpu/drm/tegra/plane.c                 |  6 +--=0D
 include/drm/drm_mode_object.h                 |  7 +++=0D
 21 files changed, 111 insertions(+), 83 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
