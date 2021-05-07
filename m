Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56D376796
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1465F6EE5B;
	Fri,  7 May 2021 15:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F56EE5B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5614913A2;
 Fri,  7 May 2021 11:05:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 07 May 2021 11:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vW+RTf3LgBXbs
 RoltOoYZx96bcul6bGBPQFQ8nNXkN0=; b=KJgrvW3Ct6yuqyf3/5iA2JzlN3Tsq
 aXbXnG35gzfHDwxVV3UNxjd3wgGRReKr5TNepzdoPZonkrbdMD7W/yaXbQLtTy1t
 Se6svRrJaoCg3LBNUA2vPCg0zIRIev/7qFxM/ygqXtXNMrNw2uLfw1CI97IOFERs
 P8ZZm6wEUCsRsQEPc4bqxdmNhPO+ghu9VgOjkl3cZw35KE1R0MlZdD2LX/QHXHhn
 rKGCim9slrfRg0Y/ofgJTJk6CSFXIIqZlnVwStymtmYPAT6MJG1BFmWhqx0WzkVy
 5NcSTvoLcfDJk9eO7PCSJuoa3X3KfTl37W4o7WZ6o7KKFqY4owFrP/S/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vW+RTf3LgBXbsRoltOoYZx96bcul6bGBPQFQ8nNXkN0=; b=nXSivO+z
 Oh9rxpTyP1n7PrlgyVo6/Fkl/i6Zxtariwa+0NxZUYEnR7sW7eX9eZc5KLMhCoxo
 QNpKmYBPWHv91d49NNwLBgE3/yNkAEWLksdFrFVKau9q0fMFkOBViECa6Qe4I7+i
 8+dC8ycADL8BTrZ0nyZpTHPwK36ikl3gT67q2dL68KkcOs5ffiylP6Wggj/FuFD1
 7rZS6uKsc6vkkb6eFmwpr95WjCGpQp53eiG+Eq/wi78nW/Htz+ZRVNVSZiNzIu0H
 ftn3o7xcqVJ8bBZOdcc/9SxDvYTMY1qOD1ChL2oB3b7UZKKmiOeH6bCYFbsnJQkt
 GoB3MXtVp55aSw==
X-ME-Sender: <xms:VVeVYKvIioAdAvglX7gHnHuslS3WZwuNt7Aa_rrYITlKjWEYNUh0rQ>
 <xme:VVeVYPcu-_qKReZ2uWeZ_srQXBEI6MUfHcJqx7NPp2EnCYH1zQMCYGzLWACFlf__u
 -yj1PCnKnHyyWEZ5GI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VVeVYFxBOf5jwFQawbSkCC4y3-Oo5x7BAYU50tbBtOmVtIAsbJ1ptQ>
 <xmx:VVeVYFPozPz8zTh26mNcoQUF11osnhcOeu-ASK4zu64wPq2xiszu6g>
 <xmx:VVeVYK9BwR6d5os2igFMVk2NDK6eMg0PjJ4NL9OnsAOVqee9qLPgRA>
 <xmx:VVeVYFXPLzyABdzOpCvUO90SqH_4BYvfrUCx3xq1IMn2jeAONdVXzGoXSek>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 07/12] drm/vc4: hvs: Make the HVS bind first
Date: Fri,  7 May 2021 17:05:10 +0200
Message-Id: <20210507150515.257424-8-maxime@cerno.tech>
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to have the HVS binding before the HDMI controllers so that
we can check whether the firmware allows to run in 4kp60. Reorder a bit
the component list, and document the current constraints we're aware of.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 556ad0f02a0d..0310590ee66e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -303,12 +303,21 @@ static const struct component_master_ops vc4_drm_ops = {
 	.unbind = vc4_drm_unbind,
 };
 
+/*
+ * This list determines the binding order of our components, and we have
+ * a few constraints:
+ *   - The TXP driver needs to be bound before the PixelValves (CRTC)
+ *     but after the HVS to set the possible_crtc field properly
+ *   - The HDMI driver needs to be bound after the HVS so that we can
+ *     lookup the HVS maximum core clock rate and figure out if we
+ *     support 4kp60 or not.
+ */
 static struct platform_driver *const component_drivers[] = {
+	&vc4_hvs_driver,
 	&vc4_hdmi_driver,
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
-	&vc4_hvs_driver,
 	&vc4_txp_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
-- 
2.31.1

