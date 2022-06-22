Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D689554D53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2772113397;
	Wed, 22 Jun 2022 14:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8311339A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2B9513200974;
 Wed, 22 Jun 2022 10:34:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908483; x=1655994883; bh=LP
 v5UcJJd8NnEBciGXdQpxCiOcxpdk7ksmadhaTgajU=; b=Vn+MZ40FaYj7a0Lhxb
 ZZuCbdaRxHNhn+/kPQgbWG5deX46TlV9OPcFuk8/Ysz2I1wd8nRwgfWNqnIAUw20
 W1+5b2ahpOnR52h4QtWQLmEAhSRR9zWADlF+/VAmbL7Ytqj6wbUOfrNHz5eRR8ob
 RXCvXswqezWCdr6lkDX6+9R6XnPmBgkW/YZKPnvQ0MBFnFutIvuATyfJKbb8K9jC
 pHyeNFEuAZcO9Uqn4rKpjoz/kioe4PlNi59aDMb4WfBCIsh3Gg7YTXC4B+3RzzqA
 PnyBp3XLs/mBhPHGmUTM/Qa10yTjUQhgdALMGztJ03Yhuo8exctVUTCeHllKR5RL
 x64g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908483; x=1655994883; bh=LPv5UcJJd8NnE
 BciGXdQpxCiOcxpdk7ksmadhaTgajU=; b=iP50pQDVoJlR9MRVS1Ro0/yQCq93z
 tNei/ttEPZ26Klp2N1G7pf9QJNBF4Bx+6I0BW/SCtscSlE2C78BPmJo1i3y9Po+f
 7U3irlA+cEkIqmV7rxho4JaR0pkcYjhftmTtVomSe/SQPMkyYr3q7kLrWjDu2JYc
 ZHT5NAt/hG5fErF94o2Kt9Q7HByTLJ6SFqNO2z6t61vM6QayjItC9TeBNsV+tf9c
 aqBuhfC4WdQ4Kq9dq4+DwujD0qro8zBMeuFtxpxcXOYo+OQR0yjZZQXKzggp8idR
 wjus2j4w3HqzUoBu88L7519sjPG4FXmGjMFJxEnjtYLluME/wkkoPXd8Q==
X-ME-Sender: <xms:gyizYv24UzvtWPUcJdifd1occe14djyS3IV2C87bdOYYW1RFJHjGKQ>
 <xme:gyizYuEtC7JXI64aCKkr8o0lST4BPQXL3QzFra2ysonKI7f-xrdksp9wHsrfD9Bbc
 2HUAoURuW2l5uk7sok>
X-ME-Received: <xmr:gyizYv4GxzrmvDMW9_rrAojJXmVJu4ziW42jK1ayeYbPoNgfa3p5akpLWssDcMPldsUYuPGITL4fPsWSMOE2NjP6w-uZGCT8gBoXETw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gyizYk2aEdL5s2AAMjDbQfmH-w4TLnxMW1lWBylclDRI0-zW3hdKHQ>
 <xmx:gyizYiGlX4OTB97cUrnDOKVFaQauCxy-W4Cmgp3DlzooxaauMym9yA>
 <xmx:gyizYl-RZzfMdJcOhHWFQPqTy8x3OK1NqZgzpwkSyUi3CuJ73vHKhg>
 <xmx:gyizYuglWeV4TFeIMC4BCxX2LHw4KEunWJtKNqYTo38eZHqQMqH1TQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 47/68] drm/vc4: hdmi: Switch to devm_pm_runtime_enable
Date: Wed, 22 Jun 2022 16:31:48 +0200
Message-Id: <20220622143209.600298-48-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e6678a668ff8..85686a8eb49e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3250,7 +3250,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		vc4_hdmi_runtime_suspend(dev);
+		return ret;
+	}
 
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
@@ -3298,20 +3303,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
 
-static void vc4_hdmi_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	pm_runtime_disable(dev);
-}
-
 static const struct component_ops vc4_hdmi_ops = {
 	.bind   = vc4_hdmi_bind,
-	.unbind = vc4_hdmi_unbind,
 };
 
 static int vc4_hdmi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

