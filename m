Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA916363A2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63B10E585;
	Wed, 23 Nov 2022 15:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454E10E585
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 859B12B069B4;
 Wed, 23 Nov 2022 10:29:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 23 Nov 2022 10:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217360; x=
 1669224560; bh=Ld/xmdM5JwuLR4lMs18cSragw0fqAAqcmDNRf6MhwfY=; b=U
 5u6Mo33xXnrMvQyNLRrmX62UfFKnzVSY8Mp3r0kussJ/B87+LASCpz7YXXUWB8lV
 VgjtsBEj1SNU5D4LBFg73KT99aTehAgmMfFLpL/eNM9P8IqY9CfrHGdDrpfOyDYq
 oJKq49ZXZOcRMBRuCXxiUXjJ5wmhv1H7VTAKKCYB1N5kjOtmdmfwAC9bTs0/Q3wZ
 PG/0GLCtFkvZ1gB7rkoqRfYnBoJWB5yg95qSWvWO6Cb43DgttlT42BOxDRHxnT1K
 MMeb5K/BYJZ74LkIFp8pcrF+MsKWfJCl6T3U8U8+cqHtdk7XXk6kKGuy7aZX4uz3
 LK64XQewhYE7LC0E8OTiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217360; x=
 1669224560; bh=Ld/xmdM5JwuLR4lMs18cSragw0fqAAqcmDNRf6MhwfY=; b=a
 rP3FyShBvB5qYpRKQpEWSgni3ejjAHl60ssoWc9jn/WhgOBc1kcrF8se6gHDr9vH
 wiEgw/R+Hy1ml914OHjCnQxdo8/9tbVInOMiKkrgj7I3q4Wayqi8CTNSVGIN+lFg
 F/GIwkSTulhtBGDMrsQMBE1V45WxHN+cd8DkauGiKXSdvv0ZMqlc5KmGS8c/bMb1
 24C5hWlKp1JXfyrohOv3z7z+VYmRLR71sCTjngG8gK7xoUEq4E1vZV0l7uaRL4Qg
 tcp3FmEC4HLy/+reZ0LUfhNoHmku1119iX+obC0pQBXl9scf1ACu3YdqHKKbt+NE
 JFobG6xikFLyjogG3Rg9g==
X-ME-Sender: <xms:Tzx-Y3E4ctCwGLlN1pYkQqtfyXki9k-1K5ZCZA6K2WryC1W5dzE9-A>
 <xme:Tzx-Y0Wqea3jccS8R48MlW5QEiFZh-OVMS2vYWUtQrpzAjo4bASUT7lNhC4wUaOS3
 ch1Rz7FttbLhxO71o8>
X-ME-Received: <xmr:Tzx-Y5LVw_CIngWaKbiQkWjk0JV0yosR0CsGL1LoZaM4Sfefor6qc_lWMFQcJWTtstgzWuJMd3DDU8h3B8Tz6OercTS_0HTvOUqX_E0KtmhlEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UDx-Y1GHvjjXgpJcZDydTnmF7Fp2L0rxhTaafba6wq_xPw5HIcfG2w>
 <xmx:UDx-Y9Unoo_K2uKI8pTl7Lvb1lQgobQ3zQLvs92a5AKikKCrzsNCDw>
 <xmx:UDx-YwPwFscCbx2t9fac_sL9q-QNuuPZLCc7HK9MUt6jUDUX6W1CBQ>
 <xmx:UDx-Y30En-JV1TnR6GcpUmx_ibbcqc_mudVOGyxW6ebBwzHK-vjj0t6_RIA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:51 +0100
Subject: [PATCH 09/24] drm/atomic: Constify the old/new state accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-9-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8953; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xYhnBEqe7KGi5dmcnsCQ0kWzTdbbF6MZ0o4hUEoisvw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tWZr6w+Fum/5quNvcK89PyGrQ3iW7MftrmVVCh+Nyxe
 9t6xo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNJeM/I8OzwbG/mih7xK6HLp0V1hf
 VkTHxj8X3GQ69XYZ2l14NyXRn+qemcP7TzwafnzCdffT9ybS7TrvRrx15MTC7QfFYh08MlxwQA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_get_(old|new)_*_state don't modify the passed
