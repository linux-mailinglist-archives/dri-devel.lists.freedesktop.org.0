Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A725D1F6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBEF6EAB4;
	Fri,  4 Sep 2020 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C296E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C0E90968;
 Thu,  3 Sep 2020 04:03:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=W3jTdUJQ/fQ9U
 6n9j8TV+b0Zs3VBSL0+lMyVJA7yrdw=; b=Qyopi9dTJPKjOBJeNKRFzQk5mlATa
 I019YnX3FrmSS9RF1PfJdnASIPaYd2yJ497GFTd4lzhOrguD1v4+0bs+ze+9wuNi
 ug1S1pKWV1Zi894bjlo3CcKQ+CE+aDcaxnKcB5hx8cwbNqkvwW938hIcb6hvFVzm
 j6HwxRNXzLv9vCT4qOiO5vw+2CrMxbuhgs3S5Sc/Im4U0VWvRB49B0hDZzN+b0XP
 oZJU4KO+//mDMIyQ6mV5ppAR2Xe+EKRqWoR/NwgwMfkdQ798uvejwcvU1EnWSTLn
 cdE20aBlikrtsHHL7031vOvSt0eer8SazoQZZrNZlTL+P6mAYzV+EKGJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=W3jTdUJQ/fQ9U6n9j8TV+b0Zs3VBSL0+lMyVJA7yrdw=; b=Q+CCcgPf
 i8Q7/S3T0E3pgcnuhrPjseRnNaZbAk+CvEzHjXlESwY6LYrDfKWyuaRtDpeFHAjh
 xShShFWXJSqF4otmabdredpK++v8QeCEfHq0eItDsgOLqlHS5FT6pefS9DDdwec/
 8uvI71GIoxY5ddY/XTfoWfysygkxwkl2z3JnyjatWDWhFrQ1WgPA5hWdG3IsFrQA
 3T1F3NGH52AquAs9qNMiww8A+AbWtU3ihhK5e88hoFsXarIQZJZdBBbNPZ+fwVnj
 CZ05SZ68Ut2Syo+bqA2sAde7QxJhr8euXlBQoonm0Xn8IwXZx+yX4k4taCVeUQD8
 3V5SZi9vN2No8w==
X-ME-Sender: <xms:W6NQX_Kic0pccUJ1pl-b7p9Hx2M5eSNvYq0ZKQd6faTMVArrt7s_BA>
 <xme:W6NQXzLpr_IOrkCiMUiiIBCHWIqXMn5ZEDn9YborASHNSU_X2oYFZkJclVuJum8-d
 Lcwl-t5ZWe23QdLh6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejteeuleduieekgfehtefhfefgkedtgfehfeelteehffduvdelgeffkedv
 hfdvffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W6NQX3uO4a16W_PrsGiw0Nwv7Se9_Nr3buR5UEagLVycOHzokUqbwg>
 <xmx:W6NQX4aYU_fyTDIFmapvcaqzaEbR4gDRC4EDr54TS6zrSbdEHAV7yQ>
 <xmx:W6NQX2YZbHWMBbOSZv3rnqY4yPzq-FTd9UeUk_3yslssCOGB_7y0eg>
 <xmx:W6NQX8nmN-2Rj6Chr3YszXtE3EUkRpzYP7Y48TzkvjAV0ZYvTlT6_UOckxI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 104153060061;
 Thu,  3 Sep 2020 04:03:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 75/80] drm/vc4: hdmi: Add pixel BVB clock control
Date: Thu,  3 Sep 2020 10:01:47 +0200
Message-Id: <d757ddd6549da140f178563e5fd2bf1d129913fd.1599120059.git-series.maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hoegeun Kwon <hoegeun.kwon@samsung.com>

The BCM2711 has another clock that needs to be ramped up depending on the
pixel rate: the pixel BVB clock. Add the code to adjust that clock when
changing the mode.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
[Maxime: Changed the commit log, used clk_set_min_rate]
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://lore.kernel.org/r/20200901040759.29992-3-hoegeun.kwon@samsung.com
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ab7abb409de2..39508107dafd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -54,6 +54,7 @@
 #include "vc4_regs.h"
 
 #define CEC_CLOCK_FREQ 40000
+#define VC4_HSM_MID_CLOCK 149985000
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
@@ -344,6 +345,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
+	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -516,6 +518,27 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 		return;
 	}
 
+	/*
+	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
+	 * at 150MHz.
+	 */
+	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
+			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	if (ret) {
+		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
+		clk_disable_unprepare(vc4_hdmi->hsm_clock);
+		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		return;
+	}
+
+	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
+	if (ret) {
+		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
+		clk_disable_unprepare(vc4_hdmi->hsm_clock);
+		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		return;
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 34138e0dd4a6..59639b405b7f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -119,6 +119,7 @@ struct vc4_hdmi {
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
 	struct clk *audio_clock;
+	struct clk *pixel_bvb_clock;
 
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
