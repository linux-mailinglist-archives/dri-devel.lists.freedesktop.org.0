Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C05560029
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC414A656;
	Wed, 29 Jun 2022 12:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A8214A638
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B118A320094C;
 Wed, 29 Jun 2022 08:37:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506263; x=1656592663; bh=6b
 Td2XCxuorYb+HUNd7k5/1AnBwNmKgTpmFXZX3orOg=; b=pro7JxFvydxI2HlnKQ
 Euc1aXRnxj5c1risMV576+ZsjA0Eb9j1N1Jvi9Fxn2o7kp3SvtXHwfPETlPlXprE
 /5d+R1i9lHsUagpkSXPjOUYDEXu+6uhvuppnLe8H/y4gxaKblgdHfFYMkjc6G8mr
 M/aTtJn3En3NpuFbLXIje0WyA1SC4TF+OTEA4Ok7S7p2aQWO8KUUE5Tin3rrnodA
 opJiQEHCXODldUZXlAusVl7HAwkj0xiT8CnQ3tjzQawpVldQr07xff9Zp90IeKdN
 nV+bMJUszDweno3yTRKCV9ihLHwv6Nc9WacI4b3POq673U1mlaMW/DwaTvWRlykR
 nV8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506263; x=1656592663; bh=6bTd2XCxuorYb
 +HUNd7k5/1AnBwNmKgTpmFXZX3orOg=; b=azVwDFDeaZ/6fRmOdrtJdOmkvsBZ6
 8me4yiun+unF00Wuxr/wjG2Gjp1fy9D0SzX3Bp1h4bDexEEOl+wWSK/qhSCLuBJD
 2D0C3xgyzx4zZGYMXrv8X410e1OQmk4hQL+m2/imaVRBMRzI04QHNVfeayLSuGrk
 kkftG0fzWg8gX/9AL05Fjx2iJ9bjkX63DTYDas27O2Mupy9nDXp9pIlfXOMgtRmq
 DxYKRIaJSd8Dpqrij9tN92iKFFopGr2P4Jwan9z5xiEsLPWhGjxptY5v/S0lxDFi
 LAuhzVYtqmJwLntZgJiJMWPZ4zErzMepInygAyKdgMrSkHvUXM9LMDTzQ==
X-ME-Sender: <xms:l0e8Yp5gfS0CxkNgu21dP4qCkuf-T408UABfW6WTjlfLtdMZxcn6pA>
 <xme:l0e8Ym4zzmBwZP620xUlsK8ZFZwswr6Tkgs5JHWUR1B591Z_fqsCFfnEKQFT7E5ME
 _v_yQaTWl2DJIqGhjM>
X-ME-Received: <xmr:l0e8YgcSyT5LKilcG34k7e7PC5C5vKe3ZxMZb8zm3KkjE3fVcCkndqWGivhX7paF_3a3IYTDHo6bQCKj9Oy38vYi6V5hLY_08Dfk9cU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l0e8YiJjJlf9yVJM9RbLhPSKOPZa8hl_XEqh7kE83YLUKUzbgZoE8Q>
 <xmx:l0e8YtKFBLS7uI33cTaQy9eEGGZoJAvxSR7Au_v2bAVZazZDbRYCxw>
 <xmx:l0e8YrxCprB44RpJBHnUCLB7FXzBRRXNAr3Z00ASMtIenVcOwl4F6g>
 <xmx:l0e8YqGSrLS0zEdJpquwyiiZpTJaik3sNca9Q4Hv-bPe8ua6Cc39_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 50/71] drm/vc4: hdmi: Switch to devm_pm_runtime_enable
Date: Wed, 29 Jun 2022 14:34:49 +0200
Message-Id: <20220629123510.1915022-51-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a826faf8b02d..166d22d62d99 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3314,7 +3314,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 *  We need to have the device powered up at this point to call
@@ -3322,7 +3324,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
@@ -3367,21 +3369,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
-err_disable_runtime_pm:
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

