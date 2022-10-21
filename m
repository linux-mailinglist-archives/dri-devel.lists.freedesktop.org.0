Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D94607802
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A80110E2CD;
	Fri, 21 Oct 2022 13:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABF710E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:13:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2BEC75C0161;
 Fri, 21 Oct 2022 09:13:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 21 Oct 2022 09:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1666358024; x=1666444424; bh=mrfwCBNHTTEAu+oUbqSggHqv4
 QrmbeoPxLdu+nX11Go=; b=bRfF5LKpXu/FrfjT5/lml5aqgqxbJjd0ZF/hCZKJT
 yRntmmGoBIEgUNOOZr0fP7rJAxjGfqIUDobyiuCRlVolzZLhtgIobqtSPIDEqteq
 9LR7VC1MK6j+a0QuuJg+1bwIx9/RbxzcYhEjwaLwtiFJCg5A5x7Lm2f1Ri2UI4af
 4TppmeYoE7zpgFClDyFHQ4hiAFgmyLTxpr5twKjSxHFhAvwrHhqqVOY686QRj8i/
 R2zKJfgVH/M7BVhTyxoYMkPZvgHgKOEw48RXglo6Btt3fOuCxmnkOwPU+o0Do+53
 kxTACtJq28YEXUWCQ3izB60GmBYhZp9rqW0ItF2Az7Pjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666358024; x=1666444424; bh=mrfwCBNHTTEAu+oUbqSggHqv4QrmbeoPxLd
 u+nX11Go=; b=BcL/UDB5XKvBqITuyAS0YnrGKAFL6oI7xs3jVofzmg1/L1+NQsH
 QSuA9YTDIrZTcdMzk6V7vpbPEgl2ji2TCmO0CpBY6toAre7eeZub680qu1SZFzk3
 Pt11JBl1zDSP9oyKCxSL4zyf7Nxb5qSa5chNDU+asxubWDIp1/agLzr4s7FtOvIz
 +JxY46N3RGG2oQaLq2THfYy8pfD307asrwQLsl/arOqiHBIwNHktmVoth/lty4Vy
 ZIVPdhncL4/wFwl20psNRIut3+vh34C0OhAiKOndLxgpU2r+gskGg/GHusFBD8Rq
 H5X2kLpeby3y0L7Ynve2fwtrE5LStNXqb0Q==
X-ME-Sender: <xms:B5tSY36vfKDgUHDHg-4d9p3Qkc-3S85IhxcIgc6tb4rXZbgn9-q-pg>
 <xme:B5tSY84I4K6b1u13NYLRx4pvgVpar1pWm776061r9pspPclgWAe0Jl7aNsnbcWfvW
 _GB46Ci4k6fpH-WWOw>
X-ME-Received: <xmr:B5tSY-crlXYkI8qkbf5huMscbDZezRzOIVRxzq62RTvFCiW6YmR-bWDPh1J64ZWLOs-bnfPvytyXhqt5LOEV0eBIp_u3oPoCmHhl8Nc35chkzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeffudeufeevhfeikeelteetje
 ejhfegudeugfdvtdeghedvvdeggfehteehfeejueenucffohhmrghinheprhgvughhrght
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B5tSY4KnzJK793hF6IJWePcY30YYCj9J5DI2LrbMpdx9eTsngTvVQA>
 <xmx:B5tSY7LivcPPJcB74zYEqCglPtJwoq6YWha-74mh6Zm-5gj9hg32kg>
 <xmx:B5tSYxwOhMrqUHy7sIQQtjIvLfueGFg5EiWiM2OKwE2ly80NvAeikA>
 <xmx:CJtSY9gAcOyxmO99H3nqYj4AARY8YZO358BRy5Wfc1CSwKnAUv57XA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 09:13:43 -0400 (EDT)
From: maxime@cerno.tech
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2] drm/vc4: hdmi: Fix HSM clock too low on Pi4
Date: Fri, 21 Oct 2022 15:13:39 +0200
Message-Id: <20221021131339.2203291-1-maxime@cerno.tech>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
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
Changes in v2:
- Forgot one more clock to convert to the new one
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eb3aaaca2b80..3519b0c23d3b 100644
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
 
@@ -2914,7 +2927,7 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	 * case, it will lead to a silent CPU stall. Let's make sure we
 	 * prevent such a case.
 	 */
-	rate = clk_get_rate(vc4_hdmi->hsm_clock);
+	rate = clk_get_rate(vc4_hdmi->hsm_rpm_clock);
 	if (!rate) {
 		ret = -EINVAL;
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1520387b317f..fbc0a55f18e1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -171,6 +171,7 @@ struct vc4_hdmi {
 	struct clk *cec_clock;
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
+	struct clk *hsm_rpm_clock;
 	struct clk *audio_clock;
 	struct clk *pixel_bvb_clock;
 
-- 
2.37.3

