Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AF56B619
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7353113816;
	Fri,  8 Jul 2022 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF770113827
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B593F32009AA;
 Fri,  8 Jul 2022 05:57:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274269; x=1657360669; bh=Dr
 DT0t2/NlF+LRhNyEhpBFJHuuhe2PjExpzKWhtzaLE=; b=bHaYmtJ6ZqaZz8/U5Q
 EOxeK28VjisiYYowuHFVd+bCoTVLqJk2wbJenyLGDiIKegZ/fXHnYxKupngJ6GXn
 WMd+zzEfAtnruWl790AgCPWxFix2fZyt9nf2cpMxMC+350wLl6JdfA70O7QAuciO
 i2H3jcfG690kSFF66IktxvvVshml2TpDJTir4vlIxlwXOIGoEaAAm1jahi3Giwtc
 CzJmkQjjrK7GARTwHyI1d9NfCiHZfD+LtIOqUbHIkSKKnbPwZlPz+oW6DYLs7hnz
 +Hxx8LR8WpyBo3FfVQLD8xWDLKkn97lgCu8Ew0hXVTgYtnCkYSLaEwmS+xert07r
 nm/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274269; x=1657360669; bh=DrDT0t2/NlF+L
 RhNyEhpBFJHuuhe2PjExpzKWhtzaLE=; b=GOgAB6ZdlUIk/69fG95dDoXEU8nNr
 hTGl4zBl7jBGYmlE4RR4Kf2CQTBxQOfK/iyJu1b4RO8K0+A+ATRz3775mSUTd7X9
 SvLwYZUjI5WvzzwPHf2Q387hyx/R5ooK8odapvOxaQxxTd5uArc6M9EqT+mUfkWV
 IYbWJ5YQuR4PuKPZc4oBLc2MVDFmCS1ePCmNeWHjghKZdPswZN7lKujLhJ0atTcr
 3QvByftO4XBLEEMzEPbut+s4776Q+OMeAIoBdRunxxpHQrWi1iG9Gr7vzlV9ZiUt
 1lFT/FGwdlS++2ZD82g8FjRwaHjlVMA3Orlo19GgO+t/qpnF8z/+rcaVw==
X-ME-Sender: <xms:nf_HYi5NykYGun_bek_37rT16AHGSJywNcw9EBwx4iRc7DKIMAR9wQ>
 <xme:nf_HYr5M2DfVkEPbhVbP4jGdojNXFOtgBwgw3rBqlAkwKdGV9mQahMPMI2EJCsNxp
 bUOhx3t3wgUnwrdVWA>
X-ME-Received: <xmr:nf_HYhe5k5Z0PXND9bmu_J2xlM_wZ1SksaxxPRAjqLAfG50Ajn84wK-ToBgTPfxZvzjzi05joOElPDqaHd1M0sYwMoc2FMNuhkuSWa4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nf_HYvLkR630-4fjjni3JqiAzf6UCWGB7vgfTS-2iS7RsxjIDPeaXg>
 <xmx:nf_HYmKrqYYCuWYHlMYjq_vnSbaT8WMTxEKwoIaMn_aZU2ov6nc5KQ>
 <xmx:nf_HYgyhdkFKXr-kmGFGKP46ICvE8JEgy0g8IMccOuPcv2T2tPVI7Q>
 <xmx:nf_HYrGMszUODYlZck37czld9Mue_ipJE0J1UDtcv0WhkOrcoDnFXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 13/69] drm/vc4: drv: Use drm_dev_unplug
Date: Fri,  8 Jul 2022 11:56:11 +0200
Message-Id: <20220708095707.257937-14-maxime@cerno.tech>
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

When our KMS driver is unbound, the device is no longer there but we might
still have users with an opened fd to the KMS device.

To avoid any issue in such a situation, every device access needs to be
protected by calls to drm_dev_enter() and drm_dev_exit(), and the driver
needs to call drm_dev_unplug().

We'll add calls to drm_dev_enter()/drm_dev_exit() in subsequent patches
changing the relevant drivers, but let's start by calling drm_dev_unplug().

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 6b8dfa1e7650..79a37d18aeb1 100644
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

