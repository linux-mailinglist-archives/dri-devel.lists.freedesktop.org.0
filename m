Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCFE56B6B1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362211389E;
	Fri,  8 Jul 2022 09:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01411389C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B4AE832009CA;
 Fri,  8 Jul 2022 05:59:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274346; x=1657360746; bh=kq
 6H2VSiu14/KRSi6bRDB4x33u2S7kKjdsg7E2zB4ng=; b=Zm075Cx/SIh/D+eCFv
 t987Qnt/68lSHvedrnVwlL15swPgxsPHk3qT/W3F/zkCJ+GIKXAr2zgKt2yQD9jf
 lOsmuWMyQYYcqxbNklFku90wqp7o0TA4BHsG5zmW1YFRV/Otct0wZJX2CL581qvE
 ykK/w5zHtk5kZrBqxbL/g9jPyk58f7Exqwdv2supxGuTqw4kGHhf9ZHKu4k/vpjw
 n7nqQ6Fvrv8wO/hBWO0DYayBk74On3XgDeo3Eax5H9SKovVsHpNxcJy43l66BBoo
 xDdd/3QSdHc6Q3SWdbz1suGJsyHuANqAmCHRFjZYYYurqP10hZU9QGBFDkIIxMfS
 muDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274346; x=1657360746; bh=kq6H2VSiu14/K
 RSi6bRDB4x33u2S7kKjdsg7E2zB4ng=; b=ZxQCEpaziCj4NzSf/AQc6bqEyx0np
 PHEoi8mcTg2LoDlHDvSlz8ccS/Te5uJHfmDa7QmQTWIFOxzqc5O0uCOeS/FuoX9i
 /9LrOobIsoShYYh13kF9GbKkzQTtE3h84PapNj79a8iUcDST+UbE03aqqg75FrBE
 lTvJdiJldJcmSETSMT7MB+LHtbuK5qPhiyKcLGGNlhdiXUWdH6OE2TCsDkw0GqSg
 qMAfYjJ6sDiNEChwWStQFggezMUhhkYNmMB5ga8NfHFlOC8TSUKWGxrYqVrSvr3/
 PQtYaMo8g0iTItnymkpuSFtbPpinK5eC8p8rqKm87jVgJF6Rup//MOpgA==
X-ME-Sender: <xms:6v_HYpAEZk1onTCrM8pLf3w6jt1rjPjfJHM6Xg-0zFi1E4lyAefP9w>
 <xme:6v_HYnhtP_ngs3Bmcpdhv6CU-7Od2_Bm0kI__Nl9HCUuBV_xJd619GrU1ongrDeGz
 rW7AsTXipj4M-rl82w>
X-ME-Received: <xmr:6v_HYknEWw7VNtu1B113lzIWbcqZ1itzMrBBrs5-mIYxKQ7JoY2OQYiKBJTfuPJBDRIUzpu7UIXUHbeeslmm36byVAc4M_GYWrz6uxo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6v_HYjyVmxWKwM69GMDAGwKQX3xyDsaREee3SHFmxYezIRLB8JPr9Q>
 <xmx:6v_HYuQ25tJmiuMLPJ0xAjwmKIx1tTk7ToTkISi-visguYH4NRgf1g>
 <xmx:6v_HYmbTbHQe55GMTfv94jPQ57NkRwBey62Lr95rMSP6ZXm5B9m7nw>
 <xmx:6v_HYkNRBg9vb2mseaWLFRx1OSPXQJMoQeL5jy1i5Urc8HC0k2i72A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 39/69] drm/vc4: hdmi: Switch to DRM-managed encoder
 initialization
Date: Fri,  8 Jul 2022 11:56:37 +0200
Message-Id: <20220708095707.257937-40-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a0b4f75a8085..700feb21c4d2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2985,12 +2985,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -3018,8 +3024,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	drm_connector_cleanup(&vc4_hdmi->connector);
-err_destroy_encoder:
-	drm_encoder_cleanup(encoder);
+err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
@@ -3062,7 +3067,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	drm_connector_cleanup(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

