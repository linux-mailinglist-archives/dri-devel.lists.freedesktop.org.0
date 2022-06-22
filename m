Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E340554D43
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50110EF49;
	Wed, 22 Jun 2022 14:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E154210EF49
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 999B13200974;
 Wed, 22 Jun 2022 10:33:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908439; x=1655994839; bh=t2
 cS8QDnsGDExMLGEWm1zU1glUm4TpfnJ0KxxFD+AcQ=; b=GjPzcZHKtuPATEWp0f
 hQuu45V+6fbMzGBCRT816QEQoAgfLMWr6Ycm/x/p1Jw8S1TOThhp9Q3J1D4aBs5r
 n7++EaCnUJYyNZsrNoJ9jtlAByJfP11HJ0IX2X9RjZBqTQrGtZ610Q4KFvzeO20P
 upEPwDnMFuG5qTLrq88arh7u0iKMWdvHy2YB8OFCUOe8p9D8yaEBbUfF8XzZZyl5
 gZukTDDwkO5RYLfsdUtYoJz8Y+3VD5piKsrWvhYX7W0eYD25r2vOJe8PPCSi5Qnq
 0V2VmSLQ5Z+PRsRSgWrDPfG0upE47QMTtLYJtjSnpq+xN2DooiHJMYPSgR+DObMR
 A7Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908439; x=1655994839; bh=t2cS8QDnsGDEx
 MLGEWm1zU1glUm4TpfnJ0KxxFD+AcQ=; b=qkC9NPuuPCa1tOvbdkLdPGVEOlKl+
 s00LdDzAVCH76CmSl60f3raKrJQI3j8j8LDqPYoUdIoftQWybob8ZGcjODCEzzni
 nIvgoWNGmcugQj4hOILMNbn5H3ingwJrerZa9CYk/4Y8vJxc/Uma9jSvbBmgUzld
 IGXiHz8vYI5woM0T8LORjP5riPILMaHY60RyOuxgK6ntyJK4xMxUkwHaokHtY8yX
 1AvOnEESpHLHVyKRwRXjRzVJa58+CzEWBoyWUmoAVGsGXlG/s4Vw9A17EeKWwYw+
 6TatLLYF0cXukPFBfEkDCjO+o+YOh7pSwMKnRdKnCfd5c0EU7dFBw4HZw==
X-ME-Sender: <xms:ViizYoHZHS9qH4VGm2Xb8YPZzOq-hfpDBlH07NL4mv2ZlcegYewTwg>
 <xme:ViizYhWeAYoAfauXd6dfHbK2Jbe5ZKvzujQUWUdRoSYTuN5H-eEQfvnjtygpL-TWf
 Iwup7XoiI264g4CtyQ>
X-ME-Received: <xmr:ViizYiKFcx_o9YVe1fjhOlC-vAJH84MOFFA6C2IGEmU8SEvL-PqkBR8fZEFsfIxrKYuRpuXhN4aaVO7t1GxS5GqW8o6IDUbqP8epDpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VyizYqGnB6qbN64iK6lMw9fUV7Qhzn_R9lPQOo4CiooVYuOhqPs1Uw>
 <xmx:VyizYuXJjKjPRKWyWHVEHLO4F48KCQYeKlJhkx4Sh-AK6T1L4qDZvw>
 <xmx:VyizYtNQWHe0FW1j-zzYOBbh7sOdv3VKVx6NgDzOozx7RLr0euYrkQ>
 <xmx:VyizYgdXeaClHcY3FPV8P-fmzPAKZZsz7fFcREcX5hPMEUzkr2MKmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 33/68] drm/vc4: dsi: Switch to drmm_of_get_bridge
Date: Wed, 22 Jun 2022 16:31:34 +0200
Message-Id: <20220622143209.600298-34-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index f3214675f8b3..b3c97aa11e7e 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1584,7 +1584,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(dsi->bridge))
 		return PTR_ERR(dsi->bridge);
 
-- 
2.36.1

