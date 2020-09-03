Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F425D1F8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B20A6EAC4;
	Fri,  4 Sep 2020 07:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C468D6E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9EDDD9AD;
 Thu,  3 Sep 2020 04:02:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=SzhoICRH0veNJ
 4qUas1HO8W+HK89HEqv093uoSsAa9g=; b=oEX4rromVFVCScx8/cmWZ80EsIsOv
 QLilhOHFiTgkedcVmESeiFA0oFR7HugBv9HA4ZhkOTdyW9SxFRGELnl78cJ/0Dk2
 OMH+ao64RHFquY/kz8bRpWXjARx3wvYRcObVBWgGHdAi4sjngmiGeEUo+t1SSjh3
 f+DDwloLT4/fOhtzEW4hMoj/kd16YsRLkfbEc6DaS2KMS8wSgVN6XR44xjy8Kvf7
 TZD3/S0IalczxDVUlKITeozTkJCkK1Je5N9vZNSjMMJUYMm5arMHOia2QhP2fSik
 UOD77AVDFJXUbiKNFPcpLcrpcPZNwKVcfxPNgd9r8+22qv3NnxfH6xBrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=SzhoICRH0veNJ4qUas1HO8W+HK89HEqv093uoSsAa9g=; b=nxVSEpC7
 wH+Z07sXA1ZwBlw6JAHChrR8YIKzM54/LgUandAplLwTJtAHSu7Sr48xFHagukAT
 mcj9VU46P32/TbG0EEj/xDy3kBH/YsJD9bmP9WS2VYEYRFSsS/vxzXRf+T9eh+LF
 sZOxFPV9yLV0c/pKoyzQ6jKZwEFcXxqsHe8BDRhQ/sp0ROSk7rbagKv9BAZt8/we
 xuy6ycnnQwu++dvJGppOdXcWsVJypfq6e2pw/a1FYDAbDkHvWb8lK/nl0mDzP9Mv
 UK2QfmXPO0gtnw2BgWt6L+iebxb68NPie2GHYZUm2w1RmZMbsczu1zfrLXNburcL
 q2xq7frLZyXTow==
X-ME-Sender: <xms:M6NQX0nulBG8tStLHqPRGM2TTiPcvnB3uX_p7WNgIUHYe-cJoFAZPg>
 <xme:M6NQXz0nwYsVywRNQqoqDK72p_A2wvbEs3zHkF8wBztpwetlQ0TMavKBXnPT8f4B-
 KbRFJCZ_AQXkg1GgC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegfe
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M6NQXyrbGhQtEyI3Sn7B1YN-3d3iuRzYCdvAJMzJK07w6Gv1GxLgbw>
 <xmx:M6NQXwl58muEtNWgEH_hPmWYrkmwy3Sr6kGBt_lNIjZ3GRqdEsfyxw>
 <xmx:M6NQXy1ji21k_dL8C5ESWBrwcYeN7Ry5jtH9PQN5d5Nrv6t7nUEe8Q>
 <xmx:M6NQX_trQtzYzSpIxDp-5koghf_OTLclo4IrhzBIFbMofOHgxAAxvBBZ-Dg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D86E7306005F;
 Thu,  3 Sep 2020 04:02:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 47/80] drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind using
 our device
Date: Thu,  3 Sep 2020 10:01:19 +0200
Message-Id: <717082cba06b5c06280f26c56c08aee512365ed3.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The unbind function needs to retrieve a vc4_hdmi structure pointer through
the struct device that we're given since we want to support multiple HDMI
controllers.

However, our optional ASoC support doesn't make that trivial since it will
overwrite the device drvdata if we use it, but obviously won't if we don't
use it.

Let's make sure the fields are at the proper offset to be able to cast
between the snd_soc_card structure and the vc4_hdmi structure
transparently so we can support both cases.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 44126ae55a19..e0dc823c622a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1199,6 +1199,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (!vc4_hdmi)
 		return -ENOMEM;
 
+	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
 	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
 	vc4_hdmi->pdev = pdev;
@@ -1361,7 +1362,28 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi;
+
+	/*
+	 * ASoC makes it a bit hard to retrieve a pointer to the
+	 * vc4_hdmi structure. Registering the card will overwrite our
+	 * device drvdata with a pointer to the snd_soc_card structure,
+	 * which can then be used to retrieve whatever drvdata we want
+	 * to associate.
+	 *
+	 * However, that doesn't fly in the case where we wouldn't
+	 * register an ASoC card (because of an old DT that is missing
+	 * the dmas properties for example), then the card isn't
+	 * registered and the device drvdata wouldn't be set.
+	 *
+	 * We can deal with both cases by making sure a snd_soc_card
+	 * pointer and a vc4_hdmi structure are pointing to the same
+	 * memory address, so we can treat them indistinctly without any
+	 * issue.
+	 */
+	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
+	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
+	vc4_hdmi = dev_get_drvdata(dev);
 
 	cec_unregister_adapter(vc4_hdmi->cec_adap);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector.base);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 749a807cd1f3..d43462789450 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -53,13 +53,13 @@ struct vc4_hdmi_audio {
 
 /* General HDMI hardware state. */
 struct vc4_hdmi {
+	struct vc4_hdmi_audio audio;
+
 	struct platform_device *pdev;
 
 	struct vc4_hdmi_encoder encoder;
 	struct vc4_hdmi_connector connector;
 
-	struct vc4_hdmi_audio audio;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
