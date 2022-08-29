Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400B5A4D59
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F59810F24F;
	Mon, 29 Aug 2022 13:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D871910F234
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:14:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B22912B0606D;
 Mon, 29 Aug 2022 09:14:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778874; x=
 1661786074; bh=O2K8vY3bz7CqbtV7SDqiw++49YhOhYlXnJRYT6GaHo0=; b=G
 mx2HOjqpy8Vuvh7ofDmXwVGjdnqoscgUXD45ef0jj/VIxTBVoLcBrYJQs8sYRiqR
 Dij9Fq0CPWGv02esfBUo/xKVSg/Fo7C2x3FlueiZz7fLApbwaeIKaOM0fdg9ke0W
 DBXrqN68/DR7zgEZdlvOH4mqOiO0beAxYVgaEdg49TGwj3wzAMnBWlOwInQ+GBN6
 eH3njcImHLuDrVVQHLNPiYowCAxj8+wf99sFfnRmPP1e6xXYKphDVf/H0mkQDdsX
 Ox13UDxzdwWzileclBwOVNjIbxg6xrz1Zt1vpV1kVzAzoOxoMwdIBlQ0jKeadwNb
 mqlg437OYD4VLtsWNm0/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778874; x=
 1661786074; bh=O2K8vY3bz7CqbtV7SDqiw++49YhOhYlXnJRYT6GaHo0=; b=K
 0hspOg0VCsB6jyOqPWfY4/sDjtqkAc0SYamNpCVVcVpTPSf9aLgwmKhvlwddAdhU
 Fcl3UIJijcevRdfTS6wlnaFFsa7dBe9DCaR626pTcZUM4c3nu8UMBSQffXzDDo6r
 nok/uuCfq+LUGqYK6ewj3PPuftAqO1UlwEV914t1B2aVCHfbOUUBPWF9J/wjSn9n
 jvX9xq7g3fpZw4zx2+1Rvu3XkhjKbXTKAnOSRcJPw1/1WdA5gitVV6z9P2+2Kh2X
 z53AGiXB49TRNB8zs3lby1yb8fluGTn2Rw8PZGL6YdVlAWG6Hk37cycmFliP5es/
 FoOlNdNLdqGzfuJxcrybQ==
X-ME-Sender: <xms:ubsMY3-87EQumtTshQqj-HyFShbwgODSF9jC83KH55vlRwDYT37Xkg>
 <xme:ubsMYzt4MDk2R_lNCRXuOCZzJwo5nk_5GoQS6ZD8umAK9tdHwkln5FtcxX3XYZkGX
 xtMB8uBdBKGz18qKro>
X-ME-Received: <xmr:ubsMY1CLbN3V18WThM7neX4gowWExfnHt1t7YZS6EyJOWpDYVZwX6ACxwL0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ursMYzedBN8T2O4CQkeke4ZjfzJSXCRM1o81eM361nRqPaN11hROqg>
 <xmx:ursMY8MeLveIjkJu-sTMa4b97-TXyXYcgr_AQ9Bi9lUF6QOXVO19cQ>
 <xmx:ursMY1nn8KSwg2CjArVw_FaPwYLXsoj1xI18WnURYANW4kJYYgllzg>
 <xmx:ursMYw1vxVIhQ0tAQTW7AHXH9LtTHFNtypE0B2SvZFdUbMp5Gau_Sy7ZzrI>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:14:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 23/41] drm/atomic-helper: Add an analog TV atomic_check
 implementation
Date: Mon, 29 Aug 2022 15:11:37 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-23-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tMMQ9LmYriVsBj4/ucBagVoAOsUAypD775BhY4mJj98=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxSEEpcYRiVtnm5f0vzng0aRVHzokRLm5M9q+ydZcLkv
 t6zvKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQ0tjD804uellbiNPGm/pk/Ua662V
 WPORQ/TUjzm+Ske/nLFOVzBxj+yr66VvabxS7y8fzzXlP2/43Wf+RRuDV0oay9+4SlaW8m8QEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The analog TV connector drivers share some atomic_check logic, and the new=
=0D
TV standard property have created a bunch of new constraints that needs to=
=0D
be shared across drivers too.=0D
=0D
Let's create an atomic_check helper for those use cases.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/dr=
m_atomic_state_helper.c=0D
index 0373c3dc824b..d64733c6aae3 100644=0D
--- a/drivers/gpu/drm/drm_atomic_state_helper.c=0D
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c=0D
@@ -556,6 +556,42 @@ void drm_atomic_helper_connector_tv_reset(struct drm_c=
onnector *connector)=0D
 }=0D
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);=0D
 =0D
+/**=0D
+ * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector =
state=0D
+ * @connector: DRM Connector=0D
+ * @state: the DRM State object=0D
+ *=0D
+ * Checks the state object to see if the requested state is valid for an=0D
+ * analog TV connector.=0D
+ *=0D
+ * Returns:=0D
+ * Zero for success, a negative error code on error.=0D
+ */=0D
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,=
=0D
+					 struct drm_atomic_state *state)=0D
+{=0D
+	struct drm_connector_state *old_conn_state =3D=0D
+		drm_atomic_get_old_connector_state(state, connector);=0D
+	struct drm_connector_state *new_conn_state =3D=0D
+		drm_atomic_get_new_connector_state(state, connector);=0D
+	struct drm_crtc_state *crtc_state;=0D
+	struct drm_crtc *crtc;=0D
+=0D
+	crtc =3D new_conn_state->crtc;=0D
+	if (!crtc)=0D
+		return 0;=0D
+=0D
+	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);=0D
+	if (!crtc_state)=0D
+		return -EINVAL;=0D
+=0D
+	if (old_conn_state->tv.mode !=3D new_conn_state->tv.mode)=0D
+		crtc_state->mode_changed =3D true;=0D
+=0D
+	return 0;=0D
+}=0D
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);=0D
+=0D
 /**=0D
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector s=
tate=0D
  * @connector: connector object=0D
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic=
_state_helper.h=0D
index c8fbce795ee7..b9740edb2658 100644=0D
--- a/include/drm/drm_atomic_state_helper.h=0D
+++ b/include/drm/drm_atomic_state_helper.h=0D
@@ -26,6 +26,7 @@=0D
 =0D
 #include <linux/types.h>=0D
 =0D
+struct drm_atomic_state;=0D
 struct drm_bridge;=0D
 struct drm_bridge_state;=0D
 struct drm_crtc;=0D
@@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_conne=
ctor *connector,=0D
 					 struct drm_connector_state *conn_state);=0D
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);=0D
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)=
;=0D
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,=
=0D
+					 struct drm_atomic_state *state);=0D
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *co=
nnector);=0D
 void=0D
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connec=
tor,=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
