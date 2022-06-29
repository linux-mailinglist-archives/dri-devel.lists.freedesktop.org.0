Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9BB55FFF3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB8A14A538;
	Wed, 29 Jun 2022 12:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5E414A3BE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3895D320093F;
 Wed, 29 Jun 2022 08:35:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506153; x=1656592553; bh=wp
 ldbioMahrMLRNbdDiExS3fw3hkUBa6pMjXNDSXu4g=; b=ddCv6//XsCiF1fhzE4
 7m4zw7YHuBB98kTMJ7yBqbSpP8nbJOKMCwGVM8ei+8xsHaOL+drkXDUzvWjEW30s
 oXIX7HyfweCxpAW2Xk+rd5QfZPGGbu/dLyhbqAn7SKbQeQLaFEQiMQzLj8Gt8QPQ
 i8OpqZQ1a1dBsKvYFMpjWWB6+46yF2KbtbYEVLe/5c/KMXkZPu4WeF9FK4mI6cdb
 xhsaoUw1LZyoFlX4xkUC6EHllKzgtS3eRqlKaRZIrCc0VIJgI78bu8no3gPWWRTu
 alCB08nm8mkT+GgBop4xEbkYQPPV6MvC+uXdswrgbgDY5ygPtma+yeJ63hrgLDbl
 angw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506153; x=1656592553; bh=wpldbioMahrML
 RNbdDiExS3fw3hkUBa6pMjXNDSXu4g=; b=OBhZaf23MIEw+Lky4b7wJudJ1SybS
 Na/Bn/gBg6x+5/XPJD7uA2IDgNa9YryAa/xCO79DFgTQBkyCOS1vwJayP0pW6EuE
 04HHMya+w8idF6CbU2i3J82zhxgnJ8RP0O9s7z5KfyDVEhrYi91DOlm8kyE/Rhf3
 O6Hq3yItfBMnPWagU10k0QtyBrLFSGp+zbr75IdvKzyywqGlHI8BXcAXuaTXKULS
 1OcCfkYLzomdDL/4PxEAeQWJFhfhjd0W/iQZyQdL2yuMiiz6q27TqCkFcYeV0c/J
 RTik4p0xOPQFIsqDArp1fAKUeOu3Jmh63Y1Xmo+6O1no9egXtakeWFxhg==
X-ME-Sender: <xms:KUe8Yie0R1-TKuPqcOq1Ghf8SlXg1zzzey1jvRPdWb0yo-fwRC9AGQ>
 <xme:KUe8YsPaTCulGFNvAOm4M6i2c7o5aNqNuybjrMz_L6Rghiibu1BLQ-mFcL_f9cGJw
 tFJmI0Xd_FWtwkkTq4>
X-ME-Received: <xmr:KUe8YjivaDmOl1xX6sQStKb7l2OCsi4qBneofIU053fcTZhkvEVZC8z_UN4yOgMT9CKIErBbGy_yd1jzWhtp-cVSt7EcklvU5jR-2Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KUe8Yv9Wgtv3EYFJ0ja9FmucAPXn87eCKSiHBpnU8Aa9r_GZAPYjbw>
 <xmx:KUe8Yuvo_yGT0QMDcfvjqqdbA41qVnxRm8EKvytC0X3cY_hy6gmLHA>
 <xmx:KUe8YmHqw2hvHRIIFVxDNzzn8AyO_DKFbT8LQqek4m2IHuuSNb97DQ>
 <xmx:KUe8YgJ5qXdsJcYuqzHaNH8TgL0uD9ce4m7g2GO7KHVaEl9eRLIk4A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 13/71] drm/vc4: drv: Use drm_dev_unplug
Date: Wed, 29 Jun 2022 14:34:12 +0200
Message-Id: <20220629123510.1915022-14-maxime@cerno.tech>
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

When our KMS driver is unbound, the device is no longer there but we might
still have users with an opened fd to the KMS device.

To avoid any issue in such a situation, every device access needs to be
protected by calls to drm_dev_enter() and drm_dev_exit(), and the driver
needs to call drm_dev_unplug().

We'll add calls to drm_dev_enter()/drm_dev_exit() in subsequent patches
changing the relevant drivers, but let's start by calling drm_dev_unplug().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 072c65aa1d98..942b5442b843 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -399,8 +399,7 @@ static void vc4_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 
-	drm_dev_unregister(drm);
-
+	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
 }
 
-- 
2.36.1

