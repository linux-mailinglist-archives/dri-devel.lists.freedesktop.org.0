Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EAD6077DF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497010E285;
	Fri, 21 Oct 2022 13:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A6010E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:09:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57E9F5C0148;
 Fri, 21 Oct 2022 09:09:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 21 Oct 2022 09:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1666357753; x=1666444153; bh=6sSf5C+8ZLvEdt3bf9TTGjXPC
 q4RHmvxYMfr3/viAaU=; b=k7x8FUgtj7Z2FRGSpiKTv7u72SumyipP/f7uPb5fp
 t2HPvvMq+QKTX26YQlKPkwTJJIU1onJaGRBO9DmQ3Hte3rU8cxjVtSeV0Kl4tM/+
 lqgjVnuxtwVymLWomdWU4MqRkMhmasglpc6bha8QYWOAbCDOpro8Mg6roT+p52I8
 s/Gxaddy4gzo8j8alkEmB5LZTTnaE+RTp6+PN5zhjc0yVsFUUoG6yUZ4dBaLZ9ke
 Ap83/8pFT/wFA3mue5OznKsHn+O/JRRm2QZkM1C34BNqoxn7kNjWEiN8vPR41Fok
 YcV2YOBAL0nyMg/Dj33CB7Rhb/qdDLmyVSFP6Wolj0hyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666357753; x=1666444153; bh=6sSf5C+8ZLvEdt3bf9TTGjXPCq4RHmvxYMf
 r3/viAaU=; b=EDhENWF2EIxgpZCwvXtvy8ZczWvHyHmCJ28Z0x/8ajpnIqJK5zn
 pMPoY5/AmIlukZAQis8635MjGHbFKZAO0QhCrsICA4UQ898sHH4SfIpdlljns8jN
 53onBZZfHEMeZGXGlKEGXbFxtOHfin4MA74rM3VEiabSUfu6bYL/5aD5QRFXYp6U
 9ryvKGqnwxLoZkvGRS9/BFRjxJzcjRCPZCgO0HpG9Lp69OAR4P8Ts2PzwjUnrRKn
 Eb+tPW5TVxfIgu5UfytWtk44ILNNfvLdZg5uBS500pUsF42IBbxHEhyZ0FkS2QxM
 GPd8EdJwRIgBqeY/ZRoL69EHi1JX53MfgaA==
X-ME-Sender: <xms:-JlSYzYx8tbzf9Ijd2RTjtxt5jhRI7GdpQB6JfNqrwlx9Aj37khkGQ>
 <xme:-JlSYyaUE5eBwzXQQvhg0ks3uKb0zvqEg-fv6DDRZJzdAcRKIdxCSMHJsMWViurof
 JpZ5uudlm5n5l4iX1Y>
X-ME-Received: <xmr:-JlSY1-Q2GgFbKDO_NYySRy4_FzCpLNH0HISwjxidyf1oX2JcO0B_kHhqTvdpz9HioVTJW4yCnyGtA9gzHk48n2PTPuh-XL43W6Nm4HxF0L2sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeffudeufeevhfeikeelteetje
 ejhfegudeugfdvtdeghedvvdeggfehteehfeejueenucffohhmrghinheprhgvughhrght
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-JlSY5o-YvQNtsJ6htrxQqTlaSkD3LG0H0fXS6VZAG03Xx3yWX4e-g>
 <xmx:-JlSY-rHTtAOjzmxuEUusVAIaXxT5CwAbivffzFrbEvckZZaTlxKUQ>
 <xmx:-JlSY_T2xTGJXGw11refhvg1A64HITmsvofajK0Hr2Fh9t7-R69m-A>
 <xmx:-ZlSY0ieBT8DsV809V9FrBsMcisDUTYyYskYijUH6Wr5416wlZzY8w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 09:09:12 -0400 (EDT)
From: maxime@cerno.tech
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Fix HSM clock too low on Pi4
Date: Fri, 21 Oct 2022 15:09:08 +0200
Message-Id: <20221021130908.2202086-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.3
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
Cc: Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
runtime_resume") reintroduced the call to clk_set_min_rate in an attempt
to fix the boot without a monitor connected on the RaspberryPi3.

However, that introduced a regression breaking the display output
entirely (black screen but no vblank timeout) on the Pi4.

