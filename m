Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1735E1FA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CFF6E5A0;
	Tue, 13 Apr 2021 14:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70226E526
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4FF34166D;
 Tue, 13 Apr 2021 10:54:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Apr 2021 10:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LuOQk5RAkKI6i
 R1Tmdd65UjMydvRnA/88JIeEOIKERI=; b=rHt0A3kHsEtuwiiWsyOMJ8H+FtT++
 KwU9nq+MMd3+KtSLZ8oQ2nwLG/u/v4yDSJGM+l3X6ax5WKk525wr6lTJlmVXQTIW
 kIr0IIAgystirQGmBii3/d0vvuHBUb6vkIh5vDLFsxub4aKw7dvKaGcMbguXP9gb
 8YGc8NFAf1pMI2HatqbYJxNEO2w6uSAcu7MP46YxO2qZNrFyjsr7qlzYZ/nBEup5
 Y3vl+GHzdtiwTRcno39YTXFsLEoOuXeqkHjlaKB9xjoMOwI6Awv1lLLIQSGDTOsX
 lcOauCkjDtLjqRJPkYgWfgjvFLHZ23PMUII+dcGEjYTFT0wjPxaW0xSOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LuOQk5RAkKI6iR1Tmdd65UjMydvRnA/88JIeEOIKERI=; b=qpP00lPJ
 m6R/47Vel75EcreEzQZGRWx7pTVpx/BP5+atuVrZiPM4wOJy2KB0VHJSYbltZXYA
 Bownfa4o11EwI/tFc8Ylc7xOCTLH/qwWQHPGQ6126TgamJyFouQY/LwfMqz0IJ3W
 AeqQCot9Rg8OSyeoLj7xCcHrMjuQJVR16+fE9moR8ne0eSaohK/RZzVnsDwIocny
 pFELS9b+NTGf+cO+KHe7bOc0XpLuL1gOqiN/OLB/z/inaMhDfGlQjcdThUfxOnE6
 f6qgZrkV16jTBzL78bovnMaKCvr3q9Ka1kw339UMsEELG6mQ3A9MPtqkmYMqnkCy
 4UBGMAe4GG3A7g==
X-ME-Sender: <xms:urB1YEm026T9E8UinwRuPOV-z387h8Tu-iJT1Yi36kxndpkWnNQNwg>
 <xme:urB1YOx3Aabd8nfLrDsCZ85i7RbdE_xz4QibmeIXiowjCtBEPe9VERm7xO9LD5MNo
 F_XzI__t49Qqd6B3FI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:urB1YBqO9kOkStq8n2boXZlMhEm-WGzxShH1KYXcZlFfr5rpOwvNFw>
 <xmx:urB1YF7ha_7Ub6DXXlo7pgyiKOopUvbtvwgeJ3Cn7sNCnu_0LfkhLQ>
 <xmx:urB1YAdFVXIbuwgWs8no2Q85-iP3aAo8I7W3RUO5KgUedFSPd0gPvQ>
 <xmx:urB1YDHST6HZVpy-8b3IaCccXD2J14wJKbMPlG0uT3wu86s91dz6mGJyMb0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DC61240068;
 Tue, 13 Apr 2021 10:54:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 4/9] drm/vc4: hdmi: Prevent clock unbalance
Date: Tue, 13 Apr 2021 16:54:36 +0200
Message-Id: <20210413145441.483977-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, stable@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
