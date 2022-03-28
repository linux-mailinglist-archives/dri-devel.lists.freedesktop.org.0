Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1B4E96E2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C110E44D;
	Mon, 28 Mar 2022 12:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097D910E444
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:43:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D2C683201D2B;
 Mon, 28 Mar 2022 08:43:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 08:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=3Dh8IOGgFOOst5cwEYfpqTOfZQnWm/
 oMXUbJ26yA6oc=; b=B2OJQUzvSuyBnqEDQpoVLr1O7AxnznQquz94ECsEyiXBRj
 VDT1jegvGIpP+Cews+H8ETQU+CqekAmS8Ln6VTVQiVmHM6WNb5gKqGy5Mx0vyGDn
 cYlK6KubAB9fufLczzbh+nHk/mSifkX2WeMrn/NxR0sGjYayWaW5aQUultKLiuCN
 aEJVVQ/xhjzNsRcF92TiIg23spJcpf6BmAgvtumNHzAyLVWPNCSs6IasFwFlVAxN
 xVbegj3iKPKvnq9vZdyxIl1QiEttpVFNqX1XiprBKkn1RKz0+xtjVAmaJN+9a+P/
 rxPRp1rO8VZcsdvj8LkqLfr7EeFytJEw9nw/Q5MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3Dh8IO
 GgFOOst5cwEYfpqTOfZQnWm/oMXUbJ26yA6oc=; b=H+a8mHA1+5uYEx+4eUP8fU
 lsEQsLLElwRnfCm8eLx/ikd7KsCW7byJ+ukJIKcgfrP/WEocyUj2t+E9B+Imtkxd
 UQJdxmlQKHSTUQ0cmrPLov1jo2PpkOa0SnadgtxkBH5d//BXIPXaV0eZHnl6msfT
 0qeBAbz25y5eLT4ErSCBCK+vUydHQvjIYXh39zyqWcFZypQoAkBpCiyilgu4CRmz
 2IV+uW2qLC+3TePohTVCiP1YYfIinx5LBPzotRncHjmk8FCLnwqIISUvWW4UTvRJ
 3CJRkDWISx0RoO7OVsJ2o0PawuUcNolKCs3Y7rFR1xMMMKTyKEv/akM/KsVkzq1w
 ==
X-ME-Sender: <xms:Y61BYm6X7KYOCaquT7RIdPwHZ5i2x6IlmKnxpZ6WrYDq39w5vesgDQ>
 <xme:Y61BYv5pJ-i05Eqxmln7X2sER5LFAEmT196SYWxPhmKJ0JIeL3CI6AJFwLwCCxqpu
 7wmaDPi3KKi1f7pQAA>
X-ME-Received: <xmr:Y61BYletijNlzGFchR4hyXPyJwj-Vpx6FtIurZwmJIxOUDBd2AX-NvkxgprwtNxH-2uesMlqyPl2sz3ocL-_YkYtZm4KOIFL1ev4UC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y61BYjJk3wySKIV2Rt_ojiB_qRQBnyuhhBpVgbUyMDr86F838W_7Mg>
 <xmx:Y61BYqJZfiUA1bGYoULloNO2mXOvY_La5lSxlU0uXSaq7HO06NiudQ>
 <xmx:Y61BYkxSkhlGdpgFFuIEKuOR8tn82hh4MtBnUI_-h2tYKbC6dT-PDQ>
 <xmx:Y61BYrpvV3qXcZr8pcLOI1ymkK_LX02PICY20uPHlUlMnQjlm_gebg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 08:43:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/atomic: Add atomic_print_state to private objects
Date: Mon, 28 Mar 2022 14:43:02 +0200
Message-Id: <20220328124304.2309418-3-maxime@cerno.tech>
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
index 637df126c2d9..58c0283fb6b0 100644
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

