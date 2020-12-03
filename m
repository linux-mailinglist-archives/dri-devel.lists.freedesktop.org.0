Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4B2CE9E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08236EC81;
	Fri,  4 Dec 2020 08:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E976EB68
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95A94580419;
 Thu,  3 Dec 2020 08:25:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 08:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gB8my3O6+VbaF
 wdMDAVrR58tjcuD0U/ykH86aY2t54k=; b=Y0hyfrvqwABMVFJlTX+x4c0IsPkLA
 VNdXvHB3qoxcgb6r0Vdlw9FmhR79ek7ydN/tJL/MImol5q/A2r9sVVnrhK3eBnbE
 7TDBdm+T4FsjcyhOUvWujcJzBKFh+c2IjCJQTQ4aLA0Gcs/KtxKj4rTionF6qj46
 uL5X6FLBkGWrNRP3glqnpQUyUxSQej72BGFoDaz/WDr1UkaYsfh7wGyOpGba+QjH
 C09Gg2sGQp6gyI9VurGMcPAT4MF9Pg/8Y3kpRNi3LBPTeMWjgSfmNyO3DIv8c96h
 MeJMD2XIaN5tH3wQ5a3N2J3h5hRNR2AlVmpZu5ffzpUhB3KA7yM5KM62A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gB8my3O6+VbaFwdMDAVrR58tjcuD0U/ykH86aY2t54k=; b=TXe7bs0A
 Vtg8ITkoLZa89Uu8Z/vugNDX2CdFVUwGD9tqo4OW6UfUqGQrUQ9ZtGBnqHZm4uEk
 laNch44aHbxx0+SIiIYlhiMC6hcPyT4Z3EPfkt1nNXxLyjE/zo/tHfu+ycAZ6YPA
 5ZZpjRtVWpuAmvdLXHKn1QGIbLz7SvvyjhJ9yGKhHtKEwlcuujWIqmgVl/f39YpI
 U2htUyi5WSQfUcDgMDr2dU+j1j6wEaMrJOwEj7KO2OYGzA7kpHmSNOXrYH58Cgkf
 SaVWtN5SVQclfKPsUNGFzVpmfaNkVNFAs/1cQ1e/XXY4pkvgUzZilozvOdAkNGy3
 WhVAc5VAuJq0Ng==
X-ME-Sender: <xms:YOfIX9Sq77rs70AtnVaDXPvF5kNEftS0vomRfNTeBgSOaGVAuUu7rw>
 <xme:YOfIX2xQ7Ib_N8zMmHW4wgC4GFniGhHZ4T4A_8vMfrQKyAviw4eWz7TmQcrmvRp2v
 KgcjZquPaGj6hZOylQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YOfIXy2ez4XC_F7QWNAB_0ihnl4LnKk2K66OunQrXOFs9nvX2ZTH3Q>
 <xmx:YOfIX1Az4p3pFadj8FmEWblzOCROh59mQgHkKWCN5wTToCT9I7A7Gg>
 <xmx:YOfIX2h9bV3AH_zYeEN-IsMHkegVgIZ3kTmoU4ou1vIOJp3PqPbCvQ>
 <xmx:YOfIX_VrBl0GPfXiuzb6n-ByolKSHyyir2RdI4CdoA4SWSHFZSlsWQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19CE924005A;
 Thu,  3 Dec 2020 08:25:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 5/8] drm/vc4: dsi: Add support for DSI0
Date: Thu,  3 Dec 2020 14:25:40 +0100
Message-Id: <20201203132543.861591-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

DSI0 was partially supported, but didn't register with the main
driver, and the code was inconsistent as to whether it checked
port == 0 or port == 1.

Add compatible string and other support to make it consistent.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 601020c10053..82162900e351 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1324,6 +1324,13 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
 };
 
+static const struct vc4_dsi_variant bcm2835_dsi0_variant = {
+	.port			= 0,
+	.debugfs_name		= "dsi0_regs",
+	.regs			= dsi0_regs,
+	.nregs			= ARRAY_SIZE(dsi0_regs),
+};
+
 static const struct vc4_dsi_variant bcm2835_dsi1_variant = {
 	.port			= 1,
 	.broken_axi_workaround	= true,
@@ -1333,6 +1340,7 @@ static const struct vc4_dsi_variant bcm2835_dsi1_variant = {
 };
 
 static const struct of_device_id vc4_dsi_dt_match[] = {
+	{ .compatible = "brcm,bcm2835-dsi0", &bcm2835_dsi0_variant },
 	{ .compatible = "brcm,bcm2835-dsi1", &bcm2835_dsi1_variant },
 	{}
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
