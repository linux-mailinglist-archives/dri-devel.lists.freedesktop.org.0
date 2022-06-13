Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6865485D1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591D10E839;
	Mon, 13 Jun 2022 14:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D7F10E839
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BC5973200319;
 Mon, 13 Jun 2022 10:49:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 13 Jun 2022 10:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131741; x=1655218141; bh=v9
 5kArMbuKHyz3BCXi+OcVZAmr7nRS5ecLdnEp0QYbQ=; b=m9nYefemnxo8UiP1zr
 jIQ1dH80kg/9Z71iRYOoHbBRNbY3+OGtfvAHaBp883280VpuzSw7ycjhkhaidyJp
 Gkm1yCGihpIQCD2M4zAxAjfz2SQSI812aQU9PDVK9RD95K9bg+E0YPR4zLGFr4C9
 CEcSH7bAMziv8WE+xIZMjeU/4bqjKtyh6lNUNgB/u/JeUN7iv76lYS2gliPGpyZn
 wFes4C7jbivHHCFEdA/iZhNKAD9KYtlGZtxzBhkyiMYfKtuuACTGRrFC5Peg/Axj
 Gytl7hHbeKcJHnyWfCXdzk9AmOdKRHfLF/WegwCj7MzBHLyU9PfiJdWVjh6kVWaf
 HwAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131741; x=1655218141; bh=v95kArMbuKHyz
 3BCXi+OcVZAmr7nRS5ecLdnEp0QYbQ=; b=jMNJ4Giqf2Po9BkgpxzQ2gZcboLqA
 t7yG8gDcofjNdCqz1SSh+i0+vIpeK9MzpkrCD5+7NzL196Fji2KeAei9dsulZ8kY
 A9eAo/ywLsxkmZeN2v9+lzimUYaJC3waoEjbpFUSjwrFoL9w4SrPwAPypB8JFzz7
 ZZ/AS8S1Qc+osy4DqgABMZP5Uqtmk/G+ut0mT0boYVZJGyIrpHJ4z+qahzrkSi+z
 HL0G9L4DYJoOVfPdVxNS9el6goi1iw22Uk2hn63aQ5jXNVIDrl4JnLh6QrgZnCDA
 1snAYFucKVKPAwzjcTSbJUaGAYwfUGnuUJ06koNY7EG5uByYSz0rJep0A==
X-ME-Sender: <xms:XU6nYj4vbXSK4_iEDs0_mU2Jd1x6RJwqeT8c7KbD3a9N9w9c7W4TSw>
 <xme:XU6nYo7tDESTrILgS_DRTKvcgLaQyZhcA5i5EnJY-9m1oFO5LC5m54nfOrx6idQMn
 jJ16qDJbS-hQtcCTeA>
X-ME-Received: <xmr:XU6nYqcRN7GrsGF0mnlP13ewUPubCwUpRPWGgGwxNbCEaOSo7D2nB0lPeX-9gpyAWP4Nvid5SfOAZHeerS5Ct6wtI7YxgyWpvdoPcMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XU6nYkL6JUvmkOjFMmRPY-TfPiKm6GhEWZ2qL6Y00-dOCBw9n4xnwA>
 <xmx:XU6nYnKeHkufjRPAj8QUqCQak2DlmpD3cwZ0F5z5UM3GmDt26js4Ag>
 <xmx:XU6nYtx-Yux_TEajfI4byHkdDGJnmWaKdFXYhSOLYcOE3uxtfLAi0w>
 <xmx:XU6nYtj3oWUyL5ITd9u_lKSMaJ7e3hY_IUzElSmr7wc0CwNsyenCLw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 18/33] drm/vc4: hdmi: Add all the vc5 HDMI registers into the
 debugfs dumps
Date: Mon, 13 Jun 2022 16:47:45 +0200
Message-Id: <20220613144800.326124-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The vc5 HDMI registers hadn't been added into the debugfs
register sets, therefore weren't dumped on request.
Add them in.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 +++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c8571e17afa8..d23ed6e5bd65 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -144,6 +144,12 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 
 	drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
 	drm_print_regset32(&p, &vc4_hdmi->hd_regset);
+	drm_print_regset32(&p, &vc4_hdmi->cec_regset);
+	drm_print_regset32(&p, &vc4_hdmi->csc_regset);
+	drm_print_regset32(&p, &vc4_hdmi->dvp_regset);
+	drm_print_regset32(&p, &vc4_hdmi->phy_regset);
+	drm_print_regset32(&p, &vc4_hdmi->ram_regset);
+	drm_print_regset32(&p, &vc4_hdmi->rm_regset);
 
 	return 0;
 }
@@ -2703,6 +2709,7 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi");
 	if (!res)
@@ -2799,6 +2806,38 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->reset);
 	}
 
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->cec_regset, VC5_CEC);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->csc_regset, VC5_CSC);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->dvp_regset, VC5_DVP);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->phy_regset, VC5_PHY);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->ram_regset, VC5_RAM);
+	if (ret)
+		return ret;
+
+	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->rm_regset, VC5_RM);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 51b27dcdcd9b..1520387b317f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -179,6 +179,14 @@ struct vc4_hdmi {
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
 
+	/* VC5 only */
+	struct debugfs_regset32 cec_regset;
+	struct debugfs_regset32 csc_regset;
+	struct debugfs_regset32 dvp_regset;
+	struct debugfs_regset32 phy_regset;
+	struct debugfs_regset32 ram_regset;
+	struct debugfs_regset32 rm_regset;
+
 	/**
 	 * @hw_lock: Spinlock protecting device register access.
 	 */
-- 
2.36.1

