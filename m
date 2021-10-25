Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AF4399D8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7776E0A2;
	Mon, 25 Oct 2021 15:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6C89FED;
 Mon, 25 Oct 2021 15:15:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C51E7580684;
 Mon, 25 Oct 2021 11:15:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=diT2fj6PkuD69IpbJXNRqYXYKn
 P5NvILTd/s9bJ0OlY=; b=VhHgFlMBiex3XRoKMVkP+MWPTu1mTWrGp4HgjCJft+
 fHkLIUpdJGrXpdk0BZKDh0N1sigiQA3bm27LeWhFLC21sLCnDLFgfcb+Cv0SNR8U
 tohUaqhOuqwc+1KuOXWtoe8CC/v1ugkxODW6w3gp/79FhR07P028s58b15qWqQuo
 TW53Ucj3d+S0vfYZzHXDE/ObvS1xxnk9mYY0+qizTiINFyHnotoAgDrV3C9CbEeD
 PLyfe9kLAShmsTe9vben4QH/GmZ2TQVQZH6rqeK++soiCr1YRvWTSASxvhfdi77s
 TJnOsLV7v6sfOHsu1UCbobC/s2wa2tjRdFXAiAumU+OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=diT2fj
 6PkuD69IpbJXNRqYXYKnP5NvILTd/s9bJ0OlY=; b=gaB3S8V7nuXn3MJq7kzo6d
 d4Fp06+GtLqaQ5KXkUBaE5WWL//ewQTFZkT7eGQabm1x7ipCRO7mAj1S++bwpKx7
 WlPX3MZh2+FJC0osKUtI23L5JD2A27pCnl8LQP8rZrIB+1NUNhHM34zBs4pvCVfW
 5WwLYEkL2QzJZ4AlPdtBapgmwZlmJV9JQ31U7+lVzxIjowrW8h7O1TbSr4lVV5Ix
 EY03X8IbPZIdmkIjems9awfdTKIoKGxBWHzJl5bTpwd/PcjA/1pjQPqZJ5EOByBO
 Xq9pQ5WdiAYvNGKtfe2uUf3kpyHt56Q6Vt6IuMBqB2MfF1ko0PmM0Fk1qERGAUFQ
 ==
X-ME-Sender: <xms:G8p2YbjduyIs9HNx7cBAEAtontiOHY_jS-jmkObeZ94vetZX9eqg6w>
 <xme:G8p2YYDTxtDtJpxDM63v_DyoGxxuDZW426cibcC6bQSOnDTLUgGd3p_JMSnScrPAP
 P1BaCp7V2agX6reYAg>
X-ME-Received: <xmr:G8p2YbFlDXgXfKfgO7g5j2-kTCFAp2v_8FrI3mbI1bXoVwMFnlvolDBPhz8oR_tl2upxI_ht9fmxL4co22guE-t6cz_fWHqABc4U51Qt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G8p2YYS-IKlGhVYjArQExuUKR87BklDnDhRBhhW0Wt7MdKK7geic9g>
 <xmx:G8p2YYx6D8REvZ37THes66PRhnkNn4ws_YLk_AFPewIYJ42sz0DgJA>
 <xmx:G8p2Ye6Rp0Sli7-vbb2yAR6hc2D382XbLOQRatF-PTTlMX7HbXZFWw>
 <xmx:IMp2YbRN72csKs5h_Y3VhNJjZqJpThnblLDm2WRMg0A90KxxMn549Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: [PATCH v6 00/21] drm/bridge: Make panel and bridge probe order
 consistent
Date: Mon, 25 Oct 2021 17:15:15 +0200
Message-Id: <20211025151536.1048186-1-maxime@cerno.tech>
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
Changes from v5:=0D
  - Collected more tags=0D
  - Fixed a compilation error for ps8640=0D
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
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  65 +++++-------=0D
 drivers/gpu/drm/bridge/parade-ps8640.c       | 105 ++++++++++---------=0D
 drivers/gpu/drm/bridge/tc358775.c            |  50 +++++----=0D
 drivers/gpu/drm/bridge/ti-sn65dsi83.c        |  88 ++++++++--------=0D
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 101 +++++++++---------=0D
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  52 +++++----=0D
 drivers/gpu/drm/msm/dsi/dsi.c                |  50 +++++----=0D
 drivers/gpu/drm/msm/dsi/dsi.h                |   2 +-=0D
 drivers/gpu/drm/msm/dsi/dsi_host.c           |  22 ++--=0D
 drivers/gpu/drm/msm/dsi/dsi_manager.c        |   6 +-=0D
 drivers/gpu/drm/msm/msm_drv.h                |   2 +=0D
 17 files changed, 348 insertions(+), 364 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