drm_atomic_state, so we can make it const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c | 12 ++++++------
 include/drm/drm_atomic.h     | 32 ++++++++++++++++----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..e666799a46d5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -880,7 +880,7 @@ EXPORT_SYMBOL(drm_atomic_get_private_obj_state);
  * or NULL if the private_obj is not part of the global atomic state.
  */
 struct drm_private_state *
-drm_atomic_get_old_private_obj_state(struct drm_atomic_state *state,
+drm_atomic_get_old_private_obj_state(const struct drm_atomic_state *state,
 				     struct drm_private_obj *obj)
 {
 	int i;
@@ -902,7 +902,7 @@ EXPORT_SYMBOL(drm_atomic_get_old_private_obj_state);
  * or NULL if the private_obj is not part of the global atomic state.
  */
 struct drm_private_state *
-drm_atomic_get_new_private_obj_state(struct drm_atomic_state *state,
+drm_atomic_get_new_private_obj_state(const struct drm_atomic_state *state,
 				     struct drm_private_obj *obj)
 {
 	int i;
@@ -934,7 +934,7 @@ EXPORT_SYMBOL(drm_atomic_get_new_private_obj_state);
  * not connected.
  */
 struct drm_connector *
-drm_atomic_get_old_connector_for_encoder(struct drm_atomic_state *state,
+drm_atomic_get_old_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder)
 {
 	struct drm_connector_state *conn_state;
@@ -968,7 +968,7 @@ EXPORT_SYMBOL(drm_atomic_get_old_connector_for_encoder);
  * not connected.
  */
 struct drm_connector *
-drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
+drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder)
 {
 	struct drm_connector_state *conn_state;
@@ -1117,7 +1117,7 @@ EXPORT_SYMBOL(drm_atomic_get_bridge_state);
  * the bridge is not part of the global atomic state.
  */
 struct drm_bridge_state *
-drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
+drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge)
 {
 	struct drm_private_state *obj_state;
@@ -1139,7 +1139,7 @@ EXPORT_SYMBOL(drm_atomic_get_old_bridge_state);
  * the bridge is not part of the global atomic state.
  */
 struct drm_bridge_state *
-drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
+drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge)
 {
 	struct drm_private_state *obj_state;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f6..92586ab55ef5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -515,17 +515,17 @@ struct drm_private_state * __must_check
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj);
 struct drm_private_state *
-drm_atomic_get_old_private_obj_state(struct drm_atomic_state *state,
+drm_atomic_get_old_private_obj_state(const struct drm_atomic_state *state,
 				     struct drm_private_obj *obj);
 struct drm_private_state *
-drm_atomic_get_new_private_obj_state(struct drm_atomic_state *state,
+drm_atomic_get_new_private_obj_state(const struct drm_atomic_state *state,
 				     struct drm_private_obj *obj);
 
 struct drm_connector *
-drm_atomic_get_old_connector_for_encoder(struct drm_atomic_state *state,
+drm_atomic_get_old_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_connector *
-drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
+drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
 /**
@@ -540,7 +540,7 @@ drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
  * @drm_atomic_get_new_crtc_state should be used instead.
  */
 static inline struct drm_crtc_state *
-drm_atomic_get_existing_crtc_state(struct drm_atomic_state *state,
+drm_atomic_get_existing_crtc_state(const struct drm_atomic_state *state,
 				   struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].state;
@@ -555,7 +555,7 @@ drm_atomic_get_existing_crtc_state(struct drm_atomic_state *state,
  * NULL if the CRTC is not part of the global atomic state.
  */
 static inline struct drm_crtc_state *
-drm_atomic_get_old_crtc_state(struct drm_atomic_state *state,
+drm_atomic_get_old_crtc_state(const struct drm_atomic_state *state,
 			      struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].old_state;
@@ -569,7 +569,7 @@ drm_atomic_get_old_crtc_state(struct drm_atomic_state *state,
  * NULL if the CRTC is not part of the global atomic state.
  */
 static inline struct drm_crtc_state *
-drm_atomic_get_new_crtc_state(struct drm_atomic_state *state,
+drm_atomic_get_new_crtc_state(const struct drm_atomic_state *state,
 			      struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].new_state;
@@ -587,7 +587,7 @@ drm_atomic_get_new_crtc_state(struct drm_atomic_state *state,
  * @drm_atomic_get_new_plane_state should be used instead.
  */
 static inline struct drm_plane_state *
-drm_atomic_get_existing_plane_state(struct drm_atomic_state *state,
+drm_atomic_get_existing_plane_state(const struct drm_atomic_state *state,
 				    struct drm_plane *plane)
 {
 	return state->planes[drm_plane_index(plane)].state;
@@ -602,7 +602,7 @@ drm_atomic_get_existing_plane_state(struct drm_atomic_state *state,
  * NULL if the plane is not part of the global atomic state.
  */
 static inline struct drm_plane_state *
-drm_atomic_get_old_plane_state(struct drm_atomic_state *state,
+drm_atomic_get_old_plane_state(const struct drm_atomic_state *state,
 			       struct drm_plane *plane)
 {
 	return state->planes[drm_plane_index(plane)].old_state;
@@ -617,7 +617,7 @@ drm_atomic_get_old_plane_state(struct drm_atomic_state *state,
  * NULL if the plane is not part of the global atomic state.
  */
 static inline struct drm_plane_state *
-drm_atomic_get_new_plane_state(struct drm_atomic_state *state,
+drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 			       struct drm_plane *plane)
 {
 	return state->planes[drm_plane_index(plane)].new_state;
@@ -635,7 +635,7 @@ drm_atomic_get_new_plane_state(struct drm_atomic_state *state,
  * @drm_atomic_get_new_connector_state should be used instead.
  */
 static inline struct drm_connector_state *
-drm_atomic_get_existing_connector_state(struct drm_atomic_state *state,
+drm_atomic_get_existing_connector_state(const struct drm_atomic_state *state,
 					struct drm_connector *connector)
 {
 	int index = drm_connector_index(connector);
@@ -655,7 +655,7 @@ drm_atomic_get_existing_connector_state(struct drm_atomic_state *state,
  * or NULL if the connector is not part of the global atomic state.
  */
 static inline struct drm_connector_state *
-drm_atomic_get_old_connector_state(struct drm_atomic_state *state,
+drm_atomic_get_old_connector_state(const struct drm_atomic_state *state,
 				   struct drm_connector *connector)
 {
 	int index = drm_connector_index(connector);
@@ -675,7 +675,7 @@ drm_atomic_get_old_connector_state(struct drm_atomic_state *state,
  * or NULL if the connector is not part of the global atomic state.
  */
 static inline struct drm_connector_state *
-drm_atomic_get_new_connector_state(struct drm_atomic_state *state,
+drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
 				   struct drm_connector *connector)
 {
 	int index = drm_connector_index(connector);
@@ -713,7 +713,7 @@ drm_atomic_get_new_connector_state(struct drm_atomic_state *state,
  * Read-only pointer to the current plane state.
  */
 static inline const struct drm_plane_state *
-__drm_atomic_get_current_plane_state(struct drm_atomic_state *state,
+__drm_atomic_get_current_plane_state(const struct drm_atomic_state *state,
 				     struct drm_plane *plane)
 {
 	if (state->planes[drm_plane_index(plane)].state)
@@ -1134,10 +1134,10 @@ struct drm_bridge_state *
 drm_atomic_get_bridge_state(struct drm_atomic_state *state,
 			    struct drm_bridge *bridge);
 struct drm_bridge_state *
-drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
+drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
 struct drm_bridge_state *
-drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
+drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.38.1-b4-0.11.0-dev-d416f
