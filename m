Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D652156B6C9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D871138D6;
	Fri,  8 Jul 2022 10:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6A1138D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7D88932009AC;
 Fri,  8 Jul 2022 06:00:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 06:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274429; x=1657360829; bh=vA
 gP65CC4vnB9j7GBhYPP1d8z1kDicrCqNe2ZZfsv9Q=; b=hi49FNoVJqfFrL/mbd
 bgAESxnGOzVZcMkwatnQqU4TyD9hKLzTteZbcU4EdHfFG98wD82ZUsGGlM8vS614
 7nGh0e4UGhB+9iRQVmHUqjHM2/vJMwX9FJtcM0W1jwSYW/u+GzZvgdiXl/6EsPjU
 Ls0euYOMvVwo2Pz92lUlRkKo4V2zBWoEHzbQPbONmNXRi5Fc8DfbK9rrobj2dlIN
 ohu7L4WGgKKg3jhokruFbYRAGlZ44Qk/DmLV8yuXLsQZ7NKeZiMFrSQi+FIc0LZF
 0dDun0XC1huDUp+2laQNvYe0t8yJDprf+XXpicgiPfbGXjbPZxpzuAZZPfrU5SdF
 u5BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274429; x=1657360829; bh=vAgP65CC4vnB9
 j7GBhYPP1d8z1kDicrCqNe2ZZfsv9Q=; b=AtpvEWApVp8h7b4LAGWkniBy+9cx1
 E2/9RFLeEu8iyvQeucYxv/0zoMEhMgNMzGGmAWVOJKJzoNnFSm3zblEPJDq8cmdF
 zV/uLH4hVdX1MtUmi1G4LpYOR2pfTGl0ShPyb5mfoJ2M2tYNI+RQHkC2+uYjlS2K
 msJPb5mqPGlmRAyl4rKaiaIYJvm8tThdbkyK7XQAK38GRnwPK/JzqImsiLLrq4AT
 jxZJFbK1Es2XY0mxWvTu5FSA4R51nnp9usAHz0XYoQQQYxQioeUKdEI7wWLuWIJj
 liYbmSwG0/Nx4QOWkQxhrWUkZJHjny7+whJyieI3XollJ7AoNOYSwpzrw==
X-ME-Sender: <xms:PADIYo4A5d5mKqDhwfqdl9NZRjAYL_Ll11eo8-MDZB_k4ZCrtnHJbA>
 <xme:PADIYp7s3pTpxOhT5TdoqSf40tQE0clheOSJMe_EQmLkg9Dr5cSvuN_tfUX7Eqh8K
 pT-3BuLXV-cExIdISg>
X-ME-Received: <xmr:PADIYncLicgvNowD8OT21RRdwId5Ry9JxJGyT47PSYwN8MIoUi8Rd2BCORMyZCvB_5nkNpVSTEp7DU15LzqCcuVbHKhMU0hbjEyHzC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PADIYtI3PotgGXOaDaedfJxkZ4SyD8ak_IJHd3-4GPBUXdnkTE_4sA>
 <xmx:PADIYsI0gP2KKVovlXOC9teyVx_Uyr1osuUxjM4iGC5pXj4b91-yJA>
 <xmx:PADIYuxeu37T28ijDHrXQrp52yxsUkh_8qRiHSnKU3xeP0u7XxUmkA>
 <xmx:PQDIYhFRlh07X84OUQd_trnYCEbIerNeQMfMc-UYD1wIkVqhNytLrw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 67/69] drm/vc4: v3d: Stop disabling interrupts
Date: Fri,  8 Jul 2022 11:57:05 +0200
Message-Id: <20220708095707.257937-68-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

