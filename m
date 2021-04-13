Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537CA35DC4B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 12:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E16891DC;
	Tue, 13 Apr 2021 10:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F62A894C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 10:13:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B99CB1A9C;
 Tue, 13 Apr 2021 06:13:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Apr 2021 06:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vxAfKWUz0NKhL
 ZUP6I8hrOgd29LYwT2kjWWxWCI300c=; b=Z5lyCSM1dSj3tylbua6t80t8BtvtG
 aTH2FcEAc6Wfw7rUajBwNh4maw+TPhtuYfOvXXIsXsYV5QZveibk78LAQWgzZlot
 iOmvZre7SEnHIH4E1MWBmhEYa5Y/3yf4WQdUieg+v3wXYisVgd8uTG+g3VFJU35X
 wVzdyU3CS+ZnGozlbvbmmo1XLz4Jep/UwhO9GE2pfz3KSEOv94OLi+LY+av7o+zH
 qHGeQoVqqanc8biVqKfR2DO/oxr/MKMOWEw+Z6gh+cyIIFfCt1zqiA8ZWiAH8nha
 Bnr6jLF5Xfd9aGskECIqlXtibMKXDvS/fQsABs34oBOwwOEt6D95gf2Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vxAfKWUz0NKhLZUP6I8hrOgd29LYwT2kjWWxWCI300c=; b=lXvxWbK4
 GMb7mwMSacThP2Nx1V1iZk0wJikkC0+PdJlkpO78dwxzECzKErIJuFTHCn0G+vR7
 oiQkr6rEYioCnvlVhSjXC1801BdbOgFKdD5WBDU4a/BnoADAguaFNjIIq3Z6NMUc
 d8/AsqKjgIFMPwIRWzM1XaItW/Bqk9jQY3c4xDTWVO4kFaN+pM3X6J7lrjVrmDWp
 7CY7PQoNidm89WkxQPqyJjizf49OpEeKK3DT3l+ltoFXIBya124iKHGbYaOkSLzg
 9i0A2SniWJ1HMU/6VAFq0Tpks4QrEXGkJl8nvEGTf+FAW4r5cLtY/NXvZYzAhuX2
 xuib1uWXrb7x8g==
X-ME-Sender: <xms:x251YOrLn1TnGZJu15YLBY-eCWHRsiWA2m8GvBoKmURHHUUeCnpuYw>
 <xme:x251YMoq7MgZceDnQB8iyKzGm57a-El4qPsgJzfi5VrfXSRyYE1dvjY2yUrbVZu0Z
 pyWJNQ0uhVEV6adTqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x251YDMMmFBkQdO_UUq80z7N0sU5PU6dK71-AmpvfzDuY-8sV1v7VA>
 <xmx:x251YN5vmqlgxtSAviffPtzTLZcX_lxwOsxy7Y3MNQsQJJlTjc-Fxg>
 <xmx:x251YN7ZLtjvY7j-E806inVHNjxwDt8znNIEfOzGDRqfLlP1G5_NHA>
 <xmx:x251YEqycVV3fA8nCDr4xbKG6V0sUN7VB_QV2lLwKP6ncKej5UAAkmkC7wc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3CC924005D;
 Tue, 13 Apr 2021 06:13:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/vc4: hdmi: Convert to the new clock request API
Date: Tue, 13 Apr 2021 12:13:20 +0200
Message-Id: <20210413101320.321584-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413101320.321584-1-maxime@cerno.tech>
References: <20210413101320.321584-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new clock request API allows us to increase the rate of the HSM
clock to match our pixel rate requirements while decreasing it when
we're done, resulting in a better power-efficiency.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 ++++++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1fda574579af..244053de6150 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -473,7 +473,9 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
+	clk_request_done(vc4_hdmi->bvb_req);
 	clk_disable_unprepare(vc4_hdmi->hsm_clock);
+	clk_request_done(vc4_hdmi->hsm_req);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
 	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
@@ -778,9 +780,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
 	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
-	if (ret) {
-		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
+	vc4_hdmi->hsm_req = clk_request_start(vc4_hdmi->hsm_clock, hsm_rate);
+	if (IS_ERR(vc4_hdmi->hsm_req)) {
+		DRM_ERROR("Failed to set HSM clock rate: %ld\n", PTR_ERR(vc4_hdmi->hsm_req));
 		return;
 	}
 
@@ -797,10 +799,11 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
 	 * at 300MHz.
 	 */
-	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
-			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
-	if (ret) {
-		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
+	vc4_hdmi->bvb_req = clk_request_start(vc4_hdmi->pixel_bvb_clock,
+					      (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	if (IS_ERR(vc4_hdmi->bvb_req)) {
+		DRM_ERROR("Failed to set pixel bvb clock rate: %ld\n", PTR_ERR(vc4_hdmi->bvb_req));
+		clk_request_done(vc4_hdmi->hsm_req);
 		clk_disable_unprepare(vc4_hdmi->hsm_clock);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
@@ -809,6 +812,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
+		clk_request_done(vc4_hdmi->bvb_req);
+		clk_request_done(vc4_hdmi->hsm_req);
 		clk_disable_unprepare(vc4_hdmi->hsm_clock);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..9ac4a2c751df 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -167,6 +167,9 @@ struct vc4_hdmi {
 
 	struct reset_control *reset;
 
+	struct clk_request *bvb_req;
+	struct clk_request *hsm_req;
+
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
 };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
