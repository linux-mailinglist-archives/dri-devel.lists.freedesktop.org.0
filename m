Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B352B3AF6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1781B89DF9;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C36E52E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C22B58032A;
 Fri, 13 Nov 2020 10:32:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9Yt2cwOa+QS/R
 0XuYmOUtR1pOo0NWYTATi8mTXUf3wI=; b=jdCkd1c9ri8svlnVBT8l/IoUsfPMq
 4B/9MhoG55cOk1GFZplbxI3wooJVbnb/5aTFtWfFc/6xg/vbx6QB5+Kw9K4Z/as/
 GD5yhZpL4IcsxhTw4C3vre78mgZpN6Shhy7nZ3VR7HI7zH97SS4jCK6JpGBJblw+
 iZN4A5RNGJcBT4Dpi/UMguNbfFnHDFqxJQ1PprLpHV+3+uir/wZQCYuFuNWq79SW
 wCl38qHEQLeHmlTmqfrZ9tgtNie/9V305Oc45v9xGDgOWA/RqMPyy5r9etWpEmHS
 Uhz9ZSBVnFCWKIKEi55zqtA0AbPjEMrDinoUDcDmVRQv5+BkME8JcxFAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9Yt2cwOa+QS/R0XuYmOUtR1pOo0NWYTATi8mTXUf3wI=; b=HCSQ5bA3
 y9QO4/aJdBYVE+ofR0DBz3h5CqiVhBidVjn3SksUmeU0WSpr7G/0P/tDpBPmXyMf
 eoqnEC8u8nSfMGnSn8IPxphRgSMOjjAQJ49oaOw6kSrF0DePM72sOGR5+K1oRYnN
 XO6frBtC3q2ySbhDE69Fk0qQrmF+08OdWCm5HPVsuAaCPS2L/+9WnbJcM0u0uRSk
 XX2w1fUexBAcknCfCalYHPAN5PWL8V3ukVFN6QWFf7S1UEfbqVrjHP1i8wV0w3UT
 0oArc4L3epjVUmZD7DwNWBOlJJk1T30t1y6v/cofv8T2W1XtGuSJbU8agdcF2P4y
 Jz3YmgPJxGDxMw==
X-ME-Sender: <xms:B6euX7qLb1Q-X_CcctIZ0rgioX9Ra9lbmWkG1exakKZhV3hIck2lEw>
 <xme:B6euX1q2dY7W4yAcEWn5I3MTyN4X65SXfgZQ7PkaUo3jmtYrcRhrxSpYbrHvuXkwP
 r21xzkvv4_x0hdpuTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B6euX4PYS4jUSHwXiG6u641q6zw8g-G9DsFGKKwh6aAlH2xcLrUcbw>
 <xmx:B6euX-5NeKSv3Q-MRfh_CMZkNuarPZTi5wG1ZtFxJQZhjPjaDTRVpQ>
 <xmx:B6euX67G6JTBq_TGJhqi-TbnA0rIRAHVdjfd6ioTRRvnoxIC8apeIg>
 <xmx:B6euX5QPnYeQVQ0br5zzF8Er-Bbp_VU4kxiJNAko4mQVyVHrN_fi1w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D76133064AA7;
 Fri, 13 Nov 2020 10:32:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 5/8] drm/vc4: Simplify a bit the global atomic_check
Date: Fri, 13 Nov 2020 16:29:53 +0100
Message-Id: <20201113152956.139663-6-maxime@cerno.tech>
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

When we can't allocate a new channel, we can simply return instead of
having to handle both cases, and that simplifies a bit the code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3d0065df10f9..3034a5a6637e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -794,6 +794,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 			to_vc4_crtc_state(new_crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
+		unsigned int channel;
 
 		/* Nothing to do here, let's skip it */
 		if ((old_crtc_state->enable && new_crtc_state->enable) ||
@@ -837,14 +838,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		 * but it works so far.
 		 */
 		matching_channels = hvs_state->unassigned_channels & vc4_crtc->data->hvs_available_channels;
-		if (matching_channels) {
-			unsigned int channel = ffs(matching_channels) - 1;
-
-			new_vc4_crtc_state->assigned_channel = channel;
-			hvs_state->unassigned_channels &= ~BIT(channel);
-		} else {
+		if (!matching_channels)
 			return -EINVAL;
-		}
+
+		channel = ffs(matching_channels) - 1;
+		new_vc4_crtc_state->assigned_channel = channel;
+		hvs_state->unassigned_channels &= ~BIT(channel);
 	}
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
