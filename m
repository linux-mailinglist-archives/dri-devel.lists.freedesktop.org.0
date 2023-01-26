Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DA67CC98
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6867310E8F8;
	Thu, 26 Jan 2023 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3810110E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 90F575C00DC;
 Thu, 26 Jan 2023 08:48:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 26 Jan 2023 08:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740885; x=
 1674827285; bh=ZjpSJFMrmWinFii5kkvh12npkuO0y8aDkcdGEE9wdRs=; b=l
 k1RUEMNa2F0dKV+f9yCKtyEdH8n4JS854AsCDTvq5Zvfi8xQ9cxHuaJNZIwthevq
 GodcpZ/QAA5bz5SyDlUmvmvTvFSlphtgV9Eb3FjcXOcm0ngi+NHozZYuxsJ4H6Nf
 6obIvr7cYfEJzMmfi4Kos7PLCJkvUKs9/noEwk9S1MNL+BJaApOQnREfnnxO9pzX
 TFgnHLcBl0aPwpSN4OU6IZbfs/ixD0ZxJBvgWRn5/Karc2tKeiqkQsWVPznWoXmM
 eGYfHZUBFGyjamFm+dR2HuKDvwz/Q6B58/2MrjFmDRVQI75tuqFKoj72dZt6ulGe
 fx8N22lJCa2owLZ9DPKuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740885; x=
 1674827285; bh=ZjpSJFMrmWinFii5kkvh12npkuO0y8aDkcdGEE9wdRs=; b=n
 McfZfm7LzP0rAmB04IwPmm8eo9P21uRJqFLL0D56nMyBWMzQRhpmJlqpx2jIIruR
 KMfGnGLnZA6tWNRKhtjDs7E8T/SqaHe7gQufiv2m51v1wDfrHkecNyLcSRrTxWao
 UYgzV85UDbkVtZmiu0jJ6PlpxXwcHGi21Z/KC8rnsESJwTpMM6jKs8TwIRFTLCWk
 L5ZgPR6bHEyA8XGJPjhD5droxljRRefUbF/MTLmXJiUsmR743OihPlMU2jDPms+O
 3W0v/PJZ85Tjt/a5/EsEl+mi23eu1ZXu5vuRgNq+wozI4WMQb8AdI9rW5Y5ojmCE
 wPJkEJY8vVsnJ3JEClyZQ==
X-ME-Sender: <xms:lYTSYyAY2-7R5gdv2scqBpZq6GSAZqyWK7kOjeWiVeWzMPC1dZZL4A>
 <xme:lYTSY8ghbNDsmROAGFlR8UNsZjx-XLkj8bPJ0r5qyYRb8xhjPG_Z_frFTsxT3lopR
 cnQoWoNofWXiXygdNM>
X-ME-Received: <xmr:lYTSY1lqJHBiVA_6puXghTZGTkp7rIQDu4FxUPSyHPKvCiByuSWoc5WK_JizFpfpoKiR2gdsXMm2HxJY20wQ1NBOWAJOjGNst_plSPe_AYRJwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfffgeeiteevheffudfgkeetvddvhfduiefftdelheegudevgfevfeel
 ffekffdunecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:lYTSYwyq_PNqlJ6CVaodJ4QRoU3zOBz6aSft0UPkMK5wdZWXmBmEtA>
 <xmx:lYTSY3TzrkrwJ42_IoIHF-ZWc4Cu0qncTSJu3HjM42ylvFUB8JyTDg>
 <xmx:lYTSY7Z8DoOq9iIc2WeajJPqrQIOe7NWhX9JL1Wnf31I6_xp7NjzkA>
 <xmx:lYTSY4DoriMQ2xl2SBriRGefgIXddlqdkn6Oh07ny2y0IaL6Be78ng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:36 +0100
Subject: [PATCH v2 2/9] drm/vc4: hdmi: Update all the planes if the TV margins
 are changed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-2-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eatPppDqwp0/6f++a7JzjT1vBTqBU80VwZ/o7/LoupU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlwMBc8uvbDS7UV0dWR5tlrs99T5TNlRk3ju7bjef13p
 fXxORykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaSqcbI0JS56MgVzYX+tcUsT8LNO3
 8+2vKt9cVli83zDi8pyk8+UcDwm7XvWW0yN8vUi4lM9b+T1Px8cmIeHNpomCKgcOdxu6cBJwA=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On VC4, the TV margins on the HDMI connector are implemented by scaling
the planes.

However, if only the TV margins or the connector are changed by a new
state, the planes ending up on that connector won't be. Thus, they won't
be updated properly and we'll effectively ignore that change until the
next commit affecting these planes.

Let's make sure to add all the planes attached to the connector so that
we can update them properly.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b3e7030305ea..4b3bf77bb5cd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -531,6 +531,32 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	if (!crtc)
 		return 0;
 
+	if (old_state->tv.margins.left != new_state->tv.margins.left ||
+	    old_state->tv.margins.right != new_state->tv.margins.right ||
+	    old_state->tv.margins.top != new_state->tv.margins.top ||
+	    old_state->tv.margins.bottom != new_state->tv.margins.bottom) {
+		struct drm_crtc_state *crtc_state;
+		int ret;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		/*
+		 * Strictly speaking, we should be calling
+		 * drm_atomic_helper_check_planes() after our call to
+		 * drm_atomic_add_affected_planes(). However, the
+		 * connector atomic_check is called as part of
+		 * drm_atomic_helper_check_modeset() that already
+		 * happens before a call to
+		 * drm_atomic_helper_check_planes() in
+		 * drm_atomic_helper_check().
+		 */
+		ret = drm_atomic_add_affected_planes(state, crtc);
+		if (ret)
+			return ret;
+	}
+
 	if (old_state->colorspace != new_state->colorspace ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;

-- 
2.39.1
