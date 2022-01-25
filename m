Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B949B5DF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030210E738;
	Tue, 25 Jan 2022 14:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F110E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 540125C013C;
 Tue, 25 Jan 2022 09:16:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 09:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=OHFTn7GOQZcdexAVl+IrIj7Ir1JYzG
 9d/APR13X0Vns=; b=GpDHAgGGM3W0t3L/yqw1K8+H0iaNJKgXp2HW40xJQRILrx
 jbQ+fb9GiTufZEO8CvKUAVCAKvvOTL6Y1JC21tvpPPRyR9j2SVoDTqM0z43VL0GL
 lpM9nhObQY4quQsrZ6Pn4nwEUVw0z2rfiyRHxTLuDTtBioqYqvfGt10nDzKtiEtR
 FcGRUJz/u8mm8Af9yU5bJUW0gWYY+ExTFOg593sz/T9WOv+bIuDCJyYaFVWpIDzZ
 Di7bwYQ1NjH/TuJB/1XpjjIC/05wRyX+TgQ6966c6EUW5RtgrT16t9GaAuA0KLwD
 gJ8Q/X20YPHNiLp90gmRcXwHy033V5nwiqdwKwOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OHFTn7
 GOQZcdexAVl+IrIj7Ir1JYzG9d/APR13X0Vns=; b=BCt5PBTmxt65hEZeX4iwIG
 fmkLOIz3+JcPktkNGIoTebFQfcnhJ/vFle+X/u3CFbzyrfknSvVyW29QMtR7LbYq
 G4oETw2i83ERYuZA25DlJalFCNUgArumaf95J3HCiQDRqk5f1H2Xng2a+Qn1x2u5
 U7IkFMS+VzE+ERvMHvjwl+1IyPApYgdjjZUEp4+Wo9nrXGoPsiwClxVHFSo1mZhM
 n9A0WRDEgsuZ6md80f3K3Bv9YLg46Rpk9hi3sp9tpBZAc0x6dvaT0lFw1X+Go0NQ
 8rMOGJcqVzN5ttRGfP2HrENa/R0jgwL1AxN6sMdHui4AS3DGB5KR6LP9uctxHbgA
 ==
X-ME-Sender: <xms:LAbwYX6F4L2Ir82PqXwGf05Bp0UA0x6Y5xdrHwnhMuL7lspTWcXqlQ>
 <xme:LAbwYc4mpiyhQQHhYhqf1xH_Oxs4pl5fpDmVvbpFIF_tU5joSxE-vU9xoBbs4Xqiu
 4_etifUuBdZLGDo0Wg>
X-ME-Received: <xmr:LAbwYefx46qB7NjCI8yK_bTnpQxzGI9xP8dL7j3amOKFuRu0IONgeEcKS5nXIdioeDrFxcqhjWlOdNgGv5DMK1tPZ80vJ8Z1XOnW5pU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LAbwYYL1OiZLo130D4R2qw-aZiHOPModa-kchsGVHXj6sYLHiIAH_A>
 <xmx:LAbwYbIYyYvYcwu6J4k2CZC4aBUoEUea34WDgjYvPaIpG6XjDEF7kg>
 <xmx:LAbwYRwMztF6ZgSw4o-GBILChLsK-rWkfMCJN1GRPwp3AWYGqcscBg>
 <xmx:LAbwYYoAP2pwvFghD-Gk-EXiFUfYNpSkywZ3yPkQtAdQOAMK26hfeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 09/10] drm/vc4: Add logging and comments
Date: Tue, 25 Jan 2022 15:15:48 +0100
Message-Id: <20220125141549.747889-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
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

