Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C12546266
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84312B54C;
	Fri, 10 Jun 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174BD11BA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DC835C0121;
 Fri, 10 Jun 2022 05:31:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853466; x=1654939866; bh=NO
 QGh6AIWEvONe+PTcb3HveZum4NXCCV1WbSYoG2BtU=; b=PEZ4Tiv0hEbcvwCnX3
 yY49F73EEyIjeU8N2FOZij+54bMWXaly25YRfFNVnnBOjQ55GqERoZvxjS8QD9BO
 qo9QVSGRo+57MZHimxrvGlFAPkf/obAaN4hHgkCE23N6bGb+EtmWKmBMTQit4rTM
 oWRD+i3NgEEFYnc2dj2ZKm88lcOtL/jKz1FcOewQZO5YCQw7b0uqhNHUXV+BNpJV
 eRQTtXNaiVnkJ5JIDs1H4mwlcYI4B7gFt5y3v+p9VdtSQ1X/69R2WegJDkyZXPQS
 oNTCYUsAUJQJUKLclqJ1WcUiTcpy79gl7OgLbxv+Zg2wRXBx0pZhhdy6G910W4er
 ODEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853466; x=1654939866; bh=NOQGh6AIWEvON
 e+PTcb3HveZum4NXCCV1WbSYoG2BtU=; b=Iwj+5GqzFc+mYfhuWfUUuIjhBIIsV
 OFrMI+sut09t0pUZRIjOOwfbs5enEBM49vcQYDZjOrwASUaKp8By2Vd+YTlD0jNS
 IR3vAgisFwuiZxEToZR49g2iEDHG4A4rYwzPk9w9aba+Xr8uP183aodTeg2T7eyG
 6Z3I8DolYBh1W7cH5MSvFOmHK9usHl8DUlrm7Ef+FwSuEKECNaLXAiAm3H44DuVX
 GfHTTD91+O9YJf+JBZzxutRM8PLuR2tjOdyu5mMlRATTyw6CfRcbOG92REXWeeUi
 erZx8QjXYU3WZ+HhHQMGIPcfKGtzOUXTKiQL6glg1owGwgmmJ+MA6sjgA==
X-ME-Sender: <xms:Wg-jYj1GtZCbF5TTdiBLSiI9-OJJVrUL4OfHBt-ep3CHFpDksQKCag>
 <xme:Wg-jYiHSe2jLKYG5pijrc2F6wPy7qwgqk8rteCB9cc34CBV9Krk1-u0RMvqjqiMoh
 -jPrtWw-Lb6m0K9JlM>
X-ME-Received: <xmr:Wg-jYj52TgfAAx_gqiWXeU0b0OMoi6z6VCDmdTUj_N6cMWl28tpFs9g176uVk33It_M1we9S6Qkrvu9nEyINWTo7Woa3utu1S31PmsI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedukeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Wg-jYo14r6Qzl1t5yfIJUVTZhkmxXW9BMHEN6vTfPtjMdVdN8w1P9Q>
 <xmx:Wg-jYmHGRGnbY7Dj_8vVyTM0e1t6cd9tjv47KCq5lT6i-9DIsb_BUw>
 <xmx:Wg-jYp851hxSk-4HJ0HcESW9kNdyDcEiyQkqCJ-2BunHqDrx85FP2w>
 <xmx:Wg-jYihxqWuoqr1n0XQO5esLEAyTegQ2jbp9eMeQSBg4MAIJKKUY9A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 56/64] drm/vc4: vec: Switch to devm_pm_runtime_enable
Date: Fri, 10 Jun 2022 11:29:16 +0200
Message-Id: <20220610092924.754942-57-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2a72644d99c5..a75b82de3796 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -583,39 +583,29 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = drmm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	dev_set_drvdata(dev, vec);
 
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
-
-err_put_runtime_pm:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static void vc4_vec_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	pm_runtime_disable(dev);
 }
 
 static const struct component_ops vc4_vec_ops = {
 	.bind   = vc4_vec_bind,
-	.unbind = vc4_vec_unbind,
 };
 
 static int vc4_vec_dev_probe(struct platform_device *pdev)
-- 
2.36.1

