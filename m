Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73D4E73B9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A02710E327;
	Fri, 25 Mar 2022 12:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F4E10E327
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:48:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 95EC75C00DD;
 Fri, 25 Mar 2022 08:48:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Mar 2022 08:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=9g4vdv9BQ2mHkx2XnPbTgqFl3sUgQc
 JfUS1j/stZq8A=; b=cw8kPfFe0Xp96JkmR9tAuruwgHM7qebqOmdomoiwYkrtcu
 qvbTCgjkhgsYGXMWZYDWHb+M7uJ8JUog504sbnCIz5J4BOvyNZCdKLAytMqJew0q
 nfSO7w61K5GHtyJJ8XRSaKxJYTMoHD3xqFIUNBDXytKHyaZoKanmiFw0Dv6w2me0
 VACC3pdYSAm3+HAQhuqhAyw41XeaNH1BaZ3Gl0moH8rsnIsQvtLnHQGJ2XhGUDV2
 f8FSFv2ydhzcbssP4vIRiZQe92hs0AIuK7E/TJZulOqXyyRMzVolTLaGqNGASC+U
 DBn7sT2kjG/5RdWPhDyz36kgYYejKID4Bi4ZxA9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9g4vdv
 9BQ2mHkx2XnPbTgqFl3sUgQcJfUS1j/stZq8A=; b=I/KlE7U2rbLFxrl3FwVTuT
 crlE2xHtER9Qr2MMkyy39B2J7l0rqy88zK9VvAyWWLGN3zedyVObbo8jI1RInBsM
 S2JpSIZs06H2M7n+qq1ZR4dYK3FEgl1pgKiOehutAxFVUtvr+q4P8jG7bDXG7VKj
 tzfkvx9uzNy/xLwxTzx7ZZNuUzDrL/agKb/tvF/zd723xyED+GqVXLX1RzopCQd+
 bERoxhIkNoLJhh0UHFUGmZbwpZFDnSaCt7a5AQ3fXmEajFrStokb8SMizdr2T7bQ
 aMFq9bImC+HrqMmgSoa3iQiH9S0YhW0L9vx17A7GuKLEfmfwc8XxIywaKJMFe5+w
 ==
X-ME-Sender: <xms:H7o9YgU7jDvmzH-KXrXW3iBXud7FiBO0KBU4Zr_0rmlNdhkkJEOJmA>
 <xme:H7o9Ykm7TV7rIHEo7RvRK8qY-db8H4hGbdu30HZqcA09c7j_M4MhBlM3wSnFQsv_7
 qnx50qRX5UfXQ7NseQ>
X-ME-Received: <xmr:H7o9YkasCOqNtFOpw_SPySuLJSzJXvKVm81pa3DiYav0OItTT28o_LH6KZ7NCxpkP_sWQFWJLa0Gy-mLNHA4LBlHyZUQBpsowlZtz4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H7o9YvWp4zmG55U_DfS7rjGCvoFpDENQXSgUxiUKa0tO_so64qP5dQ>
 <xmx:H7o9Yqk_wZAVTOu3BbIlE-oLri-YWahXRhN9UCxZPEFwsm-Rt4slyA>
 <xmx:H7o9YkeNLADQbL_6l9R-6oywbKQyfBtIIvJA07UggE-lTgOVBvpn4w>
 <xmx:H7o9YsWpsLx3ZMu5ldpIJPZrZfQSeM9FxIyvnRBQYTU6k8NLM_UI3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 08:48:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/vc4: Constify private state accessors
Date: Fri, 25 Mar 2022 13:48:21 +0100
Message-Id: <20220325124822.1785070-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325124822.1785070-1-maxime@cerno.tech>
References: <20220325124822.1785070-1-maxime@cerno.tech>
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

