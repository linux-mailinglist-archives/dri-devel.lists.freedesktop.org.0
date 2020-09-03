Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4F25D1D4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02B6EA8F;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DD6E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 78FA7C26;
 Thu,  3 Sep 2020 04:03:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VYJZcnm8n2qDk
 ZAdxR7ODSjHKgxZo7hKnnWaOrgEa9k=; b=N2vxPO3vw5Jt6JUp6PkAFUcA3U1j9
 fToR2qtgbvqY1sALE1xs49YUS7bsKGEA/9NJdFd+W8SXHqFa0GaE7t6cozNzgX8Q
 p3PNVnrPQpx11EzUNzQz9ONcd7/nXIeI16pJrIBx1b1ccGEFjBWjv+aLmWxboq6W
 O3SJshQimwXxvAMl2PX+Fu583k8DrJO+H02wkvBjayrLJZSwn7uuo1Y3YojTdFiQ
 wYoD9yzpE38QYnFpvaTvxNHAUtOapH8/oG0sBIvOalu6G4avDnpRAWFm+ZDBdGnk
 3mwpN9mtTgVPqA9nGdXyW20fqtp44knVwA/p8lIkbtHFf8yZF8PWA4gRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VYJZcnm8n2qDkZAdxR7ODSjHKgxZo7hKnnWaOrgEa9k=; b=GIx+nOIJ
 NNTRGzHU9EE5UqJPmBCFWDPkuG2wNt5ag96u3mnMA44YyPzIsM7kqzCaoLUWLT73
 FwFTI+lDEMWL0xVVfNiglaYJSqAh10OvTUTjaImBNwPS5A+5MpHxiRIjKpI9S+j6
 SAczhBVBxh3E3hIsgVDKVV2/DxhBTKfErAODrVSYmOl2rz6+lTIz9ye21AC3euHv
 IQb5STtX8gn0etd/U3R62HcZN6WuAnwngaAyrJ60ssHp7MM1InUmPtYCzTo8Ef/9
 MEvivUI1aUwlNY9snUTc0b6xgEMCDcDxUPBQpjBtEjnX08FGpf5mH0DvT1vGLN+K
 JuLgETCW9lx6nQ==
X-ME-Sender: <xms:WaNQX2ROdYKNcLc-Yc2JpPteBwn0g07quwsTkyFT0Z_sdAkBnzzcNA>
 <xme:WaNQX7xUhjSLUoYaqFcK60fHzABLA5QcriRKDCiU3tL4irNeKJ5IamwbdJZR-r89P
 xiqbZ3iCuZrpadcgPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeije
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WaNQXz1UAyqSkXVXbq56bEEC14-WVnjnWiWcOkSX7Oy78POw_7t_oQ>
 <xmx:WaNQXyAYObTdDe7VDWKD_iy2GtdIGH-eQsRmPKOUqPjJ7QKrd-5GRw>
 <xmx:WaNQX_jJv0HF1KiFZ0e-9ntGVET4zpaEEnOrSPkKd7ImWk1FX05Qwg>
 <xmx:WqNQXyoMM7LL85SswU8gaUJGMD6EMZjTFEGx12gu8fi6q60efLBmP_D5dmY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7A673280064;
 Thu,  3 Sep 2020 04:03:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 74/80] drm/vc4: hdmi: Switch to blank pixels when disabled
Date: Thu,  3 Sep 2020 10:01:46 +0200
Message-Id: <fde3efb1ad79f4476a73d310cbba3ec07dc6dabe.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid pixels getting stuck in an unflushable FIFO, we need when
we disable the HDMI controller to switch away from getting our pixels from
the pixelvalve and instead use blank pixels, and switch back to the
pixelvalve when we enable the HDMI controller.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c |  9 +++++++++
 drivers/gpu/drm/vc4/vc4_regs.h |  3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8bf69cafdd7e..ab7abb409de2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -325,6 +325,12 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
+
+	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) |
+		   VC4_HD_VID_CTL_CLRRGB | VC4_HD_VID_CTL_CLRSYNC);
+
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
@@ -563,6 +569,9 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
+
 	if (vc4_encoder->hdmi_monitor) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index d1e8961edaa0..30af52b406f1 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -723,6 +723,9 @@
 # define VC4_HD_VID_CTL_FRAME_COUNTER_RESET	BIT(29)
 # define VC4_HD_VID_CTL_VSYNC_LOW		BIT(28)
 # define VC4_HD_VID_CTL_HSYNC_LOW		BIT(27)
+# define VC4_HD_VID_CTL_CLRSYNC			BIT(24)
+# define VC4_HD_VID_CTL_CLRRGB			BIT(23)
+# define VC4_HD_VID_CTL_BLANKPIX		BIT(18)
 
 # define VC4_HD_CSC_CTL_ORDER_MASK		VC4_MASK(7, 5)
 # define VC4_HD_CSC_CTL_ORDER_SHIFT		5
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
