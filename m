Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E43F46CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7291489C25;
	Mon, 23 Aug 2021 08:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B1A89C25
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F0D6580C63;
 Mon, 23 Aug 2021 04:47:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 23 Aug 2021 04:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=YtP/mGd/n0beQ9BPe465qCbE6N
 HfKkagZy8yb8Qg1jY=; b=H28FLAd08NKDFMH9Vaxs8fIkx+hgg4RBFcNoPjd96T
 bHOK0a0iiq2cE7bS+bZixq4j2QcFfOjLbGt/60m3rfHgvWCFPPdN+rXOQeqznBXp
 qC6EVu8IR67H2WqcCUX5uGqGuDe1x2G2iQa/h0zjyQuWghAhIeTA69mkhf+e69UB
 omInCzkfcA7jaeqDaJLVCBWWjb7ODIDw49jJXdiLvOdrsLM8GV/5xidkOanIvSxP
 9mxMG89FUb0p64XCNmz54JgSddAg0pyM1a/uGn0S7kByaawqiIV8smUSi8kyCHAK
 1BCi4yURleH+JazV3J6BjpMOZXW/nhJ67ClESVx4EX/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YtP/mG
 d/n0beQ9BPe465qCbE6NHfKkagZy8yb8Qg1jY=; b=dDzJTX5qEaYX/2G8L1y+kN
 nuG+LkilGQAp8IsExwFYWpvLnOwroLjrkKRUhh3WQL9vdEPm+Uda7GgJV/ZELuqU
 bK13lfsWc9kT9OIDZ9D7lV52gXxy8sdHA4pOkEbneft9rh6tB8GG/kXYvF/eQ0Id
 l9FnaD/WXbODNRjuYUAL3J+opyaKwcdS7/p4wxf2Sk574ZTlrwseoUYD46n9BJSf
 P0TtjF5d3IUyo+OdAhvz+ce+zaw7FS0ogJ4ULAs42vqlwiihVcuTr91aBUbKmTp8
 GonUln8tq5OHoelZMa/MzbZrxg9atunsFEJhlNLAEov8z2gl1XtXn9pYp1wIru8Q
 ==
X-ME-Sender: <xms:nmAjYYq1pHpsZLLl_amQPc0vjJ3ry0XUY4Dvv89XcL-qxx4K-yBEWA>
 <xme:nmAjYepjaYLMU1zNCOGASn7aGy-rYui_PaDWmCgy9Q4uKOsqwRsr9w8szbsW6kI3N
 3sIXMdW2pRACHm9Frs>
X-ME-Received: <xmr:nmAjYdMevDW6ia7hvtt4E_BjyAgKhDdlpNGOajk8jfpe1Gu_8LeWGkua_YujrmZQqyXv52VUtcp6QIfA29uW7laYFPObTyPjAcgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nmAjYf4dMo4Ebi9DCHFRB6VF07HsHXpq0ZHGeY7H1GFqRLcdH12Thw>
 <xmx:nmAjYX69tLiBa0doURMRF-14miTmET8NzvWrGWaT7qqB9VEQTVNCpQ>
 <xmx:nmAjYfh-QnxsUsqtMKcoUwiCPso2TjHFvqkVnykdva65N5MAZF2Y3A>
 <xmx:o2AjYeIybqG1DGmHJvpKPuJJySv5ikCZgM-U9bPzwYTV402h8JosEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] drm/bridge: Make panel and bridge probe order
 consistent
Date: Mon, 23 Aug 2021 10:47:15 +0200
Message-Id: <20210823084723.1493908-1-maxime@cerno.tech>
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
If the general approach is agreed upon, other bridge drivers will obviously=
 be=0D
converted.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
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
Maxime Ripard (8):=0D
  drm/bridge: Add documentation sections=0D
  drm/bridge: Document the probe issue with MIPI-DSI bridges=0D
  drm/mipi-dsi: Create devm device registration=0D
  drm/mipi-dsi: Create devm device attachment=0D
  drm/bridge: ps8640: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: ps8640: Register and attach our DSI device at probe=0D
  drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers=0D
  drm/bridge: sn65dsi83: Register and attach our DSI device at probe=0D
=0D
 Documentation/gpu/drm-kms-helpers.rst  | 12 ++++=0D
 drivers/gpu/drm/bridge/parade-ps8640.c | 97 ++++++++++++++------------=0D
 drivers/gpu/drm/bridge/ti-sn65dsi83.c  | 82 +++++++++++-----------=0D
 drivers/gpu/drm/drm_bridge.c           | 70 +++++++++++++++++--=0D
 drivers/gpu/drm/drm_mipi_dsi.c         | 81 +++++++++++++++++++++=0D
 include/drm/drm_mipi_dsi.h             |  4 ++=0D
 6 files changed, 256 insertions(+), 90 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
