Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ACF54626D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFA012B684;
	Fri, 10 Jun 2022 09:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E640B12B57E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EF1B5C00C4;
 Fri, 10 Jun 2022 05:31:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853476; x=1654939876; bh=zU
 6V3MGrvUSv7v9sfc8fG0sUVByAaTYJncnJ3iTcBog=; b=qln889da6PUguIRw5x
 GkNbmpDD6rINoEvxyWFRQj3tC4rMCbj0/TjHSh+ivgtI8WwcWHfr2kdoVicRCH+U
 7Y0wPFEZk+w4RlJzDANI4OvdA395pR/r/81dFh2N+MudSlY8hzDFBcRaS4/+QKTO
 a+vsh38Lv8ybTgcOkFgIipadlI0id2vuBkS9O+MOB3VBX9UbfFKHm2d5oI7hRqPb
 vIVgHeoh7S9sO2tfL2f9faQ0H4whLL3qU966e1Hu/Cw1bNMpx45Wl7BmzWP14pyd
 KjQMCj6zZw87aEO0P7yn+OLJSpc5j3RDXNHdY2lJE8QSubyYKqyatb3ksE6tWrTj
 +Omw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853476; x=1654939876; bh=zU6V3MGrvUSv7
 v9sfc8fG0sUVByAaTYJncnJ3iTcBog=; b=CZbC5xceQADUqYQEGsjYU3bSOlb5t
 xdAvHp1XNJlw7FPMGCsF6LsL4tyDwr5VEt5KTWUl7Q9X2bmibmtFoiy+tRSmd9u2
 2tHiimB7169Omp6XaZ/WMZLKW95MjE29tYS+jifThFAc1YIJ6ZqqtX7VqQXCQ+tZ
 Kb5OaKayV/jifWNZMQdAvOswsgTCe0p9XMVNcVzksNic2VLzQTE2kKwH2RzDroMs
 NjH1fRHWattKiLGSQ4aZzvDDv7cKHisB+1nr7biE7iDHMHpFlb3xPrBvKEMheVWf
 NaxcFGOlCDoEqHkY+sF3Rr0e09qf5759jEn7/CprHlO2YAbNLEKMT4rng==
X-ME-Sender: <xms:ZA-jYmLuraI7M8pHSTcFMs380pbiZ7iHls84Kn-x0dfnOeG5BzAKBQ>
 <xme:ZA-jYuKniI6vw84cOHBZJJ0m3iMqyzlvoTXqa5ezktFE_Mf826haIxhtSjZ_VgYoO
 Hxp39FSNHqLcxIiEJQ>
X-ME-Received: <xmr:ZA-jYmvfvC6-NbEGBWaXbM7_tXjMnh9s4adoWvCdLKzmFASqwItHYl5hAI2O8Hy4WoMyL008udhoeWzOt6KKNJsVkMYSk0qbC9rt60Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZA-jYraurJwTRMTIZG_-ijnK1gGJ3jP5o1ghUQK3dGZHtLlfqp226A>
 <xmx:ZA-jYtarifpdoph4HiD6u63ll5ukPxxD_4o5zdAoG_AoCcIS4M5Ylw>
 <xmx:ZA-jYnAKL9sJCsszkvyMW-28rLt51tWP1sl_LXvdtOLpMZaJ18csvw>
 <xmx:ZA-jYsUiGIedeehudSR-OUDzhnCO-BeTQ2LjpzsibUR5qr1287E47A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 62/64] drm/vc4: v3d: Stop disabling interrupts
Date: Fri, 10 Jun 2022 11:29:22 +0200
Message-Id: <20220610092924.754942-63-maxime@cerno.tech>
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
index 4342fb43e8c1..1af0560ed16c 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -289,7 +289,7 @@ vc4_irq_disable(struct drm_device *dev)
 	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
 
 	/* Finish any interrupt handler still in flight. */
-	disable_irq(vc4->irq);
+	synchronize_irq(vc4->irq);
 
 	cancel_work_sync(&vc4->overflow_mem_work);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 8fd16ece5b5c..ad0dac62deb2 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -378,8 +378,6 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 
 	vc4_v3d_init_hw(&vc4->base);
 
-	/* We disabled the IRQ as part of vc4_irq_uninstall in suspend. */
-	enable_irq(vc4->irq);
 	vc4_irq_enable(&vc4->base);
 
 	return 0;
-- 
2.36.1

