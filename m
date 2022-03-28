Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7104E9B3A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2FE10ED5B;
	Mon, 28 Mar 2022 15:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA410ED59
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B82733201D6A;
 Mon, 28 Mar 2022 11:37:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Mar 2022 11:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=v1sxwh3RkOHXPJe2T+7khIrfpbDdOv
 jTFia0D/uHxMU=; b=ZvYOToGgd3aaJCdr1sifiu4vZYQglxU1UzZ3FhXRTf+7Cp
 5fC8EquvXSlUS/UihSb59KKcFeN+0qvpr67ygDPxJ53IuHcsjZxSh/0aFmNQiSvz
 EfP4l8yBSlQdcwjGmaMsrsXBAYcgxeU9EJmNYaWzzTOvSI6C5WqEwkQxnuBCPHPW
 zM3zjKmvePJTwevs8MwKo/Vc/eEvj4zFE0Ep8Pe47r41dM6h46dq93boG18OyxVu
 82mTKR5D/L3vnSlLjfvFxWOgn70qDIfPnDeNNo7po4jO54Q9KLa3J2OMHenYAcTq
 ccl157K+ROSLD43D55v0JPdyaBQ/wvtUCdo7haWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=v1sxwh
 3RkOHXPJe2T+7khIrfpbDdOvjTFia0D/uHxMU=; b=gRU6NOnFavscSJYel1swOm
 CgNqIBMPfAdBXx8M5kIqLNihae/tHNhx00QQ9EUrPOB1v9fJPrkbHrg011tyDRGy
 Q76l14COk53Z67/gyHIZGDJXjwVZFyA+H+eiSf2ic5mOYDRKMX97DEF8yGSvt5sR
 v2mPKxVmBwCjPiPPNh24/X1YyDgv9Bw4WjGm6x6JxeZar7de2uuacRhT/MEihH7Y
 as4hToOqugNotHcr/Aw/mDu5t8pA0CbTkP3LQoKADTwvDd0uSzI4sf/7SYFyYjxA
 mU62iD3Cp0Oag8qPljKysF0K1iyCYBPtHd52UTmdL83ZtqJfd6bflcucw65R5Osg
 ==
X-ME-Sender: <xms:MdZBYhoWZl_08B4pGPaUR7erkNg5I4ulrFlstUtBeIoiuTI06QWCbQ>
 <xme:MdZBYjrhQIpllB80XtmGfkDX5PQ84CUmeje8vt8EXRAZfJMDytdH1r5tsikMqBtse
 qfenOrcsy-v5XJAhN4>
X-ME-Received: <xmr:MdZBYuNZ0gyGGC3DFsqxwxTk2LGHvkik2VZU3pDiuXdaDSevoLNHP6rRZW80tIpQAOBO32VmAgh3UE3EgpWzO0i58e7LEeMUFhJK7YU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MdZBYs6jeW6UQdGmQLULU_6kRn47gOqpAcb_bGE5T2l5qKZc-N4Skw>
 <xmx:MdZBYg6XITUTJF1t9DumZgCkKKtwhD7CId-AODpICfXa0Ptzyf56hQ>
 <xmx:MdZBYkiB0rJ_jKGlfwErC-MMTM_b_lieu19q_ibzADoXclKKE_OrUA>
 <xmx:MdZBYr0T9obb_z8XYLXpRLSmLCtrt6AGDJnuwlVT_8DbuSWr0M8k7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/vc4: kms: Improve logging
Date: Mon, 28 Mar 2022 17:36:59 +0200
Message-Id: <20220328153659.2382206-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>
References: <20220328153659.2382206-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When debugging, finding out what muxing decisions were made and what the
actual core clock rate is is always useful, so let's add some more
messages.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index d94f78eac936..29ecc34a4069 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -421,6 +421,9 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			new_hvs_state->core_clock_rate);
 
 		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
+
+		drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
+			clk_get_rate(hvs->core_clk));
 	}
 }
 
@@ -787,9 +790,18 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		unsigned int matching_channels;
 		unsigned int channel;
 
+		drm_dbg(dev, "%s: Trying to find a channel.\n", crtc->name);
+
 		/* Nothing to do here, let's skip it */
-		if (old_crtc_state->enable == new_crtc_state->enable)
+		if (old_crtc_state->enable == new_crtc_state->enable) {
+			if (new_crtc_state->enable)
+				drm_dbg(dev, "%s: Already enabled, reusing channel %d.\n",
+					crtc->name, new_vc4_crtc_state->assigned_channel);
+			else
+				drm_dbg(dev, "%s: Disabled, ignoring.\n", crtc->name);
+
 			continue;
+		}
 
 		/* Muxing will need to be modified, mark it as such */
 		new_vc4_crtc_state->update_muxing = true;
@@ -797,6 +809,10 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		/* If we're disabling our CRTC, we put back our channel */
 		if (!new_crtc_state->enable) {
 			channel = old_vc4_crtc_state->assigned_channel;
+
+			drm_dbg(dev, "%s: Disabling, Freeing channel %d\n",
+				crtc->name, channel);
+
 			hvs_new_state->fifo_state[channel].in_use = false;
 			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
 			continue;
@@ -831,6 +847,8 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 			return -EINVAL;
 
 		channel = ffs(matching_channels) - 1;
+
+		drm_dbg(dev, "Assigned HVS channel %d to CRTC %s\n", channel, crtc->name);
 		new_vc4_crtc_state->assigned_channel = channel;
 		unassigned_channels &= ~BIT(channel);
 		hvs_new_state->fifo_state[channel].in_use = true;
-- 
2.35.1

