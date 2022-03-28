Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617F4E96E3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882FC10E451;
	Mon, 28 Mar 2022 12:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F33210E444
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:43:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EE76E3201C39;
 Mon, 28 Mar 2022 08:43:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Mar 2022 08:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=9g4vdv9BQ2mHkx2XnPbTgqFl3sUgQc
 JfUS1j/stZq8A=; b=MzDNM9S2r8I6ZwIkOyG6oI0ckL+kY+gEIax45UUzgjq+T8
 RhsUi21zvUcXS8HaX9D41TVXDLYOiRdlgVZIGCp2z/GHvuNKgS51u79LZi9/CczY
 9tQ62oLMqigF2Z3vs+avRzUTHH/efefcQpDecJpkFfO5Bph5Em1z+ApnMl0evz0u
 OkklWIdRj2FB5+IkYuQIU+8Lx4lwUe0FRmUhNET3TBjo0MQgPcz6ZET4upoU2L1G
 PZR71Dzlxd8hIP3MasuNfOP0Zshz7HT5WEhT0A8N8uT0wj4VAbJlKjhPcaUctuO2
 8VEbKSwqGk9v16eVPyPxeZ/N34djzaYeXejleCcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9g4vdv
 9BQ2mHkx2XnPbTgqFl3sUgQcJfUS1j/stZq8A=; b=NUsV346kFbaNb6ahDgvxrO
 5WLRM9LRbe18kR7hpOomabErSjEtEOaLHgPjFrhIR7YaJtbq+qLKSSCwZnymT4YW
 RhkjEO9ImOzPtbcCwBIz+9XRKpatFblUNRysWTQ6j0W+AcWXnGxbeww3I4OwEz5d
 wEGfDY7CKaL9WIY2RNhaxWJau/XxYVyuHHKphQP08xUzm06G43pwP2/W5k46nlDW
 CCguZ6x/C9gbeHKQer043d+75LCbju3BHobBeHiUTN/t7gGrUFIPK2SySOtlihl2
 fcpgUPHCVgldHXqO3WY1FSrRSCM/8bjkLjBtQsgxwJbsdRnH4kvcU72qSeBmu2tA
 ==
X-ME-Sender: <xms:Zq1BYot_Ukz9KJA4uKFTXw47jglHhtiR4Vz1DdF-n8NrNPFm77MbBA>
 <xme:Zq1BYldM0QPxZrSxqgsyRBoXfdOduT2A0vAN28wmMhTYYWy5V_iapkOuoVmKJvW1s
 LxoWX5vOJ3VQHTXAlM>
X-ME-Received: <xmr:Zq1BYjwDSHQ5XlH0g4TfgN9OKRmIDOGkUnUXBrnmafmOoPPbgyyE-txNpe-fozbX_tiG0nakz4nA1AcNQ57oFzT7BqDcKf2WCa7v45o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Zq1BYrO0xH0nAxOXyfjNKk6cA6bfcl67IZRdUCrIHX4uvjbj_K2Gag>
 <xmx:Zq1BYo-GYVIqz5PDKoSdN83NnoEpsK20_PMy0Hh51DEiWPeeKe7ghQ>
 <xmx:Zq1BYjVhJUGcWOhQUpemeXr-qXUnudYeQAxXVmyU9IrGxhQe9vuq4w>
 <xmx:Zq1BYlOaksTbPel5INwSMLafNJx7xJn_JaZsr6KUonkXvLIoAbWwTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 08:43:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/vc4: Constify private state accessors
Date: Mon, 28 Mar 2022 14:43:03 +0200
Message-Id: <20220328124304.2309418-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328124304.2309418-1-maxime@cerno.tech>
References: <20220328124304.2309418-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of those helpers modify the pointed data, let's make them const.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..26b771c919b1 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -32,7 +32,8 @@ struct vc4_ctm_state {
 	int fifo;
 };
 
-static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
+static struct vc4_ctm_state *
+to_vc4_ctm_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_ctm_state, base);
 }
@@ -49,7 +50,7 @@ struct vc4_hvs_state {
 };
 
 static struct vc4_hvs_state *
-to_vc4_hvs_state(struct drm_private_state *priv)
+to_vc4_hvs_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_hvs_state, base);
 }
@@ -61,7 +62,7 @@ struct vc4_load_tracker_state {
 };
 
 static struct vc4_load_tracker_state *
-to_vc4_load_tracker_state(struct drm_private_state *priv)
+to_vc4_load_tracker_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_load_tracker_state, base);
 }
-- 
2.35.1

