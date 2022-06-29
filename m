Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870F560019
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384D14A62D;
	Wed, 29 Jun 2022 12:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D168114A620
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A8B813200956;
 Wed, 29 Jun 2022 08:37:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506228; x=1656592628; bh=0j
 o1eqdvjSkWhBXbqXI913eLxGob89Yu1iN0e40MJM0=; b=ANf/XpFzwAtbCQtyte
 z9fNOMMb/MBf6/ba/0AxmMw2tLLsZGl1kfmIevZQzU8SCoRLzhp4N752bXmELMqY
 t6lwYBAYch56uaOQFfkB6UDcNvLVDZrZilIFOf01MD6mmqb/qh68TNrHIerIrrM5
 CFwRK8IMxLdvvjhCaCgt/j4wr7I4mmnYImlSKS6KzgfZhSXTObv/fJYTebamAFa4
 mEavUkgE0WwW/ZzXiUeGmMiuZKp3GV6FOC6/e3dTiTRbyUTBZLPdbTjjpSshEJk1
 cwkmAoAvB2R1zB0QuDLgCYg8aSOEWGviDXVZuq1tw60+zaS2MaeyhfAnn6P3pKhb
 xxgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506228; x=1656592628; bh=0jo1eqdvjSkWh
 BXbqXI913eLxGob89Yu1iN0e40MJM0=; b=gcrP3yAWL4Pvxilvdzko+mrHUEHkN
 dGGWIYy9URvZJdUZu6LB9D1ZYviV9Z60R/mGP3gih87UqTwMYw7sn4WIdrvAqbwj
 oIZWZVV4ZSBHTE9BrCMmpNeMa7Hxxy47/d3S5zmSRjM12W45N2zTLFLLVeafdUdC
 IsoyrYOI7dWqTnjzJsZ6VlGo+xJJ8mm20dx+/iwQ7khn9sPh+ERh7GUw14XhhT+R
 JcleQQvBIlRWbdKVlzpKagHmx12HxwLL+HNtNjfq9ipjL8sc3LKQypTLCVbvjHYn
 WnTXijOvAWYDeUKG3GnE25ll3S1/adYMkopL/CGytuaavJWBenWfROfFQ==
X-ME-Sender: <xms:dEe8Yowx5z4LtOzbUHFLonJrM4t2y7-UeGsiIqIPD6dJzJ767kZD_w>
 <xme:dEe8YsT8-dteILq5MgmBmTVmrW8LOnC6I9_GCyrTjkOtjYIl4aL5oA_s_Zi4ryHlP
 OFOldlLDpBPI8aKpwo>
X-ME-Received: <xmr:dEe8YqUPmTbfBA4d6u2E1XwHROLp9bS9PLXNkDIsnUQyYv33drSJkIOJlCD25JqArSAoj5XDsqEPuHCwJxo8uNNLMd7ahk-eVxjerew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dEe8YmhTOYrMndSYcaFkA0CadTMLUbL3aTf9qsXnnsJcSN7-HTui8A>
 <xmx:dEe8YqC3e6ui4EMxMGGECDLECSe5ngYrJ5DISbHkrADhqvP_fC62dg>
 <xmx:dEe8YnKLDbNO8NrdWo3MTJsMNTFpzl-ADstYat9r-xSix1oh4-lscw>
 <xmx:dEe8Yt99HCxGNNrhx0U8zG4ozpyWcf6vHzvslp9VzMm5N_d5oDOM0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 38/71] drm/vc4: hdmi: Rework power up
Date: Wed, 29 Jun 2022 14:34:37 +0200
Message-Id: <20220629123510.1915022-39-maxime@cerno.tech>
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

The current code tries to handle the case where CONFIG_PM isn't selected
by first calling our runtime_resume implementation and then properly
report the power state to the runtime_pm core.

This allows to have a functionning device even if pm_runtime_get_*
functions are nops.

However, the device power state if CONFIG_PM is enabled is
RPM_SUSPENDED, and thus our vc4_hdmi_write() and vc4_hdmi_read() calls
in the runtime_pm hooks will now report a warning since the device might
not be properly powered.

Even more so, we need CONFIG_PM enabled since the previous RaspberryPi
have a power domain that needs to be powered up for the HDMI controller
to be usable.

The previous patch has created a dependency on CONFIG_PM, now we can
just assume it's there and only call pm_runtime_resume_and_get() to make
sure our device is powered in bind.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 77e3ec52b175..73fb2f91c3e4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2971,18 +2971,16 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	/*
-	 * We need to have the device powered up at this point to call
-	 * our reset hook and for the CEC init.
-	 */
-	ret = vc4_hdmi_runtime_resume(dev);
-	if (ret)
-		goto err_put_ddc;
-
-	pm_runtime_get_noresume(dev);
-	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	/*
+	 *  We need to have the device powered up at this point to call
+	 *  our reset hook and for the CEC init.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_disable_runtime_pm;
+
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
 	    HDMI_READ(HDMI_VID_CTL) & VC4_HD_VID_CTL_ENABLE) {
@@ -3027,6 +3025,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
+err_disable_runtime_pm:
 	pm_runtime_disable(dev);
 err_put_ddc:
 	put_device(&vc4_hdmi->ddc->dev);
-- 
2.36.1

