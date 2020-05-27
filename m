Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C621E5968
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085D96E44C;
	Thu, 28 May 2020 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4E66E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A3C39582078;
 Wed, 27 May 2020 11:50:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lkqM2xbnr6859
 I47DszBEIGnHB6r75iZBgHsyq+PyPY=; b=rDhN1+Pn5L6vCIlmXcelnWvZM6Cz5
 VxtVhu9RxVX+0c6Z814e0eVAxTcR7qDzpARO6OOl89GgtHSqYpBF2oyft41WVowI
 AuKpwLa+KKFa+FbbuMmifpv1S6jW78SBOMaagmQ59oS8fAC6KyvJdlH4JkNgYP9K
 3g6dwKhTf8e0Afiz67NZvD68sw1uQfK6IJsLgra5zBhJ95776rkkOfpkWFjyMpjl
 /qvYc0ZuUW+tXLGAyL7ZBoGZwTH/C5umbFF/E5/Ms6hmwB4CB6qhC0a2t3WHcPrT
 na98ma11NTKvmfURYCucOrPbugUKCp/4xt6FTqJ1QtUi1bZQytVhEmV7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lkqM2xbnr6859I47DszBEIGnHB6r75iZBgHsyq+PyPY=; b=cHWsanhs
 7z2xdCjher/Bu9/eoNfhCB3AQZbBrYhHHadU0CoalxJ4OlYE3SBFqPJK0v8zLaak
 BfQguebsr94K1YH0YrwZd4Xxv3I113FrOv0PPZWpqRjfQyvscgWwtyZc4h0689u7
 +kKCRdiK3oicPs4FZo4su4qynqRmaG6Hxr7Vvoll0KNSQfgyF3ZS4oOzqiiUmGDx
 RR8isACpdjrA+ENpU8y3MekDryoIxYCHm5iURce1cRjQMqzdpzpvdFnQoMa8ueak
 ipYRWpjeqd633/2hOurdQ3yt7+GDRS8pEZyFv+icN1GbgoDUNNFfVIP4ceTvo4WM
 WXRuC+RXulnAQA==
X-ME-Sender: <xms:O4zOXjDh38YPoDqkCRqbVuoNNDlxkEQQKtOEASUq3oIKOnkJ9LuTCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvddune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O4zOXpgd2lGbcNGXQAAQaV9xXvHvFhFShi4JrKLgpDbxlHVIZEUmbg>
 <xmx:O4zOXumB9d_eKr9L1KTZSLDayGLmzODEE-ywvvilECKHk2QeFJfQLA>
 <xmx:O4zOXlwS7wOpdYwG_aT_ZED5CkO0-J1x5AKTty-m4WymTH_U-PGDnQ>
 <xmx:O4zOXtQ95tfkBUy0Tt-bg0kVqUqxJdETJ-OlfgiQqwzVn4wloIGM8Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58A2D3061856;
 Wed, 27 May 2020 11:50:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 039/105] drm/vc4: crtc: Disable color management for HVS5
Date: Wed, 27 May 2020 17:48:09 +0200
Message-Id: <ad082cbf1cfbdcb9cb7aa6881d17a94b8548d810.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS5 uses different color matrices. Disable color management support
for now.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8a3fe4d39847..9ec345254808 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -441,7 +441,7 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
 		  SCALER_DISPBKGND_AUTOHS |
-		  SCALER_DISPBKGND_GAMMA |
+		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
@@ -1157,6 +1157,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	const struct vc4_crtc_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
@@ -1198,12 +1199,16 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  &vc4_crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
-	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
-	/* We support CTM, but only for one CRTC at a time. It's therefore
-	 * implemented as private driver state in vc4_kms, not here.
-	 */
-	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	if (!vc4->hvs->hvs5) {
+		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
+
+		/* We support CTM, but only for one CRTC at a
+		 * time. It's therefore implemented as private driver
+		 * state in vc4_kms, not here.
+		 */
+		drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	}
 
 	CRTC_WRITE(PV_INTEN, 0);
 	CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
