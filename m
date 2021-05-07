Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456B376793
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8316EE5A;
	Fri,  7 May 2021 15:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65DD6EE5A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 544A113C4;
 Fri,  7 May 2021 11:05:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 07 May 2021 11:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qjzmzcPjz2/VQ
 SgHKRBv3FcU9eHA7avUlSh/8EsiIyw=; b=KBmMrDyCyAJLfG5bmOy6WMGpTT5As
 vN3d11ivFEUEOZYDbZFNqgrmqbFPB1V87/qbrKEPgM8TUUG9ePdoISOEN2qPJBpe
 ZRxn3M7W0FtbB5fIfLami64wEEmuqZX8vpEeA0kejxJxpi89My//13OodTUndi5i
 qT8OjEk9w7SAsiWDyV3OxkqNQiY2CI+jZ+ilulLgO3dF2J/OJfGvVy8Rt/uAm3q5
 /0BVM6sKME/RGqajWQw9u6I2ZiWtAgnMv51mH2SiAk01UDJkJCp+LAoY8VjIJey+
 Sa6MynVkKdSI0HfmWRS+NUbXWY44RshJUIB9mrpOPA8B8G1W1Geoga31Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qjzmzcPjz2/VQSgHKRBv3FcU9eHA7avUlSh/8EsiIyw=; b=r4ZtxMU4
 fUhakeULbr67NXAXfz63jwpnR/M8OQk2b6Ko6wZyGGh7lbyHoGYGGSrjt8Bepby/
 L2kZ0xg2bxBAx2/2BtXmuBVjQyF+FedmRpi6V3ClFkXvxfAO9jeR42KBqYrPyELO
 S2sOXSXzyD6F3RfCOtlR9BWy+g3gwF70POsdwvaTpMfbvJvgUL7qtfPzACr9e0KE
 J21U13+WcYV7s20ImfXcmk2bx6sq4FV5C7D2HS3guOR8IsiKoaZvdK18hbfuB/sx
 5mZ//KI7H1XUYkVs6y9NrVlMsaFNWeO82t5la/hiNFneiTVYHlY40mSYU6t/UK0u
 p2pB7Fd4Dy5P3g==
X-ME-Sender: <xms:UVeVYG1lQ2Dll6JAVG2LRO9JAHExvyxJQfwxuHXP_eqT4HpnynFGFA>
 <xme:UVeVYJE5RNgtpjf1f9aArBhWAjRRuVKnU2RVRchLhep0Z7YGCvulm82rSGvYbYboW
 EBfRud3Pqly9N6crVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UVeVYO4g0ScV7LurOu1euprfgIGVmKoZ9dlHGZlXaPxHHa7mnx5KaQ>
 <xmx:UVeVYH1F7Nsl1QqRnr4ioQcL6LQ0UHVJC47LYmnBMzDHCVhGVP0PKA>
 <xmx:UVeVYJGoh5t1PlYyRigzw0NXdRfZlRneVQlztEkve9w1WtaaS_HdyQ>
 <xmx:UVeVYBHtQ2xhLp0PFiC_B1j5_Hwfr5IFfAABomBFUFu66bUM-S8FTdPv_cI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 06/12] drm/vc4: hdmi: Prevent clock unbalance
Date: Fri,  7 May 2021 17:05:09 +0200
Message-Id: <20210507150515.257424-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we fixed the hooks to disable the encoder at boot, we now have an
unbalanced clk_disable call at boot since we never enabled them in the
first place.

Let's mimic the state of the hardware and enable the clocks at boot if
the controller is enabled to get the use-count right.

Cc: <stable@vger.kernel.org> # v5.10+
Fixes: 09c438139b8f ("drm/vc4: hdmi: Implement finer-grained hooks")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1fda574579af..9c919472ae84 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1995,6 +1995,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
+	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
+	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
+	    HDMI_READ(HDMI_VID_CTL) & VC4_HD_VID_CTL_ENABLE) {
+		clk_prepare_enable(vc4_hdmi->pixel_clock);
+		clk_prepare_enable(vc4_hdmi->hsm_clock);
+		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
+	}
+
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-- 
2.31.1

