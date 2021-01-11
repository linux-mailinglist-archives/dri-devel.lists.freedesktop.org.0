Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE442F2977
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD9E6E110;
	Tue, 12 Jan 2021 07:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5507A6E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C0A77580676;
 Mon, 11 Jan 2021 09:23:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jan 2021 09:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=y5a4AZQCjSaKy
 3iWjD7TJ49t/ESJPK/f64O6IhJsz2U=; b=a8eCPavE2VqoYxW9t2Q3iz1OwR8sB
 aCYlgBYEjiNKkc2SJyB5Kx9pIFJHP5CzwTQR79zH3IfddFNxBYyo+412LiMtQYOe
 eUtFG/H9G9279+iQ+FAdsFV3I66Mdqyrh43MNW0l5P5UyoIWEQSIYshU6e1lTv+h
 FWmCz3FkknH3GoZjItYl7yiKMlXZvby3kAImdXsXCjupEzZWx6/4Pdbb7DEnD94L
 bYDsWieatrrFnZpuG66sZscr/yi7LKNZbXLrnaxASLH7GjivFQ39lyv38cTpck8c
 Hu1TZSebciDBUilYmecV1SKECrGBFBoF4PP6HX2RIHsipfxH6CZvYK9Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=y5a4AZQCjSaKy3iWjD7TJ49t/ESJPK/f64O6IhJsz2U=; b=GPDlHtCc
 IxHI1uYaAK7AnuaXklI2DPCHa8m8e7e7KoByK+vXjqg62oUap7P+IFPFovYEZPvR
 IiXLjnbYa5KSht2e3GGzC72ERBaDT6aTrulao3bUBMR0be3QRnXEuuE8zU0VBLxh
 cWXmpkmJ+cWHgryVtbHENtEet5a9Uyp7W7PFhtRI/IK6ovCpUexUzm9yW1k/RQqC
 Z1kU0xiA+lYGQaDQIUCVDGrmZOnjzg1m3zVF+pMJR1ydR5Z/QLa0DQqM2Kc4uLkL
 5XTyj0TDEftJotjTxVycVd1uzhkLuTs+82RJw2mUOGk5IHpJhvXUbR83he/Yxjj8
 TOubgCGjPT5CIQ==
X-ME-Sender: <xms:Wl_8X-dLUn8a5-Y_uGCr0mrrcsGl4qJCSy3OP9M8QgVW1UTXXuC56Q>
 <xme:Wl_8XyP5GOaQuZplQpGiQw4v-92WDKUikazSbVDoT2yTP-pEyggsPzTyPdQLItXEv
 bzfy5O8_H0Xnrb2Pao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Wl_8X2IU-pbsWbxtIgUEXMJ8PW6UMdoHUUIu3KOmiHgtkW2X6hKh6Q>
 <xmx:Wl_8X6K32p2ECFYUbgDL9OjoFPbEkH6MzMwTWum9g7I7A_60X-Vqyg>
 <xmx:Wl_8X44MN_8q6OsvHe3vu4ALG5Uy39nxbmiSgURqXDXDCSi06CSmHg>
 <xmx:Wl_8XzymEcDVRiFZE6cN-077QisjLGjWZck9Sl9LD52EUwOibcxEiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B1D524005E;
 Mon, 11 Jan 2021 09:23:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 08/15] drm/vc4: hdmi: Introduce a CEC clock
Date: Mon, 11 Jan 2021 15:23:02 +0100
Message-Id: <20210111142309.193441-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the BCM2835 had the CEC clock derived from the HSM clock, the
BCM2711 has a dedicated parent clock for it.

Let's introduce a separate clock for it so that we can handle both
cases.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0627b8db32f6..7b5c92df8f1b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 	 * Set the clock divider: the hsm_clock rate and this divider
 	 * setting will give a 40 kHz CEC clock.
 	 */
-	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
+	clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
 	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 }
@@ -1752,6 +1752,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
+	vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
 
 	return 0;
 }
@@ -1845,6 +1846,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->audio_clock);
 	}
 
+	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
+	if (IS_ERR(vc4_hdmi->cec_clock)) {
+		DRM_ERROR("Failed to get CEC clock\n");
+		return PTR_ERR(vc4_hdmi->cec_clock);
+	}
+
 	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(vc4_hdmi->reset)) {
 		DRM_ERROR("Failed to get HDMI reset line\n");
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4c8994cfd932..6966db1a0957 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -155,6 +155,7 @@ struct vc4_hdmi {
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;
 
+	struct clk *cec_clock;
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
 	struct clk *audio_clock;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
