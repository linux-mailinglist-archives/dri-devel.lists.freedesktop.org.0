Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5D4E73BA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011610E3CC;
	Fri, 25 Mar 2022 12:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5BC10E327
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:48:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A1C355C0113;
 Fri, 25 Mar 2022 08:48:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Mar 2022 08:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=jsDresXrhssR3JsOu8GLvpWRrubqWq
 c/nHfmp6S2ak4=; b=BdebYP3vSgRckBTLKrReTtOxibc2xQVIlfZuovq+wv1EmA
 Q6xfw/tCYhO3rECiF1DT2tZFJbkeSJReI/4Lyw531eYV0eyyIWdYjz1sOOPFrp+5
 K/pbDc6pe8Ydje3y/2rhDHEBD+nIPAV9Xm7QvJVpLza36wqtp0wwkcHTfFkijYjP
 FCZN9NPo0zlyaAU9L/fU7JHwTM+1uGbiv9jwPNLG9ZKegrtCI89cFcb/tbA7BEHt
 OJs+KTNVZn6CI2fHGOCvORUxiazWhB1fWJ4GgssYcj4G34ZPsUD8o8bbE6kVp7tL
 DzOASVm3UWNCv3TCc1m97u62IjYKWYg0uVhlkEjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jsDres
 XrhssR3JsOu8GLvpWRrubqWqc/nHfmp6S2ak4=; b=YYjwXxQazUHKwWZe29Fr1x
 y4E/puq0b1nOexT073Iy42s8kHlifmZNI5VbERwC0sZmnCIqdFiVUfHojw+2kXRM
 GTF3ioCGsfHVUEiBubGSyxA7wxftmVMhn0mnBztOy81zwDaUrOElAlabxWUoqq+P
 ZHGQesr87t2MejzZOBBpIjMZqEKAIjre2Vuv2Xe9JBo5sNdEd1S6Ku92tz+E/+6u
 x5wKQVT8Ch9rGWwUazZKepkYVocpXaCNsaANp7sMJhAASn/VAWUDuzCA6a8HmDjU
 rTH7ES4jS0oMVRP5gLuC5oRxF+WLEjb7amIKR+r+tZUHEqHjIGTYLZiS3nw9uG/A
 ==
X-ME-Sender: <xms:Ibo9YoikuVHqpLw0E7nJjOw677rnp076C6_arIMoVHqmSuQEDq3qsw>
 <xme:Ibo9YhBaM3sVs5pHSe4rC15syhjzsikONsBob7Wtcbrsue7AMR2hjSEoWScSk257V
 PLmdOhT_f5sBSZ1-f8>
X-ME-Received: <xmr:Ibo9YgER6HXOfR-N0qJcxOBYU4jr-gUSXfydhuVfiyhJD23h25TQvvE_umptLWj3vUKyYChg4BZ3CpHzwswSC9aeOQe2IJnIm_D2EKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ibo9YpSP5YKPkz11nx8BVwQRkusTeZjlyI-FXDQ2gpBj-FSS9uf0oA>
 <xmx:Ibo9YlzecOun0sCd1g13OJUz26dm3mFUqZn9tF0VeqEEUY783f_UTQ>
 <xmx:Ibo9Yn7xi-zyhE4hA54hQcEF4-fqe97U2scBeKxbe6rjAVmemq2TAQ>
 <xmx:Ibo9YkyIZ3DikUyaxxeCU5UBixZrSuCZKE_SiFIPYbloJ0_PSF7TUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 08:48:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/vc4: Implement atomic_print_state for HVS channel
 state
Date: Fri, 25 Mar 2022 13:48:22 +0100
Message-Id: <20220325124822.1785070-5-maxime@cerno.tech>
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

The HVS state configuration is useful when debugging what's going on in
the vc4 hardware pipeline. Add an implementation of .atomic_print_state.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 26b771c919b1..bffd81d4bfcf 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -701,9 +701,26 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 	kfree(hvs_state);
 }
 
+static void vc4_hvs_channels_print_state(struct drm_printer *p,
+					 const struct drm_private_state *state)
+{
+	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	unsigned int i;
+
+	drm_printf(p, "HVS State\n");
+	drm_printf(p, "\tCore Clock Rate: %lu\n", hvs_state->core_clock_rate);
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		drm_printf(p, "\tChannel %d\n", i);
+		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
+		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
+	}
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
+	.atomic_print_state = vc4_hvs_channels_print_state,
 };
 
 static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
-- 
2.35.1

