Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5436363B1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA4D10E591;
	Wed, 23 Nov 2022 15:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671210E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A40A12B06A7A;
 Wed, 23 Nov 2022 10:30:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217416; x=
 1669224616; bh=J1D+XOFOUdxuNkuluOHcckyn8YovDBfQcmqL72Rdd5c=; b=g
 9n8H1SBJFBybBizfrjOhCjCYEwZcAHWX92WPhSYM3NzS67VfysJuy+a+fA8z/uTH
 iLlId0sHP5ScrNozlU95ST2jwCh9s2hFEJtBcBLmFFDDK3P4Mvm8SuCLIEIyuxfp
 ES/T5OmR/0keqPa1ybACxkKGVXkqi8seKEfMybOPMwT8B8sKy/wLivzRhnK5FmvL
 Rmv/jcy9i/VdJR1iXWt8ZH1AUVZlknvfhYsTykk8hrauLpcrhLE83OSuvSDJDRGb
 j43TQBIVtZE2b7E53WQkWKK9/oMItcyCwfSz0IonKd7W8fvqCNXQpHIJ5u0TXYqc
 C76rQellz9Rx9pzDw8d7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217416; x=
 1669224616; bh=J1D+XOFOUdxuNkuluOHcckyn8YovDBfQcmqL72Rdd5c=; b=X
 x6E+7aDptIHjRzdBaQMxhSRoZnUpsh1ikjJxFlLfxU8Tm48hilSZ50OQm5vMguUq
 dMQlK6V4PU0PpE9bXXiRobzJ4Dz9uALGNcm9M4vqJj98MXb38KC2HpIEtBW3+Qkc
 ds8BaHpGuN8xuJNGYFhnMyKUlBgwGnvJhiH4HG/cTr7pyo/EErJVRBqr7XVD71gM
 G335iz7bZukMGUAJuisFx2WGO4hWhostVVhAoqtfsWJgTtR1dYNLoW2kMxCRtkId
 o3xqQgpJEY8HJN44w7XvYNhQXrqaxsEuAqDvObZVmHxO3Zjg0JwEgnUAQfVUnMkW
 pqd71UxRJXXCICjUVaxBQ==
X-ME-Sender: <xms:iDx-Y-Q44C9ynF-0MzA-aQRKiwF1vvm-holmsVahTNIdZ6cFGNF5AQ>
 <xme:iDx-Yzwtu0eQ9zYVVP6ASi7f-NPaVyNGpEI8pj0I_m1-EVJEEm0rKOlWFP232aD8q
 0KHq4-sqY8KDY7v2vA>
X-ME-Received: <xmr:iDx-Y72CBmhS8_TV66STVCVrJ2gxn8wiNUbT_nS9dl32k7ogKrcM_TBe35NPZYxwnb0SgP6zaFzW7MJuJ_gS2q6slvCrqNrZdnTqvrCZW_jR0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iDx-Y6DkWtXRY317JihNtpUMQRj2a8rt7FRm6fJ-72ICdEZ50ut22A>
 <xmx:iDx-Y3jc3kDleS1vZHfXeO6MzXdjTOJ-VnOT7xpnA71JxtvfXBoRjg>
 <xmx:iDx-Y2pLfqj7fVPh7eaK2-nAR92fK-FKp3LK-Rscepxglf4oxTJE6w>
 <xmx:iDx-YwDINIcXJfBAgzQ5q5OtO5czY9F6-B2D43zdjyGVZjl7KB8D1x6skwo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:02 +0100
Subject: [PATCH 20/24] drm/vc4: crtc: Provide a CRTC name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-20-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4108; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pcc23LPR7qSZhtIKFeyngoCDAeldcNBM+wc9YK9zG1A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11jW2j8zOzV9Y0h4gd5Xxic3BeYfWdCSKPHoRu0aqYF1E
 R/uUjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykjoGR4drjH+tMfL0UzsfvqVL6yx
 32L/DhwglT2v1e5XN+3y/klMPwP3H1/2Vf4g4tfGj9fPnFzRlzMhtEHok0xbL8y2mJkdq7lhcA
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

It's fairly hard to figure out the instance of the CRTC affected by an
atomic change using the default name.

Since we can provide our own to the CRTC initialization functions, let's
do so to make the debugging sessions easier.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++++++-
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8bc30ad0904b..59e473059fa2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1118,6 +1118,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
 static const struct vc4_pv_data bcm2835_pv0_data = {
 	.base = {
+		.name = "pixelvalve-0",
 		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
@@ -1132,6 +1133,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
 static const struct vc4_pv_data bcm2835_pv1_data = {
 	.base = {
+		.name = "pixelvalve-1",
 		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
@@ -1146,6 +1148,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
 static const struct vc4_pv_data bcm2835_pv2_data = {
 	.base = {
+		.name = "pixelvalve-2",
 		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
@@ -1160,6 +1163,7 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv0_data = {
 	.base = {
+		.name = "pixelvalve-0",
 		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
@@ -1174,6 +1178,7 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 
 static const struct vc4_pv_data bcm2711_pv1_data = {
 	.base = {
+		.name = "pixelvalve-1",
 		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 3,
@@ -1188,6 +1193,7 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 
 static const struct vc4_pv_data bcm2711_pv2_data = {
 	.base = {
+		.name = "pixelvalve-2",
 		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 4,
@@ -1201,6 +1207,7 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv3_data = {
 	.base = {
+		.name = "pixelvalve-3",
 		.debugfs_name = "crtc3_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
@@ -1214,6 +1221,7 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 
 static const struct vc4_pv_data bcm2711_pv4_data = {
 	.base = {
+		.name = "pixelvalve-4",
 		.debugfs_name = "crtc4_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 5,
@@ -1282,7 +1290,7 @@ int __vc4_crtc_init(struct drm_device *drm,
 	vc4_crtc->feeds_txp = feeds_txp;
 	spin_lock_init(&vc4_crtc->irq_lock);
 	ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-					 crtc_funcs, NULL);
+					 crtc_funcs, data->name);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index dca7be3fccb5..54352db48476 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -512,6 +512,8 @@ struct drm_encoder *vc4_find_encoder_by_type(struct drm_device *drm,
 }
 
 struct vc4_crtc_data {
+	const char *name;
+
 	const char *debugfs_name;
 
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 841da240d93a..4f7ce5d3e8ad 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -480,6 +480,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 }
 
 static const struct vc4_crtc_data vc4_txp_crtc_data = {
+	.name = "txp",
 	.debugfs_name = "txp_regs",
 	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,

-- 
2.38.1-b4-0.11.0-dev-d416f
