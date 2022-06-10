Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604EB54622C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0796B11AC7A;
	Fri, 10 Jun 2022 09:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5149113FC8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F04C5C012A;
 Fri, 10 Jun 2022 05:29:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853390; x=1654939790; bh=61
 I38aslw8mItB3djVU6930UxQB9x5vKr9ZMub1YQeM=; b=vDOS34j4/xKuNzU4nB
 xNvwypV0uZqlidE73VUwMbYvltMOAQFlnz4F1BxnVo5JvD+qbI+5wXoQf63R4l91
 Uhd7tIWnOSoSozU2KmCQHf6TC3Fe5jXsDYd0nYbsIrrqE3mdrW5DWDnMOSB+UvSU
 cmwBaeWBQ1m3pYK9XVdzxejRskpoI/EBCp5TtReiIVI5xUD6/zje6LSFjo/w0PrA
 wSRUsj+FKvMjnK5jbw7fECsdTtlVyw93RaGhJ7F4CKUJ1k7newGx9cwtvZuHPX9u
 VbMhDgxh+Gxk3udlWT0xMBhV0+rAvgqI3IJy4HFVnXimCSJBCtrdMNb1mZNtnfcD
 Q87Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853390; x=1654939790; bh=61I38aslw8mIt
 B3djVU6930UxQB9x5vKr9ZMub1YQeM=; b=bNExJtK0A44uDLiTwtPrXjcaB9A1+
 cZk0+BQAWFfVGnsVHcF6l/m1+xDqNVTK3d6/K6beXYqbDWadbx3RwJYmNRBo2J90
 a3WH8y4qIkl5FnGa3aMVgYjyxcTsly0jaXLRmyLw7bNgT8q5rerbiuYH2IYMS1dv
 iWg6goubTTwjHxST5WAAkxGaTten7a1KuGXn7dkXq7I/tYcqBdME2+PM7k/nY7ge
 KDKCFWs5dVvX+hqj4Duyqp2xzJpFxPZaLmHCD0oFWBh4M6I4rQeIaziuNfvoFCz2
 rHBk4Ue0gcm7hfi5anRE45FWESGRk7vF00v6Lw+Snum6bbc7FhBq3mVJw==
X-ME-Sender: <xms:DQ-jYmj1uscaVJd7cpwW9TQ8QzBxNCN5SBReG8Hgn9gM_fsj4jqgGQ>
 <xme:DQ-jYnAJ7Lam1lHwgsVN9lxYFzqhfN3RSk9jC88q8sFHyuAzeepHWZ96WHY2IaFVw
 yUXhJvPxAe7peIi4Bs>
X-ME-Received: <xmr:DQ-jYuH8mr2PwA7CB1oaaKL7PUqG9NHH4hM5FxWl4jiTVn8_UXJQdPUHgW_ihPVRZKJ8UPVPqGXO6wRaM59bftEapsrBAedZmF7vHj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DQ-jYvQ9f3yZJ162xsNeBP0dsCNsZHS4aDm_nNxqLAd3hmT3UT8kVw>
 <xmx:DQ-jYjxdCkVB1f7myiNRtKGyyN03tgvx5Fe6uKDSPjp2b992SHlSPg>
 <xmx:DQ-jYt42ZDEVOj316abc75PZle4djSn3kFVtt_DlcOH7ochyydZYPg>
 <xmx:Dg-jYlumW5lNvmHi7gvTELdsTUAec5S2AKs_eAfxHCvLLk-r_YX62w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 12/64] drm/vc4: Call component_unbind_all()
Date: Fri, 10 Jun 2022 11:28:32 +0200
Message-Id: <20220610092924.754942-13-maxime@cerno.tech>
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

While we were using the component framework to deal with all the DRM
subdevices, we were not calling component_unbind_all().

This leads to none of the subdevices freeing up their resources as part of
their unbind() or device managed hooks.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 14 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 162bc18e7497..031f2cdd658d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -209,6 +209,13 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
+static void vc4_component_unbind_all(void *ptr)
+{
+	struct vc4_dev *vc4 = ptr;
+
+	component_unbind_all(vc4->dev, &vc4->base);
+}
+
 static int vc4_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -230,6 +237,7 @@ static int vc4_drm_bind(struct device *dev)
 	vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
+	vc4->dev = dev;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
@@ -276,6 +284,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
+	if (ret)
+		return ret;
+
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
 		goto unbind_all;
@@ -296,8 +308,6 @@ static int vc4_drm_bind(struct device *dev)
 	return 0;
 
 unbind_all:
-	component_unbind_all(dev, drm);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 15e0c2ac3940..aa4c5910ea05 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -73,6 +73,7 @@ struct vc4_perfmon {
 
 struct vc4_dev {
 	struct drm_device base;
+	struct device *dev;
 
 	unsigned int irq;
 
-- 
2.36.1

