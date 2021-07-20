Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215CB3CFAF8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006A89DB8;
	Tue, 20 Jul 2021 13:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEDF89DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D4A0C2B01187;
 Tue, 20 Jul 2021 09:45:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 20 Jul 2021 09:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=II6ZIwPuUDm1QQYI4VVjCMhViz
 c1ZeIOHaCA5ME/VuE=; b=gcOLuDgHYfhlXLonM7NgoN4W0fNt95JmWcnUbCpBLk
 unKumIG+yEWLJZAc5fvSYUyOR9fiB3vWBrcUt5Jx0p6NKE0OCNblqDfSVovl+wso
 tmqRFY0D+Ti6WYx300UuzkJTTN5+2TLpUyIRUNjLmwoZ755jrsJl/QFsr8CGqYSt
 D8q5lxjBK+pBgKrHGsmdV18SGP3wZwIcmlBorUQTPRNGo7gFnLW2wv6BRgDqb2Yc
 qvITlgljLI0B0GbWuKux0Mkk1NCobjQfiez+kFNRlOJXhM00BsVmdzF5NtTDa2mb
 HE3eeOa2C3oQ/fzJQNGlmlB/TogmOwGfLwuVviccIsyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=II6ZIw
 PuUDm1QQYI4VVjCMhVizc1ZeIOHaCA5ME/VuE=; b=IF8P3CKsEfjTO1dCrQet9p
 78O5S2+HYB3YRKQ9BbLDIS715ddf/TruhvXrYetja+dtUZv1P9ojB1Sf67bFwf9u
 HwI3l/8ds9QDfJ3vWubdEwxprnqcQK1i9y1D5j7jyVKSAfoJJhCPDAUerkwX/RGf
 alF7EokG1+rbhGDmx14LfEw2WOaO90x4TPsXtl9fnWH/k0H+HyltcwAMoXa71EZv
 JnYdLklbrlQIfvCFRd+ojE2CBGdLseA/b5xLdqsr+HGs3Fk2oN+SLBmJQW3KdC7N
 tK+k158NHb2hDUTqLKC4RXJzzeOxFm4dAVp924ZaGE44548OI7JVzHnwllDJXFtw
 ==
X-ME-Sender: <xms:edP2YCOygzu9NYZTbM-vh1ca7SmogOpd_BRVZSWMWRj0bBENRrzU5A>
 <xme:edP2YA9nWIO8l1qVURFGagGPF89a9kUvDYi9vzifGCuskxFLWocyyAOHCHnRruA8w
 FIyBYNJP_s6sAcA8ho>
X-ME-Received: <xmr:edP2YJSzb1SIZ9n_n3GjBBxjQhu91GoQ1nrq3YsLBg1O2FZr2ekqmM_p80MrQQlQ_mwVq8yu5Mg_yTobcFJR0aRUWX2yPtqBH2Kl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:edP2YCvaOXjFum2x9DVkBx0cgqWzc9OXGQcucvymczdYWcu3Gw_P3g>
 <xmx:edP2YKdKjNCdY6Bco6r2FtvkSVswbzHWiueT_HzG7GF0PrXyyvL_2Q>
 <xmx:edP2YG1vqPtFTvEw6uWab_jTSGmfBWZ1gkLsiLqleBgkw2asgf7Q9g>
 <xmx:e9P2YB_elgH-R2XMOqxtBm6Q3Ww2aWidkNVAtPMYLdER87q5q92lRvc9FgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 00/10] drm/bridge: Make panel and bridge probe order consistent
Date: Tue, 20 Jul 2021 15:45:15 +0200
Message-Id: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Since the RaspberryPi panel is the only driver in that situation, whereas i=
t=0D
seems like there's a consensus in bridge drivers, it makes more sense to tr=
y to=0D
mimic the bridge pattern in the panel driver.=0D
=0D
However, panels don't have an attach hook, and adding more panel hooks woul=
d=0D
lead to more path to maintain in each and every driver, while the general p=
ush=0D
is towards bridges. We also have to make sure that each and every DSI host =
and=0D
device driver behaves the same in order to have expectations to rely on.=0D
=0D
The solution I'm proposing is thus done in several steps:=0D
=0D
  - We get rid of the initial patch to make sure we support the bridge case=
,=0D
    and not the odd-panel one.=0D
=0D
  - Add a function that returns a bridge from a DT node, reducing the amoun=
t of=0D
    churn in each and every driver and making it a real incentive to not ca=
re=0D
    about panels in display drivers but only bridges.=0D
=0D
  - Add an attach and detach hook into the panel operations, and make it ca=
lled=0D
    automatically by the DRM panel bridge.=0D
=0D
  - Convert the VC4 DSI host to this new bridge function, and the Raspberry=
Pi=0D
    Panel to the new attach and detach hooks.=0D
=0D
If the general approach is agreed upon, other drivers will obviously be=0D
converted to drm_of_get_next.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (10):=0D
  Revert "drm/vc4: dsi: Only register our component once a DSI device is=0D
    attached"=0D
  drm/bridge: Add a function to abstract away panels=0D
  drm/bridge: Add documentation sections=0D
  drm/bridge: Document the probe issue with MIPI-DSI bridges=0D
  drm/panel: Create attach and detach callbacks=0D
  drm/bridge: panel: Call attach and detach for the panel=0D
  drm/vc4: dsi: Switch to drm_of_get_next=0D
  drm/panel: raspberrypi-touchscreen: Prevent double-free=0D
  drm/panel: raspberrypi-touchscreen: Use the attach hook=0D
  drm/panel: raspberrypi-touchscreen: Remove MIPI-DSI driver=0D
=0D
 Documentation/gpu/drm-kms-helpers.rst         |  12 ++=0D
 drivers/gpu/drm/bridge/panel.c                |   4 +=0D
 drivers/gpu/drm/drm_bridge.c                  | 134 ++++++++++++++-=0D
 drivers/gpu/drm/drm_of.c                      |   3 +=0D
 drivers/gpu/drm/drm_panel.c                   |  20 +++=0D
 .../drm/panel/panel-raspberrypi-touchscreen.c | 159 +++++++++---------=0D
 drivers/gpu/drm/vc4/vc4_drv.c                 |   2 +=0D
 drivers/gpu/drm/vc4/vc4_dsi.c                 |  53 +++---=0D
 include/drm/drm_bridge.h                      |   2 +=0D
 include/drm/drm_panel.h                       |   6 +=0D
 10 files changed, 273 insertions(+), 122 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
