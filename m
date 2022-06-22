Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A88554D6F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100A1133B6;
	Wed, 22 Jun 2022 14:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10021133E1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A838F3200962;
 Wed, 22 Jun 2022 10:35:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908540; x=1655994940; bh=s1
 3mDaOXGseVHogNjUbtAv7YrCQb3luxl4rFd+wZ0oU=; b=CdBonLBb+gQTgKxhCK
 7AJ1DqKFUB/xXzz3VjNrgArnI8h8qpopUD4SpX8kfi8W5tNNAtWFEXi1hwn4bf8f
 c0eIXtCnmQTMatbjGSWQHcoGddWJefQxiIhiWeKl3uacAACQNElvb/5NTHMW1nB6
 aiy2obAg+Je5G2l4LepCNGdF7Vg19Dr6cqza9sIl/UMs3OkUldv8nWU8zNhSLDpK
 0e4qQa+cr/Q/mZHbGCroW1Jm7m+YPvKnWGgwm7Vf8RY2dLdXC1nVx0qeTVtDHFvr
 AOUmMmLBvMsgJug1lP/LRW71ayIt4Xyl0Kxvnq4ZATNXZ7XBaoMPSV6/vhp28XwN
 yFSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908540; x=1655994940; bh=s13mDaOXGseVH
 ogNjUbtAv7YrCQb3luxl4rFd+wZ0oU=; b=gWKVOHJO7D7SqVqhAFXZZe9pJWLsn
 GG/2MyQ89QNfiNJujqPdjz9PFH1U7xHcjpneuUE9A5INfqaelkQDYPASRFonX4xg
 +4oq7y9e0BnuI2UXOB1YqrSNCHkfSl0AGGneLNxXi3CrpXNltIu3fPta1O3zHgHD
 ot0J+DJKdw3om9SJqaKKqGzHFjiEM+LIA0kAR3us0nILpxeD8a83MCf7A9jLrVcC
 Pox8+5dVNSc5dgi6BEGC4qaMhz5K5oxZmJXMDREDceVdlF2MQUlP8LKKN9oikxBM
 jAU1DOZzNg50Pv+WRRxE2O71DF/6lbbSfZtGVJDCZ4GeItA6YGUsHFo9Q==
X-ME-Sender: <xms:vCizYtU58WZLgrS4ptKeohvfFBWga4xMpJKU0PKcItDMtmXfJdk6zg>
 <xme:vCizYtkZ_dzQRB9Yoi3FzvJwNMBZ7A1NFuiDWFApA2VU7XzvYcxHeX4dTPKFoKeH5
 yAB0UzsZZYVqFbnwWI>
X-ME-Received: <xmr:vCizYpZPaXa365dA8tqSQ6-75uog9Hd1EO6DWK9Y_IkER_eH6STMQtuxMvsJgYd860KDPkqqJ_fLcddVkcGXEi-WmMsVuPsKMjqlrV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vCizYgUTg79_tgkAcfhNKHVkIpUaDv718N7rWAFaHeMhDivI152Vow>
 <xmx:vCizYnlbxWjEQRwEMGttjFu0EIGDZ24JKRYjt4O4OKyT1gnPt77Egg>
 <xmx:vCizYtdEqa7I0E6MYxgEC9aR9nr-KNVe5absqg9axgFrVPuMNqRHiQ>
 <xmx:vCizYgCLpEvVr7xQvDH-0zlf5E7iXhb7LOlYF2Apx0Ek18BbKa6FpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 66/68] drm/vc4: v3d: Stop disabling interrupts
Date: Wed, 22 Jun 2022 16:32:07 +0200
Message-Id: <20220622143209.600298-67-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

The vc4_irq_disable(), among other things, will call disable_irq() to
complete any in-flight interrupts.

This requires its counterpart, vc4_irq_enable(), to call enable_irq() which
causes issues addressed in a later patch.

However, vc4_irq_disable() is called by two callees: vc4_irq_uninstall()
and vc4_v3d_runtime_suspend().

vc4_irq_uninstall() also calls free_irq() which already disables the
interrupt line. We thus don't require an explicit disable_irq() for that
call site.

vc4_v3d_runtime_suspend() doesn't have any other code. However, the rest of
vc4_irq_disable() masks the interrupts coming from the v3d, so explictly
disabling the interrupt line is also redundant.

The only thing we really care about is thus to make sure we don't have any
handler in-flight, as suggested by the comment. We can thus replace
disable_irq() by synchronize_irq().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_irq.c | 2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 2eacfb6773d2..a9fc63d9a7f0 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -295,7 +295,7 @@ vc4_irq_disable(struct drm_device *dev)
 	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
 
 	/* Finish any interrupt handler still in flight. */
-	disable_irq(vc4->irq);
+	synchronize_irq(vc4->irq);
 
 	cancel_work_sync(&vc4->overflow_mem_work);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index e7990bed0a96..a2da0db73a5c 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -393,8 +393,6 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 
 	vc4_v3d_init_hw(&vc4->base);
 
-	/* We disabled the IRQ as part of vc4_irq_uninstall in suspend. */
-	enable_irq(vc4->irq);
 	vc4_irq_enable(&vc4->base);
 
 	return 0;
-- 
2.36.1

