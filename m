Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991CE5853F8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFFF11A11A;
	Fri, 29 Jul 2022 16:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B91111A11A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A5FB658091F;
 Fri, 29 Jul 2022 12:35:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112540; x=
 1659119740; bh=j2oN+GXdkaZKd3o9mBAYJ/85uienfqE6K5CTaBOuI8I=; b=Y
 uDdcpoN+NNm9rJzGhUlQ9htEo/iUG/MUqPD+9iq3d8rV6jbvyokS/bUVuZzy+JUu
 aKpJzgSVu6NkxHWg02eiP6cl+zOi4FCzY4XdRlUeeK2qKadxH8qJvfY6YhSxhzhB
 VkwbCSHWHDwMIuNKXjwcEsKS6uapvqFbyfpXqgWNT8tSvoFmKxDFJqf+annp9H/E
 tTbdVQTJAKobakJw2XfhcEiCuTc0OYUeOHU8aZQeWyzJ6nPRYzObYrkwpNhUMcs1
 Ne+cj3JAo72TkN+fTBIaC+64XRzdxJfiUiILg/+S9mFzAb5zRDziHHpv60Lypvi/
 Hvcfz7a8Q9J73bOVvdyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112540; x=
 1659119740; bh=j2oN+GXdkaZKd3o9mBAYJ/85uienfqE6K5CTaBOuI8I=; b=f
 98hODY+HQOdrhBVwOYfVPf24oCS0yGNRjoXi7m0lW/nYX3tR7aPTcZ4KrTaQRgg+
 7eX36GCEJTedVkzXNfu93SrCeOqmezMQkxQYGbBw6HMCceg46MPb2KrHDuSV3ef6
 fnPayt3TQha4+x2LCgMqI9fVnfz7yz8a3tWCGA2486pmEiJkrZ03t6on7UFPLvwE
 EAjz6OKu4VX7Plpi81ShrDGwgpcDFUi5lyxgTPS0qRqFx2QTHO6NtGVH3oSCXOmN
 eQZ4ETCmq7wJrsfssSPfHb3zPmQAnDtJUveF5bzdndsGS6xZ2vZ3LpIEuLOF5pwb
 WWcE1CFZLHJ/3MMn2iDTA==
X-ME-Sender: <xms:XAzkYpxSx2gV9p6OGGIerrm6z0x6joeTrAhelYRYW9u4JG-bG_fpxQ>
 <xme:XAzkYpRw3Gh7r70iJDKgtizmuubcJY5e7c7YTXcjNvfYZrKQuqNHMg4wuvXBsN6ge
 0Lot8o2rVCZEUQ0aLU>
X-ME-Received: <xmr:XAzkYjU_0cpjqhzXmX3i9vxcTxd2qIyq3khlL-dIp5ZYwqHRDhXg9GstzYd12pCkDFpmrNOatwkD360riQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XAzkYrjzoNkI__YNddJVxqWo3k-IMyh9133Dhc6b2oMalThJNvcwPg>
 <xmx:XAzkYrDZYr77YgOG66NepjYQuhC02vDHCvK0KHzM7wkZgbzgu_nG4w>
 <xmx:XAzkYkJs0a5gsNCSC2qZo6CcVnjeImpMsfuEWxpf7YekPmvoCGC4CA>
 <xmx:XAzkYtzfWCoG1npa1YeNyeRirqhaphEL2V68214G2dmQNXoyQrTQdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
Date: Fri, 29 Jul 2022 18:34:46 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=506g4JCkQGu737Vb71VZVRDOM3FvouVx6ntNTaK1n9A=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VEqVtjOy2b+/MCVffevbd5Z+PDswS/Seqe6+77YzX8s
 5mv5paOUhUGYg0FWTJHluuBbO76wKLcIng+bYeawMoEMYeDiFICJvNzH8E9/hWF7eAGLsNc3+Q0tmt
 2/7KWdzD2WVKU8NSxtC3185hcjw/Qpx5/6tf04Ky/2mP8Kn+/71w9P6Lnujnj+ZEfO9OtJd7wA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subconnector property was created by drm_mode_create_tv_properties(),
but wasn't exposed to the userspace through the generic
atomic_get/set_property implementation, and wasn't stored in any generic
state structure.

Let's solve this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c74c78a28171..c06d0639d552 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -688,6 +688,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		return -EINVAL;
 	} else if (property == config->tv_select_subconnector_property) {
 		state->tv.select_subconnector = val;
+	} else if (property == config->tv_subconnector_property) {
+		state->tv.subconnector = val;
 	} else if (property == config->tv_left_margin_property) {
 		state->tv.margins.left = val;
 	} else if (property == config->tv_right_margin_property) {
@@ -796,6 +798,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 			*val = connector->dpms;
 	} else if (property == config->tv_select_subconnector_property) {
 		*val = state->tv.select_subconnector;
+	} else if (property == config->tv_subconnector_property) {
+		*val = state->tv.subconnector;
 	} else if (property == config->tv_left_margin_property) {
 		*val = state->tv.margins.left;
 	} else if (property == config->tv_right_margin_property) {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f8091edf9a33..1e9996b33cc8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -672,6 +672,7 @@ struct drm_connector_tv_margins {
 /**
  * struct drm_tv_connector_state - TV connector related states
  * @select_subconnector: selected subconnector
+ * @subconnector: detected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent
@@ -683,6 +684,7 @@ struct drm_connector_tv_margins {
  */
 struct drm_tv_connector_state {
 	enum drm_mode_subconnector select_subconnector;
+	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.10.0-dev-49460
