Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970B54626F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2712B227;
	Fri, 10 Jun 2022 09:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E7312B0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AFB9A5C00F2;
 Fri, 10 Jun 2022 05:31:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853479; x=1654939879; bh=Uf
 rNm1aT2NCEXjU1j37GI22AueNWGOVjpc+X750FpoQ=; b=TF9NZSGa2qO3uYtyIa
 q7HznHHxDVVQyFtGwqs0h8xbYolQdxFCU32bxkEHE4NpeOSAkVBReZng9aT1/02R
 nmZIedfKddddp9BXJKuba2iRc5PxOoO9YARydZmFrp2wlFTz3RljQgeelegcHdY5
 5cNjLi0ABTyFw6glcgoz6N2jrnl1FqGaCE2cP7O4X/8avggGPON3TgoOzTwKAmbn
 LWxEJohkj7eXBPB0lPBPX7rotlBeMlUzF1OgLu5nCU9KQlZJoZu0lB1m8r/k+UXK
 hACjWWr/kD9JnhR/kgAr3nMj7o7gVf4iVd5egYTVPzoKWsrPrDchps8uHvT4yZkw
 rwcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853479; x=1654939879; bh=UfrNm1aT2NCEX
 jU1j37GI22AueNWGOVjpc+X750FpoQ=; b=gn1gxexVn83RtsTpDjJmX+UDdoaAz
 jU4sOpUhmsRWVkupCnsLChspUT3V+RV7y3+Iy4KFjItuoZdsGgLjVGk+RyP6TI4T
 YEaBF2yJTLUChVfpqV8DA1daC7l3MZn52xDNpop0xEVsMpsqFxcr2ghxnFOj0q9d
 UVKEULPm+IhPMvsHAXPVsWN3d29dGrwdpNj/lM5K3ei4ElYnMynlQehRhF2dVG3w
 i2nkmw5X+ZE1d+yANdhDpDtECtTeqGOtAX6NChvL7wSDC0TG5vH0qFBkQ9RAZ8Jj
 vK5CLzCj4NPhUI8UpSWbyshyKS5ZdZV91o8jY4tcnqaImfxhRvL9Pw8yw==
X-ME-Sender: <xms:Zw-jYjC0Otcc-qDBpZRgBrYOsOWY8FHZIwUIXFH1o2RV2xvjRFGAoA>
 <xme:Zw-jYpj0F2aFtf-DRTb-KtR06KyYvDj5G5E3PL9U5YsLDaxQ9BTjfd1J1ROdz_BXU
 dE2-mNAT5nCqsYAZG0>
X-ME-Received: <xmr:Zw-jYukMdEG1O1WasjxpfgRNKX2Fb31eiFYYIDa31ccSba1D44nk2AkmtbczfDRcVo9dnBskDHFrZzt1kGuvFCgV7lvWz0y7swbfqEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Zw-jYlxBsluu9jKLkxwz16uh_anqxPvY--n1g5WYz5AFqlEjp6uhQg>
 <xmx:Zw-jYoRAsnZkh_FcPDavQQCbqRru9RTpiEWesiUfu0JfPvygZgcWSA>
 <xmx:Zw-jYoasciJSmK7jXJCqV8ETM_ib6BTsJQjry2HeydQs4XOycYel2w>
 <xmx:Zw-jYuM3rnT2APTMvggd5DPVJuTJrVFzCXcuIahOplNESZIrcaKpIQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 64/64] drm/vc4: v3d: Switch to devm_pm_runtime_enable
Date: Fri, 10 Jun 2022 11:29:24 +0200
Message-Id: <20220610092924.754942-65-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index a3fcabf5e6ab..2d63124e2ac0 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -453,11 +453,13 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
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
@@ -486,9 +488,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put(dev);
 
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
 	return ret;
 }
 
@@ -498,8 +497,6 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
-	pm_runtime_disable(dev);
-
 	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
-- 
2.36.1

