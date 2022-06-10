Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3A54625D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63A12B0F1;
	Fri, 10 Jun 2022 09:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5687D12B0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B0AE15C00D7;
 Fri, 10 Jun 2022 05:30:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853459; x=1654939859; bh=Jr
 yVdK8hSertYy2zcgFc5JMQAjkc6tLgxzwTwbh9SuU=; b=U9cczYl07qdOlrP0ht
 VDJdhemTchifTg3BX6/+WVnFLIrNBzZr+nCoOKpfpMnmSjdv56A+YW8Mw81OSytN
 dieWHh5cPEjEhAzsyZvNgPAZLLrpXfChPRYZqQpS0KdEF6iHEbBJY9gP+YfNF+bX
 4j6zZtZsXoJUzA5rj/XAu2mnZCJsnWEplbQnATogl2D4c+qHtUzjaPzwuZlvyxlg
 BmNAUKKhbVmJEELOClWDK6K/aahrbCfCtM3Xg+A0+ffQVCwddZfXxXPtaETZLP5w
 ZjjabyiBDGWyDWdl/7jJWv/+o60wuomuGsGm3MEBq9LPOCuq8qv7qMCLZ35N/sij
 vbeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853459; x=1654939859; bh=JryVdK8hSertY
 y2zcgFc5JMQAjkc6tLgxzwTwbh9SuU=; b=uCAWGMzKzxIp4TZIv2V6/LjxkTuQM
 +LF01Wl/BTjyOJ1fDS2M0RXZYLG73UyTXYb+FKyw/wAfpoRSSodUi57ZXexKrtVY
 /qTJBX8Hf3kW0a43o+cRPzmnmp3bu9VoFUAcV5bABETIIla05tRtWPAGvwlE62AD
 ZqbMahTosRPsdri/aD8iKd2QiUexFvz9Xf3t/qF6JSH702Q3fPGABhUi835KgV3v
 luaedw9JB0gXAHBfdxFKzs9o/d5rz/h5IosEDDywqcicdCowjMoB+3gvbSD95ooH
 Ay7pYEy04mGUioX3b1jUv3Zmp92Zy1sZj+0Stz7F2X3ziKQiqAK4AgL4Q==
X-ME-Sender: <xms:Uw-jYn5aFeQ4yD4TDIo2l0tklJYCSPclodElvrmNxHJXP2nQUlAkIw>
 <xme:Uw-jYs7XgkR84seIkBWRtMGiRlxXAeQbxG84tqKvNmnXKUragZaMfDRuNUtXozVOz
 v0oyT6iFdYCSVMPGh4>
X-ME-Received: <xmr:Uw-jYudO4Ub1XQpHMvEqDJyptzs5oYQXIWQAy0S-zBMyhzscPLaIzUTeFJZuXH04hGdaS3cw2AEsqj17tM8jxg5Boexad50mNS5m1kU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Uw-jYoKOqe4_h_d8-ghD6Hb69dHKhO9ztnJHwVUDuCPbExSpxScGEg>
 <xmx:Uw-jYrI9VkzfzgzY4PYyUZ6LeaPsK8IttdcEZqyzq67o1DyZbNA5RA>
 <xmx:Uw-jYhzNJLmsEI-JT8srScQaZNmgafQNSKkvOBjzUE_2A0nsmioefg>
 <xmx:Uw-jYoE5xkN2IPXqTye8wExNpgY5eP31sLWhEfeUWSjSjw6CP25GjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 52/64] drm/vc4: vec: Switch to drmm_kzalloc
Date: Fri, 10 Jun 2022 11:29:12 +0200
Message-Id: <20220610092924.754942-53-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most like source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2c96d5adcf49..a051b25337c0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -509,7 +509,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vec = devm_kzalloc(dev, sizeof(*vec), GFP_KERNEL);
+	vec = drmm_kzalloc(drm, sizeof(*vec), GFP_KERNEL);
 	if (!vec)
 		return -ENOMEM;
 
-- 
2.36.1

