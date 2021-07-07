Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4E3BE5F0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913996E082;
	Wed,  7 Jul 2021 09:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2216E873
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:51:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 55E402B00791;
 Wed,  7 Jul 2021 05:51:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 05:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7mhnXqm0UEC1q
 bZWHIpz3smAAHrZY0tVEDn1j/F9XOk=; b=uaLcdBgkZwMWTWaypaPCNtBFqkvqD
 HKGlqGE9y+iyGC4RvBqMTaAp9RP/X4oLM3WYF1EKJm5s/+Fy6k2iLBy1XorNMq+m
 +9WyO+MAGZyteUAsPXXUlFP2Ud30SIkcYe2TjQM1adjHf4dwpnhLxSKFbi8Kq2av
 4PX3qsbwqzPJ6YuA5X2gnokh8B5QNskHrQuvNwrrJRuUvyWzKt7IMFEd3BIKGUYT
 BbMZFqSWRCmHAWG0wPBZaxZPElGke1wtw3LHG4TeHD1rZkRuBw1RPq0R3g5EBB9Q
 3Fk3AzIvZnHVVI4nlMbXIS19szxKHhYjOn3VFHfK5WFnuv/Ku8FEoIbHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7mhnXqm0UEC1qbZWHIpz3smAAHrZY0tVEDn1j/F9XOk=; b=rS/k1xO2
 2+03brN03So0+SWzRYS86gVwb9a3bLpjhqZyOUL5TQcY06dpUkt4Zpz2aLxdb8Xj
 rA5SQW1KpLVYdp16o+Ri9NfrTsTZliaWOft/MNp0tL2i+qwXNrBoTQgV+O7I3gTP
 dyxjjysdANtwkAmDSZ/+gMTlhOnT8NTvK0zhENQqcJm+U2hecgWyhvdivN4TYcoT
 bz/7L5bxlGJow05Y5ySMVmxUfG5F/MOf9CKSALl0MyWwBPhPwYCy3WfMUJ2/8+Kb
 OYx2A7OmI0O0l+BX3vX5fQiM842ikJhcX1ZuK6jYP7HHuvechG5LA5fUuWQpHeEc
 0HbqgHJwHdXIrw==
X-ME-Sender: <xms:GHnlYIUxDMFOYB3ECuyF8JrkRiiU8GEceJNnGx4cjfxAeEl8QyN00Q>
 <xme:GHnlYMmvQGtEm1xAzGIuYACRlN0UqhAtDH1vi4Zd271EKoiCmWtMalo3YTrj6ucgQ
 vLYZfKjPtQIux4jFgA>
X-ME-Received: <xmr:GHnlYMbGJRsZuHhbjLi2Em_VW6PX6wviRnz5OvasxwtMRNFvqWsa9pUmVf00YewgnLqaRpJz8PvuV2lrmIB2j-mPRVsxxR-qWUdT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GHnlYHXyFrcyUgh-DWDXJ1-T4Y-ZD5MpgVYvDjwl9PBh8wj_5PXZyA>
 <xmx:GHnlYCkeusiW8N1AUs6NxLLV8EP9YESlROtryErkbvRteSNEt0UW4w>
 <xmx:GHnlYMdJCotRWgb_y2VC0vTdIaOHBsNHY3Nq3MZEcl1GPnW3OyUUEw>
 <xmx:GXnlYM3iiWDtZupfX_MoaIvo41t6DrEcSX5FyEH2ei3oZZ_sOIiUn4OQjUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:51:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/vc4: hdmi: Drop devm interrupt handler for CEC
 interrupts
Date: Wed,  7 Jul 2021 11:51:10 +0200
Message-Id: <20210707095112.1469670-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707095112.1469670-1-maxime@cerno.tech>
References: <20210707095112.1469670-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC interrupt handlers are registered through the
devm_request_threaded_irq function. However, while free_irq is indeed
called properly when the device is unbound or bind fails, it's called
after unbind or bind is done.

In our particular case, it means that on failure it creates a window
where our interrupt handler can be called, but we're freeing every
resource (CEC adapter, DRM objects, etc.) it might need.

In order to address this, let's switch to the non-devm variant to
control better when the handler will be unregistered and allow us to
make it safe.

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cbeec6a5cb90..d966f61966c6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1858,38 +1858,46 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
 	if (vc4_hdmi->variant->external_irq_controller) {
-		ret = devm_request_threaded_irq(&pdev->dev,
-						platform_get_irq_byname(pdev, "cec-rx"),
-						vc4_cec_irq_handler_rx_bare,
-						vc4_cec_irq_handler_rx_thread, 0,
-						"vc4 hdmi cec rx", vc4_hdmi);
+		ret = request_threaded_irq(platform_get_irq_byname(pdev, "cec-rx"),
+					   vc4_cec_irq_handler_rx_bare,
+					   vc4_cec_irq_handler_rx_thread, 0,
+					   "vc4 hdmi cec rx", vc4_hdmi);
 		if (ret)
 			goto err_delete_cec_adap;
 
-		ret = devm_request_threaded_irq(&pdev->dev,
-						platform_get_irq_byname(pdev, "cec-tx"),
-						vc4_cec_irq_handler_tx_bare,
-						vc4_cec_irq_handler_tx_thread, 0,
-						"vc4 hdmi cec tx", vc4_hdmi);
+		ret = request_threaded_irq(platform_get_irq_byname(pdev, "cec-tx"),
+					   vc4_cec_irq_handler_tx_bare,
+					   vc4_cec_irq_handler_tx_thread, 0,
+					   "vc4 hdmi cec tx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			goto err_remove_cec_rx_handler;
 	} else {
 		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
 
-		ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
-						vc4_cec_irq_handler,
-						vc4_cec_irq_handler_thread, 0,
-						"vc4 hdmi cec", vc4_hdmi);
+		ret = request_threaded_irq(platform_get_irq(pdev, 0),
+					   vc4_cec_irq_handler,
+					   vc4_cec_irq_handler_thread, 0,
+					   "vc4 hdmi cec", vc4_hdmi);
 		if (ret)
 			goto err_delete_cec_adap;
 	}
 
 	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
 	if (ret < 0)
-		goto err_delete_cec_adap;
+		goto err_remove_handlers;
 
 	return 0;
 
+err_remove_handlers:
+	if (vc4_hdmi->variant->external_irq_controller)
+		free_irq(platform_get_irq_byname(pdev, "cec-tx"), vc4_hdmi);
+	else
+		free_irq(platform_get_irq(pdev, 0), vc4_hdmi);
+
+err_remove_cec_rx_handler:
+	if (vc4_hdmi->variant->external_irq_controller)
+		free_irq(platform_get_irq_byname(pdev, "cec-rx"), vc4_hdmi);
+
 err_delete_cec_adap:
 	cec_delete_adapter(vc4_hdmi->cec_adap);
 
@@ -1898,6 +1906,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 
 static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi)
 {
+	struct platform_device *pdev = vc4_hdmi->pdev;
+
+	if (vc4_hdmi->variant->external_irq_controller) {
+		free_irq(platform_get_irq_byname(pdev, "cec-rx"), vc4_hdmi);
+		free_irq(platform_get_irq_byname(pdev, "cec-tx"), vc4_hdmi);
+	} else {
+		free_irq(platform_get_irq(pdev, 0), vc4_hdmi);
+	}
+
 	cec_unregister_adapter(vc4_hdmi->cec_adap);
 }
 #else
-- 
2.31.1

