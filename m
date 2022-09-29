Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C865EFA98
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92510EAD5;
	Thu, 29 Sep 2022 16:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850E10EAC3;
 Thu, 29 Sep 2022 16:31:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24E8F580807;
 Thu, 29 Sep 2022 12:31:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Sep 2022 12:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469083; x=
 1664476283; bh=rTOBq8QGMua1UdWDwtRy1+1XF/qwLkxTvj5XyWChYOU=; b=V
 A8dVBoaOGjOmzcekTj8ntJ41Ignd1JLvDBDECPqqQPT4Ud0znz8euixiMfCaLuU0
 fhNllfsg0CzEN7D3CT++pHBgL38mY+kfq84wVN3uTAQ8t4YX7jM7Q2Ot6dsuqGRF
 uldYgtj/UrM6Asm7thsRGqwfmTqfXJUNg2iMEsEzd1pv0cs5YQCPMLQrx8mBul3T
 9PbdOV7VM6uNjjTumslc2Q5wrTZMDMdGJeOGMwJ9QilYP5kp+3Wavl06CP6qUUgU
 qx5uxDNp/sXI4olO91AxKuTu0TzDpbxEZuio8dGO2Bt8P1U0IdGd0yjd0ba3So+S
 WoVciM0G7W2aPN+42q3Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469083; x=
 1664476283; bh=rTOBq8QGMua1UdWDwtRy1+1XF/qwLkxTvj5XyWChYOU=; b=V
 tgRIJDGTfzy4Vn4D+bmgdep7cuPGaPs+wJTsz1cOrm0saJ8XJAciBChsGLx4Kq8g
 dxFKdXfOOPo8sfshPvgldlSK3kYqS96/z04MY9dCk3fFwfc+5nM8NtT2dS7B8OPX
 PRbxDScCVcxBSan4b5gvopTUtLDQgfFBM13L49cbbLYz6vDUGx7xH4wH6FLMcfjM
 6gFSk87dZu1O9ku6BS0scfMNpdOvNYavYIrXvuZxeeKekvUHgeUlb23EXOpyvxFX
 eErKozx9aLxL/HgoszUqMW23sBRbN9w6O+tRmyx6nOqcjeDX/sTzIfL5Spj7JBxa
 uTrSGkwNVKgLGBwyXj3Uw==
X-ME-Sender: <xms:Wsg1Y9sES2oDZFhc0a2YEsR07Qfd5q0c6soqq3CQQxdwY5aKl-ZqzA>
 <xme:Wsg1Y2fvJ1RGzzVIIyCcHyF4mArFfinp9oeuMfk_F2x_CXCQaggvtbhpENbT7ro6D
 TCtLQWWBHai8heBYmU>
X-ME-Received: <xmr:Wsg1YwzRa7K9-ylZDrDwuRE3y8oWv2ZSBfKyA1RTgj5xjpuViBi8QZQj3YPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W8g1Y0M2rDk58GEQAtvHutlSYe8XqT9l8s3SfdDtKXmtfUbh0Y44Fg>
 <xmx:W8g1Y98QG6O4sZFd9M4_c_KlaYOCx1H5YpfVnZZwVAnunVX1goD6EA>
 <xmx:W8g1Y0UlKTRlpawrvHzHlbECXz_ncFrVMnqLA-0QlrT9M9QcU9nqSA>
 <xmx:W8g1Y5LW76B-x5Y6Ac1IofWSn0Kkemi8WZOorlAFQk9Pi5m5AKkebQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:00 +0200
Subject: [PATCH v4 06/30] drm/atomic: Add TV subconnector property to
 get/set_property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-6-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PNmBXeBj29NmRDCOP2DsHEX0rVfAqy911+SVom6dnZI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wcdCXFVYMN2z+tfTSnb9ehcA0f8xcrYywTy6bL/Je/
 1d/aUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkEPmRkOHKAz0NtRghPVaj7w5nLJP
 1Pl4Z5vpp3LdX7Ts5+xTNcigz/C+cwO59bcMV8c/jDuI2rUxYlP+Piij7okLfVTla8VbOUCQA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subconnector property was created by drm_mode_create_tv_properties(),
but wasn't exposed to the userspace through the generic
atomic_get/set_property implementation, and wasn't stored in any generic
state structure.

Let's solve this.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
 include/drm/drm_connector.h       | 2 ++
 2 files changed, 6 insertions(+)

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
b4 0.11.0-dev-7da52
