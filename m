Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41161560001
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FD214A612;
	Wed, 29 Jun 2022 12:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30E14A60E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0F134320093F;
 Wed, 29 Jun 2022 08:36:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506195; x=1656592595; bh=aT
 YVuazg0JOe4HVrHLY7ePCN2HysAnY4lCoKMs2x4fQ=; b=VmMLpeNEJeBwhN8wVh
 yfucmYeVwKWUnqpD41XYL8KoxmofudspBTzukSs5HopGZskY5qkIGXtzef04u+rh
 q0dkGMajqeFsMiN0zrxElRBh3k/KmxoAVrRIMCo5/QeSLCftMyl/Pm+s+KqBLBn5
 EpHVEXAo5w5BPWGoER86lVTWO6Sj5bSaj+JySFfLd4pearahnlBx8Upq8a3U2Snz
 t6VJ1J/NaGD5J5/XmJPTfF6J1CFISXgM3WAVutGCXSVa2+l2WTmWdfgesPQFf0lL
 ujUFO0m9yaEC6JA5ScIYuVuy16rJo4b4q9UHVtidFTOLQPkrOOJ0fVtXYQ5kiJif
 fDpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506195; x=1656592595; bh=aTYVuazg0JOe4
 HVrHLY7ePCN2HysAnY4lCoKMs2x4fQ=; b=cfC6gTZuEcKxPyWSYfUn+cDXiJ46O
 W5nnX9MCeLty2w5hHMCMYWtafbqYh15c6dW9M4haa96Y6S2YJeF5r2eBdxuCfzgb
 AofnrUZtL3PUVogKJHuvqXlzRZESTpWVQtXwOwAx2CZMTUhYO89LvXnq9Px6Q2hX
 iKHyp+mF5RBwl7DIVOcr7eixKLGi2WIzs26KtaduYvhT5pMCCFQ5S+q4UbhQairb
 Dt2IRgIXkAU6xx0HW/ErvNWf+878hVbacD2w01/6fYknxISeS6t6lz/1qfqwwCVM
 jS952317UBGgXIH03fpcYSSiSOvmd46yx8WFX3J6sxDX/i1o8U0kNTXdg==
X-ME-Sender: <xms:U0e8Yq0SLLwpu_UXeVuF2JZyGGuQ53iVN7wi8Zwm50JQ5h_SJx3q5w>
 <xme:U0e8YtF9_TwJHjQCMPvMD5qWNd7HLlkdCyWzF_LBa_XAZ46WKUU_LH_Yecr1dz-FY
 RUM0k9oCRBAc6mtmy0>
X-ME-Received: <xmr:U0e8Yi6wBOmyTGS8Hwamvl8I6l13j9EUghs51GJl9hpIzTXUcU66UWcCwHUC-Rb8jvyPpku9jexg4Ei-R4GYxDZw1oP6lC9Tlnl6xtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U0e8Yr3DkwCFZSMwWXztgxzi5qxk8NwOX7E9E5pP3VSpItzQavRRDA>
 <xmx:U0e8YtHpRZXE03nzOgmLtbg5LnrF71hiCQeZhFbWrcVaXw90yEeAsw>
 <xmx:U0e8Yk_waKrbE_se05N-KtEP2XEC6j_o6nelAy2QKZVFf4RMcCyUqA>
 <xmx:U0e8YmN4QU6FobagPV5EGHuoUOXHsrDU6n2JbsClMv4NNgvxqwKVMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 27/71] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
Date: Wed, 29 Jun 2022 14:34:26 +0200
Message-Id: <20220629123510.1915022-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

Since we have a managed call to create our panel_bridge instance, the call
to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
since it might lead to a use-after-free.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 2febfe3d854d..22e388d17508 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -328,8 +328,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
-	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
-
 	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
-- 
2.36.1

