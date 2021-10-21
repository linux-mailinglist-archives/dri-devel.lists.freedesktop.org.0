Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99B435BE6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BDC6EB9C;
	Thu, 21 Oct 2021 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4796EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:39:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id D4BE92B012EA;
 Thu, 21 Oct 2021 03:39:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 03:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Ig1NvDgki9mc/elboNYuCt9K83
 3bzrfrL+LUGb9uXpg=; b=OGSlvN/lnYQBUsMdggz3wEVvHYB2Bn31n4plOWWkxM
 rWRzs1wBWRYd7IFuHbQwgQcfYhPvt+y/1LLMygK+mH6OI2hOmSXlydu93E30/sOR
 1LEuTnj4CAURh857bNT9PxwAeookSU4Qmx5ZSPT8luTCwmMFrJIqUcepQ+S2sLV+
 wZfpCdl/pmxVpn4B2hV+NWEO0N0dOVaMbk8TKXUHyRDpNJOiNbR7sGnXyBFg8gj4
 uFryvZUXIfQV+tsNmzN6hLcyjtTkyQVMF88ds5Wz4YLjbdfBmitsrdaZgOaoOaJ/
 3IJIt81jgj+jagQY1pdvabkc4GyyYuFTuzepPnSxS4sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ig1NvD
 gki9mc/elboNYuCt9K833bzrfrL+LUGb9uXpg=; b=jweG4n6R0zrCNasc0QxO8I
 h+W74iVQQn0nFHhvtudyxSX/RSSRIzuJnzrTQGK/WDAai6DrVYIPSGF6QiP3uYMm
 MnoBlnJH/8i9dQrJmS/H6ipPICqyVDGP+XSLcfPmKoia1TKijeFF4HQ9/rYzOa4W
 g96ziizY0N1HpAwLiMDx/kHYZPX8arJcQdnsrotMLibbJSzUlsPZ4KdYgEerkyd8
 8UvK51iSjHg0sT03VhFvNC/o85bmVpTgicfIzI9IXUZZOLyC8f0G6y9DdtZ/LrJ/
 WOPyBQMVfvE34EztJ0fjgCkYSlQxzHkEEGA/TJHICwnEYBNYCAJi3mJOzNa0Z80A
 ==
X-ME-Sender: <xms:RRlxYcXFvwguWd3dmZWHRQ3WjV5Oy53_r1Rd7SDRjC12y_Qnw_kbPA>
 <xme:RRlxYQlP6HTrl9SC6uWdf5yS6npjMLwFJrpbsmTCO6ea4fwIjkHHUu_qQhlopYjyj
 AeEtdA1LQXnjsq487Q>
X-ME-Received: <xmr:RRlxYQYVmB9ir25rs9tGYt71BZNF4VYBjbzD3NqGcuNuNIDY3bUoNbzfSWPmhmBInHcbd3THCu-dyRV5pB5iBAVV3HujMVBgWFkOG7Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeff
 gfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RRlxYbXDD_GnPb0xAQgYrZ2-s_U5LgW5aB1f-iALx2cbvbwSAxuy9g>
 <xmx:RRlxYWm2qmpQlplvdr0s0gxyTw91TUG3QLHX9wBqg5HzOD7jx8V8aQ>
 <xmx:RRlxYQedRIIrJbFSpzTS_9N9pXBjGrxbeMkXe6D-vICqPbspx2rTJA>
 <xmx:SBlxYU3ZFLlG9khXKHP-woEqyAQ5VoFfiOntNkv5kWRwQ1ocyNYdnUzHozY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:39:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/21] drm/bridge: Make panel and bridge probe order
 consistent
Date: Thu, 21 Oct 2021 09:39:26 +0200
Message-Id: <20211021073947.499373-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
We've encountered an issue with the RaspberryPi DSI panel that prevented th=
e=0D
whole display driver from probing.=0D
=0D
The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:=
=0D
Only register our component once a DSI device is attached"), but the basic =
idea=0D
is that since the panel is probed through i2c, there's no synchronization=0D
between its probe and the registration of the MIPI-DSI host it's attached t=
o.=0D
=0D
We initially moved the component framework registration to the MIPI-DSI Hos=
t=0D
attach hook to make sure we register our component only when we have a DSI=
=0D
device attached to our MIPI-DSI host, and then use lookup our DSI device in=
 our=0D
