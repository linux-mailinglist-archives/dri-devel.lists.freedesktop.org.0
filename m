Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B404BF920
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC6F10E651;
	Tue, 22 Feb 2022 13:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999AD10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E218E5C02B6;
 Tue, 22 Feb 2022 08:19:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Feb 2022 08:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=uiveBeYnqGcqK+zu9ioOaNZW1ydXbC
 w+PmOS3Kp8raY=; b=LSDG/lIJ/CmcaYJmitbqepLivNzqYGv0QtHLz2nOQC8cyr
 x0sjq+SXKte1pSzXhkd+NpeG1kyx+B4xDUhphmhtiat1w8P9B7+1/Ayq06cOb6SG
 jfQdC8M1VlReyTmJPqNI/hOQ661uru3kC+r/b367pH0OIF0KgP9PpIsSFy0WIOkt
 GEeSoRxwGfqJLtHuzIyhorToa8TOtAAjVINmFnEgskHOJYnOkU9KJ1ZyHdwgr0Mj
 F35gCzaOzhSb/jkDHfpG0EZ+cF5GHN4s7vHEjno49YboVCfkWkvGPlk8SQxNqfIz
 3wZ+MDaoVDMcza4JoVIqzlzX/ZdP9J5JXvErRshg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uiveBe
 YnqGcqK+zu9ioOaNZW1ydXbCw+PmOS3Kp8raY=; b=M8vIUCCwYJ4QUE4lYPq2dh
 +rIhPsU3w3MucKawOW5Z/BG7qxNBtvxPVVEx5svBO+0utxp/y2bvQ6XvSl55bp2l
 wpNIBUATntJ8W6PNOxIjNeMHCCFAKUeccODyiGbEUYeBFoyZECU58hS2ZaR0cipl
 a7iUC26i+CpR7d2woBGoe1demn4gCjnJNp6V0cqIuOVVXbHEeceyedWCD5NLTX+s
 PdtBQaXZaZ37ZTiifCKYLFq0nEQ6lDnJ+A5QCdKbT0evdPLdRcJlMPNqbczPgoxm
 71TE6L29vunsFibWJ+0SEBUxVW9xZTjY04jDxiqaYP0uU3Dxph4L3f/kdnh/VzsA
 ==
X-ME-Sender: <xms:1uIUYgA3Qn0OTjFqKXD3-ptgGV_Zd1X_2JAizXg21azBneQZPoU_RQ>
 <xme:1uIUYiiHkc5E1en89zH5K62hh5KQ26ObjFGEcrXFAMtsgvDVSSJ0QsPQIdyv9SRIK
 _dGISGH_p_EV4cdI1Y>
X-ME-Received: <xmr:1uIUYjnUpPOc6pcUo2O-Rq-nq-n8ehlvRY1jNbFFlnyf-qxW05mir_kTEmw3OuqS8IVdS70IslNHuZJKgGxIYgVw82wW_CuN1gtIvSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1uIUYmz-SCvziNz4Q6pBabCf5Iv5Hs7h8JJjKKrdLwoEtugzDnKbRw>
 <xmx:1uIUYlQgfXLQiNTBghAtV1NjITAZi4_wG9EzMqzonrMrjIwUmdPPEQ>
 <xmx:1uIUYhbYqFDlFonA7YcU8tCNNOHpBujSVtMPLhtpcVY-hMao17lgRA>
 <xmx:1uIUYmQri8a_NlPmmXNogoE3qzFMImi_F3Uqh_6dSH-W4Q0mdhrgVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 10/11] drm/vc4: Add logging and comments
Date: Tue, 22 Feb 2022 14:18:52 +0100
Message-Id: <20220222131853.198625-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
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
2.35.1

