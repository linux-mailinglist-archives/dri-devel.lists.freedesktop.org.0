Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D750D353
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8856F10FD1E;
	Sun, 24 Apr 2022 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1B310FC55
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D56C5C006B;
 Sun, 24 Apr 2022 12:26:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 24 Apr 2022 12:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817612; x=1650904012; bh=g8
 9iiFras6Fywfob3dR/6hth32NBYwFj8sDvkhiHsjA=; b=RGjja/ali5jtreS3KA
 pWDXSOeLUHxxsXebUNIxWfhSgm6/P+l2WvTJjYlJSht+0+V1fAFRn1FHlM6rFagj
 1t5NRSh/OHVCG/Sq1b1g7KNtgWSIwGa8o9DHtzYHNKll7qkZbW99T3YEQ5hzCVMt
 jahA34fZ+4dqOOQJjjjgiZWaFBO66DIwoPtnEDHKL4FAsadpSID+c/numkaxi6no
 rTga8LIT6dqcZeTgmhCjZ/J1D0mFcmAN/pnJJu3MJiHwn9/GfiMpdm39tuQb3vms
 n9wZJ17S4Ycl1YzfhRNA0rF09rH26gzpfFeNXLllq6WouJSnFqwsaaIaKMQhLdc6
 lssw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817612; x=1650904012; bh=g89iiFras6Fywfob3dR/6hth32NBYwFj8sD
 vkhiHsjA=; b=QdVvXijDkgZgFVCX30CUPBUFQyEROnl0GnMqR5YbijQublorVuR
 72zOmwqlIXfHp4Nx1cRMDnIu92UMWQB1lT4SGaKhNQMu/T/qu1qds3ukRxRPWfKt
 RUDM90iVup/8hzJv1j6cYKExHQSnqs0AgL4yiJr7gZYbmvUSGhrRAJ+qxCo9Vffp
 WJaaaumL6kS1bTDwhR7y2ZgyY5TQ8+FEKZ6stzxGThMLXsJQyO8UzHyllwyoSr0m
 hwhWUM/Ryx7pGhCUzQd8x5vgDxCyqgkOY1KtAa2hyJM3k0i8vn8+MxTjhuvR0qRy
 lBRA3I+obRICKhgY7dowc3J2Qq3W3A8EPfw==
X-ME-Sender: <xms:THplYn-_Z9uPuAb1CxAq0LWOFrka_OOqHvHC34lJ2TmuUVd67MDKAg>
 <xme:THplYju_QpTY3anjd8QMigIx4Rn6dgdiEzF7u003ApaRkykZUbtTPw7zEBEro2koF
 H2NatADbAjIZxmlEg>
X-ME-Received: <xmr:THplYlDG_oPC3o1-wWoGx1mHjKSml49p9bscw0TzD1qW2Mb7_5DMS6N5_lqwWQtptHfbf6t0Ow79LqiEBn0Lq-iSOHaSO2Fdbpz94u1qbLd0EaWSTgdQ-mvG8TuXpiAnmn8f-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:THplYje8SZCqxCjObQqQq4tIl67hvdN6AXtixZleaROkQpwIx11B7A>
 <xmx:THplYsNRdh-94JPp_3q3sTytzATtQQ6CB1BiFKe-v9P2S3VPZFjBmg>
 <xmx:THplYlmegK2IPvtBjQN61gxOOyadiMROZGCU6PyW8VZXXoxhavB81g>
 <xmx:THplYln5zm2Mlp3dQP8ZdVgEBMnyMCaOy-ChYOYKwMOOyPRXec32hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 09/14] drm/sun4i: Allow VI layers to be primary planes
Date: Sun, 24 Apr 2022 11:26:27 -0500
Message-Id: <20220424162633.12369-10-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

D1's mixer 1 has no UI layers, only a single VI layer. That means the
mixer can only be used if the primary plane comes from this VI layer.
Add the code to handle this case.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bb7c43036dfa..f7d0b082d634 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -542,6 +542,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					       struct sun8i_mixer *mixer,
 					       int index)
 {
+	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_vi_layer *layer;
@@ -560,12 +561,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
 	}
 
+	if (!mixer->cfg->ui_num && index == 0)
+		type = DRM_PLANE_TYPE_PRIMARY;
+
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
 				       formats, format_count,
 				       sun8i_layer_modifiers,
-				       DRM_PLANE_TYPE_OVERLAY, NULL);
+				       type, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialize layer\n");
 		return ERR_PTR(ret);
-- 
2.35.1

