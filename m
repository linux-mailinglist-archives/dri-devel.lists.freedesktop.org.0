Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DF31FA2C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 14:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93BD6EB31;
	Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B726EB30
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9BB05302;
 Fri, 19 Feb 2021 08:59:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Feb 2021 08:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=kLzazjhvTU5QMMz6Vk4C8hkekA
 3rzr9twxb2+FR2TL0=; b=u4ViKt0WzT2spG1dGeDIsNprxyfihJdZRWythNqx62
 wwwMv/IqL7lQHUVAm+kNrZ6IU2iz+TJzhjmoamHHvSN2FIe7hVpzI555Iij+YAML
 sCPwPNB0z0qoRrKex46KQobS6qgs2Lq8eMKgKkWfJ1x23I8QZE+79/lMDnoGHSko
 cCud4+aZjxuftIC2ShW3Krm0c9YrnY2I2NO1lryw51WStYP1Ak4VZ4YaFS0xUGgh
 sjDLwXgNRmTMNeo8OIUVpeWs+T7ha3dchje9f1673IvJCK1Z4cUZ5e4T1UWcKQ9P
 K47O8wNvb+dgc4y7N5YfrbRaO/Y8rKTzajeVSR/8m9Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kLzazj
 hvTU5QMMz6Vk4C8hkekA3rzr9twxb2+FR2TL0=; b=K75wOOumuHUKLSCg1UqroO
 FUgoceCWHBF1wIO+XnB1YGysTS0J2aai6leVjkGkCqfvricKCUSQcE0gnZbJI1WN
 dYgsDpYcdYkNqifHD0lfvHTHNXFdUbtJuR3Ipn6j70zHukqCdQ4cXGwdXlsLAP6E
 FqFsPrURaT+r+JqALwsPIG+hE8GeonHoFoF+pknl9AyMvnj1u/zlgXo5QNyyEdKH
 P5tjcw+UqX+k5nu2GUYmXJ4bART7K6ZK33NoLo1jKf355KS86p+pW6K8oizsLczK
 sprnyMoPo3+HzUmWuF9dzyG6uiA80Qq3oo75FBFrWZoQAS6st55rV6PTrrj55NTg
 ==
X-ME-Sender: <xms:ScQvYEx_YRVIMb-e2IwVsQgFD6ty40Bzom7tkJfvq-Mujpuw5KFcOg>
 <xme:ScQvYISX5zy16zyqiubHwlMTSujmOjGaGew7YzzZeqhCuIVPSrlmAhdA4DV3Kn-B8
 JRVNBWNYdSX5trjeSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ScQvYGVzzB2XpLi-sqv6pEL_azeqUKaRsoN43t5f174C453qbqG1DQ>
 <xmx:ScQvYChMuZvCZ1prvymSXsqqmEdcOP8z6UyF0J1-O1ZNqYJqECih7g>
 <xmx:ScQvYGAhdelR0J11h0CeOUguTeRnb6feIPjoCPjyUm_7Xu04YnrQgA>
 <xmx:TMQvYMAKNmBsPQGY2GRsiJhM-oa70WtS0ZMp8TixcjlTDkvFVA4wjA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A91BE1080057;
 Fri, 19 Feb 2021 08:59:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 0/7] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Fri, 19 Feb 2021 14:59:27 +0100
Message-Id: <20210219135934.618684-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a fourth attempt at supporting the LVDS dual-link output on the
Allwinner A20.

Let me know what you think,
Maxime

Changes from v3:
  - Reintroduce the endpoint sanity check (and make of_graph_get_port_by_id
    const in the process)
  - Make a few doc fixes
  - Fix device_node leakage
  - Changed allwinner,lvds-companion to more generic link-companion
  - Rebased on 5.11

Changes from v2:
  - Added the DT binding description
  - Split the patch to enable the A20
  - Reworked a bit the error messages

Changes from v1:
  - Reworked the DT bindings
  - Refactored a bit the panel registration in the tcon code.

Maxime Ripard (7):
  of: Make of_graph_get_port_by_id take a const device_node
  drm/of: Change the prototype of drm_of_lvds_get_dual_link_pixel_order
  dt-bindings: display: sun4i: Add LVDS Dual-Link property
  drm/sun4i: tcon: Refactor the LVDS and panel probing
  drm/sun4i: tcon: Support the LVDS Dual-Link
  drm/sun4i: tcon: Enable the A20 dual-link output
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the
    Cubieboard

 .../display/allwinner,sun4i-a10-tcon.yaml     |   6 +
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   |  69 ++++++++
 drivers/gpu/drm/drm_of.c                      | 138 +++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 164 ++++++++++--------
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   4 +
 drivers/of/property.c                         |   2 +-
 include/drm/drm_of.h                          |  16 +-
 include/linux/of_graph.h                      |   4 +-
 9 files changed, 299 insertions(+), 112 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
