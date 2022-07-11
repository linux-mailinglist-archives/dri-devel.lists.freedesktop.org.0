Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57A257094B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC489038B;
	Mon, 11 Jul 2022 17:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239E49037B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 81C9F5C0102;
 Mon, 11 Jul 2022 13:41:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561297; x=1657647697; bh=vA
 gP65CC4vnB9j7GBhYPP1d8z1kDicrCqNe2ZZfsv9Q=; b=LVoAWC678mnffIUCpQ
 aP4R+lW68eJSTVW4QdmzwuJqZjmhgyecmhzRb5nyboA004zmRYvvR63WjVijbLj7
 qzLu3wBcZTuWRR1erebb+U6pFz6e00yPzYkZuYyQ1GoNoKGT9fDqBd+QcZwu2Ynf
 yYhfMZp3MVfA6bKTpgseaePbBumY+I9AWSmSzZVgOGcxPBRlNZNDOTtfMbUbJYmi
 lCjEBvmwOY79N0Tq3V8nOoBQMIxbHAU1sVS7k3zdPRIERO8e7VTId/t8mngNQTMq
 7TVjp0Vv3LHh2skqk9cp8BCmHeKFlQFrQ3FzNsxR8fDHvEsrMdC6ryXbfHPDKsjt
 zbig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561297; x=1657647697; bh=vAgP65CC4vnB9
 j7GBhYPP1d8z1kDicrCqNe2ZZfsv9Q=; b=S6iRxptaPWzKQCPBMbTMBHxR0eCGP
 u6ytQ+Spdcl753uOUox7gNlfjDVhtDAnxgIw/o84ek2gE8zt1/R1LP2wGigwoj2w
 bNGqOGabR+FcMaNyfzM52I927KyDTbGXLgjdD04BDwcGMYPL6sgVnrH+BP083Rvo
 bSleTRnWt1nnnhFe3LF+I0SCDBUIVwyDe6J43cj0K+9QLdd860fHvT1S7GJx4qrK
 oBc8TsTaGBg/RaMa0w2DEmGO1cENw+yPDXT346qT04fjyzDoViJ5OKs5RH0Vxp6B
 dZVQ8/RzuZcy8KQ64/fX5M6O/8PiHtwXMIDqjUYIoeMls4GPmmFwOjx5Q==
X-ME-Sender: <xms:0WDMYsU4XoROH55WSoXG481vYlH0Y_NFlMxNHq7J_jGfeZOSAVlAyA>
 <xme:0WDMYglGsXZ-3Ixd1vCNuFBcG32zDsv4ymh91MJjeeEVX0e8Yf3WrgL31ufTuGEB2
 pKxkchDJ1cA-OrMMPg>
X-ME-Received: <xmr:0WDMYgZAEyRBOZm7CGQNP9BiVxJfKR602SWOHrPu_fPiNKJvAEmfAxqzX29_LNShc7ZxiooCx1Z-F06KLuWZPuZ2ObSpaDO9svOBr0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0WDMYrUSIybmKOS2CfIo345fKx7_aDIWpDUZMzwef4rjZGlcCATUPQ>
 <xmx:0WDMYmlZ3TC6N5x9O_x1tbamZT7AdwrMrdkMBT_FIxaR-M1ow0jSHg>
 <xmx:0WDMYgcERqgSxeZRlsMpQrI2vTwlgCr9tmst0il7e5Q7H0AagepC8w>
 <xmx:0WDMYnCQBrVsGbnaobv9QK45O9f_ZLmYZlPvYiXnbzGz89c0kOCFPA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 67/69] drm/vc4: v3d: Stop disabling interrupts
Date: Mon, 11 Jul 2022 19:39:37 +0200
Message-Id: <20220711173939.1132294-68-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

