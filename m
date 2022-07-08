Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE656B6AF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE7F11389A;
	Fri,  8 Jul 2022 09:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FEB113884
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D34AC32009AE;
 Fri,  8 Jul 2022 05:59:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274340; x=1657360740; bh=x/
 lD2oTTN+wWUc+cm6hPKFFo18akL10ix6YMVi+j400=; b=Uvygb/s15F6cH0POMT
 qEMGrnr9ueIcExGJEDEB9Bs5CPAtP4CYYduA/xosn/pTI+MSSolgkoxzYUWoylkR
 0bgX+L5H3zA2SjVzfo9aHzmpihz8ZOg03QKfTofSbeEI/+pMTQx8wapt+g9lB3Qs
 iFSfStTJNrNwnat4SQgt853XNCeSEz79y4X688iaHTd59wxuxi0MgrKhEcPmcWuA
 cfr+lswMl4FyRlbY4lwFvE+dowVCo3XvcRyHps1hRJ6uwt22nOqhXf1w+ujZ0gYe
 EzHu4MlCuO4H4iQgtXKiSzoptqZiFD8NQIIz9QoXrVW1FZ3YqVPYAE1wPC6rvdkw
 HE7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274340; x=1657360740; bh=x/lD2oTTN+wWU
 c+cm6hPKFFo18akL10ix6YMVi+j400=; b=y8wCQjbQxOs0MDUXJJKitNPsQWai2
 0Vae5MdhVYMj70fQoPRDkiYEeTdyOFvfdx3WNwAlCY4FSveddHbdoypFECoth3wq
 A+AdAtHT/64LsTPauSaivqgBX6+ZUJGv4/HXxhzRHhScIDJ6APlafqUmMsmopjlc
 SGZZ7RwQRBb4g03W7zdXwlGD4Vkn10lxTgI2oO/T2fGulXqQO15lE+n1qk+RYJ19
 lmkB4Ir7GVkhGTVVD5odz2Jy1MybQZEjjbKFCVakRjqCu0D4JKPlTKSj67Zsuqtk
 gIURObtuCvfezHRBBfVBWBaQfB+DvjqhsdQe501BrIGa2jkpeZ4z/XW3w==
X-ME-Sender: <xms:5P_HYlmT7aotTd3pU9N87XQM5i8KBvyzZxOGpROZSTHhZPhFheY3hg>
 <xme:5P_HYg3Pi4WFGSOJj6-6HLT54CunUnT6qhQTxcvA4gUSWZnTtRoricpxCatUfx7Ex
 PE7iD92U7BQnRLQuNk>
X-ME-Received: <xmr:5P_HYrou6ZWKP4KWZLeJ_M51V470etliYk3UEDoANzzHQQ3tsml3FCak6QVzxCf6xKk6HjRAk3iRuGhSud46obDFWCy4i-9FGIBYVlk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5P_HYlltn_gb7LDNOSHOuIC4SkMFiert-jdzMVzlgS5DvwfyYAD2wg>
 <xmx:5P_HYj1Jb1CKoRbBnCfEGIAzrDnP8DFIse_RgSnAy2HW5ZriVvW4pA>
 <xmx:5P_HYkuZUSYq-3-gVU2MWv9NaMBfmFHysYtzFcZpGlPl_3OXSngVrQ>
 <xmx:5P_HYuSAS-jTcEEOToEvgZEpnFs2lmfmAAm0hprHM4u6kreKzFTbrg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 37/69] drm/vc4: hdmi: Switch to drmm_kzalloc
Date: Fri,  8 Jul 2022 11:56:35 +0200
Message-Id: <20220708095707.257937-38-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e5f68704d7d..5681fafa4271 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2908,9 +2908,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+
 	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
-- 
2.36.1

