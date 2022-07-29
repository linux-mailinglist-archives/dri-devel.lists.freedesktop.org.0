Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABA5853AC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F658E6F8;
	Fri, 29 Jul 2022 16:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E458E5FA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:40:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E0C1658091A;
 Fri, 29 Jul 2022 12:35:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112536; x=
 1659119736; bh=Euo0R55Q5eE4uezB3NLXuLB/3k2AluGBavdHuX5AB78=; b=O
 ZtQIJn9Dcw7lzoPMyYuQPImxUHaawiXM4gOSm3BB52LxgmSHjd9EOLiREyLcvAXJ
 OoSChlaGSxt+k7qICpUPUfbMf/fKOSnFl7bCKLz6phsAtOW/0t8nLTeBnMbOMDbp
 +Nl/zkHaUTSMM+Vd+UtvTBsCB2uo9olWBKlJ8hdJYG3Cj4X9RTqkD3BPIfNwUlWx
 7z9sgA3C9ZjQJOWPsjVqI0dUcodCxa9+CQ2Q7nQyCR/YhWb4+53Hp0PfTpo83Fl2
 ziF8/SqfT8YSw4s/Yr94QEbDpNc5oDOZaBKo+I3ADuUkpp/VpvlKyYnLzNSDF4OL
 uhU/c/erfNn9D+B+rTBtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112536; x=
 1659119736; bh=Euo0R55Q5eE4uezB3NLXuLB/3k2AluGBavdHuX5AB78=; b=w
 HLcs/hFtpVmYTgrP2RMYU4e71QabxsECT3duh9IxsTqTQBd3RqkmltazhnqXhWNc
 1+bOnNihmcin2pothzFt2T/9jAhu5wczwcGH6rZRqhrjzcSBnwcWUSs4KGaTLRKG
 5oEZMQ0xMJCjIjz9Uzz6EAWKIo6aeZ4OkokvjmFEuyzoxmEjA3JImQ6j7FbDRBDG
 dcRsB233CAUaT8/g2jlEW4ZgJQhV+UqZ/Gou/G40S2ucauM8DijAA2Dq47jbm8b2
 S9mzZim+CWTH2m0X1X/FztMRHyY1pzaad/61nxEJQQaCeWxEgRn1lerruNy8vSdl
 LZ0k03Ti2u1t4BWutX0Yw==
X-ME-Sender: <xms:WAzkYh-srNCJQ9nBlprlTpkQIsH_D0mrNqIse-JAkDmgQ_Q9NY01Sg>
 <xme:WAzkYls_s9Lzjz64rQuj9aiv9h34ELnMfc_J4N96DcG41BCUPQ5BT2NZ5a6M06hq2
 3aDSKWbeDaI1MUaxH8>
X-ME-Received: <xmr:WAzkYvATggqROnJEAwi_WEUxdqtljVLFE_T092CwgxcksFx-n8fOBm5hHZSqR_M42lwaje1k-jt3AZPJtps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WAzkYleJbx1AFUCHCYGIZdhiLdcc5RxHE2seRjZdL2SNWmpKYNmNpw>
 <xmx:WAzkYmNoWQj4V0NU7Rm36Ez1Kfwx33GDaFHFyuTBRUBI40iJ3IS3Mg>
 <xmx:WAzkYnkABXiDWCA7PeQ8sWeSRU1dguly1VRgSPlFK8LvaXPAgiEzSw>
 <xmx:WAzkYheuMZJ3K_2hwqlN1GTOE7IPWkfzrQ3miwTizQCItWTK4Sx6vA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:34 -0400 (EDT)
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
Subject: [PATCH v1 02/35] drm/connector: Rename subconnector state variable
Date: Fri, 29 Jul 2022 18:34:45 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-2-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2193; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Rj7Ciymqp8SGZkmcJZM8z2NaF1Fg70qcRKx4zs2X0Gk=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHyURXfWtdnVloX+mkO+xSjPGOh/fcf2N7JPGF8bWIp
 X7ZZRykLgzAHg6yYIst1wbd2fGFRbhE8HzbDzGFlAhnCwMUpABPZH8/IsDfBODvE7YaymumTCw+Oyn
 lpPKiT212VJsVx7/cOlUjxuQz/61TOnTpRX1AV7KlVyOUbVtjUttCf4ZK8gLpa5xlJJ5HVAA==
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

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
index f185ad862cb1..f8091edf9a33 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -682,7 +682,7 @@ struct drm_connector_tv_margins {
  * @hue: hue in percent
  */
 struct drm_tv_connector_state {
-	enum drm_mode_subconnector subconnector;
+	enum drm_mode_subconnector select_subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.10.0-dev-49460
