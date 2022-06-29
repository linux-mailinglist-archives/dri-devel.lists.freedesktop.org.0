Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C107956003B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D473C112A50;
	Wed, 29 Jun 2022 12:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0E14A686
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E7C09320095D;
 Wed, 29 Jun 2022 08:38:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506318; x=1656592718; bh=s1
 3mDaOXGseVHogNjUbtAv7YrCQb3luxl4rFd+wZ0oU=; b=M9yjGbFHaXiw/ox0hY
 KgQrh2lSVC+waYT85qzrnl+V8xwRDr/cX++RrdLKOjKCmOw7lUH9waGNT38mAhJO
 xQvEzMVs7wJ+2+ulbucdzb9HLc/tr99IyrlQxbhWuvWQxdUe5HSSYsUMr2bIfbJf
 fB1qfKxfOsO2eXf2niR6B8AmJjpZsUW5kL6GxvRJA+c8nj5ANRcM83V2GxIWrhCY
 2A0Fw2woTn6sTpNsbFf1ms01emZddK65ISAl5tlcWw6q4yAn5LMx9Fj5uhKw1bdV
 IW4rSLkdKXzdMiGv/xSQxX0qXcEA2/dQwfpt7AYhr15lWtPQmUk/cCkY94Sf20CX
 o93A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506318; x=1656592718; bh=s13mDaOXGseVH
 ogNjUbtAv7YrCQb3luxl4rFd+wZ0oU=; b=O/pKJgECCfnlvwZ/sdw+X3BrUylsi
 jqwbpztAaKZlTWDIexFa9f4AJHMekLXf9EHxSWixsE0n9K30b/N6Q+KVcAf32fRS
 G/90r0BDTxpAVkHrIsc5+54tk63z0CUisSzo51iwqPjNxkDilTnrQNpM0E+2ASmM
 tPx9hUwWJvR9Ij6WQwC39AGgq+/ZzF4pB+iSZyN6hGPfofHf7EYFafDSc2z9tQei
 WwYrzPo+1ETo+nyaPeNAPfqfS9TuXptl7ezfMhoJshSVM2aSIpcvV3zRVwAckiC0
 mhZBKriCBa3Rjz/jH+KVeCsr/oDhzvtCplz350qTzEdg+wS8cJUcavu7g==
X-ME-Sender: <xms:zke8Ys0cxa4SQOXP4a9-0jwwAtZFQYpdwnzk-_HAj6-iV0CjJ-VlMw>
 <xme:zke8YnGNvxz7mUhAXhfnByeG-ScahUuKPHxaOwemjQCLnZyTl1zGoUJn66uotxE9v
 koW6j0bYFa7DPfTgEg>
X-ME-Received: <xmr:zke8Yk4XL7CML1rld9dtE_rFW6uGRBjiJkEXo2qkDE5i5XjeFsyVaDmHjwQ1h0_YK1wrtsFivSxXPui2KyBkTIbL_tFSMGlHYxnyv_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zke8Yl1syLfyAbT_ziASiNPlF60gTRB12cKpp-gjZjgE0fTQ4Gm6yg>
 <xmx:zke8YvF1sRlZAqVuxN3_mFPpGYpAx6ZjfYrtRjfov2LKJOw6Fo3X-Q>
 <xmx:zke8Yu9ZmJlVL4Vco_ETV5qNM_v-bWn8jeBZL0_EvqfvllUDhsznpg>
 <xmx:zke8YjhFBf0FD3ALEc41FIs8q-O32kIQptdhtxDX-KWJJ0q7ni64VA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 69/71] drm/vc4: v3d: Stop disabling interrupts
Date: Wed, 29 Jun 2022 14:35:08 +0200
Message-Id: <20220629123510.1915022-70-maxime@cerno.tech>
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