bind hook.=0D
=0D
However, all the DSI bridges controlled through i2c are only registering th=
eir=0D
associated DSI device in their bridge attach hook, meaning with our change=
=0D
above, we never got that far, and therefore ended up in the same situation =
than=0D
the one we were trying to fix for panels.=0D
=0D
The best practice to avoid those issues is to register its functions only a=
fter=0D
all its dependencies are live. We also shouldn't wait any longer than we sh=
ould=0D
to play nice with the other components that are waiting for us, so in our c=
ase=0D
that would mean moving the DSI device registration to the bridge probe.=0D
=0D
This has been tested on vc4 (with sn65dsi83 and ps8640), msm (sn65dsi86,=0D
lt9611), kirin (adv7511) and exynos.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v4:=0D
  - Rebased on current drm-misc-next=0D
  - Collected the various tags=0D
  - Fix for Kirin=0D
  - Added conversion patch for msm=0D
=0D
Changes from v3:=0D
  - Converted exynos and kirin=0D
  - Converted all the affected bridge drivers=0D
  - Reworded the documentation a bit=0D
=0D
Changes from v2:=0D
  - Changed the approach as suggested by Andrzej, and aligned the bridge on=
 the=0D
    panel this time.=0D
  - Fixed some typos=0D
=0D
Changes from v1:=0D
  - Change the name of drm_of_get_next function to drm_of_get_bridge=0D
  - Mention the revert of 87154ff86bf6 and squash the two patches that were=
=0D
    reverting that commit=0D
  - Add some documentation=0D
  - Make drm_panel_attach and _detach succeed when no callback is there=0D
=0D
Maxime Ripard (20):=0D
  drm/bridge: adv7533: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: adv7511: Register and attach our DSI device at probe=0D
  drm/bridge: anx7625: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: anx7625: Register and attach our DSI device at probe=0D
  drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: lt8912b: Register and attach our DSI device at probe=0D
  drm/bridge: lt9611: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: lt9611: Register and attach our DSI device at probe=0D
  drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: lt9611uxc: Register and attach our DSI device at probe=0D
  drm/bridge: ps8640: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: ps8640: Register and attach our DSI device at probe=0D
  drm/bridge: sn65dsi83: Fix bridge removal=0D
  drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: sn65dsi83: Register and attach our DSI device at probe=0D
  drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: sn65dsi86: Register and attach our DSI device at probe=0D
  drm/bridge: tc358775: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: tc358775: Register and attach our DSI device at probe=0D
  drm/kirin: dsi: Adjust probe order=0D
=0D
Rob Clark (1):=0D
  drm/msm/dsi: Adjust probe order=0D
=0D
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |   1 -=0D
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  15 ++-=0D
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  20 +---=0D
 drivers/gpu/drm/bridge/analogix/anx7625.c    |  40 ++++---=0D
 drivers/gpu/drm/bridge/lontium-lt8912b.c     |  31 ++----=0D
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  62 ++++-------=0D
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  65 +++++------=0D
 drivers/gpu/drm/bridge/parade-ps8640.c       | 107 ++++++++++---------=0D
 drivers/gpu/drm/bridge/tc358775.c            |  50 +++++----=0D
 drivers/gpu/drm/bridge/ti-sn65dsi83.c        |  88 ++++++++-------=0D
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 101 +++++++++--------=0D
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  52 +++++----=0D
 drivers/gpu/drm/msm/dsi/dsi.c                |  50 +++++----=0D
 drivers/gpu/drm/msm/dsi/dsi.h                |   2 +-=0D
 drivers/gpu/drm/msm/dsi/dsi_host.c           |  22 ++--=0D
 drivers/gpu/drm/msm/dsi/dsi_manager.c        |   6 +-=0D
 drivers/gpu/drm/msm/msm_drv.h                |   2 +=0D
 17 files changed, 348 insertions(+), 366 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