This is due to the fact that we now have in a typical modeset at boot,
in vc4_hdmi_encoder_pre_crtc_configure(), we have a first call to
clk_set_min_rate() asking for the minimum rate of the HSM clock for our
given resolution, and then a call to pm_runtime_resume_and_get(). We
will thus execute vc4_hdmi_runtime_resume() which, since the commit
mentioned above, will call clk_set_min_rate() a second time with the
absolute minimum rate we want to enforce on the HSM clock.

We're thus effectively erasing the minimum mandated by the mode we're
trying to set. The fact that only the Pi4 is affected is due to the fact
that it uses a different clock driver that tries to minimize the HSM
clock at all time. It will thus lower the HSM clock rate to 120MHz on
the second clk_set_min_rate() call.

The Pi3 doesn't use the same driver and will not change the frequency on
the second clk_set_min_rate() call since it's still within the new
boundaries and it doesn't have the code to minimize the clock rate as
needed. So even though the boundaries are still off, the clock rate is
still the right one for our given mode, so everything works.

There is a lot of moving parts, so I couldn't find any obvious
solution:

  - Reverting the original is not an option, as that would break the Pi3
    again.

  - We can't move the clk_set_min_rate() call in _pre_crtc_configure()
    since because, on the Pi3, the HSM clock has the CLK_SET_RATE_GATE
    flag which prevents the clock rate from being changed after it's
    been enabled. Our calls to clk_set_min_rate() can change it, so they
    need to be done before clk_prepare_enable().

  - We can't remove the call to clk_prepare_enable() from the
    runtime_resume hook to put it into _pre_crtc_configure() either,
    since we need that clock to be enabled to access the registers, and
    we can't count on the fact that the display will be active in all
    situations (doing any CEC operation, or listing the modes while
    inactive are valid for example()).

  - We can't drop the call to clk_set_min_rate() in
    _pre_crtc_configure() since we would need to still enforce the
    minimum rate for a given resolution, and runtime_resume doesn't have
    access to the current mode, if there's any.

  - We can't copy the TMDS character rate into vc4_hdmi and reuse it
    since, because it's part of the KMS atomic state, it needs to be
    protected by a mutex. Unfortunately, some functions (CEC operations,
    mostly) can be reentrant (through the CEC framework) and still need
    a pm_runtime_get.

However, we can work around this issue by leveraging the fact that the
clk_set_min_rate() calls set boundaries for its given struct clk, and
that each different clk_get() call will return a different instance of
struct clk. The clock framework will then aggregate the boundaries for
each struct clk instances linked to a given clock, plus its hardware
boundaries, and will use that.

We can thus get an extra HSM clock user for runtime_pm use only, and use
our different clock instances depending on the context: runtime_pm will
use its own to set the absolute minimum clock setup so that we never
lock the CPU waiting for a register access, and the modeset part will
set its requirement for the current resolution. And we let the CCF do
the coordination.

It's not an ideal solution, but it's fairly unintrusive and doesn't
really change any part of the logic so it looks like a rather safe fix.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2136234
Fixes: ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at runtime_resume")
Reported-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 ++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h |  5 +++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eb3aaaca2b80..715f0fe3d8e0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2732,9 +2732,16 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
+
 	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
 	vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
 
+	vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
+	if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
+		DRM_ERROR("Failed to get HDMI state machine clock\n");
+		return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
+	}
+
 	return 0;
 }
 
@@ -2816,6 +2823,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 
+	vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
+	if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
+		DRM_ERROR("Failed to get HDMI state machine clock\n");
+		return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
+	}
+
 	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
 	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
 		DRM_ERROR("Failed to get pixel bvb clock\n");
@@ -2879,7 +2892,7 @@ static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(vc4_hdmi->hsm_clock);
+	clk_disable_unprepare(vc4_hdmi->hsm_rpm_clock);
 
 	return 0;
 }
@@ -2897,11 +2910,11 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	 * its frequency while the power domain is active so that it
 	 * keeps its rate.
 	 */
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
+	ret = clk_set_min_rate(vc4_hdmi->hsm_rpm_clock, HSM_MIN_CLOCK_FREQ);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
+	ret = clk_prepare_enable(vc4_hdmi->hsm_rpm_clock);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1520387b317f..c0fd0423c84d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -174,6 +174,11 @@ struct vc4_hdmi {
 	struct clk *audio_clock;
 	struct clk *pixel_bvb_clock;
 
+	/*
+	 * TODO: Comment
+	 */
+	struct clk *hsm_rpm_clock;
+
 	struct reset_control *reset;
 
 	struct debugfs_regset32 hdmi_regset;
-- 
2.37.3

