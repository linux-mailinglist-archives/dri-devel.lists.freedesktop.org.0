Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C076439A77
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C43A6E0C2;
	Mon, 25 Oct 2021 15:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0500F6E0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 413255806CD;
 Mon, 25 Oct 2021 11:29:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9IZMa95QxdFW8
 F6/H8kHqAEGM8P4RCek8PIOtrKbAVU=; b=iv0OaKuztPA7wrBwqXDJPpc3x+rmE
 CqTVogJoswQJvgKlVuG+d6coalzVQFG5vMUH9rEhNx42llZfT1jBmnnaSEAMZh95
 FRVP1PnYjyt5X+9F7+dqk1v2ZMesag+iAp+JQLOVzWyyq1ZQXQtn2oeTyBlbhnP4
 MZjipfRiqiFI19Xr9HFRqLNrH7DECmUfPajDS2+O4ffmG87NvCKShEHaD51tBKhV
 j7fdr6WmFqGpeiTX50KCvLt6vkc7pHpiyHPC7MiNrTXP/GD8qdVUGt32vOvnU9Kx
 AwYUGOkM+xs/oCp5kpjVMbt+zMM0CSOOXhtuj9lkD7AJ193BqSbCoTnMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9IZMa95QxdFW8F6/H8kHqAEGM8P4RCek8PIOtrKbAVU=; b=Wx2K+isk
 8HOFEQsvTfhXKlrMWoEYxH+vU9bUSfnuzSU/1wXKZHchRwuhOO00ZzmlAeGfuQtx
 gTFh6UEmHVrTQ8TkWZm8r9x7mN2Ep8/1ql52yLVhOio6ComYWkr1DQ+ylFoMpYQ6
 xIVZ1d2HAtGl3ly2D4bqLn+7ezH4XSCTcCzZUq00uJp853q2GGGD7wq/K2U75vK8
 NVD2cDYlD5h8fW+fsUzZjIw+/kXJcMw0pYm+JAJyVcQxxb6wvB4uXFg0mgQ9GC7X
 IQAvCsxrNMIuECe+c44yPKccLt3WV9OLtuFZTBF66B1h9I60DDL5DA6PW69rp1ra
 qcAE+l9Envn0fw==
X-ME-Sender: <xms:RM12YajtTu7ecien-O7WLq86n8DBgqnByHiO4TP-HOmQ82iEtMjUcA>
 <xme:RM12YbA89m873c25V9VPEmIiIUcuCsC5jtEKwy5l-i1IcIxFkxc8HqAsPjDkXOuCw
 FR5ElDlQdZxIbSQ2RE>
X-ME-Received: <xmr:RM12YSFP_m8PBdvQQMfpl2Y2OXLg_Vigue-B5hakQE2nT7jaT_ZHXX-4WLLBSZHCM4ENe8jwXYGtEWTFq5ipnaFmyump2NkKtFMmCuzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RM12YTTDrv8jJVmedExWjuSTkeVQxbGbJ5rUFQHUr_2-eIAcO6DZ9w>
 <xmx:RM12YXyZ_Sh4t4um7NGJLt2NzVF4fwIWKoPphcKEVorRDsPKkwGMkA>
 <xmx:RM12YR5eFtPF8V8V3UUPsXNpSqTJrUN25Fcm-x_cyAdWbkrS_aVevA>
 <xmx:RM12YcJIeSFCh-0ODUyQc0Qvs6U7FqaVSCs4uOe2CDvtI5XdXadvmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 01/10] drm/vc4: hdmi: Remove the DDC probing for status
 detection
Date: Mon, 25 Oct 2021 17:28:54 +0200
Message-Id: <20211025152903.1088803-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9d44abbbb8d5 ("drm/vc4: Fall back to using an EDID probe in the
absence of a GPIO.") added some code to read the EDID through DDC in the
HDMI driver detect hook since the Pi3 had no HPD GPIO back then.
However, commit b1b8f45b3130 ("ARM: dts: bcm2837: Add missing GPIOs of
Expander") changed that a couple of years later.

This causes an issue though since some TV (like the LG 55C8) when it
comes out of standy will deassert the HPD line, but the EDID will
remain readable.

It causes an issues nn platforms without an HPD GPIO, like the Pi4,
where the DDC probing will be our primary mean to detect a display, and
thus we will never detect the HPD pulse. This was fine before since the
pulse was small enough that we would never detect it, and we also didn't
have anything (like the scrambler) that needed to be set up in the
display.

However, now that we have both, the display during the HPD pulse will
clear its scrambler status, and since we won't detect the
disconnect/reconnect cycle we will never enable the scrambler back.

As our main reason for that DDC probing is gone, let's just remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7b0cb08e6563..338968275724 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -193,8 +193,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	if (vc4_hdmi->hpd_gpio &&
 	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
 		connected = true;
-	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
-		connected = true;
 	} else {
 		unsigned long flags;
 		u32 hotplug;
-- 
2.31.1

