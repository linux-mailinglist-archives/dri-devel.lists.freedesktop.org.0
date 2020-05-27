Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19011E59AF
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C886E4CA;
	Thu, 28 May 2020 07:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D626E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B5CC582101;
 Wed, 27 May 2020 11:51:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=d65+1uw8oGAwy
 EgBRSw7oIikorpDLZOAwmmgqX61Vxs=; b=EcBQa9pDVStORYd6d1azjZE+ESG/L
 repjA1nKSLE0W3r8bNH5B9EyMcwuKUP0trwq7J5SY4LC3Lj6nSKg+NTETS8BXoGI
 suFQTSH+QH3x5dsSdVix+qJEzqygbBFpT/ax5lA8B6nk0LzeC6PNp2PGEh6Q+ATC
 d+MUFJkyBy4MpMaoAXmykScDNT5GHN4X/LEU+Oh4DRJZRKinU/tSu7ipBpSwQo3/
 73XTyficDcFt270nZ0V3Q01xn7ofPpDrTaCVId9oIhjeMxJUlCnUG/GhIEoQbSp+
 oWE6fw7gDDCzAOOB6qvtjaD4CDiF9tibCkYZFHEojt5pcYBHNhY50VUig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=d65+1uw8oGAwyEgBRSw7oIikorpDLZOAwmmgqX61Vxs=; b=AcWMGYTd
 wmDkLEL7owLMHO1LnMIiG6RfVX++TS8qJAyIWfF6wDEP0gxxKrj7rH28Gy6SY+TQ
 WTlKlJ7AmG6kwJ9K0YYsYwnkvnlepvEWWrfdQWlRdpBVISl8BFbPtVqcs85Gq/wT
 6uFcfsQu6+QmmTPwt2xq00+d5oQyIwr8pNuLUS6n4d2bFfHDyT2gZcGVzHqZaZ5p
 OX3OdPt9qEwO6ilx8/Qeijtquc/pjrZmYOKBIxrEy484b2N3QL8Py0I2N34pHGQn
 pEpHCZnbDgoxFB74VOJuW116Tu3o3fwTFUKOVdv7aIYRIS2ZSPvFi3b4KG/O60EP
 M98LDbuDpzIrmQ==
X-ME-Sender: <xms:l4zOXp6uZF60LfP17s9Mk8DioE9vwAZKAcSbl8GiVKbOk3EXCYo_Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l4zOXm5pXusCJoz6PzFdF8AJyQ7ruUHpp_Bvk6KwdpQZAXBUoKFd1A>
 <xmx:l4zOXgcQtJba6O3_QCYZ1YhW8lCqa6kDY0wp1JrjZUzVcjGShQ0_0w>
 <xmx:l4zOXiKJaA65WBpSWFTRLvGQrFcnRDJ7Wh4xaxMw79Zpdh0sbxdeUw>
 <xmx:l4zOXiorDXgkF46-Dde8hUrBfyq0rlwhy0Q8qmsvY5ar7agDU4-DUw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 035433280064;
 Wed, 27 May 2020 11:51:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 098/105] drm/vc4: hdmi: Remove register dumps in enable
Date: Wed, 27 May 2020 17:49:08 +0200
Message-Id: <b18fa139a3d96c334954175748efbc656d6c53fc.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code has some logic, disabled by default, to dump the register
setup in the HDMI controller.

However, since we're going to split those functions in multiple, shorter,
functions that only make sense where they are called in sequence, keeping
the register dump makes little sense.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5ad983ce87d1..4b23d589377a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -430,7 +430,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
-	bool debug_dump_regs = false;
 	unsigned long pixel_rate, hsm_rate;
 	int ret;
 
@@ -489,14 +488,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
 
-	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
-
-		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs before:\n");
-		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
-		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
-	}
-
 	HDMI_WRITE(HDMI_VID_CTL, 0);
 
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
@@ -522,14 +513,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 
-	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
-
-		dev_info(&vc4_hdmi->pdev->dev, "HDMI regs after:\n");
-		drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
-		drm_print_regset32(&p, &vc4_hdmi->hd_regset);
-	}
-
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) |
 		   VC4_HD_VID_CTL_ENABLE |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
