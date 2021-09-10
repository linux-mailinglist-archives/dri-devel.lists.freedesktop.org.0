Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB7406988
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF86E9B3;
	Fri, 10 Sep 2021 10:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C12B6E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:12:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 478942B00939;
 Fri, 10 Sep 2021 06:12:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=/wYkDAweBEVV6XEJJiBjkmdd+f
 sR/vIPk4SFnyRJIEw=; b=Z61vRn/pjHuIVK0U8iQQc6o02wWjGgSy5Mq7VhkrtG
 9KszoGSplOrJbMAi690ob1Z1Rbd6CXaR0bSdSKloPkNc+4MadfECmZcsS+Iyqg9p
 wNh+rC18qzcHP5JJUUrGVSUzBgTA/SgkNH5ZsIkacsKcfGDwkjzYgyoV/8tFkqYc
 M9igqVSgwO5qcewjWPkP11YhCGrq81Qao6UmtRA988I+FV2FJkQPbDonbvBulIfF
 b9LRs4TR/1m8RlY9zO6rhexNIqQanbrnqQ1a2/QOo8SHhVlfM/Ob9Gu/FWnkjmX/
 MDod8kaA/25VHLY3v4qc94NOZO5nSZ8fXOfFa3rMpSmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/wYkDA
 weBEVV6XEJJiBjkmdd+fsR/vIPk4SFnyRJIEw=; b=Tp3/xf5wSTYdhQexa5+jVb
 /Xr2459iQLqKuECB5obggKx1lCx+O/eqxynoA7E5Jjt9EQf4op6D3dPnOTs31XVY
 Yo/g7EK8pytjoO5L5bzIEu+dNFNUCIFwBmbKYGDFibf5n3mNDeL44Cg90xk3d1VN
 +k08B81vz2EBeUAOZ9SWmb1NXeEZgvmfahmSCQiYzThjnNDtCXCCnJxJYXdqc8qw
 nqKfTYEi0KIA5VHD1ODoNYop3lWLl6ASkwLXZbIXmiyUGgBBzkTvTCDsE5tBsOp+
 kPYm2rVnR3nYOudb6qmTPmLegTjDSZEAlbOEr4p1qrTE0ZM7NxmT6f/FVWvUPgYg
 ==
X-ME-Sender: <xms:hC87YeY799W2Yyv2QDfsd-tYZ2W7aAkkRgJ5QgiICmhoaGFLPe7g3A>
 <xme:hC87YRZBEy4-3J19eGLjtu5DbtZkWtCTHA9FPt1k-F-ArpCbHasHT-mt4MxNxKw_s
 xP-JNhJmFVULw4klEg>
X-ME-Received: <xmr:hC87YY_SVPYz8G2Oq5uYvcK9Grsw4MzqvssnWrr7G9VVLiypbrN30TPSWoj_tMPqMFbY8HOh5GNqxl3e34MlZzkY4gmdHKAtbIrz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hC87YQqNAXq2zy6WSo4ZWBQPuS1MJxeUD0ccg-23d0LOWDB7CWFgMQ>
 <xmx:hC87YZrN20R_GiKpG2lpYUyI2SSLzPTNOUbV08kGX3K4luyaodfl5g>
 <xmx:hC87YeSCLWOMLfr75sxnvaLE4mJgFnJ9va92ZH1JnLBg_EMStvoyUQ>
 <xmx:hi87Yarx_m8WB5_rbYe9o-RAM7XgThkPPtirosv1HQfRudXcuLYL4BCbmKo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
Date: Fri, 10 Sep 2021 12:11:54 +0200
Message-Id: <20210910101218.1632297-1-maxime@cerno.tech>
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
I also had a look at all the DSI hosts, and it seems that exynos, kirin and=
 msm=0D
would be affected by this and wouldn't probe anymore after those changes.=0D
Exynos and kirin seems to be simple enough for a mechanical change (that st=
ill=0D
requires to be tested), but the changes in msm seemed to be far more import=
ant=0D
and I wasn't confortable doing them.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
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
Maxime Ripard (24):=0D
  drm/bridge: Add documentation sections=0D
  drm/bridge: Document the probe issue with MIPI-DSI bridges=0D
  drm/mipi-dsi: Create devm device registration=0D
  drm/mipi-dsi: Create devm device attachment=0D
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
  drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: sn65dsi83: Register and attach our DSI device at probe=0D
  drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: sn65dsi86: Register and attach our DSI device at probe=0D
  drm/bridge: tc358775: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: tc358775: Register and attach our DSI device at probe=0D
  drm/kirin: dsi: Adjust probe order=0D
  drm/exynos: dsi: Adjust probe order=0D
=0D
 Documentation/gpu/drm-kms-helpers.rst        |  12 +++=0D
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |   1 -=0D
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  15 ++-=0D
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  20 +---=0D
 drivers/gpu/drm/bridge/analogix/anx7625.c    |  40 ++++----=0D
 drivers/gpu/drm/bridge/lontium-lt8912b.c     |  31 ++----=0D
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  62 +++++-------=0D
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  65 +++++-------=0D
 drivers/gpu/drm/bridge/parade-ps8640.c       | 101 ++++++++++---------=0D
 drivers/gpu/drm/bridge/tc358775.c            |  50 +++++----=0D
 drivers/gpu/drm/bridge/ti-sn65dsi83.c        |  86 ++++++++--------=0D
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        |  94 ++++++++---------=0D
 drivers/gpu/drm/drm_bridge.c                 |  69 ++++++++++++-=0D
 drivers/gpu/drm/drm_mipi_dsi.c               |  81 +++++++++++++++=0D
 drivers/gpu/drm/exynos/exynos_drm_dsi.c      |  19 ++--=0D
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  27 +++--=0D
 include/drm/drm_mipi_dsi.h                   |   4 +=0D
 17 files changed, 460 insertions(+), 317 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
