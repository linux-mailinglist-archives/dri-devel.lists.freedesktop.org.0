Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCA56003F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC6610F8D6;
	Wed, 29 Jun 2022 12:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB37F14A68B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BD4F8320095D;
 Wed, 29 Jun 2022 08:38:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506324; x=1656592724; bh=Re
 awkRMJ8LKdk/DjyJv/gQ5A2bJhpQaE3jvLxUM3anw=; b=BqRL75bwIfx2Nd5LHr
 mhhe6dSZFm/y3n9YGyOkAODZUTpm/sH8W2mrdUs3LIxzxJzgTiNLDn2vlrJ5MWp/
 SvJKMyrivPjm0MDfPeKfeTJ4Tz1VR0oj+e4hTos4+5uBHUxCmYx7N3SqRXdnH7RT
 vq06LtX7CrR6cLptd9FESV0M3um/Fe/LxxvHc3reYQ0WFTk3srmPcC/caJTfnp9Q
 a5hJkQ9WslIZ4JYzZlmP3zBaXcRA9aNHJuPJrGSPDXBRxCi4tsk7t+cwxo/P8sms
 /ut7LCMegbU5Z5sPFb8LBSkCJ/+02uCw+aGoaNTPh0qqBw9uUZ+RkJKd7A/Csn20
 EECg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506324; x=1656592724; bh=ReawkRMJ8LKdk
 /DjyJv/gQ5A2bJhpQaE3jvLxUM3anw=; b=EykwF1ZEqxAAxhLm0QAjNxEBDgCD6
 EEF2MrJJ/L97qTT8hcNXEhrHZ4c79r4ZXy9W2es5PE7789aLiANcpYhqnocAE83r
 aGko+OThwhBjz8usaWXJBS3k9cZdjWGLANMoC8dt9i0/et2VfASZyxoeXGPzLPrC
 /DYtaBjGA/SiG4HpIUJ73U1XWrBjsjvLDITQES/GkXmoFWhGBuQJ/oJD2TLMEgmt
 T0SWrwLGwB9AMyRKVR4nt5dcHEHmqQerHSiPPBVGagkSIZ29YEOXQbxeRBJL0yAt
 o9tpExGdbIJlwrzFwlaWaiUB2mQAVH+aZ/gKzRt3p1bvSYcwtWMbfW3IA==
X-ME-Sender: <xms:1Ee8Yo35oYVpCiJcla9AG9dYCP1CWqlZ3hsFGRS58b6Yd0BEUf3edw>
 <xme:1Ee8YjELHgheiGhhNsEBeJS2FgKp0YFyrs5oDPNCRhD72v8K5dM_K4HMGxwPCU4Gs
 _SHDUEgw0qgU7giMPw>
X-ME-Received: <xmr:1Ee8Yg4iZTnMNSKBL34jsPdkT8drKxLYOzqTou1TuU6FYZOXRn-wEv8sj4fE8G_cJYZ8KV5LmlJAaLv-jwZsr53ybdaWBu3HancT6iM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1Ee8Yh2AcxrxaUAd3spkvTiAwt8jvhdg60OBQjnIaB9Lm-qsKmYdDw>
 <xmx:1Ee8YrFeR4Wy4weggkE5h-ViXWgC6aQuafcoYilLuYoz41jWi0qvrw>
 <xmx:1Ee8Yq_ziCiZD-uPxsofQamcvsf81991zFxduNlvPNlCWLJSDZa4gQ>
 <xmx:1Ee8YvhTGYMGDHpzEnl7i-0PDvYViPr28pkYSOs9JexVkr8LPUevIg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 71/71] drm/vc4: v3d: Switch to devm_pm_runtime_enable
Date: Wed, 29 Jun 2022 14:35:10 +0200
Message-Id: <20220629123510.1915022-72-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_v3d.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d82c86865079..40f04157ea39 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -468,11 +468,13 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	vc4->irq = ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
@@ -501,9 +503,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put(dev);
 
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
 	return ret;
 }
 
@@ -513,8 +512,6 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
-	pm_runtime_disable(dev);
-
 	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
-- 
2.36.1

