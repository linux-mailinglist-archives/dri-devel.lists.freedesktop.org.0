Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A689554D4A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B27D112704;
	Wed, 22 Jun 2022 14:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A081F112A9D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6E8643200974;
 Wed, 22 Jun 2022 10:34:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908454; x=1655994854; bh=iT
 rtmyslTAMM93CkDq369KVal7rMwatN+PeyFzUXzz4=; b=xdRcn9QQxT3USB4nnP
 FqJ0w61lctgLl/klR1Ud21ZQJsQOvEGx2Tjq6V2gGRHOGqadHFJBPcLIc1uVoJLA
 vkwUdLyyqrHcNrYfgeZJ4V1CNZ50q4yqC6dBNnOKQPxC24xNTv6oIdCcv1E0gqWj
 Oqk7+vnwLDjiR50rKiZGt5PvzNlXeK4K4jsuesXx1qrZOAdOZFfQ+K+9Eey8ZEap
 BspNGcuhPHhzZVaT3tjCsxRBybDNm59TAUhwNRc7hxrHzGSrrNmfQ9FL58d9yHLI
 +BtxsUQfHiA5nHyxTwrzWHz2bCXAVhpOJkfNFlBp6WxEjMLGhBhnmDzw9qYB9ZNI
 UqCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908454; x=1655994854; bh=iTrtmyslTAMM9
 3CkDq369KVal7rMwatN+PeyFzUXzz4=; b=Fg2v3kE8F3eSgoVbcvm0kio4grLNp
 kH2AnHvNnJIxwZQFu2n7i6751RZolJ/OkZCAc7PV+GzZE9eX+t/ySYPYytSUKGtz
 HBjDEHPQPN2uyhzWQfBUGKzq72B/TdkEBVHw59yWCAy0VGjP+QWkPHQjG/dfLZm9
 E+GG1icGLjtF/20rYPN+muMxA/rfsviT0tCNcdEKdoXQ4B3EO6MRUbPAYofU7kGC
 fTDvsWIcYbbKNfXfvrYdKrGNlhvGSvD3ipZaHLl4Y3bD3+NGAYRZBNlCaBjCXaET
 TLjXcNwKCy0SMrqLyDHLqYEKD37ZX3nW0c2xv10isWxDfYNJyn1v13K2w==
X-ME-Sender: <xms:ZiizYht4aYglps0ponnH4ddISnz_D7hnY4a2nbaE4yQN0UM8l3QoRQ>
 <xme:ZiizYqeBqkEUEs4V6rFKPf3YSCIEZ4aVFkBIuAUUyM3WIN4JDEg_SueUCZwkDpOEE
 VPwA5mvHesaQ4PVOBE>
X-ME-Received: <xmr:ZiizYkyWaXUTVPFJpJrgbBjAfVi3Sjgd0rn1jqnq4WEMGOx_aUv8nvLOT98JNlPNZBbxSgmNpYH0_OB3hB1S0J9lI3ZcMo51TuxkQ6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZiizYoOy8JVFU_eJ0H4a0qUXm3U9sDpl-9qKyAUBPXCcW2flN-bxnA>
 <xmx:ZiizYh945X4OTMrkMi0rVNpXfuSZDVv12gviykdpPqTYgc8uxjnF7Q>
 <xmx:ZiizYoWbGlF57FrUjBhEcwT7gr4zqG1UCod6XAmMbxA_XC9bXNgsww>
 <xmx:ZiizYtbz9ZtCiZhqBA171nzbT94pWkLakGxfbJFDNkU44Qmpqqs6QQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 38/68] drm/vc4: hdmi: Switch to DRM-managed encoder
 initialization
Date: Wed, 22 Jun 2022 16:31:39 +0200
Message-Id: <20220622143209.600298-39-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index 7d08be14b075..592f85993a80 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2916,12 +2916,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -2949,8 +2955,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	drm_connector_cleanup(&vc4_hdmi->connector);
-err_destroy_encoder:
-	drm_encoder_cleanup(encoder);
+err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 err_put_ddc:
@@ -2992,7 +2997,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	drm_connector_cleanup(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

