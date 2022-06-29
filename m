Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464F560040
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6071112BD7;
	Wed, 29 Jun 2022 12:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB89414A664
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C2B47320097B;
 Wed, 29 Jun 2022 08:38:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506292; x=1656592692; bh=Rs
 RIpUlOT9kuILSlKRRCKRjhOmSJb5m4YvFymsYvUPs=; b=z9yfVwwM2bC+HMf4vC
 u5Myu4gQgpAirZ6lWyk9i258M8vfqobCUMsSieePAFhGW8xrsbmdmLTenWVm/sCu
 xMyIZalOJipfLL7Sgw+jRVZNEGOx3g1rwLjdvqS0TQxuFilWh9qGcBtRhmRF7ISg
 CGxGqDkzN875+YMDujZ8obzZ6BmcE73hpLbsTM7p5FgHPQ1nmhXa6kihlZzaOb7L
 Pmzk/VoY7a4/gbqVLRivIUOsIUOHAcfFqB01yZ2TyCO1cpTIoGJsLeZ4dCYF/0Vd
 dPm+MmWDtS6sFL0H/nwldxAwwqjcrze+VXcrgpM+5fEU/JT773G8QK9UhjxL2apW
 Yj6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506292; x=1656592692; bh=RsRIpUlOT9kuI
 LSlKRRCKRjhOmSJb5m4YvFymsYvUPs=; b=HmBKdTa4WA8tXVj1wysRkrutOy/aD
 +uELpkkOgqEurT+0YtUbOwiOO02DNuU+lqqroZWPUk/zgMIa24pv4r4LQmV4LSW9
 i3aA4A4E6FTSzoBxpnEVaq8FPouTLwuOeAUf364dRYTgFkGGMFIb0qobxaHOBNUr
 BedRPh4xeeJ5sg46qx81gbqkLRDZykp/W+oLMYm74Oit0bjmHXpAvmIsIy/qrtLf
 YDxdJhr0mKgM/nf8N0g0FYDYSJcfF+2cQOB8XCk/x7NxfqDE0mf/3vN0wJFwgRM1
 mMOW+jBnDN93oTPyO1nLFB3E/h9MlloXxYqi65Uj69kgu5L+VrJIaZX6g==
X-ME-Sender: <xms:tEe8YoubvYHBxFx2F7I2x6q3xQMRmsv2XqgWQxRRGPo5jK7v_ele2w>
 <xme:tEe8Ylc4lM2aRw2FOZXSRNSfdtv5p34CrRE7eiHab7RSWxPOBChJOZP80VH_mB0bI
 dnYL010r9LJllORfjc>
X-ME-Received: <xmr:tEe8Yjx_Tgy4EthWepC9Kalf0TLbknQvroPOYClbNVh1FXNfq8qaBF5Ln0QM34C17Z_JOBV-VHdXHIejACkScGTU1I8BmtwyX8EczRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedujeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tEe8YrOA71svZVJZm91krt1x0tMl5JqgSIrJ6Rpg1LTnJA8JHSmi6w>
 <xmx:tEe8Yo9i4m3xLKHQSnHcl1mJp5FqjwRzEUvovgLfh6nxbW_Lc2pt1Q>
 <xmx:tEe8YjUNq4yXpIQR88O0Jfnuep6eg6WbiTcj-qpi-Q3zf1E3B5cYNw>
 <xmx:tEe8YsaJie8hcsOhAHV1PKOIE19Xq6BwVSYh_lSiTZSQezGj_guC_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 60/71] drm/vc4: vec: Switch to DRM-managed encoder
 initialization
Date: Wed, 29 Jun 2022 14:34:59 +0200
Message-Id: <20220629123510.1915022-61-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_vec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2e9dc09fc6f0..518b66bcc0b5 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -528,12 +528,18 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_encoder_init(drm, &vec->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_TVDAC,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	dev_set_drvdata(dev, vec);
 
@@ -541,8 +547,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_destroy_encoder:
-	drm_encoder_cleanup(&vec->encoder.base);
+err_put_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -554,7 +559,6 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	drm_connector_cleanup(&vec->connector);
-	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

