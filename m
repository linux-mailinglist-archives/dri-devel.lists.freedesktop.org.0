Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C0570939
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F7390348;
	Mon, 11 Jul 2022 17:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861849032F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DE9055C006F;
 Mon, 11 Jul 2022 13:41:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561269; x=1657647669; bh=SL
 lTDF24f9TC/ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=ljZlUIZgVE6oeC2DJh
 XsQHOpxlih4JbtgO03n7aKBACJ/tM4aiHnCbOf2LyaFn6XnAlno2RsY0jZrhDDE7
 xt6axbNfCazWo+qnxmSnC2K5Z+p9SAdzd2HSWF+qR+IpqldOXk0WTugSNwlba1Cc
 bZ189lGCrdQzR6teSNLj8+2MjLKZBRIv7tBcsXS5Fow7e7DWfz4EjyIiFz/cCmGj
 f+I78344fje0k7FVIgMXvayxR1Y0fDoPbHkxylMsQnDUcAEIiKjncU4VHvs4fk+k
 S2XOzEAxtBAP/DFvgbld8RfypO9T+6rYF66pe8Namp3hSbBHwcx4hL4fHvxBmqx2
 wwOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561269; x=1657647669; bh=SLlTDF24f9TC/
 ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=p7IAkfdTTspv7X5lZqXn6Zg50CgKb
 hDWi+NIUn4wWhnQNPUqqSBdyXKfpYhPPV4sKszNxsOP9W+DHwWX6YNlj3rpjQyuY
 h+JBIEOutQs38+LVc/9UaETka2gxqDiXGlK4i8WBSlwVhFfV+t+ol/9qqco8QnpM
 xoY5iSz6SPkTb9QLp8eDDYxbu56UXpXFU9ALgkKGj7sns2kGtBut5DLq0pDr2fAh
 zD6xrJyUrdeTOp22eukvzNvoB+lbntW8nHlFY4ti+ki8H9P9tQx0YSe/cU2WOAol
 MT35Rm8vZC3YubHX69kIjDQrbvZiUZMWtc3wXFFRYXsVnz/sc6bDkUAIg==
X-ME-Sender: <xms:tWDMYh82kF6YomA0S4pJ0i7GR2KEECwIoejTPQLCzYXoSLfjRnuQZw>
 <xme:tWDMYlsBkeKW2Y1UfVOYlr43vexB-13YsgkS6SdR9PKH8Ir-UKyNOXoeH0Stytopp
 u6wh_g2wbJvoM_5r-4>
X-ME-Received: <xmr:tWDMYvCtOeAtM870YmGBL9TqISQrOEVVdCLzkx72z41tuiDXwf7t0fc0__1QJMCqXAiYl6_xnSqC_vtN2qInB_k34BguUyUQ8H8ZTWk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tWDMYlcb-AgzIC6ECjVUnrCJ4Z_mFUz87d6TBDp2yBld8c-TMbCLjg>
 <xmx:tWDMYmOSq5wG2wkodiyDEsL7qf2OT7M87a_lRepCepw0ppaQVFZdXA>
 <xmx:tWDMYnnivChuhBQ1Yb2y-0hPM9wx-TmdahGFxx4I8-nWaWMbvLsGlw>
 <xmx:tWDMYjq63ywUwLjIG2gfESSLqTCMq3AZJIb1TbC8yChJapu2spcBag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 51/69] drm/vc4: txp: Switch to drmm_kzalloc
Date: Mon, 11 Jul 2022 19:39:21 +0200
Message-Id: <20220711173939.1132294-52-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 19e37924ce77..160f9d0ec6f0 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -478,7 +478,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (irq < 0)
 		return irq;
 
-	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
 	vc4_crtc = &txp->base;
-- 
2.36.1

