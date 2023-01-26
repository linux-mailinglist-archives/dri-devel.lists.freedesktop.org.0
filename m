Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A267D2C3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E1610E94D;
	Thu, 26 Jan 2023 17:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6410E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:10:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E0945C0447;
 Thu, 26 Jan 2023 12:10:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 26 Jan 2023 12:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674753010; x=
 1674839410; bh=TuONVed+Dr6TDLyZbTUpohIjZuE5nuNDcQ+ItZCvi3k=; b=R
 a718uho7fMDkdpvip8rcL8lrHYt8zSw4/XDhNGY5faq4kEJiNX+QH/K2yxMkSxRi
 xkUlpjhQj4tUmN03sucPVzq197r9lMZWDRC/+vFh6kCyyCzXZyAfKf7Bnf0Tm2GL
 cbCDg/OPKUEScky1NRlpbKlZXdVkW0keZcL/9Iqnj4n77m/ZAcE0skbDtjrVrO3i
 Xo04SuwW5y6SzIdHlvAMbOWRSYWdbhe5JgKfsJEvTt+7zKhGldAPL123cY3quToi
 DrDBvn8wXBDbB+YbNLO5jJECI/MyWVhFjtrXqFQJCI4JN/F8GFchkW4Gy7HxhsNH
 euZVq6OSFfHqlyya3joKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674753010; x=
 1674839410; bh=TuONVed+Dr6TDLyZbTUpohIjZuE5nuNDcQ+ItZCvi3k=; b=g
 713ha+uzpzWRxJgnidqiKvgLkv4dIMR6ban1Now8Cwp63DdKOuJscc+BJUIA9efL
 4xp1l1BgbuVqSb/vdbFSCEKe/XjDRMe4tNBb82KVloOrshHJW2W64eROFf+TF67r
 hehQRqmALGE//2cWnZ1FnDPotxrTkiWA5qumYZDa1ClH8ECsTxEQn96cz7XrRW3p
 mETFFHuf+PGkTXQ+XmPH4aXqJhPhBH43AAhTU2McX0KJ/qkwRjMLRW251HrVcS5e
 p3WY6MDvHVaNf5u9aLFMQ7mZKEYyKrT68al5ynMd4i0q/Nb32XBDhfpKv9M8P0J6
 TjXkyWAiHQriTgZsi/GSA==
X-ME-Sender: <xms:8bPSYwF59K7IbY8yhxxHLiQeTtHOFamz46FxTrxLsTrGUD3S8JrBrw>
 <xme:8bPSY5WHsNWqMb2ytjMEeapP5Q7CwBG9RMu8UwKz_r2ydb8cExbpUp01yIEAblimj
 SK-i-RC9fseUraXVvU>
X-ME-Received: <xmr:8bPSY6LwtcCE7DME8vl_iVgL9IMsNqA7qZOho5fX7GI8QGIa_CYS0ZdJbfFlt1T6jjOM5SV6Jemeayl3_SUP-S1yCPpU9l8DM37oAq8Wq1G05g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8rPSYyFt5BlS7tda_IH-hbxgbhH5uzq2psQA7ka2pVafrIvcZP1ZYA>
 <xmx:8rPSY2Xh_bQUzgqF4exEUKmCA0DA218Xnm7y5a-ZpjB0hPdwye339A>
 <xmx:8rPSY1NSnAjs5pw80VtEiIC7Ia_DvyMeOne090kX2xqOm12494c1jQ>
 <xmx:8rPSYyn77wp9n3y_E8GJFqWud1Odyg4Vz8D3gdnFWykaGxvw5HNN4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 12:10:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 18:05:48 +0100
Subject: [PATCH 3/4] Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230126-rpi-display-fw-clk-cleanup-v1-3-d646ff6fb842@cerno.tech>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=se4/zccLZCV03kCfGwykFTtzd+oBbkxTP8WaaiMrb2s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXNn3sPi2bXfTs++38hseNXAIr1hTeYT3NZ3VvTffRqdz5
 v0y3dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiHEcYGTallD9YNnnvh/VGPu1qd9
 avZy2t/K8k8ZQ5Zg9vtdYEUV6G/6HHexSyTk5Qq/bgFdrXVHnhQ36ydK9F66TpFtufqk1L5wQA
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

This reverts commit 3bc6a37f59f21a8bfaf74d0975b2eb0b2d52a065.

Commit 3bc6a37f59f2 ("drm/vc4: hdmi: Fix HSM clock too low on Pi4") was
introduced to work around an issue partly due to the clk-bcm2835 driver
on the RaspberryPi0-3.

Since we're not using that driver for our HDMI clocks, we can now revert
that inelegant solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ++++-----------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9dd722b9ae3a..e82fe17c9532 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3189,16 +3189,9 @@ static int vc4_hdmi_init_resources(struct drm_device *drm,
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
-
 	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
 	vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
 
-	vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
-	if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
-		DRM_ERROR("Failed to get HDMI state machine clock\n");
-		return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
-	}
-
 	return 0;
 }
 
@@ -3281,12 +3274,6 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 
-	vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
-	if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
-		DRM_ERROR("Failed to get HDMI state machine clock\n");
-		return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
-	}
-
 	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
 	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
 		DRM_ERROR("Failed to get pixel bvb clock\n");
@@ -3350,7 +3337,7 @@ static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(vc4_hdmi->hsm_rpm_clock);
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 
 	return 0;
 }
@@ -3368,11 +3355,11 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	 * its frequency while the power domain is active so that it
 	 * keeps its rate.
 	 */
-	ret = clk_set_min_rate(vc4_hdmi->hsm_rpm_clock, HSM_MIN_CLOCK_FREQ);
+	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(vc4_hdmi->hsm_rpm_clock);
+	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
 	if (ret)
 		return ret;
 
@@ -3385,7 +3372,7 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	 * case, it will lead to a silent CPU stall. Let's make sure we
 	 * prevent such a case.
 	 */
-	rate = clk_get_rate(vc4_hdmi->hsm_rpm_clock);
+	rate = clk_get_rate(vc4_hdmi->hsm_clock);
 	if (!rate) {
 		ret = -EINVAL;
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index dc3ccd8002a0..e3619836ca17 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -164,7 +164,6 @@ struct vc4_hdmi {
 	struct clk *cec_clock;
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
-	struct clk *hsm_rpm_clock;
 	struct clk *audio_clock;
 	struct clk *pixel_bvb_clock;
 

-- 
2.39.1
