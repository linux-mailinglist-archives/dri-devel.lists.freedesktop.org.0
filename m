Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3E3BE5F1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691AD6E079;
	Wed,  7 Jul 2021 09:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DD6E86F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:51:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 8A5B02B007A1;
 Wed,  7 Jul 2021 05:51:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Jul 2021 05:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=AP/I8rxrmE9Ml
 RDmDxJIy4tqdiKllNYXAEVIGV9L3GI=; b=g8C+NgNuTUqc8w4R12gc57tLUAN8A
 H90sc6rEChB5iWGD1xPpTKRa7Jsga+lA1erKdI/pSzanlpQtgH7KlXqHbLKuxewy
 R4l8Qzuw9VGPnHm7C2cOC2FVCuudKNWy08NWGDUAODJ+bKvrn8u78kK2IOUds2tt
 CAZBLwGT+3yL+tNydQLRs+a0cvIgnkpJa/WrHs/ZPL8jPBQpOv9sRMsTlUQeEDuA
 yxtTGnFeOicgLRihcJJ/Cify411XF1BWjeTC+k3qb/JFifYh+UAm6ASNNUSaAKTG
 NUlqZ5lDqcVoanOULZWHbXC0mLs4tVk8JZOuVGS4GdNqnmUG+7BExnnlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=AP/I8rxrmE9MlRDmDxJIy4tqdiKllNYXAEVIGV9L3GI=; b=ksdUKZT1
 gCC2cs1svaMtcvWYJV8ZfB1bcjwqAtY4Hpqq0mW3ZReppRbnA0jj0gQkt3L8GaKy
 3rZZoM8Si6iKSVwUnBe6qFucNzCiEJYvQZk79m7eVgd/XLaXVqcQs9qdN9mhLPr0
 RKcTUhuJp6mIiTH0skZ9Wjgrr/zzdqtI8fIjvuh523xxvfB+K1eAjzA/cGIM09l/
 D6HNfGVugXJGCqKacF9HE7jA16k+m0qlSB1lWlqZ+0WdZk+hUUCiGNtsowwbP3lP
 HLM+x2XgIZa2C/4xMWWMpxXBVUPVDyCdiKEZBFuxYz6hhq6dy0kPY6TIF+ri+e5c
 RlRDJyjsyrm3XA==
X-ME-Sender: <xms:HXnlYJ7SKHuLlJBaFptxWDIPxO94zyQc7yOGOzflkpWB1Vq3uVL6fg>
 <xme:HXnlYG69OZN5vj3nhmnuFgCRfgGc3Yk2JjA0Wow378Q5ZttXTDRpVxRW3sxbN_Tga
 KLxl0pNC0LYwL1lEek>
X-ME-Received: <xmr:HXnlYAfUjoyKWf_LxMw9ii7REV4mUkShVsWh04fbPCdQAK6gjLnm629t89yna7FUYkvGyqiKxuN8LKr78Ge3SVaeIKWvf3EKY1Q6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HXnlYCL9pfhIlAqt-L_gXJz-TXEOu1N_XJyTEcGuEjmZFyK6WMVwhg>
 <xmx:HXnlYNIXtRMsH3X8bUz1dt2F_TapoLya1xgYwIwzJOwUpL9LfNyD8Q>
 <xmx:HXnlYLxsAKoEXVe7C8bjo2p3GB4TpEy_SEkwdus_7HhCM04bc0Jb_w>
 <xmx:HnnlYG7RlkQJ9B9UFFrhDfmd8OJ8e6CbXZOwrndIgSYW7I4rklyq-Do0htI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:51:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] drm/vc4: hdmi: Drop devm interrupt handler for hotplug
 interrupts
Date: Wed,  7 Jul 2021 11:51:11 +0200
Message-Id: <20210707095112.1469670-3-maxime@cerno.tech>
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

The hotplugs interrupt handlers are registered through the
devm_request_threaded_irq function. However, while free_irq is indeed
called properly when the device is unbound or bind fails, it's called
after unbind or bind is done.

In our particular case, it means that on failure it creates a window
where our interrupt handler can be called, but we're freeing every
resource (CEC adapter, DRM objects, etc.) it might need.

In order to address this, let's switch to the non-devm variant to
control better when the handler will be unregistered and allow us to
make it safe.

Fixes: f4790083c7c2 ("drm/vc4: hdmi: Rely on interrupts to handle hotplug")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 +++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d966f61966c6..50393a8a42b3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1590,25 +1590,27 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct platform_device *pdev = vc4_hdmi->pdev;
-	struct device *dev = &pdev->dev;
 	int ret;
 
 	if (vc4_hdmi->variant->external_irq_controller) {
-		ret = devm_request_threaded_irq(dev,
-						platform_get_irq_byname(pdev, "hpd-connected"),
-						NULL,
-						vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
-						"vc4 hdmi hpd connected", vc4_hdmi);
+		unsigned int hpd_con = platform_get_irq_byname(pdev, "hpd-connected");
+		unsigned int hpd_rm = platform_get_irq_byname(pdev, "hpd-removed");
+
+		ret = request_threaded_irq(hpd_con,
+					   NULL,
+					   vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
+					   "vc4 hdmi hpd connected", vc4_hdmi);
 		if (ret)
 			return ret;
 
-		ret = devm_request_threaded_irq(dev,
-						platform_get_irq_byname(pdev, "hpd-removed"),
-						NULL,
-						vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
-						"vc4 hdmi hpd disconnected", vc4_hdmi);
-		if (ret)
+		ret = request_threaded_irq(hpd_rm,
+					   NULL,
+					   vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
+					   "vc4 hdmi hpd disconnected", vc4_hdmi);
+		if (ret) {
+			free_irq(hpd_con, vc4_hdmi);
 			return ret;
+		}
 
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	}
@@ -1616,6 +1618,16 @@ static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
+static void vc4_hdmi_hotplug_exit(struct vc4_hdmi *vc4_hdmi)
+{
+	struct platform_device *pdev = vc4_hdmi->pdev;
+
+	if (vc4_hdmi->variant->external_irq_controller) {
+		free_irq(platform_get_irq_byname(pdev, "hpd-connected"), vc4_hdmi);
+		free_irq(platform_get_irq_byname(pdev, "hpd-removed"), vc4_hdmi);
+	}
+}
+
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 {
@@ -2197,7 +2209,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_conn;
+		goto err_free_hotplug;
 
 	ret = vc4_hdmi_audio_init(vc4_hdmi);
 	if (ret)
@@ -2211,6 +2223,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 err_free_cec:
 	vc4_hdmi_cec_exit(vc4_hdmi);
+err_free_hotplug:
+	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 err_destroy_encoder:
@@ -2252,6 +2266,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hd_regset.regs);
 
 	vc4_hdmi_cec_exit(vc4_hdmi);
+	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
 
-- 
2.31.1

