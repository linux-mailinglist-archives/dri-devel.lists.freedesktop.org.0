Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162705E6531
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A3110EB61;
	Thu, 22 Sep 2022 14:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9810EB58;
 Thu, 22 Sep 2022 14:26:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7C2FB2B05B17;
 Thu, 22 Sep 2022 10:26:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856766; x=
 1663863966; bh=rvMfktgHy5FhCaD+KHa3yzMfq+yFQMkfoAap0/0FluY=; b=O
 FaiSKEhRINEVsGsTUwjEfoFmSO7lPr3iFSHKlUPUf9u/kOQkY/0cJ8U0vxK+W2HU
 E7kSoygrS2qCOCMuUzbC6OB2zHukP+rqQv1VOPOXDGptTFtelDiAXy8PI+tCKbZr
 Q1s8rG+lHqhFTq2QE5BDAAlMPfk81rau9ybmqTKEEezNvY44TiymESXwjB+32H7U
 EUB9h7ietgBVsbtyEDgIoCroZmp9EnusNo18DFvvWDNitLN1Pi9oMZp6jgTBxqY2
 xraHnqiEwOqPZVlBCOfojiBJL+Qn0AbQzXm+FTTxgA1Hsb9w3cVl++GU2CV7lUlP
 fbEF8jVKMMtThD8Zbp/Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856766; x=
 1663863966; bh=rvMfktgHy5FhCaD+KHa3yzMfq+yFQMkfoAap0/0FluY=; b=v
 R3hAs7aZ7pw1v0EfIpiMXRV9SDLJ56RA69Ge19CtZVq5vf3/8MCMVvU+7kNtO2X1
 xhQo0BBjFJtshZ2FcTOlhZl6sj+v6CcD4sHYX1YN9Uq0rhTo6ITSKHBjvLZlfSCe
 DZKnYYeMCT5ZSbsPYngkAov9Q/DmDnCnKViLKCRYmjL2bo+of1zLQJZaZzfwth+G
 hceZgWh8R8dsX8LIETElUDKEDYNrJMuGjwJfYG9DJvM5GCXArABtr3/KAxTXeIRp
 ymgHsIudnaM00BR2D1d/uWL4CST/yr4fyJQSb2r6GSrmiKoAAUwcwVymueTDj10W
 m64Q4RfRQUyOToyiztauw==
X-ME-Sender: <xms:fXAsYzvh4JAwPUF9RduuphmLOHftzKUeGGtjGs2uuRqfjCYunRpaiw>
 <xme:fXAsY0cEdc7wOuwWCK1lIs_YY4qdYqVNmSFtJJiJsseiTBzFAeIJLRYXnFpLZPszG
 tgsiC5Zpqs2FZI_pYU>
X-ME-Received: <xmr:fXAsY2z0foRYC2P2W01Den4d_EDFvdcKDPW0Sbt_d9fNQw2dTI9bPcPCx9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fXAsYyOGGrq8K7qm1MxhukGZ83aOMcdfK6_EFzOrn__3f4JOGKRiHg>
 <xmx:fXAsYz9TVlBdoDH25INtOR3l0hLH2JNYwu4tcztRdK-f7B4b5MBEfg>
 <xmx:fXAsYyWohqTI8exIF1_4KHtde8GDZbekmT05plT1eBbWjmPNcjVlZA>
 <xmx:fnAsY_L_Leswt7AFDjJx8Gu1NotOMIgjtJHSAjBCOxb02ixSw55-LUXyO9k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:22 +0200
Subject: [PATCH v2 05/33] drm/atomic: Add TV subconnector property to
 get/set_property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-5-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qDYM7aQiVENXoG6IHQvxJCBCpTNzU5wd8MrHn657838=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQEJzp2ye1L/+Ekt4lj9prDhf0QHr+D2fdv3dkiG8C1g
 0lDsKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERS8hgZ5j7fV1RYlsfcWP/huorE1c
 Tv+WrnjUS0jGPDfZqjQy4XMvzTvpWzU5SZ97wBX1HPUuXrP850n/uUoKiW97XLaEr6PkEGAA==
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subconnector property was created by drm_mode_create_tv_properties(),
but wasn't exposed to the userspace through the generic
atomic_get/set_property implementation, and wasn't stored in any generic
state structure.

Let's solve this.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
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
index 60b5662dec7c..1d5e3cccb9e3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -693,6 +693,7 @@ struct drm_connector_tv_margins {
 /**
  * struct drm_tv_connector_state - TV connector related states
  * @select_subconnector: selected subconnector
+ * @subconnector: detected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent
@@ -704,6 +705,7 @@ struct drm_connector_tv_margins {
  */
 struct drm_tv_connector_state {
 	enum drm_mode_subconnector select_subconnector;
+	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.10.0
