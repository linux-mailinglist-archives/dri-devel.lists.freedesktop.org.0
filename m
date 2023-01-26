Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DF67D2BF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5213E10E94C;
	Thu, 26 Jan 2023 17:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801C910E94C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:10:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D72865C0432;
 Thu, 26 Jan 2023 12:10:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Jan 2023 12:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674753007; x=
 1674839407; bh=r8PfVgfg1/1/LZjTHHsJomA3Uy4NDG54RVBnB5RCyr0=; b=i
 OMneerGnFOg01mvXwYKOrilpgKgtN2YF2q43xZSo+mRI5twbkHDXaXIwgVSRouJ1
 65p3JF8o+6q2GcOnyVyKOE9ebDL57uQv+Wx5hDz+78wX6b3JlwQSkOxuIArignc/
 vQ+IUcQ63XwHhhr+fQW5sR9QLane19xyol7beemJQ/s+UGJqeHbwQe+f2gfb9qdq
 inswiE13VgzvaNEDKO9a9CFfz+uzqvi3DkYIPv732OwQtVkB/GKfc3dA5t7JEZ0n
 Ug/7qQ1atrz0+482puou0Z5zPYm9yFZ2TbVvGBGxT3tn37tO1S/GpJBUFPbbJ5oF
 oubgnACTLLlUM1FR1KIHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674753007; x=
 1674839407; bh=r8PfVgfg1/1/LZjTHHsJomA3Uy4NDG54RVBnB5RCyr0=; b=N
 o8++D68TaOHuEuvEILXJr6z7O+49rKKa6vOCJokzIte38Etazwc2Z0cKXXgUnVTc
 +0ePT76lzAOjkNe8CQwvZ+5MeDDlY3yOTqZb1MtJKDAOWzQ938dgFcYtrKAKUxH1
 P66yPIHyvn1EpG2o7fETP3vwB/z0uS5wr68+7FM6Q4NxjGejFRscHPFNSehMoFl3
 PYbXDH3pT2huERw7/TjRjdggm9lkluX7yNkw+yf4KN+h5D3gG169UBSGjTT1fjiN
 UteSy9cS63SHYZgedZOLC3PkUkQZTcAEAe2higU8EcPyhBrD1nBWwcBTbEqKUsiX
 O6piMwtZbMR07AP/DpEMQ==
X-ME-Sender: <xms:77PSY34L4Da-JcyF4G0JBy0cT_T_Xx3zkWXow9mCPX0bqIOiMMImlA>
 <xme:77PSY8401suvRE02LCLcvL77IrqsXsqusaGl_-bygdU7LR74mOD2EcOdtXZ2YyS7o
 kW7irSOUa5wQtifvPE>
X-ME-Received: <xmr:77PSY-fn7YY0z3xA5W834UowgoD07OL6h2qIaGxi6BSthufeDPpsOpSc40I_wSOtnRWXVFww3vvpCkvI294Xy2nEP_0HLOMQNeCEyptfNxzR9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:77PSY4KzfJGso5_D4piK_FfJQKFEQ-kUreJvvKKzuFcOw2TCkmuHyw>
 <xmx:77PSY7L-em_BXw6_t0dlrcCdC6fuuONyD5Tp7_LqERU34yHkulNwHA>
 <xmx:77PSYxz6MKGMl57AbWqauE6PIEU1AlmlFDgFeAFugmF47qVfr7C2vA>
 <xmx:77PSY0453PrdRCZeR5Bwf0m_pAZgZ4nIzIhSAfhGJXCi7IPZVA11tQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 12:10:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 18:05:47 +0100
Subject: [PATCH 2/4] drm/vc4: hdmi: Enable power domain before setting minimum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230126-rpi-display-fw-clk-cleanup-v1-2-d646ff6fb842@cerno.tech>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=kZGgOHx1L8Al+hD8WBITB+QjtYhPj3I6fD0qrBD3FhE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXNn1cUXxw3eOl1Z/WXv/I+yunIH534lFG8zne6xJjdvNM
 YFi5uqOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATyXRkZFh2WyvtZvbNrpbMb+3t7g
 eimY5tOa33UHp5oq7i21yDzzMYGfZccHvts+12IG9UNOdxnZVp0pudnAMat6oaL+R9fOGmMA8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the RaspberryPi0-3, the HSM clock was provided by the clk-bcm2835
driver, but on the Pi4 it was provided by the firmware through the
clk-raspberrypi driver.

The clk-bcm2835 driver registers the HSM clock using the
CLK_SET_RATE_GATE flag that prevents any modification to the rate while
the clock is active.

This meant that we needed to call clk_set_min_rate() before our call to
pm_runtime_resume_and_get() since our runtime_resume implementation
needs to enable the HSM clock for the HDMI controller registers to be
functional.

However, the HSM clock is part of the HDMI power domain which might not
be powered prior to the pm_runtime_resume_and_get() call, so we could
end up changing the rate of the HSM clock while its power domain was
disabled.

We recently changed the backing driver for the RaspberryPi0-3 to
clk-raspberrypi though, which doesn't have such restrictions. We can
thus move the clk_set_min_rate() after our call to runtime_resume and
avoid the access while the power domain is disabled.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 98fa306dbd24..9dd722b9ae3a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1466,6 +1466,12 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (!drm_dev_enter(drm, &idx))
 		goto out;
 
+	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
+	if (ret < 0) {
+		DRM_ERROR("Failed to retain power domain: %d\n", ret);
+		goto err_dev_exit;
+	}
+
 	/*
 	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
 	 * be faster than pixel clock, infinitesimally faster, tested in
@@ -1488,13 +1494,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
-		goto err_dev_exit;
-	}
-
-	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
-	if (ret < 0) {
-		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		goto err_dev_exit;
+		goto err_put_runtime_pm;
 	}
 
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, tmds_char_rate);

-- 
2.39.1
