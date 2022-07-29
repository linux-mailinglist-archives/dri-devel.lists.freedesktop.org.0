Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5E5853DF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6880D10F9A9;
	Fri, 29 Jul 2022 16:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AFB113994
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EA71058094B;
 Fri, 29 Jul 2022 12:36:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112579; x=
 1659119779; bh=we2+5Gor+ytUnMBu5xTu1/9nZ//mY4WLMl0azuUC8IU=; b=t
 bPTTMExsQw9FnJ7cdg0tSKxMS82fZGoc+6CUtoONHdMB/1zWy9k2/vhceC9EhIsO
 Yb34RLL8LfEH4od+r2+GGfc0wivpBWANmIwBor36tVvM1phFj0WBI49eONSf/+LB
 Uz9cVJMs0SRAK8qS05hjwZzPwvv/sJGcOpktEeRLjLULh/wP+cy1nv7qu7Pzdfjv
 aUoMSQ446ns1k6myTDUhzo1MotXt5MJWT3/UNrAAsCB6o1ge/W2wsH+xAkPeIi6l
 xaJdJE4ZUTHyE5ry+/9Doz/TdzThmaXI4zpKnqbSdJJGWJmyBJSvkUqp4XgbYp43
 8J5MnD/JaysgXIrarycVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112579; x=
 1659119779; bh=we2+5Gor+ytUnMBu5xTu1/9nZ//mY4WLMl0azuUC8IU=; b=t
 +vXR9bSbVnww4amDF9/gVST21vjey3iqivWmJjgGd2KKu34U0PL3xnA7IdywGF25
 urgvIdC06v0sz6S6neBHOMXmW5TJnQn1Kc64Pt4QMBBQm7nIZVvNRD5Hx0QKxGk2
 IH0NBCCwrLzF5yyqOxnhE4R1JgEM0ak8MRpDub0CTg+zuwG4DmKvqIxBLR0bsxpZ
 TS/3LlYCCNM46R2LTVHqqmRWmUGvrvSwXa85P4BvcPekKxc99sKclY1m+Kfh5//a
 mZNQU2SxLe7JZdrutqrdVq9A4JK2SgLIrNJLnnUqWVck5HmpBc5Lb9hsk8aHX9bt
 0EXbxB4lvB2lTqDUXRDgQ==
X-ME-Sender: <xms:gwzkYtdmUNQ9HlFAOIdFpEniYQma9GRYco-4afzBNjMAGp-2uqxqkA>
 <xme:gwzkYrMPyyolQPDqqSvtcjy3FtD2s75ph6rcXkxUjczFkX2Whvff0tIX0mxKFbfnP
 BcfmIGVKCALP4XYpjI>
X-ME-Received: <xmr:gwzkYmjZ9FJuPh9BLdTf5p4FxdPtwM75qy_119dG4eIvBvPnMGT8og5AncdUQnrnBpi2jpvH7WaQkm5oJ2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gwzkYm9tVy7St1rxnhy40N4nONHxEpSrEAvKXdeb6wCLgkUU_5qMXg>
 <xmx:gwzkYpsWI6iu6N6XyjPLp6d0KO6P2oy7saaTyFykugoB9gSHy0q8wQ>
 <xmx:gwzkYlF-Ct_WCTG04fn6H7pZ8CnK0ZeEG-sn61DBr-nby9zruyva-A>
 <xmx:gwzkYo-PjIshaMMUhFL1yvzeUrjFTryhV-OQdEsE9LjsYioOjDEOKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:18 -0400 (EDT)
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
Subject: [PATCH v1 15/35] drm/vc4: vec: Remove empty mode_fixup
Date: Fri, 29 Jul 2022 18:34:58 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-15-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9K0X2b4CC7vPlBBRjtYOkzUbCYIm/F5a/oUghA5nq0o=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFifHJgR6+cxa2y8n+HKhRTA37+3+55zXtVaOUeHnG9
 NuuQjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbCzsnw371n5RZx3cTAVd/mXD6aOP
 OWm9q8PTXHnwoujn934l7kgf2MDO+ixT26zVIqy0XSMueF/NKaKrn4VVjkTKNsoUg/kXPnbgMA
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

The mode_fixup hooks are deprecated, and the behaviour we implement is the
default one anyway. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 457529e5d857..17a6afac61cd 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -483,14 +483,6 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	drm_dev_exit(idx);
 }
 
-
-static bool vc4_vec_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
@@ -518,7 +510,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 	.disable = vc4_vec_encoder_disable,
 	.enable = vc4_vec_encoder_enable,
-	.mode_fixup = vc4_vec_encoder_mode_fixup,
 	.atomic_check = vc4_vec_encoder_atomic_check,
 	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
 };

-- 
b4 0.10.0-dev-49460
