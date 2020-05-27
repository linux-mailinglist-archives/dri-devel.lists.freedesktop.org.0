Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4D1E59C7
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2663E6E4E3;
	Thu, 28 May 2020 07:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8276E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24771582091;
 Wed, 27 May 2020 11:50:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hn1mG4jcbIIbo
 0o9ITAXWH7T5+mqDrg6shUmeSL5Ixs=; b=yGj2WBWf7aNTKqe1XIdQP4IugcG9G
 TuzE15VYtv8mLN71gqg4eV581al6ajI26dzIllgwH27l3dnkV+2BaP1f9IR+rnor
 DU7qpFnW0P5kgua31cubGUsyTCeoRQSIt4YyaMelcQkzgnnohDQtuFYjBHsgVD7G
 ikup90t+Cu+pC+5N3/QRUOZPoHaV5tiBDWPl4ujvSvCkNfOrcqKz75MjPXpLycz6
 Capu3XGBShRlvZuU9gTUxktRy7MgcvZj4ldZwrn1ks+aNXDuWbBmO2xYjGAldHkD
 jik0JVaEEUtKaPbJXlaKtG5If3HJOgSPE2HJRd9lXWx5AaoZFaiCNO14Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hn1mG4jcbIIbo0o9ITAXWH7T5+mqDrg6shUmeSL5Ixs=; b=C5KeHyMO
 TOkvrTlxF/7oCvfP3SWDCIWcAEREFST4OiTEdFsZA0p7TaczWuc72n008+yJBISr
 aKsYXfYKCYbk/yiOpWCEs83P9JCwmd+DLpXYQ7cABrv8s6O1NMRqiEmK0QLBBkFC
 xCB69EglMkj2r3PGVtP5Fkcu2rteC5KKVu5Fe0eOfE21GkK3Iqg89XHftbeRDnVO
 OmB4Oi99OmXEBub/5GpLsoDBbFXiZ/ir28g6bJZXGptyX6GXdqtxtywVUX5fvvNL
 TxXhK2CgEvq54RoQrrL69yAe4ydssNVzFmUpP7M8a/wDJ2n/2/YkiE4taGBEfNQi
 ceGKr3ZvL121Jw==
X-ME-Sender: <xms:SozOXmDJWrCkdo2nd4Lz7cJR6MfsSZV_MwwY7COZ57Df3OHAbZtSHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S4zOXggaCtR7hg7cv6dn4bg-ezlvtNObeeOTXozymM7UzWsqYoMPHw>
 <xmx:S4zOXpmdcELaqVxt9UWNNvBxbIAAdgyjqM2Qnf4pVTCkfmco4eWIYw>
 <xmx:S4zOXkz8ebPac6UM5GKPlDcb6nlZ3Ubz3z2cP6dKQROyl29jMFqrRQ>
 <xmx:S4zOXkQ2zqijMys-l8NIkgkAoUPUu-AOPkB3dc5bVHAj-IWCMLiRTw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3C2D306218B;
 Wed, 27 May 2020 11:50:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 049/105] drm/vc4: crtc: Move HVS channel init before the PV
 initialisation
Date: Wed, 27 May 2020 17:48:19 +0200
Message-Id: <04fdaf2379fbb315a1e73d44139e9205490e7a6b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid stale pixels getting stuck in an intermediate FIFO
between the HVS and the pixelvalve on BCM2711, we need to configure the HVS
channel before the pixelvalve is reset and configured.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 3c9b0d684136..83fb5ba19b43 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -433,11 +433,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
-	if (!vc4_state->feed_txp)
-		vc4_crtc_config_pv(crtc);
-
-	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
-
 	/* Enable vblank irq handling before crtc is started otherwise
 	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
 	 */
@@ -445,6 +440,11 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vc4_hvs_atomic_enable(crtc, old_state);
 
+	if (!vc4_state->feed_txp)
+		vc4_crtc_config_pv(crtc);
+
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
+
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
 	 */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
