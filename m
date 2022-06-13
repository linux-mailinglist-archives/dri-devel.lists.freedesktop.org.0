Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D05485CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C4110E832;
	Mon, 13 Jun 2022 14:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181D10E832
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 436593200302;
 Mon, 13 Jun 2022 10:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131734; x=1655218134; bh=J7
 INpyb5GsbU2D7caFWtjLc70COGRW5jhYI6chMEoD0=; b=iIE6wgazVKjKc6PE6j
 lIbYAMoWaVnueeALSFtUYlEyxbmZnlYzxuB5IsvIRezfHCLjxOZruV0ktRMIAFnh
 FcEQx21i1HbMJlrOi6VsKrV6WPJQdsSX0XxCqx1j3Rcaw6Nc3mW+tAYslgH704/m
 oKf151AdS1me1m1xIicW34bIUxCz6eepjCuG2GIbOFoCO5fFz08VXXyEB6FzaQJQ
 sYQfrpzfVc94NDaGKY+8xRc1QuMDuHsuVkFytuQ1jShMBbasyxfd4QSlo5Wsk88d
 cOW/UUrGDCMZdVXfjGMZx16MdlgSYD12UXWRHVD2rpiTYTKNZYC24gtVPDgcO0uL
 RKrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131734; x=1655218134; bh=J7INpyb5GsbU2
 D7caFWtjLc70COGRW5jhYI6chMEoD0=; b=SKPGHCelrsR4ah2ZF78JTNoQD/ECR
 1DVP+gaq/vRlO7qr85PYFqQaUjK8AMewN8Wsm693zokborCvthm/16vKaG7e91UB
 mZFlmxDXOy2HhPMBKpbwH+IYwqHNyMAFZeM1IQzH7eYX/FUU/5SzPfEBgso0Dfu5
 DoRudi6JuJZ0RJUYAsJ8DjVtt2iTZR6Oh7qRin9zeyB1xXUg5L2yJKlpfDqkLPla
 4jnFpGbxeCgO/21ce3DT7jt17caA3PmV0fXZ5D+VwQm3bzAmAFlaV3h1EzOjpuaO
 Rpy9cA5y9k7hnZNRbcJGHgzrnwNpJQxLLovTF/73TkBLJUf8AF78+jyCA==
X-ME-Sender: <xms:Vk6nYipqZQobVci_3LnDjOdQfQwhIXW21dlHDplz8mZDcXA9aFk7ZA>
 <xme:Vk6nYgoMPh2o37V2u0exn8imNZ7E3-vudNYJvd6AKlI4993ynxyDeLItgNvElcaLh
 52NN3YGdlvi4HVA7ms>
X-ME-Received: <xmr:Vk6nYnN01O6g3E3-6oyj5Nvc1gBTxEKbBcpB-a_ETylXTRcNqEXf7kWdaBDltrhvPc0oL35cmfNdf-WA3mWn7ROC_QXtesjuy9rQlwo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vk6nYh5T_OnF2jmnOBORLtVS4KCTPNoautU_8knB7tNLf34lwZa-Tw>
 <xmx:Vk6nYh4cCDMeV6gfQyk-zQu5HLPhLlWdhrkUQGqIOQWnXgVpyZLf4w>
 <xmx:Vk6nYhiJRXT-oV1fOToQeGI6bmxm8wCXv4VyGACQqYY8nCLZtmSOFQ>
 <xmx:Vk6nYvS5-4QTMqdVpIe2dalnSJdRmc5pEF6ScCcr4zqgajz4OLb_MQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 16/33] drm/vc4: dsi: Add correct stop condition to
 vc4_dsi_encoder_disable iteration
Date: Mon, 13 Jun 2022 16:47:43 +0200
Message-Id: <20220613144800.326124-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

vc4_dsi_encoder_disable is partially an open coded version of
drm_bridge_chain_disable, but it missed a termination condition
in the loop for ->disable which meant that no post_disable
calls were made.

Add in the termination clause.

Fixes: 033bfe7538a1 ("drm/vc4: dsi: Fix bridge chain handling")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 333ea96fcde4..b7b2c76770dc 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -803,6 +803,9 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->disable)
 			iter->funcs->disable(iter);
+
+		if (iter == dsi->bridge)
+			break;
 	}
 
 	vc4_dsi_ulps(dsi, true);
-- 
2.36.1

