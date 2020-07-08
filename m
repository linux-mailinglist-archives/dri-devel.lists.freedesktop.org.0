Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB16219926
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45326E9EE;
	Thu,  9 Jul 2020 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7FC6E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 92339333;
 Wed,  8 Jul 2020 13:42:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+GsL/PhEM1vcC
 hoGS1OCu8EP3VmI+pijDvz5ksKewGI=; b=r2V6N3BPhoh5Ia8G9Z1LPUUcL+9xw
 Ogs5Kw2pcD43qODVazexU/nU3tvY4B2ELcumGAqphneygl1ILSI2JSD8Zn6f2UTQ
 gqkJZDeoy9uK1y5k1Klu1MVlRm7zKiLmwaBXFgtRiYEGcIoybV64SoZLm3oJ0L0D
 Qn8s7P0vsju6K7K8FlyAmoe/LgNBzHyqIe7kDnA25HQlKgddYEyM0u3Tq1Mxxiqw
 JQKKSey/W9oeCelvjWO91V6oNQT+kxltxJM+8R/6l231DL2V+5J1/llqciFT5Nwz
 nfnyQPk3U33PYmPwiIqcovEJG3/N8bhxlqZ65DDen3EKa4VskPMqbczAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+GsL/PhEM1vcChoGS1OCu8EP3VmI+pijDvz5ksKewGI=; b=WKTANOBb
 CwZDaxzl7y+r1S1upxUrAw8aq/oNadwZOEh8eT9SkrUklb4c2O2wtaanHXNgiGGQ
 PFcwzEv/77gJza/9G22jVmch9Y9qrdi3h7LguXujEZ3r81NRYDQaEABH2Kt073KS
 Y9qLwjZ2wRTwR9zoJpWuN00djUVtI+oDfr/TiNTMxJeWbdF3d72HbdvrHuzvrO/5
 m1//A69vMehvdwEQnEjjm2z/7/jE/RApDUDWd88HbVI3jFwayvU7BkrWzgzzIpHM
 yHuAMOzgF1p7ZtQHuSwjg9D+aUVZjvtvO9xuR2whCDUxBPe0lPCLo9SUJRdqUJqB
 PIj9X8jZXXRhAQ==
X-ME-Sender: <xms:mgUGXxvIw69rXw2tPHJTQZzd6A7OG2hykqvzCyz8O4LhNpzdosFBzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepuddune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mgUGX6eR_uYo0NOMtQymzB5D04R_VJgDjO0w_dQVjzylUcpxhMJRow>
 <xmx:mgUGX0xmlCB5L1C8KIsvtKXEVodUub9CDaZGobZD1AztmQ86FqK2gQ>
 <xmx:mgUGX4NCC67VBVrce5O8460-UM8XSSTc1NaMCS4oB-JK2Dggmd3ggQ>
 <xmx:mgUGX6PT2zXw4OCpk5PyVDm5oMUrvRkQLSRHAhKlKUOU2edBjVs3pppV-oc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D279130600B1;
 Wed,  8 Jul 2020 13:42:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 13/78] drm/vc4: kms: Convert to for_each_new_crtc_state
Date: Wed,  8 Jul 2020 19:41:21 +0200
Message-Id: <8af06b31c58ec9745ce13c2aca4e532d6ca340e0.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The vc4 atomic commit loop has an handrolled loop that is basically
identical to for_each_new_crtc_state, let's convert it to that helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c |  9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 210cc2408087..717673b18132 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -152,14 +152,13 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
-	struct vc4_crtc *vc4_crtc;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
 	int i;
 
-	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
-			continue;
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 
-		vc4_crtc = to_vc4_crtc(state->crtcs[i].ptr);
 		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
 	}
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
