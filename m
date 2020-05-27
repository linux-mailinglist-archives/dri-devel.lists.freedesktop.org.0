Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A61E59AE
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615A46E4A7;
	Thu, 28 May 2020 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE056E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 03D44582101;
 Wed, 27 May 2020 11:51:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JDEX6MAtxosDe
 l7oC/fdDO/+J0huIvOIGDcYTweJxI0=; b=x3eRxR4NffTRdfcoyyIj7gXOrg6B1
 jjqqGl37SonoO+MqSMFUESbdSiVX4DioNRBId/l9XNtOpk1mggRxqmCVcWRmV4na
 jbT8+15S/VAaANzakrEcVnuluMc9bvDcw6sgXuf7xkAABWQ7oiL/jgJmrxDkI17t
 cvh5iFfr9t9vcIIFCJJFeTiFKiUqgEG7De2GSt9nlFZnhfQWyoJfoebTQxVbWd0A
 Hne2mRlsCkguZsKRAQ3SjRkktHzWJAMUsPMGXg35BMU0DW0GBRA0vqBp33KpexQn
 R3F8KRDt9lo8EYhACtlHHiHbo+K70gNc0nE0ykfa5YsdcsT0anoH6ebew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JDEX6MAtxosDel7oC/fdDO/+J0huIvOIGDcYTweJxI0=; b=PYZrrH0V
 T2bzziBFlbEGOaS+ytete6XxyzrDCYH1HtHq49MmEB0cVm7TCaRNG6WFaed8sKBM
 WoNYFmAptJaS5lzWZDBFeNBTOTPTx1vcnTRVBoTWUZashX6G4ME9iJY0v5ueK/ik
 /QF6Cl623a9dtv6qZLSvbhY/bMBT0Y6o2TNex6aSx6sd6I4p9CjapDyRd9fcAw4r
 nu2VKwIuC4NkPDBzm0AhYayqfbVYDHJR9wlD2rI9uCHdWNhmihI+0NvI20FKYQSa
 pmaz9o7JzuAC7SHqWAeqogBN0tdgjSvG8lfYcS2dUtqDtzN+msNUWxy6dWSKMeOS
 Vm3/CjuIsa2Xtg==
X-ME-Sender: <xms:m4zOXin0eoXbTUjy4Wwqjab0bt_hPbnsoNBcIBgwYFVDRyQXx9r0KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m4zOXp3neDgaUFj3t6analbmLAOHqioyOT9amYyEkbikdmGVcE-sWA>
 <xmx:m4zOXgoErk0KyxwpJbjY1iYmVku4E4Bw4GIwV_k_k1F92pUeHhCgFQ>
 <xmx:m4zOXmkg1BTpY3ohSGRg5npgje76EhOJfC6fMKYnXbpkAP48x7kzQA>
 <xmx:nIzOXhmTDw5uQksbRQQQpunfPmrweuXj3tP1XHIB2YCTnxkGbCGgew>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90C75306215A;
 Wed, 27 May 2020 11:51:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 101/105] drm/vc4: hdmi: Do the VID_CTL configuration at once
Date: Wed, 27 May 2020 17:49:11 +0200
Message-Id: <733b4ae69521eb4e580efde2dd1cffeba9dcd80b.1590594512.git-series.maxime@cerno.tech>
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

The VID_CTL setup is done in several places in the driver even though it's
not really required. Let's simplify it a bit to do the configuration in one
go.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 86ce8d247a00..d889a83a0f56 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -429,10 +429,6 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
-
-	HDMI_WRITE(HDMI_VID_CTL,
-		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 }
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
@@ -521,8 +517,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
 
-	HDMI_WRITE(HDMI_VID_CTL, 0);
-
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 		   VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
@@ -566,8 +560,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) |
 		   VC4_HD_VID_CTL_ENABLE |
-		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
-		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET);
+		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
+		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
 	if (vc4_encoder->hdmi_monitor) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
