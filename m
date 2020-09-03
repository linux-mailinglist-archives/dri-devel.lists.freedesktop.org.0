Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646C25D1FB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11C56EACC;
	Fri,  4 Sep 2020 07:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8A6E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 59740C18;
 Thu,  3 Sep 2020 04:03:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7xfe+tngvDJEY
 yUZhayJC8QppzfdlwLaBZR0Cls2PKk=; b=cDAp9pcmmAjzSkzW6PCfYurgzp2S/
 lloNta+FniysiGwo/Z7KYRo3PMIbZAczW+Bzhkqh0BiP0S5CeNc0ibJ+HfuoFxIz
 dhty100SiMFZCAe3DbhAlh9ZiRrKQcSZSrrVeux2j4JZvhyz2l3oMNSn4dYX+PTQ
 CUu99lez8j5eCWxE4OEblco3WB4uKfWNrwmKQuVvcKSQqLx+ndH/JDvniVRtJMGk
 AaSYLeyt4GHt25tOcFbRUIyJiZ+Yj3EJIBpnIPdzsNJve4ItxizfT87JJUqnni9Q
 3s+s5+DnkuEgHs61YK1O6El3ksqkQG8flHaGT+1Bht6i1WGG0tMgQUgWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7xfe+tngvDJEYyUZhayJC8QppzfdlwLaBZR0Cls2PKk=; b=GJR49dxW
 6IBXLqWnkyf72+VJOp5lV6LXGbBVzZl5c+JoY2Ulu29yVLhtjxpZSZjs0LCqiY7x
 nHBGXp5A/ZVcThs8PndsOah2ooUaOvs09E5OIdejzo/T8OedlfImTv5aV8fsBT6D
 iUGynUt6gtf0NAF6M+e52QkwBt7sGppx2ENw07oT9eBqyUau5w81Hu1cKeQqKvYg
 8jjMIgFyVr0yE7V+Ys7YjnyV8ghBmTeG7Db+ZA2c7sZjvtPEK5D9XvsiZTycJU1p
 9c/0ocqNyje0qRqSNQElMsza5OcW8nJeGPOF3GMVvl99XbDIB95dwRTowyT/uHIc
 IBLmWyckwHlWNA==
X-ME-Sender: <xms:VaNQX0EScVT9I_3-rQecQE5Nqy4L9h7o-CagpCHSa1vHLg_bZ3mc5Q>
 <xme:VaNQX9VHbQQTKw6MUBCt0VXoo_fNIaerGaek4bWgJVAZgrRbsLPzez_TjL4XkjoBE
 RyzVxIbgZrdrl7kva4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeije
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VaNQX-JLzfYAtkPl5cHp1o6ueo3K71wcuQURl5UypX2ra4pFDVPKlg>
 <xmx:VaNQX2HH0byuLFHsk64cOEP-9iHPNZZBi3M2aoIKQRGHpuD6EedepQ>
 <xmx:VaNQX6XOIgbgH7_u-McmvEOcbEUOI1l65F1ajSWad6-D6RwadUxCsA>
 <xmx:VqNQXxO0kevK005VXW04D1sknp3XTOthZFuzVi3Fv73vGXSBp0YIWtNavEk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 964CC306005B;
 Thu,  3 Sep 2020 04:03:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 71/80] drm/vc4: hdmi: Always recenter the HDMI FIFO
Date: Thu,  3 Sep 2020 10:01:43 +0200
Message-Id: <b3faaf05ac6c4d3c364d28fa441571eb85903269.1599120059.git-series.maxime@cerno.tech>
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

In order to avoid a pixel getting stuck in an unflushable FIFO, we need to
recenter the FIFO every time we're doing a modeset and not only if we're
connected to an HDMI monitor.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3c7862a1dda8..c9eae5352b9a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -425,6 +425,30 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 }
 
+static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
+{
+	u32 drift;
+	int ret;
+
+	drift = HDMI_READ(HDMI_FIFO_CTL);
+	drift &= VC4_HDMI_FIFO_VALID_WRITE_MASK;
+
+	HDMI_WRITE(HDMI_FIFO_CTL,
+		   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
+	HDMI_WRITE(HDMI_FIFO_CTL,
+		   drift | VC4_HDMI_FIFO_CTL_RECENTER);
+	usleep_range(1000, 1100);
+	HDMI_WRITE(HDMI_FIFO_CTL,
+		   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
+	HDMI_WRITE(HDMI_FIFO_CTL,
+		   drift | VC4_HDMI_FIFO_CTL_RECENTER);
+
+	ret = wait_for(HDMI_READ(HDMI_FIFO_CTL) &
+		       VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
+	WARN_ONCE(ret, "Timeout waiting for "
+		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
+}
+
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
@@ -543,8 +567,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	if (vc4_encoder->hdmi_monitor) {
-		u32 drift;
-
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 			  VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE));
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
@@ -555,25 +577,9 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 			   VC4_HDMI_RAM_PACKET_ENABLE);
 
 		vc4_hdmi_set_infoframes(encoder);
-
-		drift = HDMI_READ(HDMI_FIFO_CTL);
-		drift &= VC4_HDMI_FIFO_VALID_WRITE_MASK;
-
-		HDMI_WRITE(HDMI_FIFO_CTL,
-			   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
-		HDMI_WRITE(HDMI_FIFO_CTL,
-			   drift | VC4_HDMI_FIFO_CTL_RECENTER);
-		usleep_range(1000, 1100);
-		HDMI_WRITE(HDMI_FIFO_CTL,
-			   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
-		HDMI_WRITE(HDMI_FIFO_CTL,
-			   drift | VC4_HDMI_FIFO_CTL_RECENTER);
-
-		ret = wait_for(HDMI_READ(HDMI_FIFO_CTL) &
-			       VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
-		WARN_ONCE(ret, "Timeout waiting for "
-			  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 	}
+
+	vc4_hdmi_recenter_fifo(vc4_hdmi);
 }
 
 static enum drm_mode_status
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
