Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AA4AC5C5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC0C10E200;
	Mon,  7 Feb 2022 16:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0175110E200
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 81C035C0107;
 Mon,  7 Feb 2022 11:35:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 11:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=K+eWok33+6aDUpvJY9s2JM+QsuzqfznNKdyOgp
 sBtE0=; b=TxkRDiLz4fqYpmmWjRtnTeWUrhTGA+Fj7juEXNbD+xG9vbABTAie1V
 eRn0+zQGW5qpyTjbvPLsE7mJbFfoRAb4hxk/Um6j0eKZWu5wUooWSiGIu9MKETjt
 FyfkGE5SoThlFsDY8tSGAhMHHIGpRWKPz3U3USwc31NS92M6di4jmpLbSCEann7Q
 7oDDb7mdpU905frPcH6lln9pjR6eFtTUbzeXrbdr6C0sQK3neqonIGo9DZ03ZbPW
 ZHHgDa8f7XrhSRHUlCZ5YHcJdpJ/5n6TQPoFFuty4tPHe5qcpQCssRUS03sbNck0
 AWbxysr173hrazEmpKANY2roKsc9+LzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=K+eWok
 33+6aDUpvJY9s2JM+QsuzqfznNKdyOgpsBtE0=; b=RsV22A7xP6tJP2RAxWLgqc
 vQT89ZI1vO+VfeCpiQoENxOPXZtLIs/v9jDLFcoYzGoE00eb4+oJ6ZZH7IZvx0VM
 V+DgTd8eBH0d0EoHNfUxbu9DOiVZ33S8L0YpgHY/2LYVVUl7gcg1osFqBWHE/ddd
 dl7SDj67sur+MMpIJxadum5iFm3Rs4nKfJz1csxdhpnat7nVUjKKRB/dTqFIYuvC
 sJ3a9t0WqSONsvXF89WbN6eM623zEVCStyB5tb+hPSn2tdt2Q2T0aUyiGz5PY2B4
 8yWrXRubEVzJhddho9mIKhAcbxMxDvnwPuRcx/i8g3AHEfjDl3M+5Lr3Bo7SIy5w
 ==
X-ME-Sender: <xms:RkoBYl9BvCfQz4mQx7asSAnQQlf2paAbV51_SoWgL7GJoWO1UV14NA>
 <xme:RkoBYptLbfvS1tORMcjb-KryvC0y8r7DZ0_wmiSMQNqTMPdUixLHC31qWMr3D988m
 un8rQtlzbwy0iz9dUo>
X-ME-Received: <xmr:RkoBYjDLulNJgwtA56Y1zbIYaAcjzSb3qWswrzGEtjQ9lzgSwT6BAtUjwG5rzL4MqmQI-ThwZJ3cFVT8aREkckRIZ6622MkZqVgEkwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepiedtkedulefhffdtueeljeeijefhkeeiuedvhfetfedtledthffhteelvdejudev
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R0oBYpcPOa4Gxe7YDDdnr_Cm5kvS4qUbVS5q1DaIeoyGlZM_6y3Fxw>
 <xmx:R0oBYqMRxf98CJvDqfCXBrJyN4aLe-um_JZZTeqKEjp3BWvTee8z5w>
 <xmx:R0oBYrmQ6xFpRHWlFQs89ktMtOYwDpdFpfGaJm1AxTG7mj7OmaLTTQ>
 <xmx:SEoBYrjfcgFgC1WCsM5WNiQWiYUQaN6XfVbbDq8Sgy2nug7QG2nuIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 00/23] drm: Fill in default values for plane properties
Date: Mon,  7 Feb 2022 17:34:52 +0100
Message-Id: <20220207163515.1038648-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Dave Stevenson (3):=0D
  drm/object: Add drm_object_property_get_default_value() function=0D
  drm/object: Add default zpos value at reset=0D
  drm/object: Add default color encoding and range value at reset=0D
=0D
Maxime Ripard (20):=0D
  drm/komeda: plane: switch to plane reset helper=0D
  drm/tegra: plane: switch to plane reset helper=0D
  drm/tegra: hub: Fix zpos initial value mismatch=0D
  drm/msm/mdp5: Fix zpos initial value mismatch=0D
  drm/amd/display: Fix color encoding mismatch=0D
  drm/tegra: plane: Remove redundant zpos initialisation=0D
  drm/komeda: plane: Remove redundant zpos initialisation=0D
  drm/exynos: plane: Remove redundant zpos initialisation=0D
  drm/imx: ipuv3-plane: Remove redundant zpos initialisation=0D
  drm/msm/mdp5: Remove redundant zpos initialisation=0D
  drm/nouveau/kms: Remove redundant zpos initialisation=0D
  drm/omap: plane: Fix zpos initial value mismatch=0D
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
2.34.1=0D
=0D
