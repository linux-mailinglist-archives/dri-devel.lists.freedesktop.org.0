Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DFB439A7D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18616E0F4;
	Mon, 25 Oct 2021 15:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BCD6E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8FBCB5806D7;
 Mon, 25 Oct 2021 11:29:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vuJjsFFLiX9bw
 l77Xeh7BHL+u1uEF6vHeUVCMxURHPM=; b=hDRe+8kAWV2iJxY5OlX/7mftL+bEo
 HNVmcgsFTIojz8E6Gk9oFkRoa8CLLC6YTmmaBK1EH1flHHro74MMX3BWt3IBMuLY
 fT0jhEGxsCOenW0XCa/zNTFLBhmUaKxDIfmYEd5Etp0d+wQwf9GdKzmeFOYyQ8EU
 dBicojp+emWoSaYc5o6d/UhWNEdcXm4hw8Y16jzoOubr5StXO6u9vDNR1Hk1g9+c
 ipb0yGPyfLWnSjfH/c+gMyoJxZzR/7NgDoq3MQNmp2Zw+rC9FE9rOnOTcOuzomQc
 U6rq6v1orz4Hx1RsgQ7E5TiYvL+3pQIg81Y0NBLSJ6n3bAlZnC/QzsmQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=vuJjsFFLiX9bwl77Xeh7BHL+u1uEF6vHeUVCMxURHPM=; b=cBErPvwD
 LjMWg3MoButALRmjvnV2UlennM1hWhU59zpTxCLIk5hdeWNYH/oQxs62mg6KKcmb
 Ae0fYtrpE1hCZlPO9fiUXpxyyfB0qbBoZjp4hmv5xfwb//7Dm5dICbaVsR2bK+W1
 +Mq1dJbc8HnUWijNA/1F1zepaX8C/qwVI5xUw53GqtBTDloTpLzdW/FARyhl02to
 4x6q8kterd40ZvVwUUUyrZClzGvUyY4T/I9E1mb+/OGx88Zj96b9mGrhBfCfAbRO
 nFHQxaMRjBqdHLovAP7K/RIegy787hSqH58kyZxjb/4d0Fa4al4/cnmWRdn6kgQ3
 Y9SceQbapGCHVA==
X-ME-Sender: <xms:Sc12Yfpu4aTg1CwDZkUEFlGYx9F1mwTy97WmW66SM8BSVtwwFTl-hg>
 <xme:Sc12YZr4HiCMHg3ArMp3tOFjb8b5rf_MPBTipIrhrWxe5irf1eyyCbV3fJ8Rhfy9R
 co1NpGDnyj7SOYi0Vg>
X-ME-Received: <xmr:Sc12YcON4jE98PKf8dyPUSL8nqwLb2VEK1-ljQiAS7cBvQuSY8Ix-o0bxz5oH6HXabrqb2WOXkQNliFnlWEtFYsKRH0fdo105mVo90sP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Sc12YS76etdM0B3iULbtDRA-bef9ehx4PhCtt-Pw0ES1-gAUpXsQGw>
 <xmx:Sc12Ye6dzf7-nmz5vl_OcF_97mwdDe2U3pv6p4tgvK2XOUI2q6RWxQ>
 <xmx:Sc12YaiuvrWZLzbNqdVOZiSihvLKqP2GetJP8dLdG9lqRc-TNmJjCw>
 <xmx:Sc12YdRqiT5PkAy9TU_zAQsDA3Da7rQDfXZzsRHsz0RLdvowDqlhOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 03/10] drm/vc4: Make vc4_crtc_get_encoder public
Date: Mon, 25 Oct 2021 17:28:56 +0200
Message-Id: <20211025152903.1088803-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need that function in vc4_kms to compute the core clock rate
requirements.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_drv.h  | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e3ed52d96f42..7cfd4a097847 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -281,10 +281,10 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
  * allows drivers to push pixels to more than one encoder from the
  * same CRTC.
  */
-static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
-						struct drm_atomic_state *state,
-						struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
-											 struct drm_connector *connector))
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector))
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4b550ebd9572..f5e678491502 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -544,6 +544,11 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 	return container_of(data, struct vc4_pv_data, base);
 }
 
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector));
+
 struct vc4_crtc_state {
 	struct drm_crtc_state base;
 	/* Dlist area for this CRTC configuration. */
-- 
2.31.1

