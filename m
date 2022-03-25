Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0F44E73B8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EEB10E324;
	Fri, 25 Mar 2022 12:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AC010E324
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:48:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C4C55C00CF;
 Fri, 25 Mar 2022 08:48:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 25 Mar 2022 08:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=YZP1FnnPMpEcVBb6NQiltcXa/vZiMG
 GXwvyGMRdwWOo=; b=ycvONL3WSm+13e8RUHGjTMtBQbMNwfEwzd0Osxu0SX+b7I
 vHKqVvEjhuBy0cIQf4MuhMxjGWwBFISBBTqohd9K5pj/YS1aIro8YDdTPaozRLkt
 l8nipK4ppBRPpuOTV+0H4DOVluanFO6KW11vWrfuidi1gsgF7IrCnp9TEQa1KBs+
 rKmu7+ej1S7l9Ex5Z7Pkuf8ogVwLgHBrOlqQbI8Jv1PZeIDLz7CSi572c8PKXOLy
 d7Nyk2WdlpcoFOads3jkzopokQJA1SqfOC4cY5eFz9SAoxt5dtOpgys2L0Ox4vaQ
 NOodMkSJvscUjoyn7MeJKLKn0jsirlrB6biDdVIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YZP1Fn
 nPMpEcVBb6NQiltcXa/vZiMGGXwvyGMRdwWOo=; b=Bk81eqDvMkP9yDZHBevzTo
 kFBpbQcKOI020YfWQ14jARTWwKpkyEcW5fbev88jk1wkUrwgUVApoK7G1fyFlSaq
 9boNgo9VgsiWS4CuXvuc9NZihwTV4PDWfgGCLgWkSNxyskssmqBeFRPTosSzgkXs
 7WmK2FWPYOD2VOV8HkgVmLmirDJCQql1xjHIrc/yhHrEFFLg9Jp++zDuXs2R4vkt
 hpv8KOd8A80/R8YX4EpZubmhsQDdQA9aKtKFjZy8pGzStTVOOcViIv6RktLrGlOF
 BBNEDuTIrRRrFnUafNYmCcpTyZR6ybw8elIPkT8AOcXNUIaGi1Ka5LtMImyQJHZw
 ==
X-ME-Sender: <xms:Hbo9Yk4_Z1UxnsuAEduT_5zJ8XIFvdG6DWatfNV8TQ7cLmhTH-pwyg>
 <xme:Hbo9Yl4ktGfI1P-9AXcPZApGvDBrMDukNhpmh0rLTjnVqt6o-AqpBP8XieChOEnfU
 uhaU4CcfGnt0zUp8rk>
X-ME-Received: <xmr:Hbo9YjdIaAJY1ozZLIA9H3Xwn-F0VqEdoLu4KvYUUTpL3rwUGXNLMrP6Xee4HU7H1GSWjy0v8VX1JOkDmHIoDwUb9MND4R_reVgsOw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Hbo9YpKV30CQa5tHM5-yoXX1gpZTKIHlFZC1Wc7uybRkuGYZErFuPg>
 <xmx:Hbo9YoKfbzr-mfVxFnrV_Fhc0xmkCbCWucqtV3lEnjyel6s0u2365A>
 <xmx:Hbo9YqxSlHNJrgMtrwniSWvhri9oqmhtHq66BXDg-M-p1sc_4jne-A>
 <xmx:Hbo9YhqCB2oPbZNQiTW-KbGMXFCdqlCHbFigor2EnfPaeAWAx0cGNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 08:48:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/atomic: Add atomic_print_state to private objects
Date: Fri, 25 Mar 2022 13:48:20 +0100
Message-Id: <20220325124822.1785070-3-maxime@cerno.tech>
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

A number of drivers (amdgpu, komeda, vc4, etc.) leverage the
drm_private_state structure, but we don't have any infrastructure to
provide debugging like we do for the other components state. Let's add
an atomic_print_state hook to be consistent.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c | 16 ++++++++++++++++
 include/drm/drm_atomic.h     | 27 +++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 73865c147b4b..7a52a9f4f487 100644
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
 
@@ -1636,6 +1638,15 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
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
@@ -1656,6 +1667,8 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
+	struct drm_private_obj *obj;
+	struct drm_private_state *obj_state;
 	int i;
 
 	if (!p) {
@@ -1673,6 +1686,9 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
 
 	for_each_new_connector_in_state(state, connector, connector_state, i)
 		drm_atomic_connector_print_state(p, connector_state);
+
+	for_each_new_private_obj_in_state(state, obj, obj_state, i)
+		drm_atomic_private_obj_print_state(p, obj_state);
 }
 EXPORT_SYMBOL(drm_atomic_print_new_state);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..0777725085df 100644
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
@@ -311,14 +323,21 @@ struct drm_private_obj {
 
 /**
  * struct drm_private_state - base struct for driver private object state
- * @state: backpointer to global drm_atomic_state
  *
- * Currently only contains a backpointer to the overall atomic update, but in
- * the future also might hold synchronization information similar to e.g.
- * &drm_crtc.commit.
+ * Currently only contains a backpointer to the overall atomic update,
+ * and the relevant private object but in the future also might hold
+ * synchronization information similar to e.g. &drm_crtc.commit.
  */
 struct drm_private_state {
+	/**
+	 * @state: backpointer to global drm_atomic_state
+	 */
 	struct drm_atomic_state *state;
+
+	/**
+	 * @obj: backpointer to the private object
+	 */
+	struct drm_private_obj *obj;
 };
 
 struct __drm_private_objs_state {
-- 
2.35.1

