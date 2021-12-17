Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C2478CBA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EEC112326;
	Fri, 17 Dec 2021 13:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9777011232A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CB8415C013B;
 Fri, 17 Dec 2021 08:51:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 08:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=sBGmg6OGxAeyMRv/6A1Uv63uY9
 15zP05qZumq6y3+sE=; b=j9Q3kqom3gMjpDKX9fOWJVxeDe/uS1OsXdqxwC5wft
 uloUGyYwNQN/tfAUoyIydvafeX2wwPAGTbd71VAySIl8fQXoo2o3l1X3s7HSRW+M
 si7c5BlAP8brMT+neFd8ObT67y9T8v/g9dLPr0S9SM2jJQZ0aHlYoYci4bdYUP1I
 tZOiM53pFwi/HCFJGIoRCRUmcPhbctXrsQSSZSvy+1evQWQbg5Zyz/NSwWDB9q+M
 7MWaUBvlUw/6L1rr6fqhiRT8yOEJ33ynV2TOhAM1o5ZGUcKsl/fbZff7CCi3GWU6
 soAjFyGeLC9rxQA8jMJwkndpe4jrk49Wvaeom0khOYPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sBGmg6
 OGxAeyMRv/6A1Uv63uY915zP05qZumq6y3+sE=; b=P/5gw8ykoVNjw8B1EFQcDn
 IKHdBdLq/XNXUarH5FYobNtkf5f6ZDuxY5GxEL6fYYiHcQGSTUGLowxmx1K4MU/r
 EVBm53hyRPMZzhkwr490RNb3vubpL9TohPeuJOy7CCd7dQeQOKRzfTEMiZqlFFdm
 sX+6DzDGNT+ha0P4+BX64zRUiahzfcfi5IMgsehunsYW67Sahn3wmCucjlqLgVAH
 Znv7uDidRcTrWXK4CnR2cMQidZBBezW44FfdRwV1Mr+ENvz+gxOU/IJTm6JfWkCq
 mCRxMDF/I87yuUVipGWjwg/xv4urKnMBJtvQr1jOjdYzVzRMCsJRtv2fJqf1s33w
 ==
X-ME-Sender: <xms:2ZW8YSaM8kwLQtD6l70wZ-Iftx1l1IY4B-22oN98sMB2fYcILGoShA>
 <xme:2ZW8YVbsLRxloWpgQtGhcZgZKtVT5YcEdaxBksF_p2f01iVdUvh4GHaFfy9XC4ZFy
 KjrgymX_abtKsjPNww>
X-ME-Received: <xmr:2ZW8Yc88i6wdmBVlt5PyNcA6cgOqA1c3xoqKzgSjyXP04m8VSKLgneUkXGv-pyx6p8YfsheNYhUp5JrRnLSLl7EktcSrEADJviN_rUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2ZW8YUpKomU6I0gfaabIgC-eLRfm8XX9KOh7Lv4xs3SpjkbasHHheA>
 <xmx:2ZW8YdrhU_medpZdBxpijTBCc7a3v86QZFCDoAS2CjP0Uc_QmvZhPA>
 <xmx:2ZW8YSSif0epwDo6zPJdsGE5ESkkuq36yH4ZlhjkNoEFbNXR3oUemg>
 <xmx:2pW8YRf3TkulijsDKZ2-IXTqsUgmqcjbueLMB6W5s0OhtdfGf_xXfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 0/7] drm/sun4i: Add support for dual-link LVDS on the A20
Date: Fri, 17 Dec 2021 14:51:12 +0100
Message-Id: <20211217135119.316781-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This is another attempt at supporting the LVDS dual-link output on the=0D
Allwinner A20.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v5:=0D
  - Rebased on current next=0D
  - Enhanced the property binding description=0D
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
  dt-bindings: display: sun4i: Add LVDS link companion property=0D
  drm/sun4i: tcon: Refactor the LVDS and panel probing=0D
  drm/sun4i: tcon: Support the LVDS Dual-Link=0D
  drm/sun4i: tcon: Enable the A20 dual-link output=0D
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the=0D
    Cubieboard=0D
=0D
 .../display/allwinner,sun4i-a10-tcon.yaml     |   6 +=0D
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   |  69 ++++++++=0D
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         |   9 +-=0D
 drivers/gpu/drm/drm_of.c                      | 138 +++++++++++----=0D
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   8 +-=0D
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 164 ++++++++++--------=0D
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   4 +=0D
 drivers/of/property.c                         |   2 +-=0D
 include/drm/drm_of.h                          |  16 +-=0D
 include/linux/of_graph.h                      |   4 +-=0D
 10 files changed, 300 insertions(+), 120 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
