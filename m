Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC250D347
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62F10FB88;
	Sun, 24 Apr 2022 16:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F15710FB88
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AD255C006B;
 Sun, 24 Apr 2022 12:26:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 24 Apr 2022 12:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1650817595; x=1650903995; bh=y9WhySCDOkgfaO0jzDCKtLpiP
 Ul7HttVW333ZBcJFc8=; b=SqUV610VWrD1bDFGtDAal7j7ofoMHTpj1iJ6qgCil
 VGLQqQpVt6kS9NmsidLI+DkPO1DE5t49TrW/Nvcu4TZauWrqvAgE9XCr+vYzfdPF
 oblYDEh3U5V8ucTiVVm1qWCyX3NAubRZDCyrEYNhkLGm8tK8ApO0fk2U46WF6qx3
 Zf52mX2pAOpnuQXUrPGrFs6C/J7YoTwrE1NRZijLdZ9GDJSAWSYCozzrLEtMcMzQ
 wGtslPpL0fO1xqk1cK+tYYbMrROjylyxVNj0p+ZMGYGE1ws2/1us2yrJA0VaIiJn
 dbccAmSX89YhCRNSM9D5nAEZ6kT4CDJ8fq1vsaNadpVEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1650817595; x=1650903995; bh=y
 9WhySCDOkgfaO0jzDCKtLpiPUl7HttVW333ZBcJFc8=; b=x8Myl7b6lfjtioxL3
 JqTBDq93IAYK9v1BTtOkYdKZiUu1sC2J/7/cMpQXP85Y74DGX+PixmEubeS3ul9W
 qeK4cdKTGasvhbaC37yTbP8ietVg/nuxLRwwBJL5f1qnsoIka6CM3wZB9rVBDWnw
 /ImpmweQbW0Hodd4LqeUKCHE1cTUXdQNVoF01mEnTHIJtNPTSdTHg1fJOfVg+0f3
 pjtrMcyzGqj6T/zEqSQuukleOAq09b1NhRRf2guxIjCVxXxO2f6D276NTxgEvlXL
 tdwsJLCTsdCNOaltsx75KmtWzSo23mrgUOe9uYupEaZF7RI/oGrJ8otDkwAHf2x8
 e9TBg==
X-ME-Sender: <xms:OnplYgxOcUnP3f1mZejLveZglnZ9k7FwaOdONyS0zmQ0GYGRtSFGhA>
 <xme:OnplYkQfY7RPi3Ij_FxeRlDqHuN2cNYRZiNpvJqB1Ym4ed-gzFZSydj3AAeRETam-
 61Nhahz7LTeXImCbw>
X-ME-Received: <xmr:OnplYiXAW56wbCAv66g7lrA0k5t0DNjHHsi279udVt51Hg9K2eQh7kkdb_-_bHTxTegW7ApKnsUN2pCOZLMGqt7BeE_6fzQgdD2Hw6A2GoXEVsBKjJ-KIozXRRzjfVcDuu_LpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
 hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:OnplYuh5sVjVuOOpdtYFG3h-JP-ZW-eILsIA59-IDmjYCQaOotepUA>
 <xmx:OnplYiAcOwXcQsrpgqLIfNmJEUyFmZ_fMsEC-Wz3GFReC3F9azZmkw>
 <xmx:OnplYvJV1oP1FXbhSuuYyv7ir_FFXsSTFNisvKMbt_YW-wdAm_X9vA>
 <xmx:O3plYjLJVRYdec_xyPcQQiL27WKwtpKdNOqqFXpOs3q_5AsafXxtXg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:34 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/14] drm/sun4i: Allwinner D1 Display Engine 2.0 Support
Date: Sun, 24 Apr 2022 11:26:18 -0500
Message-Id: <20220424162633.12369-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds binding and driver support for Display Engine 2.0
variant found in the Allwinner D1.

So far it has only been tested with HDMI. I will be sending the HDMI
support series separately, because the hardware comes with a brand new
custom HDMI PHY, which requires some refactoring to support cleanly.

This series was tested on A33, D1 and H3.

Changes in v3:
 - Drop redundant minItems and maxItems

Changes in v2:
 - New patch: I/O helper portability
 - Use Jernej's patches for mixer mode setting.
 - Use an enumeration for the ccsc value.

Jernej Skrabec (3):
  sun4i/drm: engine: Add mode_set callback
  sun4i/drm: backend: use mode_set engine callback
  sun4i/drm: sun8i: use mode_set engine callback

Samuel Holland (11):
  dt-bindings: display: Separate clock item lists by compatible
  dt-bindings: display: Add D1 display engine compatibles
  drm/sun4i: Remove obsolete references to PHYS_OFFSET
  drm/sun4i: hdmi: Use more portable I/O helpers
  drm/sun4i: Allow building the driver on RISC-V
  drm/sun4i: Allow VI layers to be primary planes
  drm/sun4i: csc: Add support for the new MMIO layout
  drm/sun4i: Add support for D1 mixers
  drm/sun4i: Add support for D1 TCON TOP
  drm/sun4i: Add support for D1 TCONs
  drm/sun4i: Add compatible for D1 display engine

 .../allwinner,sun4i-a10-display-engine.yaml   |   1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |   2 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   2 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 133 ++++++++++++------
 drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  40 +++---
 drivers/gpu/drm/sun4i/sun4i_crtc.c            |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |   3 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c        |   4 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   8 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  74 ++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  14 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  30 ----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |   6 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  27 ++++
 19 files changed, 251 insertions(+), 120 deletions(-)

-- 
2.35.1

