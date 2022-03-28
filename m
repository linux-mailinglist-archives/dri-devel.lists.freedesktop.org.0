Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E24E96E4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE9310E444;
	Mon, 28 Mar 2022 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407D10E450
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:43:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F2BB53201C39;
 Mon, 28 Mar 2022 08:43:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 08:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=jsDresXrhssR3JsOu8GLvpWRrubqWq
 c/nHfmp6S2ak4=; b=v8NQoGmb66S87NdzkDym3EfsKnLXCy0vvCeBRIHd6HEQT9
 qBeLa8gfAwMKSfmJqzVeoLEfc+ha8DFXqsNOHuPFKSGY5aE4MveDWZKn9db+VptO
 Zw3Mw+nC0yZNGfiL6gX1T81bgL8/7YYTgO1FPwYH6mvlX/XmWmVZbTaRR70g1yz+
 zPAqKssD967f73HnHJKayBdh57rM5gJMpDT+/Hvpu8AyLXNlrwQ0j22kYD7socQH
 p0ESHJAESxTiNaVA//kx4FHy/tFw/hRA3M8Z+HvsY4MsqY0TIUJvsLIcBbn4g/10
 50iIZFBSIBpvcnuqQ7UxkqXQg3V7VvMeEkD4tOjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jsDres
 XrhssR3JsOu8GLvpWRrubqWqc/nHfmp6S2ak4=; b=QtGIhEKvFdHbZmzJTr8FAX
 4dZWDDMfXtn8TNLig2fNcJPVE8JpFoqI7v3XRGnpHuZCO1hHCLUj2XlMqw15+95P
 0ki3Py4LtRf2haciZPFmp0fGgoRnp9b7l0QYOyqYRWlkNUSvqt0530CWYj9rrb9d
 xnKz2m2gVLnwIoei+d3UMnjaGMEW794fkZ84pLvXyRXR4DQNQkhqE3gCRBgaMOlA
 dYI1Bvvu2fx+tba2nLnnrhYO72JDC60JNXtFpBwlVV69+cq2HeeGJ1KXXt6557s9
 uMOFfiaSOCatmB9gIAM/hkuCdvaNYBzIAjAvVRhHHbQ7FJytDZtnhmLrl1rXAWfw
 ==
X-ME-Sender: <xms:aa1BYnu7yetO5G48-DQl-nIhp6X6sZTZ3zdqh3ryz5kxantxzCpNYw>
 <xme:aa1BYodxr2qcUqdDAROKvuktsp0t_V4wQgu9OZ0OxivgTfBWuHktbMdDxgwWpEesk
 JO0zMMI7UfafVnsYlg>
X-ME-Received: <xmr:aa1BYqz4hr50oCFkcmS0IDO3y09yZNMzk99xfwY_-qq_d6cK3nje3of9mZaVcwEjEwyOoNBX6w7yIxw50w-vnHrO5Z7HUkkoLRxjzYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aa1BYmPVVQ7hnj59Jmc61fxWhUpYt4XI6hdHhAZDTOh_Nobrl4dGtw>
 <xmx:aa1BYn-RygUshZzo9vg5EzkoyCPP5oi8LMKYew_GOIfxUm4o76AhOQ>
 <xmx:aa1BYmWp8jkhJXg-5TdWPPnX3pbFpbTBzFfRISihMfrjAWo8VlV4aw>
 <xmx:aa1BYoNrBHlhoU6foFmvVyVDmnYYXuN0yr7uLijA0UJoS__1Sygnbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 08:43:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/vc4: Implement atomic_print_state for HVS channel
 state
Date: Mon, 28 Mar 2022 14:43:04 +0200
Message-Id: <20220328124304.2309418-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328124304.2309418-1-maxime@cerno.tech>
References: <20220328124304.2309418-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS state configuration is useful when debugging what's going on in
the vc4 hardware pipeline. Add an implementation of .atomic_print_state.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 26b771c919b1..bffd81d4bfcf 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -701,9 +701,26 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 	kfree(hvs_state);
 }
 
+static void vc4_hvs_channels_print_state(struct drm_printer *p,
+					 const struct drm_private_state *state)
+{
+	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	unsigned int i;
+
+	drm_printf(p, "HVS State\n");
+	drm_printf(p, "\tCore Clock Rate: %lu\n", hvs_state->core_clock_rate);
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		drm_printf(p, "\tChannel %d\n", i);
+		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
+		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
+	}
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
+	.atomic_print_state = vc4_hvs_channels_print_state,
 };
 
 static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
-- 
2.35.1

