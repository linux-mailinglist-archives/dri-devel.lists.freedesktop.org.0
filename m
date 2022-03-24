Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680E4E65A4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B2D10E8C5;
	Thu, 24 Mar 2022 14:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07210E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:47:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A49315C0191;
 Thu, 24 Mar 2022 10:47:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 10:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=wH+hLHooHjqx2j3EL4CTL8OqfQgde+
 x8S5lQdTTvqu8=; b=X2mg0sHaxObMGEAzgDSS2YZ3rR1frLi46ktenuHGzYBZhD
 dzgSzjTuR+t6AXHx5mivNUJQyUECwlVED7xaxXiWXMXAFwf/zjoJVeuxJ/HmixEn
 ybMeH+uFt64/czhOtcM+VdAnFpyM5CR3Lahr1o+dVvm64qh2o8klMHQ+jx3HDS+W
 lvDWazXkV3gt5VyirZgZY5OgNvSiYo4dPp12jY/QNZqR6q915g919rfF/IYftq9e
 rUhYqqizaM8OK2OT9hhOcKkyroCeVLkn0x5DLE3Ez+orv5HUTnBu5qwCQqa+vcbY
 BR9JHu7zKLuMyMBPGAOqjok29uD26FV8eyFSwA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wH+hLH
 ooHjqx2j3EL4CTL8OqfQgde+x8S5lQdTTvqu8=; b=VliePAI7Cx8z1edDdYarWZ
 vP9XX/ClgXPzxmRzMY5NgxvzdW5bSyVZRpntmR1IrHQiRbFKjo6Us7yvZxQpGRQq
 m/qdWn+AbcgnEH7YLuRTKgvq1NqUb3V9eWzKm/GICHYA8LUaYVpPACMxe8CoE/V2
 jV8JB9HU1dZDS0MvsitR504agiFKPdHV3n9FTVIUCibjg34JIhwwxCLXtrfdnBkF
 JR8SwVfyRURU8UEsJoEnUET4QLKcOd+D1mRMbborPgEg+3o5vvlmgd2IYpyXdW9R
 4ipMb6JAtf3/m7nEI9A45x9toNb68Q40jbAxEpWKC4FLbH7F/hAhfkL4mZ36nAGA
 ==
X-ME-Sender: <xms:hIQ8YmVUzTJ4c6n3fkdvt1Gpx2tzdioc_eUCk46YmmtxbzNGYoCa_g>
 <xme:hIQ8YinJUcZLEwXeUEObV8oYpRC0MnRcSPeHP8zIm1_95DHj5F4StBwLqpfFPL6BR
 TZAgRq1uCSWOp34mGY>
X-ME-Received: <xmr:hIQ8YqbUueJ9oYVQI_TmgcEdgzDEpVGK34uHtKrMg57OeBJxqPCL-8P7p5ZF9etTdhmC3n89heQ9eYnR723YSx3dRsjyhkCzbrLDdTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hYQ8YtUaGMCx-xNlOETPecjdfqXb3u-a7SpKyUEw3GrfFTouG8MsSw>
 <xmx:hYQ8YgmP_iBYWHe-HVe14CkmP5tOuP_l_TcJ6WhZlFBgeVnfrol_eA>
 <xmx:hYQ8YieZF-ytjWSYA4o5EyYIsAtSZE3-k9arXqJRLUnQ3YYpTod24Q>
 <xmx:hoQ8YhADqw4qqht0XaJc2yLgf92l2URgbv-6HtW0cKBECYZBJ8ytkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:47:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/atomic: Add atomic_print_state to private objects
Date: Thu, 24 Mar 2022 15:47:22 +0100
Message-Id: <20220324144724.1306133-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324144724.1306133-1-maxime@cerno.tech>
References: <20220324144724.1306133-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of drivers (amdgpu, komeda, vc4, etc.) leverage the
drm_private_state structure, but we don't have any infrastructure to
provide debugging like we do for the other components state. Let's add
an atomic_print_state hook to be consistent.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c | 16 ++++++++++++++++
 include/drm/drm_atomic.h     | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ee2496ff3dcc..b9246206ed54 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -789,6 +789,8 @@ drm_atomic_private_obj_init(struct drm_device *dev,
 	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
+
+	state->obj = obj;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
@@ -1640,6 +1642,15 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
+static void drm_atomic_private_obj_print_state(struct drm_printer *p,
+					       const struct drm_private_state *state)
+{
+	struct drm_private_obj *obj = state->obj;
+
+	if (obj->funcs->atomic_print_state)
+		obj->funcs->atomic_print_state(p, state);
+}
+
 /**
  * drm_atomic_print_new_state - prints drm atomic state
  * @state: atomic configuration to check
@@ -1660,6 +1671,8 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
+	struct drm_private_obj *obj;
+	struct drm_private_state *obj_state;
 	int i;
 
 	if (!p) {
@@ -1677,6 +1690,9 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
 
 	for_each_new_connector_in_state(state, connector, connector_state, i)
 		drm_atomic_connector_print_state(p, connector_state);
+
+	for_each_new_private_obj_in_state(state, obj, obj_state, i)
+		drm_atomic_private_obj_print_state(p, obj_state);
 }
 EXPORT_SYMBOL(drm_atomic_print_new_state);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..7e188cd9452b 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -227,6 +227,18 @@ struct drm_private_state_funcs {
 	 */
 	void (*atomic_destroy_state)(struct drm_private_obj *obj,
 				     struct drm_private_state *state);
+
+	/**
+	 * @atomic_print_state:
+	 *
+	 * If driver subclasses &struct drm_private_state, it should implement
+	 * this optional hook for printing additional driver specific state.
+	 *
+	 * Do not call this directly, use drm_atomic_private_obj_print_state()
+	 * instead.
+	 */
+	void (*atomic_print_state)(struct drm_printer *p,
+				   const struct drm_private_state *state);
 };
 
 /**
@@ -319,6 +331,7 @@ struct drm_private_obj {
  */
 struct drm_private_state {
 	struct drm_atomic_state *state;
+	struct drm_private_obj *obj;
 };
 
 struct __drm_private_objs_state {
-- 
2.35.1

