Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A482B3B07
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9860C89D8E;
	Mon, 16 Nov 2020 01:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3AC6E532
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A404A580337;
 Fri, 13 Nov 2020 10:32:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yRH3HGKMxPkCB
 hafEQ18e2pDZzkLwu+GD/KNu//gUW4=; b=WcIe1mM0nCnIDgZNeflQAlK+eRMz5
 /5W9LTtimER3uUaP1SKqrOP2oTsCohsWxgbVVXgW5ZE8xbXYWkhQtQqV3I1rECF+
 IC+rxUizxBomjxz5o0qEZWI2ltGo0PPhELQ9rMaTsoMu41hPEUrPEQ0ikbOLR8rq
 V8HMBqa1lr6S9HKFv51LYeaIsI19K3qUo8nSxd+ZC7pa2Xz2FE+NmZ0U01fGWWm6
 Wwgm7SVcOsY58A1dwsGHqkfHghHUzPRvCaS4S/WNGRu4rT/0kV32n5zJ1H4kR/BK
 8+SF4AHy3EaVE+0UZNOiLQXTjfMDq4uYDedfwdLdhTljhRXCHQ32sf2Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yRH3HGKMxPkCBhafEQ18e2pDZzkLwu+GD/KNu//gUW4=; b=NA0zWuTf
 z9whVxz+KxSUTqIguzPh1U20BPbRoZCLPNQ8iLMEmBNdftfgeFXf3druYRDmoASX
 N6cnE3Xm9vb6DGq6YjhCbcfgN2IiK9afp9lxntd1DnLnOMpwlNQgquzQiTCbtTwO
 8Sc01ZSseVECTMbchLLScBsq35Mp+FhdmSa3i8bIx72CaE/DD8bPPZ24Y/eGB2R6
 xhaSdO6BLd8owZuS7lbrDBOqHnb2a0SFq8lBZ8hbtiCfy/3GgG4+0WHSkJ/8fOLR
 QiZZpnN7ggehmyHhHEWA9kFbxrYCpwiZaaTM3aNdNIwT29u2Wl/xJilPkIE5LaaQ
 wjCHGf2vt5qIYg==
X-ME-Sender: <xms:BKeuXy3nc9E3Xln8AxSx5kh59Nvrp1_KSClaCDrXeqW_jblVDjdrFw>
 <xme:BKeuX1H4fbvcz_47bnMyC11M_rwZkbhpw7nzicbrfnE4OQ8eVhPS9DW9l24EdDf9z
 2ZzyKL_iF_RBDot-wk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BKeuX67YxyEe9eN_MPmTehdYp2LkY_cYk9T__z14RDpYVzjGQzd5qw>
 <xmx:BKeuXz0CD9h-40goIM2EQ9AwYLCPgNWczucc-k1cJOXj02TRTAKuaw>
 <xmx:BKeuX1GG5qzP74e1ttVaF7aU9bp5eoqYJScjRlJVrjmFYWyrSVX9-Q>
 <xmx:BKeuXyehb6uIz8NoSaY8DqTH6pemvV2XE5sPZbmRg8NiAbmoBnp7RQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F9283064AB0;
 Fri, 13 Nov 2020 10:32:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/8] drm/vc4: kms: Move HVS state helpers around
Date: Fri, 13 Nov 2020 16:29:51 +0100
Message-Id: <20201113152956.139663-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113152956.139663-1-maxime@cerno.tech>
References: <20201113152956.139663-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to use those helpers in functions higher in that file, let's
move it around.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 7ef164afa9e2..d6712924681e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -182,6 +182,19 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
 }
 
+static struct vc4_hvs_state *
+vc4_hvs_get_global_state(struct drm_atomic_state *state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(state, &vc4->hvs_channels);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_vc4_hvs_state(priv_state);
+}
+
 static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 				     struct drm_atomic_state *state)
 {
@@ -730,19 +743,6 @@ static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 
-static struct vc4_hvs_state *
-vc4_hvs_get_global_state(struct drm_atomic_state *state)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
-	struct drm_private_state *priv_state;
-
-	priv_state = drm_atomic_get_private_obj_state(state, &vc4->hvs_channels);
-	if (IS_ERR(priv_state))
-		return ERR_CAST(priv_state);
-
-	return to_vc4_hvs_state(priv_state);
-}
-
 /*
  * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
  * the TXP (and therefore all the CRTCs found on that platform).
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
