Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC24BD8CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E981B10E5BB;
	Mon, 21 Feb 2022 09:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3301A10E59E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F94658025F;
 Mon, 21 Feb 2022 04:59:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 21 Feb 2022 04:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=SBKxndqRJqKTGvR4OSR8aSqZ+CMFFL
 Md5Wo8SczSeY0=; b=U8DTRtD3oTrkbtNcH2d7Uus7uiq3VRFP+rZ1I/Cjo9/xDW
 NNVc0iT5az6Us1qjD9S4tQLzz5248KEyehA70OwSTXyennyBjXwK0bn1AQHQ1U0w
 m31a3Ii0iwAyuKgoQX6d2/WHsdLfj2OI5KsilA1abC8SUdjCJxu89Wu38o9H9YWV
 FmWvg75598w09E5n9kSZkwzX/jqbA4gCuTB+TGBLv5FPt6JCF+3pYFC1YjWtqRfz
 OMGLuzKRH+iFDK+xYS2cjAcDI2EBaA6yUMs1h0PwyPzDcVNDt2asJcf5qITG8SRe
 5+RL1EU1Uhlymo/S+iVRwDiNkwKVhL+rA0l1+FNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SBKxnd
 qRJqKTGvR4OSR8aSqZ+CMFFLMd5Wo8SczSeY0=; b=BjitJw1W4NWeRT6fQXc3aj
 /YILW97eHipeUKO2Qz5qbxwI+ekmL69kv8AugrLf7BB8TM1fzNyqLU0iuxfW4bTx
 0c3SuUXTnypNcYY3Pn4CjmjAqztO3xIhKXeLJfom8sYtQXCBVsbcyO1HQJrBwBCK
 PgrmFE790755IAR7ummwU9Paqf4GNQuAlHE3fG6qJ9yAkSb98u7peF1JUeb1K0Hg
 qB/1e4x2n0Hk7ik/KkW8jEAUIukeDKSbImMl1gwmrV7kPndBtpyN4yxU9pDhj0G3
 eheVhZa/tLQyicAodHR4/A/jcZfL7XKywW0gryd6Obd4mQnG30h6YPA+QwHGm3pQ
 ==
X-ME-Sender: <xms:kGITYm_wlzsytVmGHAtA0R6UHxTeYVXhyHPCVRLlRboyVpgmgacTWA>
 <xme:kGITYms1_xEH9_VrkSvrl7eurBeEhZhIxZavJuTMkP0sbI5LNtsIq2kgtYPBhs5IG
 AzByfnPtIzhxNC4i-s>
X-ME-Received: <xmr:kGITYsA4rPMsGUqXIHlR13RoZPqJYgGWReX35feizWZ1FS9ETiegOdG6UvBf-6O8nv-NfXO8BYiryH2l1gUKqH-iVty6qzePyIvtxZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kGITYucVNJFjL_G5PW_fsEszhp0kKJa7129jNpXP8WWSHSSKIR1dHQ>
 <xmx:kGITYrOhEl5o04cTmbSZuaXRO8zJvbFbkOkQZfcT2x8b_Xlfi8Nd7Q>
 <xmx:kGITYolHIJeO5AbMZuVNQEfTHutEILejRdvZKdC_NTRl3hF7GsaLwg>
 <xmx:kWITYoccPyLGgGGPlEC_NM9YMAzMyppgUQ-xMWtBq4xhu9w1Giw6xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/22] drm/exynos: plane: Remove redundant zpos
 initialisation
Date: Mon, 21 Feb 2022 10:59:06 +0100
Message-Id: <20220221095918.18763-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
Cc: linux-samsung-soc@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Joonyoung Shim <jy0922.shim@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The exynos KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in exynos_drm_plane_reset(). However, the helpers have
been adjusted to set it properly at reset, so this is not needed
anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index df76bdee7dca..3615cf329e32 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -122,7 +122,6 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 
 static void exynos_drm_plane_reset(struct drm_plane *plane)
 {
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state;
 
 	if (plane->state) {
@@ -133,10 +132,8 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 	}
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
-	if (exynos_state) {
+	if (exynos_state)
 		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
-		plane->state->zpos = exynos_plane->config->zpos;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.35.1

