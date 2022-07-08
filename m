Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4156B6BF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0A1138B6;
	Fri,  8 Jul 2022 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686091138B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E941F32009D0;
 Fri,  8 Jul 2022 05:59:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274372; x=1657360772; bh=/e
 xfFqPWj/EkuC/CZxAppwFZ0KuD3O+5SRTeEzYTVLs=; b=ZdKIemm8zffIydw/3V
 W0XN5oCVJUfv+7cvDAERI+RbomQT70jQT5IrxTqQ9iO+cHB3QUieIx5th5MNDMGi
 jq5sMITH0HAfx1Xn3xWXQTHMV67nbwDWVL/eUGFjuu7rLgn+AR6WmqRsiJc+7DXs
 Vt2i73yoDkkKVcsTIyZ4eCmRBd1OiMjlux+qtZSejDPU/E2rA4Qe9Ek6YqxAOZet
 0lwqcZoGrMeQZK9SBPPhi5SN2Hto4moopmLvNKYYa+ZNHOpw+qS0uV61vCDl11lQ
 Tkm44PuBgF4NuMgM44Wz1rz3bdqwS+BPnEBEb6ruFiDYcO0wEzNuHT1Djp2zQIQz
 brdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274372; x=1657360772; bh=/exfFqPWj/Eku
 C/CZxAppwFZ0KuD3O+5SRTeEzYTVLs=; b=I1GVS7khEYl8C5ZOp4zcSlwxSYGvO
 QsTJcWYQoSs4RTLWCWSiwkx1bt60xtU3R7jsiwav7qgELtsF3S6tZnHXJ9jqoQO4
 3h/bSpzdip52/ywVypYWXS1h9WlR+Y1DU7zLu/e6bmscRHefZ/ggrkrFcw5QWJm/
 NMigamDslVA73d7RGQ44SIfUbeKeTxMjMkEuoFVz6DllIBhKmig2PFI3w9m3FWWf
 lguRa7m2ruV9s8AL+1r4m0mF7IZr79b6tNrA8bUjK32KnRJsVqlXKTlbMnSohzK1
 HfzIajWZv6O+tXABBX3I9I68FltaA7Pq8YtaBtOZ0kf/CSbKaNvl0Pkhw==
X-ME-Sender: <xms:BADIYhXbWSygEyOpGFqMDtc01yAYjz8HtKiOsLRSAMGJvKEJ2Zn5hQ>
 <xme:BADIYhlCaRLMb_JYraI_3Pxs56izPezm4u3ZQZY1yOzMkQVqJJfs1-76fw_XCDAV_
 6qRQHoRi0YOmsah0UU>
X-ME-Received: <xmr:BADIYtbyn_znn1zcZMc4yaIjRI3z8YcbEEgcOqJxOnANu3EjZjgkzWrzWyi9OPOBqY_ftMFM9_WYTMaTZF4GYXP6kLw-sCtIzbuDiKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BADIYkUVcvoSSfi-rd8RPDUZQyeIuQzcLu6B1j1eC7kyCthupv8wHg>
 <xmx:BADIYrnQjs89kXe2DpgaHhVzUQ8gCB8djSuejw-GZ-lpdBV7xNc6HQ>
 <xmx:BADIYhexxwgEUZKgXqInYzNSm8cosQoDWA3Kd_QblEifJ9S4HJ1NQQ>
 <xmx:BADIYkDKvRbDWxc_B00NpRNgjw2xWguCHOpYqEGbZgmfgBNe0uLlYg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 48/69] drm/vc4: hdmi: Switch to devm_pm_runtime_enable
Date: Fri,  8 Jul 2022 11:56:46 +0200
Message-Id: <20220708095707.257937-49-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 82a0d6a906a4..52106ad54efc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3315,7 +3315,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 *  We need to have the device powered up at this point to call
@@ -3323,7 +3325,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
@@ -3368,21 +3370,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
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

