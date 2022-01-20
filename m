Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027D49503F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DC410E524;
	Thu, 20 Jan 2022 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2E910E38B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BC1213201F66;
 Thu, 20 Jan 2022 09:34:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Jan 2022 09:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=OHFTn7GOQZcdexAVl+IrIj7Ir1JYzG
 9d/APR13X0Vns=; b=UowVh02C9QVN1XVBEiqBFyjTVkfDXxD/pZ6EAT+/JmupC5
 iquIIorjOTaAgEDid+6JDWVyELNH8+yurvp3rtI2tXTn5ZYqQ1C3ouNsk0uiBgE4
 ZvyPoMLxsigEwwRAH7/OWpQAavua9UXXXdIA5KSKvB7sxqeaqG3odIZNlNkjgZJ2
 5NQk7cxX/DtspACM9a/HFPyRE6hM22Vx4WYMyXRVCZdQvy79RrjmuVys1xVtrVbB
 HpZnw08oL0BAjqQLtx6JKlV7rsMglzBzPsTiV1dIgnGkY10rAtbd8kXIrD6Z59sK
 Rki7xz6kCaa/P0ew9Q3BTEHpAHhcSqi6AYDivSyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OHFTn7
 GOQZcdexAVl+IrIj7Ir1JYzG9d/APR13X0Vns=; b=fhWSsGh5SUPxL5NWjwUylp
 KqmoyiNvholOpjyLOjARqsfaCaWzMxw9pHKiKOPIqcADhXDFneFII89EUREsayjw
 c2zWbdmhyzqXfQBzosqOCpbuoqN3+IkmVt1cjzcj12H/GqIO8XkMVscyAp8oluAs
 Uraw9ptA1U59VpEdKeV9RVKNTl5KbXv//V4W+U6dNZG2RNgYMv3YzvgRa1ErdmKU
 z91bBxd0WCAZeYJ3QtIJZdQmqTcrTW9hjx+SZgXoLjdabAVsbKu3/wsmNn0BFAPi
 p9jYKgDYRCUuOheKZLnQiqRXeLlWZSK3IMOiM+ZF3dQC2IV+m9RPM/zHHlQInIqA
 ==
X-ME-Sender: <xms:C3PpYX9hxUrxHOsu-UDGo5J2lVu5YnugEoD495KCUWCyN8-Xgijy7Q>
 <xme:C3PpYTu5rHZR1NfbVbabVhC5h8bS6akNg6GEVrZ4OTLaPtvawnnCHduOPUh6QAruu
 obUpztu1ykxhjv8LMg>
X-ME-Received: <xmr:C3PpYVA4upnLm7MVPn65qU8ZvqxTQjZkfrolNkMBWfHahnKiG3j-If7jjzHKbmS52q7VE0GTIgWQjcMu5MfPwna3I_d0hTyeNSe1HPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C3PpYTdGhVHcO7sJNUWsgaNA7qebaE5ozvzS-OQ-SuxTIewDqOTP9A>
 <xmx:C3PpYcMTzBttpBvfiy2yh60ZrPbtk0_2_TipPW0ALuz6ZxCKzVg3Xg>
 <xmx:C3PpYVk4UAK8MBGX2CFudccwt3EV0DvHTcbcPAa7jMmBkkVXq4bxoA>
 <xmx:C3PpYTcIc3xTDuJgQ9Jazahj0W8n2-IPAH3R8BKHnAQCEnc0-bhPJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 09/10] drm/vc4: Add logging and comments
Date: Thu, 20 Jan 2022 15:34:16 +0100
Message-Id: <20220120143417.543744-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS core clock isn't really obvious, so let's add a bunch more
comments and some logging for easier debugging.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..6fe03fc17d73 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -389,8 +389,15 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 						500000000,
 						new_hvs_state->core_clock_rate);
 
+		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
+
+		/*
+		 * Do a temporary request on the core clock during the
+		 * modeset.
+		 */
 		clk_set_min_rate(hvs->core_clk, core_rate);
 	}
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
@@ -416,6 +423,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		drm_dbg(dev, "Running the core clock at %lu Hz\n",
 			new_hvs_state->core_clock_rate);
 
+		/*
+		 * Request a clock rate based on the current HVS
+		 * requirements.
+		 */
 		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
 	}
 }
-- 
2.34.1

