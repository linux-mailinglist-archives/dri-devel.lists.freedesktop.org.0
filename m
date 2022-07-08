Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9127D56B6A7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CA110ED0E;
	Fri,  8 Jul 2022 09:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976710F50D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2C7DF32009AE;
 Fri,  8 Jul 2022 05:58:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274319; x=1657360719; bh=S4
 IwQwilp9MbI7mX6sunJejucqIp4Zp/8ywgQvIpGqE=; b=GwSErqnlIdOLqGEFe0
 Kt4Dt3+JqU18FIMZvcD6rwNc8oGHBR14bWszP5jEs+a2ReXmGivZTnFtSmFgS6Oy
 +QUBWxjyKuAw4YxoKska/hLtWqggelUpCQxolO5nKFmtl1MgYDFS/WBOXgt5Buxs
 gcdN5NuUyowvwp9gMOGXSc3N7Ug+vfIOM/gPHZQ20tAE71kn561llt9/0X2tc9Oe
 YaoaqiH/fJBeB73F/Hlaq4ZNOUPcyO2w8B1ZaAZQ768mk1hqvN7gm0IN43MWet83
 xcBAJRCGUb2Hb+dHjtIyIHo8fOPXKiuzqyfC/tv7Z+DWqUVzlFcO3JymXQkLv7h7
 yfrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274319; x=1657360719; bh=S4IwQwilp9MbI
 7mX6sunJejucqIp4Zp/8ywgQvIpGqE=; b=AQr5sdcT/m9goeDKC5WFTyvseAJ56
 C7ISmkpTUVvXLVVTDdhWFWzN1P07yfsP5Ur74JbMTSE9rC/j/eOxf4cc4tTSZHfq
 Irv01YDod4frZl9zO+1tteo01K+XY3KIkqFkpy4ReAWIJVDuUIE0J26d8UTLQbfL
 O+xXyQVmQDEsU130yvOggscVSMoC6N+cXKlK6pIeHRut3mC79j2ayekm0YWBFkHo
 B2zcZ8vbYBGbAPNjIKE/65pOnWxlRVmBtc2DCvSSbp5YPEBtbykrNpPbXc+J/hFm
 vnZElSm/vXtmD6yXG3DPU87PqsG7V2CHTpd4FyzqqVc/f6VaMBhU7RIMw==
X-ME-Sender: <xms:z__HYqJnM4PEYv-qStCVFLti2q4TMJXvnx4oBBgqd5ugFvsU33_JgA>
 <xme:z__HYiLITFm00xnEoGvYfcf4826tQZQPTWNP-YqVwGmZCGk1UqKX-lO2kgM0onRc0
 fUxkltxP1u68pJhISg>
X-ME-Received: <xmr:z__HYqsaOPTIZGr7AXe2waWFxjyHK3q4FGENxa8tw_1tyHiRcL0Joa7-4Jj4IBlAZflJVFSTfe4to-yxg1MlbrBxVSxedTpXiC3_B8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgieekvdevffekueejffdtjefgkeekjedvvedtjeekvdetleeigfeludej
 keffgeenucffohhmrghinhepsggrshgvrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:z__HYvZoYIjVUwnblreL7YL3efUgAnFVluMIpMXywckTO5IJhcbL1Q>
 <xmx:z__HYhZ5ZQLdrs6LfsPQJDbIonG6MZOehy9f0hHUWlpCjGBgBYqC4g>
 <xmx:z__HYrDuLGVKofcBrsuilO0V8VSLS3KNbE1f-loGegRtX5L9cyefJA>
 <xmx:z__HYkxoIy_ifg7TEP9tG8QUFqc7l9cdBQiFv2ZNWL9exv5PAIiaKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 30/69] drm/vc4: dpi: Switch to drmm_of_get_bridge
Date: Fri,  8 Jul 2022 11:56:28 +0200
Message-Id: <20220708095707.257937-31-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ceb14aea6c05..660feea0534d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -240,10 +240,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
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

