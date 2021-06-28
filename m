Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF63B5E3C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81746E44E;
	Mon, 28 Jun 2021 12:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501D6E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C3653580505;
 Mon, 28 Jun 2021 08:43:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Jun 2021 08:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=77NxfyfOo9DLw
 z8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=YPzf6S5irvGcnYuKDjNhggcx53JeN
 kEztvssOyh+WwHO0QIaj8NMYk02uzOAD9P+Rk+NqnNDkO20fqx4gLuAKAU1SibSn
 sTVA6UVoh02j/hVeXY1PoIjHEZ8Gi0Yb24g1hdGUcazR9fFwbHsWQmfu5MTkx/O4
 Bj3+J5QtdvJkKNWaxYwEEfwChTWwQZgewrOJLq0Kx/MnSSdyx9lbUrxZqTUfT80V
 K+Jf9IUq2pkKDuyh8DuJT4C8KevmV4clVsYzzT+H2t7KCt/uF2NyU9ws40vmu+iv
 8DHxaZbRNaAwReu2r6B6AxmO7rA4UX1uUnD9qIBbgPwYySpu1sr45HU+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=77NxfyfOo9DLwz8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=Dl+5Hmsg
 uXj0Rc+Fgd4/2aO5WZ1qeNZYjeC9zRbvi5TpLuikn9+hi0lMRn8uorVKlGe1xtmw
 yKjxbc3m38mt0divrgUHF9co3j9Nfa/SKmGJxd4/a12SBK6Ue9sqHY3+LoAHlQwE
 dtTvzb/sLYnulVmCGjG5HLKMMp34iSrVLSl2pL1+gE7f9wfi2Cv2jxjC2MhJJkpP
 Kiere1Nb0ZYKUgKw6j+4x9bUin9VtfRBJ2SGnZzad33sqTK7cXu+4zJTxR4+RQoe
 lheb7zjBnpbKinYBtVIfuonlyGNaAs3IuPUHxQs5xKsBsmUG2nhBzLSBTr92q/oa
 jBxvkU6SbSOKcQ==
X-ME-Sender: <xms:3MPZYNyD_RG8O9eFSg2EMc5sEH542vQo2soDI54nJ_hlIypVHz-7IQ>
 <xme:3MPZYNToLgwcr-9YEY6JUqi_E1a9N5C5J4XcipfG9i9LoG57JkASQdG21pRRpMUc0
 xeOSGZLRAtW4JCU7CE>
X-ME-Received: <xmr:3MPZYHXy98eS5wrULqMhg3J2zv2v2QDLNApSpdsuuKVxVQUkzbUQ1PmR-92bO0aeihXg4voesjX3cML2FPPn05aauZQcp7SDz1w_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3MPZYPjFJicSrywlF59KGHqxnOOTI1QNWEHDrmxFfv7c5el_6fhX1A>
 <xmx:3MPZYPDeQk5jXO3eIIgvTcYyjuSgK0MzuttPQAJnmVnLv_NKoO-NXA>
 <xmx:3MPZYIIo64ypOr4jLWPehl449pceY2WbLP7EnQ_9JxzwdqcYWwJcEw>
 <xmx:3MPZYBROpnYFZm4X10iOgTky4l0ZUYuUlay3uELNnq4HB1Kv_k1GCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 04/10] drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
 prototype
Date: Mon, 28 Jun 2021 14:42:51 +0200
Message-Id: <20210628124257.140453-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_crtc_config_pv() retrieves the encoder again, even though its only
caller, vc4_crtc_atomic_enable(), already did.

Pass the encoder pointer as an argument instead of going through all the
connectors to retrieve it again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 902862a67341..93d2413d0842 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -313,12 +313,11 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
 }
 
-static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
+static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
+			       struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_new_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
@@ -580,7 +579,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder, state);
 
-	vc4_crtc_config_pv(crtc, state);
+	vc4_crtc_config_pv(crtc, encoder, state);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-- 
2.31.1

