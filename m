Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627E56B6D5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8F1138C7;
	Fri,  8 Jul 2022 09:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF031138C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8689632009CD;
 Fri,  8 Jul 2022 05:59:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274396; x=1657360796; bh=tq
 R7o8W1+s3VR2O8JDnAU86ME1tKMshmvmxvU0K+ANQ=; b=nrypr4B8ajJQO2H22a
 oWusUoO1qHa/kGyPiovY2ltjsGPMfOmiixOvAZTchkydP2rp4gYNgw6yOEUbW5YJ
 MXoH83y1het2i7h+acXMa56zp4N13Ztv5ijaNpFlihl0nLcRP2Av4eEHYQjlk1Zq
 aNn5EDVJzqktTmQNLzNU0bfCbVZcEUZkqpq1nfohkQXbmpZnnDuV4U7kPpywxRhb
 XgeMHtS+oK6HMgKfLsjMvsRHRGLabM+k8uGCxQv3PthtqdiUFLFx+SGJ0RrsPReD
 5RCGeyoD7DVund525O87dedLAvRw05mXS7DhdDKF4TAPF9NSXaXLRj040KRjSgKv
 zPFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274396; x=1657360796; bh=tqR7o8W1+s3VR
 2O8JDnAU86ME1tKMshmvmxvU0K+ANQ=; b=pvDhbSXljsIMWleVVCBFADRyEY3G9
 xCRZNzcNN+NR4g47QGSA58mzq6yhYz9d+t2Z15nI7T5ejetlQk8lCmRKvBLSDqD5
 79a43WmFLxhsRSUaGUFCtLopITjGr7j/syGQjNVSbdG2YzYQNnShrQ6Gs98kxQjb
 qiuFnVVeD0/zPVv2imqtP+Wy6FFPqt+Wx/MW+VKjh3j3Ldol1/T2NabFbeHw4Wud
 uG0iYRoADeqqq6vKmuEVDj+NHQV4SQ3y6g7hUP+DIJssqLHCoGKAmR//Xh83fpNc
 NlLdm6wnSasUKw2iGUw3FhOE6I6RRAyZK4zevzGmcaeOWXAyQTlV0VwnQ==
X-ME-Sender: <xms:GwDIYifXDGaPa0L-6u7nKDZZ4ek-CKxcRc9kr-BTPyo88Co2y6cH-Q>
 <xme:GwDIYsPBrm7llHdALvqi099NV8_V8Y1yAEPAITaYL-yVYHzudEmHRbVuKlKcaqm1Y
 VhUc-JKwGF2bxPlFL4>
X-ME-Received: <xmr:GwDIYjgKotP3NXIuI8yxfzYNtdyxwTbpR2oXEjMKfQp8DN68EPbe9nlNE6o9oqwAYL7avI8vcxD0gfyHOFLZUrlGhCfqvgAEsXOhbTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GwDIYv8VsPEMDvWT_VllTqR1WVVx5P6pHjFvgbkSHb0pWr9uNw83rA>
 <xmx:GwDIYus7FMHm2UOx_t6_CB08tG-xXV4O8kh3lZlh_F4NKZ4oxrTCrg>
 <xmx:GwDIYmFB_eq_DcGEK2UWAqMDKNAcXb3La1JFLSy7UQf78Yh8nfkR7w>
 <xmx:HADIYgLkk36qfKzeLCrguiG__wwb4t6QCnqt_GHfvXJ-rRyrSXPTIQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 56/69] drm/vc4: vec: Switch to drmm_kzalloc
Date: Fri,  8 Jul 2022 11:56:54 +0200
Message-Id: <20220708095707.257937-57-maxime@cerno.tech>
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

