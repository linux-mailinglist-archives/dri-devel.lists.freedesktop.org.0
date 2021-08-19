Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570D63F1B14
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D1E6E98A;
	Thu, 19 Aug 2021 14:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308BB6E98A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:00:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C616F2B005D0;
 Thu, 19 Aug 2021 09:59:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Aug 2021 10:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4H7t3dGcw4dBJ
 ONd4xZXRCqXccSjowURhdhQwcutobw=; b=E3awQcI2GOZooP7DCvRTVk/9NubKk
 DqpuVXMMO9naGANJflM3Do0In7ZpaI/05BYo5aPR+UkUJM2qFtysQRp7d8HodEaM
 lYUB+tHnk0jmuers0op7NqJ+3fkHvzgL4x3Tm1F/F4ZGzjg6t70bmmnkMq9IX9Kl
 uzAGpzOj+4a+TEheZxp0MqIQgC4QYDmZM+aAYbE8ffVitE7Ek1zOM3xBsFvlAw1w
 KVJUREmOoOxCoyBbhTq7m+gz20BzOuhbvnjPbdWAF0m++hUstiQlGsGi9rO4V29A
 R7XMm1QyVWArP+HzpX90U1bSQNUCm3nhoIwqSrCp77hmbU+JpI7dZucog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4H7t3dGcw4dBJONd4xZXRCqXccSjowURhdhQwcutobw=; b=U2N2kQVV
 Zl2m06YaCp2Sf17jJvfGTIcn1h1tYBowXCBk13o5Dh1PUqSDONfomIgA8LWfjTUx
 WylNqMBmwycmJhTDqWzrQ14SHTntUgnWT6ZKWbG0HPwybzgVHowRmpECB2ZSpOio
 exM2xsclog3reo+KSIaNGfufxjWPsrH9RWe65YZzEFwpSiGZSPdDqtZwoZBRtjy7
 /A2Be+o9k+KkAJHkn8goMaXZ83xKLNuIeugWQ5J49B4BQEnWW4w3WoB41GNfftwP
 M/ExlsQKVA42cY/cuGcyprkkeNsvthp0lMMUQSh/L1wij0ZQtso30cEVmYk82jTF
 HmCAWHNKaH+5Vg==
X-ME-Sender: <xms:3WMeYXdYo09toqBEzmw1OJuJYDDZNywqCvHGN1ZfFCrVpQ0B6xmiqQ>
 <xme:3WMeYdOwsbEwbtP2fD1STgHYU0BP4oQqGSRZ70nmDN_G_E_RCxJ14zHnhp8p5YkIx
 ePe5u0pAIV9A2djfJI>
X-ME-Received: <xmr:3WMeYQg0akFeQIT0D00GlXHGHz0Ebk_-TlxTXPfqXnHJdyV6peNrZ_tR08zgMCDtEZUzVBkStT0kcMGptHraQnWTf9FZkxY7lBfy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3WMeYY_DOnGUXjfr4P85ounlGmGII1z7PrTwVSoaTGrv-FAeRqBwjA>
 <xmx:3WMeYTuCz4dPRunN6-rWXtS_vZvr9LaRO0CaFJlYGv6VbwaNIeXnPQ>
 <xmx:3WMeYXERpvtsSJvBz1lqdsrm_2oU5An48DhEy6M-Y1-u1Ew5af3ebQ>
 <xmx:32MeYc_a1WzqHp9JqC6K8R6SHu6lceruWDMP6he_oLZEYCLctHmzylEQOi0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 5/6] drm/vc4: hdmi: Make sure the device is powered with CEC
Date: Thu, 19 Aug 2021 15:59:30 +0200
Message-Id: <20210819135931.895976-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bfa35e32052f..53647ce902ae 100644
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

