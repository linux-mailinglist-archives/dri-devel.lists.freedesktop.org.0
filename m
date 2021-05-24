Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A838E744
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714896E56D;
	Mon, 24 May 2021 13:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662FF89DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:18:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8A391395B;
 Mon, 24 May 2021 09:18:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 09:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=A4U8f622y15xN+ZagXBG9NpEC5
 YDva9tV4Lav/1ucwM=; b=F3ynUO4APQaMxLO/ocrADPqrX6M27XLkniI2nEhnbj
 aajvXV6vvOKgSEAVvsP/4L600n9a4/MeUZop4nGHymNHJ9I9qeWDkMUzH2YwuR/x
 jxD2WIbA9mSTPMNFNaJZxAaLun4cWMRbTuh49L9+5/UeZ6pv30yED+lQ24N+ygn+
 oxZ4pfaD3GgyvYf2BJvOdbvkc0Vhx/o7f17iX1jziXzqjKL35KeTLz9TATv3uIlW
 nR7UoVEDkYKC+Yaq7Cus6mSBBjCY2o7GjrHWvsNFAiyiiq996vQ61AYy5e70YK2Y
 4h9Lkv1Am3AWkQVdsABgwSNvsiyBZ8OV5OL0yuOeIzwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=A4U8f622y15xN+Zag
 XBG9NpEC5YDva9tV4Lav/1ucwM=; b=jzIUuTKnJfSXe7D9TrvlpHwRUFH+2/S9i
 pzlS0SNUF5ddkhNkJQ9qQSZx2gpAP89Si6joYT+wQ5N5uept7EPi13ostt4f9+CZ
 nrRVuWDIO1NlMZ1mcQo8WAiA8xDKxI45pF/c7gKdbInAZF4hHSi+PxuezivJG0TT
 ZyGJgWLoJlUIkb0Ak8u+KPTv4x7FbulGWerKZ95LakFglRyNV6zKgHp4Q+NsdunZ
 Hsna8g5QR8buCa54QsWtt7A44szBWcDDGyXJ4Q1qcTgnfBx3G63ipb3XswOYUt6j
 qXJDTWDeQoHrOVP2O9vyk70BwX7+RDj+duobk541KnIZSThwgtKmg==
X-ME-Sender: <xms:vqerYO6fKQa1oonH4DaF10jg1P2qWxozCS3U0J2UqVD5UpFPGXkvHQ>
 <xme:vqerYH4IxyCS9p8M8SCq9_Y83_1IFXeNLXagUYl6p5rNolSSurxXzPqKzw3oOx-FV
 b7oGW9Dq-Mgd21FdiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vqerYNcp6NULpyIzNbLohI3f1mSdLFn3RNuDHRMKmKFDPT6RvyJVww>
 <xmx:vqerYLJmiPKkhimIqF1SuohdRkcjGr1VmNh5_EixbVe81ZRWtxNeIw>
 <xmx:vqerYCJqsxTsZUuhmZ-ZIRA5j78a2UrltQPjQAs5FbA6KjTx5GbNdA>
 <xmx:waerYNa3SyqoTN2xVFzh7KkhUoqXY_NdBmnMU4IkK-1pz4M6nAAaBKDKluk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 09:18:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/vc4: hdmi: Fix error path of hpd-gpios
Date: Mon, 24 May 2021 15:18:51 +0200
Message-Id: <20210524131852.263883-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the of_get_named_gpio_flags call fails in vc4_hdmi_bind, we jump to
the err_unprepare_hsm label. That label will then call
pm_runtime_disable and put_device on the DDC device.

We just retrieved the DDC device, so the latter is definitely justified.
However at that point we still haven't called pm_runtime_enable, so the
call to pm_runtime_disable is not supposed to be there.

Fixes: 10ee275cb12f ("drm/vc4: prepare for CEC support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c27b287d2053..ccc6c8079dc6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2039,7 +2039,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 							     &hpd_gpio_flags);
 		if (vc4_hdmi->hpd_gpio < 0) {
 			ret = vc4_hdmi->hpd_gpio;
-			goto err_unprepare_hsm;
+			goto err_put_ddc;
 		}
 
 		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
@@ -2080,8 +2080,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
-err_unprepare_hsm:
 	pm_runtime_disable(dev);
+err_put_ddc:
 	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
-- 
2.31.1

