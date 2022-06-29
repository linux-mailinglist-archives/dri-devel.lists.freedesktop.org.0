Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EB56001D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F714A632;
	Wed, 29 Jun 2022 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C563B14A625
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 99BD2320016F;
 Wed, 29 Jun 2022 08:37:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506236; x=1656592636; bh=jc
 xqlBhiCSIvftM+IppG4S1QFQw+xb/Gf9ZjKyGQ46M=; b=Xgpd7yyC0lKS1mhiUH
 8N9j5Q5hG1nz+NeYRUf5Ug9sFo1+KD9JcwGWg0v9wWR0+FKoowZvsp5BkSAz/ZhT
 V5T7qaI3P5j9+Ce+yHUElcSYq5tt8ivEj7S11QQZVONKMHTaLDGm7azLms5Ic5ZQ
 QwD4ON/P7KrXg+oEeo/URMfATQmAnqsijJXMH03gKXhhmAx41rAgicakDDeVc749
 jMVZ6Rhs8BmnWjhWoCP0WZvInQtKFY3Vt1m6O2sKpjGXsYwtH70n6B7wmtTUpCTk
 UgwnLmNShsSg5KRrxvzok5uIXAuatSZcQk6fKmuE7sBYig+QHWRrNEn/PqNMWbku
 nWYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506236; x=1656592636; bh=jcxqlBhiCSIvf
 tM+IppG4S1QFQw+xb/Gf9ZjKyGQ46M=; b=PDYGEoR6DiY0muIVmgHjVJ2Ay6WQK
 FtwTrVnNmiyd99BlRRPlnODwqaIxGWCm/iRRbwE4MBJNMBi7vs9Mhv1TJG3b77bN
 CttPSe+TBab3CV2mCkoXf5zp61zuN3+QWe8I9Ijq4o+Y6yorTTk/D8fWrkO8cV7w
 Aj+/mo+Mh5K1TJE7YrPnrf5tQisrOygN8oSoEKTfmCFhnLCAyCrpC80eBPytaNDg
 gcutTrT7Ugdjwlr6BIHqJqIwW4FYVDGXI+JndpCo2Hm6sonHrTr6YBcwqr1X+8oO
 4X8XZwD2TZcVDsDYmI6sRIZhLLrNzulSXMN64kkCDA4Fo7NHUGv1elnDQ==
X-ME-Sender: <xms:fEe8Ynu6cnyzC0cStoE5MWDOxrwfrMX55NdT0sYTfMSCFJ0Eu3AhLg>
 <xme:fEe8YocEvuuIZQsMCevxesqpJINvbITzMtkpCEqMxBdyD2M2pqkbQVp-ETs7fnIkG
 MGx1X0OM3BHq2ggysc>
X-ME-Received: <xmr:fEe8YqyPzU3cOHJP-zldDAFEWnQHUymDcr8_E__X9EgFaOqOWV0Pw5TbpT7AMbbI1kFUJojOQF3JsZ1W5Cxwz4O21B8cdyinnevZ8PM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fEe8YmMgDq9iqGSRrnE7ZndoMsHfUjSbTOtRk6Tc6rL50eu6CNe53Q>
 <xmx:fEe8Yn-ApCuVJRfHFGVGrxkrUzDH5EHfA2lsS-kQXjttGrcumG10zg>
 <xmx:fEe8YmVsd3gtrDuSBuH7Yb-VLkhv7yH8EFb1MSURpqv3YzPoEHOmxQ>
 <xmx:fEe8Yjavts6MX6LqcHIGDaNOzo6Y6owSk7Xc3CR8xrkRiMhrvd5dKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 41/71] drm/vc4: hdmi: Switch to DRM-managed encoder
 initialization
Date: Wed, 29 Jun 2022 14:34:40 +0200
Message-Id: <20220629123510.1915022-42-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 05f769474903..6c44faea4af1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2984,12 +2984,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drmm_encoder_init(drm, encoder,
+				NULL,
+				DRM_MODE_ENCODER_TMDS,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	ret = vc4_hdmi_connector_init(drm, vc4_hdmi);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
@@ -3017,8 +3023,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	drm_connector_cleanup(&vc4_hdmi->connector);
-err_destroy_encoder:
-	drm_encoder_cleanup(encoder);
+err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
@@ -3061,7 +3066,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	drm_connector_cleanup(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

