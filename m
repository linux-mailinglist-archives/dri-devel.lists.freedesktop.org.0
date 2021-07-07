Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811B3BE586
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCE6E861;
	Wed,  7 Jul 2021 09:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7BE6E860
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BCCDE2B00927;
 Wed,  7 Jul 2021 05:23:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 05:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=iECWjzZ9PtNQF
 QH9Y5iPSpZJa5FddrCIeq+02aACJyg=; b=MPA8pX3H3Q8f12aPR1nEcRwc7OXAD
 Re1SZVBXQn23T1ojKYb8dGEuQa0585ksakgewvsoY+lWyqSndfC6GY7FuvwV3yAw
 P7ya/iXQPnMES9OZ3HmYRde/spqzb5MBpkZPIWAv3dtBaB7pPttSLcx+y60l03W2
 JzAHDZkFjJ4ialrnkdGjjpOkwJoaA+GxaslllMpY9vR8AY2hcGHUXQEfU37t0ny5
 6oVl0RT9oF3ASQGAdjIXnps/SPVlcmciH2iQvO3EThTRcEQvoMCTdRJ2ruWT8KA5
 NGxoC/vqthgDfH6rPQIjWLctfx7uAp/htbO2Jzk5syeifw3cg42DTjLtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=iECWjzZ9PtNQFQH9Y5iPSpZJa5FddrCIeq+02aACJyg=; b=TZDD2GEL
 2h1n/jHVyCXfum8jtrQZf1vkbll3rSlkQlr+sQ9rGYD0SgWaAh/jCzMYrpoaDzH8
 nWPYXnYT/Q48mU7n26wFhvhA8A3ecYWaUpzr44kWZsJOITTGMvtXMvPwfBws+Do0
 NZ371wjf1kWJVzZ2ladnN4Y0Hereytt2/N2BH9oNVmC2MogzH95Cy/Y//eMQTaPf
 YLLlE8eTAlbfkoYg5Dxr2mzE7LMUdX3NR7QZgjVNrTXx3Ar/4hB25WscjxTKoD17
 JICdfz8qyPUH4xW7o+ncacQqDNDH/buEdxdlHwd+JpUgajv/GNlzZqKR6yRFPPs6
 7T38SLwsRETuLg==
X-ME-Sender: <xms:hXLlYJFP0R66z-VyB1xLm6FVcFq9_1jwzgWN1bIsZsYHU9iPTDW_eA>
 <xme:hXLlYOVCPYyrm6pVshnaieM-dFC02K9Hp4nkWz0lg9kZoFebvaN8p7WdPf0nQeom_
 vFvJjvM5xTj56EcVEg>
X-ME-Received: <xmr:hXLlYLKRq_gY98G2E_39BziVH8gvaCMxhkrO6z034x9175_ULbZh7F_4RXgMhyXvt774mvjSXe-AybpJ5U0nwlvtPoCsStYtcAU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hXLlYPFg7vZCFNUmxQ6-5bQ5AyIr0SpOmON-8BQBFh54sPLNC-lFSQ>
 <xmx:hXLlYPWQB-fbhjAZWOGGLjx9r0o0xuj4IaXhFGJpbcKqTZ8Auyo_Dw>
 <xmx:hXLlYKNyN8O8aTLs9k6SLqeJAEtLeQ9E4XwtxBtI2wtNnOT5gEjGaQ>
 <xmx:hnLlYDmSRXH_cOFuGo2lClQvLgsnzRn0FH5eJkbSaFBQx1vA4LuwrKjUqrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:23:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 4/5] drm/vc4: hdmi: Make sure the device is powered with CEC
Date: Wed,  7 Jul 2021 11:22:56 +0200
Message-Id: <20210707092257.1465109-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
References: <20210707092257.1465109-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similarly to what we encountered with the detect hook with DRM, nothing
actually prevents any of the CEC callback from being run while the HDMI
output is disabled.

However, this is an issue since any register access to the controller
when it's powered down will result in a silent hang.

Let's make sure we run the runtime_pm hooks when the CEC adapter is
opened and closed by the userspace to avoid that issue.

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 825696e6ef02..c37326f5e263 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1745,8 +1745,14 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
-	u32 val = HDMI_READ(HDMI_CEC_CNTRL_5);
+	u32 val;
+	int ret;
 
+	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	val = HDMI_READ(HDMI_CEC_CNTRL_5);
 	val &= ~(VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET |
 		 VC4_HDMI_CEC_CNT_TO_4700_US_MASK |
 		 VC4_HDMI_CEC_CNT_TO_4500_US_MASK);
@@ -1789,6 +1795,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	HDMI_WRITE(HDMI_CEC_CNTRL_5, HDMI_READ(HDMI_CEC_CNTRL_5) |
 		   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
 
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
+
 	return 0;
 }
 
-- 
2.31.1

