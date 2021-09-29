Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4741C0D8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BE26E9E0;
	Wed, 29 Sep 2021 08:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37D6E9E0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6DFB23200F9F;
 Wed, 29 Sep 2021 04:42:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Sep 2021 04:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=/dl8IMuf1y3V0WrkZJ2LWnQK7s
 2aukBedRgNWHXbFJ8=; b=SAY9PpQSZz9VVqsVDVJZdnU5DPvrXn3pdq7vtCS6IJ
 lz6NAgxxfjQvO6vbRyM6FkQ9yDBvmDCL8LoEi+UaygiN1YhQleDh1wmDea6Nq4Dm
 Q07EizrJdP+NfGNmk9Hm5sgQOgd9zk1xUN70uEVUV7u9HWoociUhvMbXYS0wxA/F
 X/R2ZeUYNrIZR52+Xb/L4A6bXaXl8U0hawHvKhqo6rU+LWIRA5QOf/AYGNp2I7nM
 zVyyQFlHsgBmqLHWHm3zBsju7h5oFQ7M5oASro6zD5G/LwUDoQC9IXB4B6yoM08x
 k0vWs0j806XWZSkv8GETlX1MusDQrc6hGRXbOUu8O1kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/dl8IM
 uf1y3V0WrkZJ2LWnQK7s2aukBedRgNWHXbFJ8=; b=Sq93/HTbv0ogOWMolo0Sul
 PuF5H7pRBPoxbt3pQ+itzNuN4OhnyLPiXHG59Eb6gFQt0JV+eHfnmM0A2jQ4TfLn
 N8PAQVPW3C2rDWU+Alzu0GoRxe5bIjGC6wTCccDab330/zn463Tqef8MNCeuFB2V
 rZKlVzY0epj0VHfIjVO0X7yNzhzUS5XYxRykyApqpNSNeQKnHBJ4WR1th4Cx/3zh
 8sH5AwD8LcCe1+pWj7l7jrCDApBAu4eyJUFb9CVv0MeaR6QhyxNwMsUdwafR6vv/
 mb/SQunYNMBDN4FqlvYD8V/eHsaRvncx3ODasTZHYN7m10li2tedvIYmm9+GRQXQ
 ==
X-ME-Sender: <xms:_CZUYSOnEKNfgMZMf8qVtByzjiZb5Z1FAlovYdTJiBCcUDus7n91OQ>
 <xme:_CZUYQ-4ehroM-Z3lKbI7bRztyLYmUhZnkISPrn47Kehx2LRg0H_h4n7UPoV11tx3
 Z5WlfI44XHCwKLEGck>
X-ME-Received: <xmr:_CZUYZQw0i7D_YaD2p96YQHxEAI2eCiuHOg0GOuxV0H02swUnFESQRkOD98dUloymywQ4_YEQh9rrJYskrzARBYJOUP5Y5wQ-7ZNiOMe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_CZUYSsTdyxWGggAkxidyB-a5ezt-nvxJUjM3RMeiPamUywfzIyOUg>
 <xmx:_CZUYaeP0xuWzkd3x361xnhwbbeWol5tLKFbWZirEPrixQ_rFZmd3A>
 <xmx:_CZUYW3Q_qwPAJGbd-ULpsZAEH7p_kQFKxC1XUiFJME4TYXUod8zwg>
 <xmx:_iZUYRxmfkKuz1TKbNYFfXMsZvOLizq7Vd1FaBw_2sY5Y0LaLTpb8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/7] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Wed, 29 Sep 2021 10:42:27 +0200
Message-Id: <20210929084234.1271915-1-maxime@cerno.tech>
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
This is a fourth attempt at supporting the LVDS dual-link output on the=0D
Allwinner A20.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v4:=0D
  - Rebased on 5.15=0D
=0D
Changes from v3:=0D
  - Reintroduce the endpoint sanity check (and make of_graph_get_port_by_id=
=0D
    const in the process)=0D
  - Make a few doc fixes=0D
  - Fix device_node leakage=0D
  - Changed allwinner,lvds-companion to more generic link-companion=0D
  - Rebased on 5.11=0D
=0D
Changes from v2:=0D
  - Added the DT binding description=0D
  - Split the patch to enable the A20=0D
  - Reworked a bit the error messages=0D
=0D
Changes from v1:=0D
  - Reworked the DT bindings=0D
  - Refactored a bit the panel registration in the tcon code.=0D
=0D
Maxime Ripard (7):=0D
  of: Make of_graph_get_port_by_id take a const device_node=0D
  drm/of: Change the prototype of drm_of_lvds_get_dual_link_pixel_order=0D
  dt-bindings: display: sun4i: Add LVDS Dual-Link property=0D
  drm/sun4i: tcon: Refactor the LVDS and panel probing=0D
  drm/sun4i: tcon: Support the LVDS Dual-Link=0D
  drm/sun4i: tcon: Enable the A20 dual-link output=0D
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the=0D
    Cubieboard=0D
=0D
 .../display/allwinner,sun4i-a10-tcon.yaml     |   6 +=0D
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   |  69 ++++++++=0D
 drivers/gpu/drm/drm_of.c                      | 138 +++++++++++----=0D
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   8 +-=0D
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 164 ++++++++++--------=0D
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   4 +=0D
 drivers/of/property.c                         |   2 +-=0D
 include/drm/drm_of.h                          |  16 +-=0D
 include/linux/of_graph.h                      |   4 +-=0D
 9 files changed, 298 insertions(+), 113 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
