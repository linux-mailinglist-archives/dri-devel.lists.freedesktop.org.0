Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4F25D21C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3436EAB1;
	Fri,  4 Sep 2020 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DED26E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 628C0C73;
 Thu,  3 Sep 2020 04:02:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=p6ASSALBj3trP
 I2b5fKvIn475D/TYRNvZYPVKAGOypE=; b=l1oId/VtqfMuWyNqyJnpgWHQpeZLB
 tXKsRIPQI0jgyxSjBxgZSG88ssGDn2/z2sCfebB2fRAHx3XvWyCGVMcwf6JkMj/P
 rBr9uofjEk143Tj1iwMOyg0hkQLEREKxy4yXgTO0rrRvJfsvHbxcPb6lyLNKO6TZ
 YNnUvFBEbxqh8gyBotzF4NBARYn7PWr11WVKVKV9advjfYuvuKUwt/ACXc1jgBuB
 GV/1RbWS99DsyVcAYM5pMbLI4fLF/PUyBMFTvjwy8me53ZtkZw0hfCw1Jbv0mtrh
 Zfa8CFYRhH/LkqnvgILrl0GoypXWgJsFTimmcZXk7ExaJNp1lDdEUHg7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=p6ASSALBj3trPI2b5fKvIn475D/TYRNvZYPVKAGOypE=; b=PQxM7x84
 J5jaJa0sD5VVszrYo843fEwAP3XYlJcq6Lw0iUWJzQ7z3wLZajQG20e4RV2MIC69
 7JtZ+ckNrMlYvXXytuqGXeWHOHV3+bi3TLghlTjVHWvaQVWTeZFahoHS/aj2oUea
 Ay2eL+LVMBIot2OT0srkqHjieIlnxU+HkD8hY+XwjLLrhow/S8lVILswAqq0JbJs
 NjSwQOaFtOmt4NetCBncxLMXJi8UpwcB3x0UXs8g7mLmKC9YH88HLL7Hn6nhCYvp
 6aYHBXUCuqZtfGT1UrKm00NH+09WpX/D/NSF7lnreeQUhrpIdgeDI/Nxadw0927T
 izgiIQJLmG7rSw==
X-ME-Sender: <xms:H6NQX5KHMpwXjX5Av8h4uWxTi_R-hx3keteB64cZWfDCvsgMba8hcw>
 <xme:H6NQX1IB38VbuNmKHeKf6WmE7FGbw63VdbuChdv-UnJaWokeZqtP3JBiIJ2u9DDrO
 6_ide8AmB6N6kvmmDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefvd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H6NQXxuUG-ZJ3F5Pc60vM0dd3SwuT2nn2pNk8ZvdlTM1RGz9VD0CYA>
 <xmx:H6NQX6a9lfj8Dl4to9sM5sJma8al-jm7G5EmA5fUGZfb5Zdkf6na2g>
 <xmx:H6NQXwaocGWhsC7MKLNFmYUbbHfw3d5ybpkkowUpcBgnz_tpwJWWRw>
 <xmx:IKNQX6AVanyZ2FFTqiQu3w-iGIrSIq6LVQlayper2BREBkJQ23a6gu-RAAw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A7AA306005F;
 Thu,  3 Sep 2020 04:02:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 33/80] drm/vc4: hvs: Introduce a function to get the
 assigned FIFO
Date: Thu,  3 Sep 2020 10:01:05 +0200
Message-Id: <178192d90874559b8386139f2226e773347729fc.1599120059.git-series.maxime@cerno.tech>
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

At boot time, if we detect that a pixelvalve has been enabled, we need to
be able to retrieve the HVS channel it has been assigned to so that we can
disable that channel too. Let's create that function that returns the FIFO
or an error from a given output.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +-
 drivers/gpu/drm/vc4/vc4_hvs.c | 54 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 554c2e29b23d..860be019d8e3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -908,6 +908,7 @@ void vc4_irq_reset(struct drm_device *dev);
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
+int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b5ee9556e821..4d0a833366ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -19,6 +19,7 @@
  * each CRTC.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/platform_device.h>
@@ -196,6 +197,59 @@ static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
 	vc4_hvs_lut_load(crtc);
 }
 
+int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	u32 reg;
+	int ret;
+
+	if (!vc4->hvs->hvs5)
+		return output;
+
+	switch (output) {
+	case 0:
+		return 0;
+
+	case 1:
+		return 1;
+
+	case 2:
+		reg = HVS_READ(SCALER_DISPECTRL);
+		ret = FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg);
+		if (ret == 0)
+			return 2;
+
+		return 0;
+
+	case 3:
+		reg = HVS_READ(SCALER_DISPCTRL);
+		ret = FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg);
+		if (ret == 3)
+			return -EPIPE;
+
+		return ret;
+
+	case 4:
+		reg = HVS_READ(SCALER_DISPEOLN);
+		ret = FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg);
+		if (ret == 3)
+			return -EPIPE;
+
+		return ret;
+
+	case 5:
+		reg = HVS_READ(SCALER_DISPDITHER);
+		ret = FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg);
+		if (ret == 3)
+			return -EPIPE;
+
+		return ret;
+
+	default:
+		return -EPIPE;
+	}
+}
+
 static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 				struct drm_display_mode *mode, bool oneshot)
 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
