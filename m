Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E92546609
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7357910EB16;
	Fri, 10 Jun 2022 11:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110010EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EDFAE5C0110;
 Fri, 10 Jun 2022 07:52:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 07:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861927; x=1654948327; bh=mI
 RldLRdZoIGgKsJzJbZrwcCHj8OhaIA1sASOgT8sI8=; b=VA3YXasrhmomrOnxNy
 YrdKGTPOqQDgKzmcw92Purg0/wZeu6YFgelbU4YyQzjg6hPf8/HK/YVCc7AmJ8pq
 xTzS15Au5tnFohK9kGAbMkiNsHGMr5x/Ts8ozC8LvyoZMg0yAQnXkE/TlXLrX2f6
 u8SUbvlw/PcSYve70ygG8vF9Euv71hENV1SuJuANSiiq6ihafeLXTJA389SBYju4
 6AIFLeacTIg8fY5qfjUsxgdDqYzE6FIIbI+WevfUQCdH8Y4SrEIbAfyEIxWCOGoA
 MESqlpBZcbzBKyAoO1pO4YBAvNDNQl0W08PUKQ3muFuaW2f9jomnAunWmFh/W0AL
 e9yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861927; x=1654948327; bh=mIRldLRdZoIGg
 KsJzJbZrwcCHj8OhaIA1sASOgT8sI8=; b=fBYsyqUs1ZEjx0FVx+ZLwOY5ecjFB
 vv4TrpMxerS+9E7LOLwT5W3YTe3UZiiH78kVSW25LGTmW1Lp8PWEWkBWoHImgINa
 cYsa+RcWzp2+9EtY85xi6LRUv83Rg8za1yLkT50GpHA8iRVGVAn/me7WMgiGDaWZ
 0WhbqOmRolC/Hw5knibxxRNP8BLwZ8A2UKC9mhSsoRlrqWAfG0PfliOj7aB7L1Q8
 sYQZDscpkGqYE9HbZqo8TRZ18dk85EV93qT5tA2GxSAuepdlZgLXeaPvEUChpF7d
 oRkodhACDlT0eH0sY3oSXUTzWfElK/qjXDfHGZCdbHh/72xoMVedkTl0A==
X-ME-Sender: <xms:ZzCjYlaxQdloqZvgzqYKA0MNrZ8nyDOSX9UYCu6EMwokaxP25smXyQ>
 <xme:ZzCjYsbhid09XlBlwjkFDzW9HDwt7xWXgqrSDuf9XgGcvTXlm0J8Hu1AxA7zQb_y4
 vqi6Sc4MdmvkC2sr-Y>
X-ME-Received: <xmr:ZzCjYn9ddQJ39kOTzqz8Ta3dwSXPlmBxSdoVtDSTCn81BwZEeZ29lE_9gsgj6NZUM7R5IKqgOw7gX-GknlzXnzWEiqSKc-mcuETTVms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZzCjYjpV8BVfOjqe561_Rpjq50xSR1mTk-LhTZL-GozAL9ilQi-Lcw>
 <xmx:ZzCjYgoqol14ERKw00a8Db71vu2hr-rL2d2EKMA98q009xFxXLoOKw>
 <xmx:ZzCjYpR-730o65BVOp1gJ4NuelLg9z91aWPapuJwma0uqJrouleTbw>
 <xmx:ZzCjYlDhhsa7t69IAbdCnzjIwlaj13JY5wU9U8hAxt1MPenF5DOX2A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 08/14] drm/vc4: drv: Skip BO Backend Initialization on
 BCM2711
Date: Fri, 10 Jun 2022 13:51:43 +0200
Message-Id: <20220610115149.964394-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, we currently call the vc4_bo_cache_init() and
vc4_gem_init() functions. These functions initialize the BO and GEM
backends.

However, this code was initially created to accomodate the requirements
of the GPU on the older SoCs, while the BCM2711 has a separate driver
for it. So let's just skip these calls when we're on a newer hardware.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 528a1e2761f1..ef4ab0563168 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -285,19 +285,23 @@ static int vc4_drm_bind(struct device *dev)
 	platform_set_drvdata(pdev, drm);
 	INIT_LIST_HEAD(&vc4->debugfs_list);
 
-	mutex_init(&vc4->bin_bo_lock);
+	if (!is_vc5) {
+		mutex_init(&vc4->bin_bo_lock);
 
-	ret = vc4_bo_cache_init(drm);
-	if (ret)
-		return ret;
+		ret = vc4_bo_cache_init(drm);
+		if (ret)
+			return ret;
+	}
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
 
-	ret = vc4_gem_init(drm);
-	if (ret)
-		return ret;
+	if (!is_vc5) {
+		ret = vc4_gem_init(drm);
+		if (ret)
+			return ret;
+	}
 
 	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
 	if (node) {
-- 
2.36.1

