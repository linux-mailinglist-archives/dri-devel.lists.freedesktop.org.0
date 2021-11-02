Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F997443127
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB7A72E8D;
	Tue,  2 Nov 2021 15:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF35872E8D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30734580741;
 Tue,  2 Nov 2021 11:00:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 11:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Vt11WgLzzV6Wz
 TMFHmRXrRPkf+2yFbTib92sNpd3u5E=; b=XcQ7FOklhoXYs9zhkQFfCaINYDVmC
 KgvbvTkIqphAkWNRORiwkXBW2/JFhN0lKta0y7AiUxKAF4qrXyZYCY4qeb+CG8MU
 u2zcoxcRAudSVfntbDn+SUwTsMLsHQQ2KcZYA1Nc71qbPW1lD299jTixat+9lwqP
 +Ul2gMuUZ/yKdZICydGrQ+OKlybF3VhIUgsOwEreAIO5IDOFTTtHL1jItEJYrjto
 s0Gtfja1NX6QkvvXoGbzLGAHOOAG7njrchSAj+d+bZUtegWMYtfIOVFOWsyOLlMK
 xQ8/RkCgCci48QHmBY7KhHLOXK4HuuBD7g0QI6jYsUfvM/3pfiD3NoOig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Vt11WgLzzV6WzTMFHmRXrRPkf+2yFbTib92sNpd3u5E=; b=fleHR3cj
 jVd1L9hcs3IirxueCpPBYHw0BbO9s1To9FHSn1GNnazfI/fMy9G93ymMEKpO8EUv
 UdHeRG1QTvCFPgNpXMgnX3QtoimsVt8Q3k+tq028F+BEQ3f8zYY16WzXjmZ/ZACh
 eE/wmOl+7spMBtdC5nEbJNZKd9UNOs+2bVCF1S2PGaxIhi8TzO1KE6Ui+yOtEAOy
 MNYnLyZM/HQ1D1wHEMp8aRAa5Wk3b6NRuRyMShAQIFWi318RDKb3ZAQJpNkAACr9
 geJa9GUS4GK9/d1+1N8XG2xonAutd1UQKKWcBnWWLov/iWSs1MFQ2vDjR430/I5n
 DX6wmL851ivlDA==
X-ME-Sender: <xms:g1KBYf3wO0ukJZzL_0b281hnPmOqODQT08AwMogaf0GPEtTju8DjZw>
 <xme:g1KBYeEFO7qP3aHTtjGhTCr1h807qkGk5HXe0nxZecDHNX9U9qW-fxLBwJaOL62rx
 5j5i0bcWjZtyyQI-E0>
X-ME-Received: <xmr:g1KBYf7-NdNdX5xk1Z9KxymG37C7YzS0Ctc_6ieejSiKceUuVKWssyLlSDRiVeuNrIdQ77K1_OlaSkoVfnV4-BpeC5z2z0M05ZjHlzV7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g1KBYU0yIQxvmBB7A0X5aQ0xYJYxWZb4AzbytcrgfUmIYpFYPxU3Zw>
 <xmx:g1KBYSFdk16QmIlb0P1hCroXv15wPiEzKk46gLC6zIOGZTkqhru2Dw>
 <xmx:g1KBYV_pvKMJ4rkzUKShAqbZmwE4NK2RizP8qdgeqBp49CL6PT_dlQ>
 <xmx:g1KBYVCAyx5INS8NF8ymnTB6eKS1Izw6sP3oppBEftFm1ounsBlc3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 13/13] drm/vc4: hdmi: Reset link on hotplug
Date: Tue,  2 Nov 2021 15:59:44 +0100
Message-Id: <20211102145944.259181-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling the scrambling on reconnection seems to work so far but breaks
the HDMI2.0 specification and has introduced some issues in the past
with i915.

Let's do a mode set on the connector instead to follow the
specification.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aa6700622797..a1f40548dd48 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -175,9 +175,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
-
 static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				    struct drm_modeset_acquire_ctx *ctx,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
@@ -198,7 +197,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	kfree(edid);
 
-	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+	drm_atomic_helper_connector_hdmi_reset_link(connector, ctx);
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
@@ -236,7 +235,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return status;
-- 
2.32.0

