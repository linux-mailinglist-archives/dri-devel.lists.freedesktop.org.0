Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B656000E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35814A616;
	Wed, 29 Jun 2022 12:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8714A5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id ED8F7320096D;
 Wed, 29 Jun 2022 08:36:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506204; x=1656592604; bh=zT
 ezph7MeMylpxa+VRTCv4r/eP3BX/8rfolLtm6Kfh0=; b=VQG6JQBQ4w5pyHXPFn
 vG3d2vsPaNf/d/VTZUdOR0Kf3udnhqrRl4HOoAGDz9f4xaFtGVs3PtsKLfFBxn19
 ngFtwZsaILe5w+ZoQTFQPX9WkTwlq7IRG9YDjDfe8C8UcL4dy9Jm3uCPyfxBwiWi
 EFL52KM0FFxzVMtR0+uKaOs40JVeehFBkza0/4RIK9iIAohx5Q6GW6jWl+ERYJN8
 7akGPBpioXDtns8nBkS9T9DHAa1kqaegqrO2s7mFgrZsWWntVH9Vlnl8/743wlrq
 MzPtxnlvvGq+KyGv/qBJ6Xu2LfPrV1e+HWe8XZB9XhHMmnvP3h9K02b0UgZ2dpEs
 KnNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506204; x=1656592604; bh=zTezph7MeMylp
 xa+VRTCv4r/eP3BX/8rfolLtm6Kfh0=; b=xdifoMx27ihQL4IaKjMPpt20d4PHD
 CQEUYxW7tzjuQ+cckwJ5MmysEdJhhvMmhRv2NvWZptrT6szCIs8LZBuj6gY12t6p
 xEq76XjPZ3k7vvYH2cpadEbDFzLuN04eJM8xBitVEkPP7Eaaibps0XXcBw2OPf+l
 HrSUBhWl3Kd0cAqqjtGaS7NPtZCrgmrSmZcTwQJLOBvCYMMgdMxMxtZI3kSRFtqh
 zxv4/ihhmzXg6gMTpovkaUHNeO0DiZrA9NkTgmobcH3Qzmo3u3B5DSjPW7G8RFPT
 SSWOjXzfY7v1SRw3OZy8XqYeRrDojrem+bIFKVG8rHfvDnjNO9yGkLv4Q==
X-ME-Sender: <xms:XEe8YvOHZ2D9bQL7N3q8ze6B5lRxL_JP-OvXpOnw3HJVYwuTNUHRHQ>
 <xme:XEe8Yp9QM2ZglaeoHINFvDiISN4kHnwxtVSX-MMFrF4quRAE09XKqrPZRtVAOMbX4
 eFf3UGvAOYeX-1eoFc>
X-ME-Received: <xmr:XEe8YuSFPMoWIXNQSmGGVvIwLkxzv_sJnVhmSGZkFelQcjs8f_awjpOxelupGMA58H3yBDT_XIxyXDg_R0vrUYf7fvPFo9ownHievAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgieekvdevffekueejffdtjefgkeekjedvvedtjeekvdetleeigfeludej
 keffgeenucffohhmrghinhepsggrshgvrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XEe8YjtGI-er6KgICtwnj4OrSbGpPVHcg3vAuRy0Uwr23mWwZkMgLQ>
 <xmx:XEe8YnetxT-EbxpeknGDtGi_QjKlj1odTKhgQIupTMEabXvwlRaUvg>
 <xmx:XEe8Yv1hnl0APjvcaaXRpvhUkcgnIDeOybmea_qnO5xWc5wPJCFWig>
 <xmx:XEe8YoHSTyXe1ryh7WuqfVtMwdmNf9K2UCyMUM0ay8bPOPJmf2EVfw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 30/71] drm/vc4: dpi: Switch to drmm_of_get_bridge
Date: Wed, 29 Jun 2022 14:34:29 +0200
Message-Id: <20220629123510.1915022-31-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 6e0d8da4ae1e..b4059820c9f5 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -239,10 +239,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
  */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
+	struct drm_device *drm = dpi->encoder.base.dev;
 	struct device *dev = &dpi->pdev->dev;
 	struct drm_bridge *bridge;
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.
-- 
2.36.1

