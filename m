Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC026363AF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6B10E58F;
	Wed, 23 Nov 2022 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB4C10E58F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9ABDC2B069B3;
 Wed, 23 Nov 2022 10:30:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217411; x=
 1669224611; bh=5YkrVptWy9IssY/wTkiiT1imLx4QI2BNorKiVetGYvk=; b=V
 Dmm0FPjj7fewl8cTv7J2UKWMPukSakBKFz9/Plhnha7AxKQcxyJIcm86gKUsnIDv
 G+6bmN9bFT1/kdCy02nGxeFhfO+HMrMJFeVTyIIzcHvBHYeOHeWwh6XylCdQ/OZy
 MFcnCLji/M7VdI3sy661uw8E3ucZ8VMq1goyXFzVSfb0QyfFeMl32nn7CFd634sz
 CcgyKpL+8s/QWN9QnyECcfJBSTsWKphwZbDw13+MuL1rSF1Wxbn4GVQiTBIqPVfU
 G6Wwm4FYtR9hu1ZCiE9A3Y4JLpE897wZPeiOeHCgXasNVGY/Xzhke9K+LP8+UBir
 JYpi+tTb5bOawPxYINEhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217411; x=
 1669224611; bh=5YkrVptWy9IssY/wTkiiT1imLx4QI2BNorKiVetGYvk=; b=k
 yex4woj1TDsrUia/OG/biaXgOOBh9G5tkE/6M5E8W8Vovjjtqj1CyGhC/w9u5bdi
 ugKmEp/b7WBMxV6Nx6YhJw5QFsBDPHjUedtpzVTojoQs53dOpKPFzx1zY6egYNL6
 p3CwSvtS/qXFkqq69OcMj13WXGDVq9Swppa14e2PbUc4CzTWW1BeYYpSEJMkmXVk
 Kjc/rHpiMFj1cIYhMiF5HEA20Y4Yjgxv4XwYjCcBwCoOJIaviKjS64A7ZTqR4PxP
 x6ewasp6zKksdzof66VvlUBQcUw8nejavnLqwBjnx26wupSlQDoGrfW9t7cQKKHQ
 LY0pY/GbEKujzg9gZLg2A==
X-ME-Sender: <xms:gzx-Y-FV-hTZopf8HSxu-WancssHgROXZbEFxzn8Mh07ujkmgU2C9A>
 <xme:gzx-Y_XSIGn0JiarFuO8J16GhYDuss4TjceXy1BO-031DnM9p16GZHlz9C58lrfOA
 _2T4UGIUEwxeEakszk>
X-ME-Received: <xmr:gzx-Y4JIvie53rWNJqxAMknYHeoBp3xPkgvT6jwpp1ZbMhOeBxOsiwK7Uy09fgkP88Pf_1jXQC9EtbYaSf5BRN3lORU0g6abFH45IrBjiz6XkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gzx-Y4EX5bk5XOx609a1LnGarUWEVPPhC0ywGgzbFsNnvKjEEe96_w>
 <xmx:gzx-Y0Ws2L6WCcBgX46gsV8Ov64LZmRDshToRBCLIwbUyXQrbkZKVg>
 <xmx:gzx-Y7PziROTi1DvWK988VcxIDRV2UjIZ2BitGYvYrp3IHvtdSvqQw>
 <xmx:gzx-Y-2eyfN6eSsKsv_pI_kuP7u0-kxnxfuV_aerucdpVz928Qek1NaEiqE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:01 +0100
Subject: [PATCH 19/24] drm/vc4: crtc: Make encoder lookup helper public
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-19-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MzY4pxUt8z6V+MCGUxVJbouH7Pp+P0qdt3puDLaEigs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tWsxzep7i38/uRlv5tGUN58yy45kzTbDX3fv2qn77/Z
 ebK9o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPhaGZk2FxYHPC/stt99UGzLp1Qzx
 1P+7+cEX1Us+r1xtBMOWuxVwy/mBu93iqFx9p4O225ILNkSt/ujHllVnE2WiYBpd9L2cK5AA==
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need a function that looks up an encoder by its vc4_encoder_type.
Such a function is already present in the CRTC code, so let's make it
public so that we can reuse it in the unit tests.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +----------------
 drivers/gpu/drm/vc4/vc4_drv.h  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 340c39921bce..8bc30ad0904b 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -486,21 +486,6 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	return 0;
 }
 
-static struct drm_encoder *vc4_crtc_get_encoder_by_type(struct drm_crtc *crtc,
-							enum vc4_encoder_type type)
-{
-	struct drm_encoder *encoder;
-
-	drm_for_each_encoder(encoder, crtc->dev) {
-		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
-
-		if (vc4_encoder->type == type)
-			return encoder;
-	}
-
-	return NULL;
-}
-
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct drm_device *drm = crtc->dev;
@@ -536,7 +521,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 
 	pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	encoder_type = pv_data->encoder_types[encoder_sel];
-	encoder = vc4_crtc_get_encoder_by_type(crtc, encoder_type);
+	encoder = vc4_find_encoder_by_type(drm, encoder_type);
 	if (WARN_ON(!encoder))
 		return 0;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 01ca2b25d2e3..dca7be3fccb5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -495,6 +495,22 @@ to_vc4_encoder(const struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_encoder, base);
 }
 
+static inline
+struct drm_encoder *vc4_find_encoder_by_type(struct drm_device *drm,
+					     enum vc4_encoder_type type)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, drm) {
+		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+
+		if (vc4_encoder->type == type)
+			return encoder;
+	}
+
+	return NULL;
+}
+
 struct vc4_crtc_data {
 	const char *debugfs_name;
 

-- 
2.38.1-b4-0.11.0-dev-d416f
