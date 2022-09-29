Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303C5EFA94
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD110EAD4;
	Thu, 29 Sep 2022 16:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0310EAC3;
 Thu, 29 Sep 2022 16:31:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3CF36580800;
 Thu, 29 Sep 2022 12:31:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469081; x=
 1664476281; bh=hzWTfTrh+GGKS67lMWxl9cNzRKq+JVkXa71CKRCrLuE=; b=O
 bWdoR/5p6T/eo2KGDNB3Mf4DHA5Ll7wP8zPEZT8sE9dLmirD9BgT57chYaOgn7hy
 CYHSCYCXtYteTD6fAUT1Mr6SwhduEpVH5mGd3rL6XxE0s4BeT/CDUGZJAYeT6grF
 e4HSoVmjYA0piSP/mvPbuTaGG7NVMGVHHbc7V0AIW39SnCa+zenEkcQEKibz+/bu
 4UsCQbOR7RmN7uQG+bujC2lXIL6pcq3D5Be2McsOF22jj0IzAQiMOvxLarS3StgL
 cAokGlw67cf8olxpzo+BNioK5k28EcbeY0Y61S1xMGGPD514IyQlAcjRH+2p4CF2
 dKku82rQa9H+93M8OBeMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469081; x=
 1664476281; bh=hzWTfTrh+GGKS67lMWxl9cNzRKq+JVkXa71CKRCrLuE=; b=h
 MajYTGiNX9HwquNZ5ewGkZIyaznNNfDiXwTNsyy1OpWDDMzIlbWmOIarkgfwF7O8
 PVsJESGGBCSf8X62edjKN3Ih5U207Ku3moaKNBveQGif+M3JHShuWt6i0P4kL1xF
 0XOFkfoKQKgDlzV7UECi+vUgIR3QYZfXCkx+rmiZTqzX29ma3AtA+gfqlsHRWtqL
 J1enmDULcbKFUMq+3Q1ZfGef4wwsjzTmqgiu5DgyxAwZdKd/Xr7VnT8nkthDQGZh
 TEmg1L6w4B5AeJ4ZHdLSk9EQcfzUnv69xGhx8RVfKPMbHhak27R7Jyc7+EkcIkvs
 JZ1J2+Hgz7H0eNnooR8Zw==
X-ME-Sender: <xms:WMg1Y7ziLUa9Yk3CGNoOBraml6BFZvaJnoPBZOKLXrAuTcyfypqE8Q>
 <xme:WMg1YzSOhHCFAmKC-gNZl63Ye2lIadfcJMys_KnAC0rffeic1rzYTa3AEj4cO6IkO
 eJLGzu8E0E8HfIfD9g>
X-ME-Received: <xmr:WMg1Y1Wcgyd3VrTH4pHp3Ki0QKFKB_NVIP5BbphpfKTUUIq4qs2h8efMoInG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WMg1Y1havSqZJnNKNyT34yLywzmbv8EUEyLX-J-Xb9NuGp8s4DPncA>
 <xmx:WMg1Y9BLLidLyugIRUkpcYlRxtEHCGo10EYVu_8pk48yqB6bZhxm5w>
 <xmx:WMg1Y-LDeQuy8O8wWBSXdxw-wLj040qRoR9HYg6Norr8VRW-HTAaUQ>
 <xmx:Wcg1Y-vNeZAwMsyrGU418N6ISexGtkJ_5ejL3o-0XhAduCOquXY4mw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:59 +0200
Subject: [PATCH v4 05/30] drm/connector: Rename subconnector state variable
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-5-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=YG61J82B1ciNFhc+9pD3wkIVvjz06eRoxytMiv8eoao=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wCsvYcE1L0+JNz0zHMXXxH3qw7y9eU//0V2pt4WW/W
 o4aIjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwk8RHDf8/u/EqBHXEBfxielZTFT+
 JQYmn5vqfBm+1oz7p3Yst+WDIy3Dmas1Zh9424iZzzpgXEGU9/o7ewUrvjjEhz8/rswsA4XgA=
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

There is two TV subconnector related properties registered by
drm_mode_create_tv_properties(): subconnector and select subconnector.

While the select subconnector property is stored in the kernel by the
drm_tv_connector_state structure, the subconnector property isn't stored
anywhere.

Worse, the select subconnector property is stored in a field called
subconnector, creating some ambiguity about which property content we're
accessing.

Let's rename that field to one called select_subconnector to make it move
obvious what it's about.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Added the documentation name update
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
 include/drm/drm_connector.h       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..c74c78a28171 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -687,7 +687,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		 */
 		return -EINVAL;
 	} else if (property == config->tv_select_subconnector_property) {
-		state->tv.subconnector = val;
+		state->tv.select_subconnector = val;
 	} else if (property == config->tv_left_margin_property) {
 		state->tv.margins.left = val;
 	} else if (property == config->tv_right_margin_property) {
@@ -795,7 +795,7 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		else
 			*val = connector->dpms;
 	} else if (property == config->tv_select_subconnector_property) {
-		*val = state->tv.subconnector;
+		*val = state->tv.select_subconnector;
 	} else if (property == config->tv_left_margin_property) {
 		*val = state->tv.margins.left;
 	} else if (property == config->tv_right_margin_property) {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 248206bbd975..60b5662dec7c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -692,7 +692,7 @@ struct drm_connector_tv_margins {
 
 /**
  * struct drm_tv_connector_state - TV connector related states
- * @subconnector: selected subconnector
+ * @select_subconnector: selected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent
@@ -703,7 +703,7 @@ struct drm_connector_tv_margins {
  * @hue: hue in percent
  */
 struct drm_tv_connector_state {
-	enum drm_mode_subconnector subconnector;
+	enum drm_mode_subconnector select_subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.11.0-dev-7da52
