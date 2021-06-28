Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F03B5EAA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 15:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA33D6E0CD;
	Mon, 28 Jun 2021 13:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81E6E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 13:05:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B087D5806B1;
 Mon, 28 Jun 2021 09:05:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Jun 2021 09:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=pJDoaEKICoxjXDVlY/UTHzlsuR
 SeWoO2PgHJjPp/Lyg=; b=RppTGqKqcZhZzad1XqGjUzuADb9IG7wCZFBSOGyQVt
 MzSfS7XvGomrP/nvAY2QUWvzBqBeY1c3uWLTja8ivcHwHGTgkyPo/KR1gJOwFWnF
 JDXp8AejsnHiMtuXLrioSPhN8CnMsj3a5/agIKFygTHFyBZiwn8igkEznCSt1Uiw
 +lOkMqfaJjd24mu27RFRdKzzAvm9hcPSjeTb84WIFCncu36gu/mHKUgDGJSB3Mw+
 3Vpca9Cn15hzm3XEZ0pr8+LiFPxB1gJKfnZEM5CwxR6Pp4sJt4DZxZ9aqtdd4Eg5
 Lx5rSiRdz8QxQDWS6JwLVm4HPe12VFoTd0vcFj3yDlgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pJDoaEKICoxjXDVlY
 /UTHzlsuRSeWoO2PgHJjPp/Lyg=; b=nBxkdVJTfocxYD9oLD54LH7HsEfKlZZQs
 xKNJltEukCFEDVHgrZZ16ZSQkAsUFrv/nGfUF/udhS6UXvpMgSzSPnzQMeXcFLEo
 e2S5l3lri8Sk3vpeWEEjru6pl3sMr4x7qnhLDnfWRCrMgO6K0KsOxLb8NtkqKJPn
 zpA4Ai3/Xmw5RJf+M6ARx8Aq2FR0rnFntjX/HBzqDo6M9ieldhwKmfhw0UJqNonz
 L8BXwq6GKdVZ8s6akS10PYkZHHAnD62nGGEVzBium1o05//1swgBOb8uqkeVym3L
 sj6BWYKv/uuxWEiObu6vfyDJ9hOHsHX2FluiLT5mjvo/j61D7utEg==
X-ME-Sender: <xms:H8nZYJuRHHTUEd7ib-L5vMIB0vUqw4UaaxMlrl7HcepKIoKI_JuAtA>
 <xme:H8nZYCdd1QdWqf1attPv9brsVwsdwYYCruRvStwUM0OkyCBpbqfBXEvsmwKfidjqW
 lQf9BGez5ayNSJ0z7Y>
X-ME-Received: <xmr:H8nZYMwL3rA1wQvHk4MCGuvoROOH9lp_FNjvOqLGMxyyWkC3uvVnmp4P_S2_qQQE-2wFxpFD2YiIW_4mYSg839Mn-ly7uL-IJpmf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H8nZYAO6F9petE1j2Ib1F3v-B5m27TmYMLI_aOkcwh8zTdyHmX0RLw>
 <xmx:H8nZYJ-pQH4fa9ERldvz06vu5iSo5K2BeRwwXFGRq0M_A3xZCWPr_w>
 <xmx:H8nZYAWvZ5udT-5xLyoeek_qXA1epS-RotRnHZS32TrocJa1rmkmEA>
 <xmx:IcnZYIcscGcgWcz5Oywh10VGc4DGP3q6OJVVzuWmXHXDduIdVFeX6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 09:05:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm: vc4: Fix pixel-wrap issue with DVP teardown
Date: Mon, 28 Jun 2021 15:05:33 +0200
Message-Id: <20210628130533.144617-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tim Gover <tim.gover@raspberrypi.com>

Adjust the DVP enable/disable sequence to avoid a pixel getting stuck
in an internal, non resettable FIFO within PixelValve when changing
HDMI resolution.

The blank pixels features of the DVP can prevent signals back to
pixelvalve causing it to not clear the FIFO. Adjust the ordering
and timing of operations to ensure the clear signal makes it through to
pixelvalve.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4ebe216b10a9..472a9d6b5866 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -605,12 +605,12 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
-	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) |
-		   VC4_HD_VID_CTL_CLRRGB | VC4_HD_VID_CTL_CLRSYNC);
+	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_CLRRGB);
+
+	mdelay(1);
 
 	HDMI_WRITE(HDMI_VID_CTL,
-		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
-
+		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 	vc4_hdmi_disable_scrambling(encoder);
 }
 
@@ -620,12 +620,12 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	int ret;
 
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
-	HDMI_WRITE(HDMI_VID_CTL,
-		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
-
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
@@ -1017,6 +1017,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   VC4_HD_VID_CTL_ENABLE |
+		   VC4_HD_VID_CTL_CLRRGB |
 		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
 		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-- 
2.31.1

