Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F72A3E6B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67906EBA4;
	Tue,  3 Nov 2020 08:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BD96E566
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:29:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A610312FC;
 Mon,  2 Nov 2020 11:29:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 11:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=5gr58/6D7W2RvnvZ4djQs5m84E
 8morhuCwLoYR4/U8E=; b=da7ZisBluM/RoKKrSB5URcEgdTElnkFyybBZOifIjh
 el8PRWJTM2mlW7J7BuidSmOXEJSjSqAW6kIzd3WgUT809qif9Nny1Be4zvkL1RAb
 3f0w9Ed8s9swTCKZcLW7A5eAHYP8EYX58K4Ho/Hm+G1G+leRIgRdVH5fPxHnMULv
 DMqqdWXWMbYm515oM9f6Y/ETSNAmEa2EnBWn65Q7UCbjGhlb/9daK51DZXvZ6F9e
 VxKcLQ3VfVOCZJ1JtBrEynXvZoIreorcbcVkC4RwIuZXC56mdgNvm0PPG3ST34fa
 kcytYtWrJHrgvDFo18w30DK7ahQOFcZPKu11cuBCIXDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5gr58/6D7W2RvnvZ4
 djQs5m84E8morhuCwLoYR4/U8E=; b=g6oB51MjhkfB5M8GBQKba5o3L5WvWohNg
 2bDI5SYsOsFlpVwjg69F48aW/BOi799D4oFK2p/4zvt4y5PnPcWiTCVrzwNjjH/Z
 OZaspQ6UOlTnXL+f7Omu7UQzjX2hROptNXDbI9ZNbu4CDI1nrSOMOTnR5I2yAYoF
 EFvaahg3/kVcdVPX9z+PH8L+baZFxqIgNMgMUiJn6COMiCdZKWeq5T5D7NUqhc/w
 4xmiqhpIr/d04f1q2p+uclVbaCpBEtl/gF0QideqzhOBUv80P5KvBj7LFdzjV/Ey
 f5n4JukEUNzEC83CHywh6hLzufL6RdTVD8Ovr/N0xiJt0cqwE/pzQ==
X-ME-Sender: <xms:1zOgX0Rd4xjxQ-c7Rp9Gotsx2L-v7CUKJmiA64KtJZL2VisVKNzVMw>
 <xme:1zOgXxzqPxmXvsIX1YOW66BSKp80nb0plNCIURXwODpBC20q4yPE1arxbGlvaoMPy
 aPAxb-N9QQGPL22UDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1zOgXx0uvD05UHto1RKCTTgRh894Y6ssXlkZIM1Cj0MTeiiI7uhBbg>
 <xmx:1zOgX4AcLUj3JixTpgcGeE2HKxWrLDttcC4NGakr6sZzaoGvTGu-GA>
 <xmx:1zOgX9jmE8WX7sZaQzIQLXIigFXwV2A98yxwJO2MvY0oE-2Chl_gJA>
 <xmx:2TOgX9fS1vykuB9P7Dcp1ysOhi_APw5h7Iuu7UKkhoAplweXsnaF5A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75D683280060;
 Mon,  2 Nov 2020 11:29:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: drv: Remove unused variable
Date: Mon,  2 Nov 2020 17:29:08 +0100
Message-Id: <20201102162908.1436567-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state
objects") removed the last users of the vc4 variable, but didn't remove
that variable resulting in a warning.

Fixes: dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")
Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 08c1cc225045..2cd97a39c286 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -307,7 +307,6 @@ static int vc4_drm_bind(struct device *dev)
 static void vc4_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
 	drm_dev_unregister(drm);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
