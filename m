Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5E570940
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EE39035B;
	Mon, 11 Jul 2022 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79D69034A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 41BBB5C0102;
 Mon, 11 Jul 2022 13:41:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561299; x=1657647699; bh=sX
 9Z46yjSu5ay/q9mdw+YWSoVYqXdtcXkB0jM8E/N6w=; b=XB1x102IMZbhoA73UG
 YOSK56LWeWzkrFJFWNPmNVb4bbWdpRendtOpwM4ffVdoka7dOcrgU6L40KiAXZbi
 Cw9GDI+z7brCWEAQ93h7/SHOucSqK5TCgLdZ9a+J0SqFbUnDDF9m46bCf9OxuuLr
 LuO7ULf0JvFxBxGGum4QLziGoAkWyIRwm6Xuhng2HHoVuHCf2O/aHv0znfYhi1M8
 rzrWZKUWAUhLY2GUhJMB9d+3W6XyNb7YEKy316mzaqhiioEMMx/DP/RsWhzl2byl
 a25as+0jcIg50G7L0Q/ou8QBp8pEEU/4nLHUZy4CXs2EV9v5zpBW+2uvgj6WkvRq
 hQEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561299; x=1657647699; bh=sX9Z46yjSu5ay
 /q9mdw+YWSoVYqXdtcXkB0jM8E/N6w=; b=XEb7LZ1VzD/GKkAFY6nSorq1HnmkU
 KHxQfGFFgipxAfgWXtFONtMUS85xBQmweaDwOuJVPoPFQgAxmCPbyWuB+25zFzqe
 EPLp+Y4vIl+qME5fLRcL+qCTDiGRY8c1o2EPtLBh7dI64+DOd2CpQ0vEGnmy84hX
 DzwdFHDd7IZomQhlwvDA/wC88/Wf4vo9/pEwpUZB7VDmkfPaJSGqepA/bWJ8Sxa+
 6x2VH5q7sw/H/RIymSMsNb4MrocKDREw+uDpWngDQcLaBkVRYruSyDw4ZJaomfER
 6xpsZCQHoKt1u85/x25wHZ9v4wxIdU/h4mx7LY5jQdunxEHAlZDkGjDtw==
X-ME-Sender: <xms:02DMYiJWSavzC8ey71VKjbrTUu6RXi2OP-ktM9pIB-F5ZSkg4E9dFg>
 <xme:02DMYqJU6vxRGpQcu2mQoRWHcjyiPaOCK_zp2gIZscfn0fcInvywBG36lcDwfgQMA
 9mYvlHg-RjdIdZRUtI>
X-ME-Received: <xmr:02DMYivth7CMijv9GtRZRPbjRrVOCiSXwPQ_zEz0sRJVuZhrgj623G8kuL91PjhI2TMihQJ78k6qrswLt3FpSIfOEjEXNhPHlGcrV0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:02DMYnYJfHsTaXk9NVfQJU478HV7FsKFrxCIpPw2I7X0sztxV1qaNw>
 <xmx:02DMYpbPW00DmKYOT2kC1pIYKhMehG3a4q42V4A-4BP187jtGtF_rw>
 <xmx:02DMYjDDxl_GIJZZpTZWuJG_tb7mpqdR_zfKfoAGR85JMYJqe0Sx9A>
 <xmx:02DMYoXEIVy0txab6CtZBjz8rA7H2nq8cc2WIzyBX81F_7M2FWAyPw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 68/69] drm/vc4: v3d: Rework the runtime_pm setup
Date: Mon, 11 Jul 2022 19:39:38 +0200
Message-Id: <20220711173939.1132294-69-maxime@cerno.tech>
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

At bind time, vc4_v3d_bind() will read a register to retrieve the v3d
version and make sure it's a version we're compatible with.

However, the v3d has an optional clock that is enabled only after the
register read-out and a power domain that wasn't enabled at all in the bind
implementation. This was working fine at boot because both were enabled,
but resulted in the version check failing if we were unbinding and
rebinding the driver because the unbinding would have turned them off.

The fix isn't as easy as calling pm_runtime_resume_and_get() prior to the
register access to power up the power domain though.

Indeed, the runtime_resume implementation will enable the clock mentioned
above, call vc4_v3d_init_hw() and then vc4_irq_enable().

Prior to the previous patch, vc4_irq_enable() needed to occur after our
call to platform_get_irq() and vc4_irq_install(), since vc4_irq_enable()
used to call enable_irq() and vc4_irq_install() will call request_irq().

vc4_irq_install() will also do some register access, so needs the power
domain to be on. So we ended up in a situation where
vc4_v3d_runtime_resume() needed vc4_irq_install() to have been called
before, and vc4_irq_install() needed vc4_v3d_runtime_resume().

The previous patch removed the enable_irq() call in vc4_irq_enable() and
thus removed the dependency of vc4_v3d_runtime_resume() on
vc4_irq_install().

Thus, we can now rework our bind implementation to call
pm_runtime_resume_and_get() before our register access to make sure the
power domain is on. vc4_v3d_runtime_resume() also takes care of turning the
clock on and calling vc4_v3d_init_hw() so we can remove them from bind.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 37 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index a2da0db73a5c..d82c86865079 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -463,41 +463,48 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	vc4->irq = ret;
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_disable_runtime_pm;
+
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
 			  V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_runtime_pm;
 	}
 
-	ret = clk_prepare_enable(v3d->clk);
-	if (ret != 0)
-		return ret;
-
 	/* Reset the binner overflow address/size at setup, to be sure
 	 * we don't reuse an old one.
 	 */
 	V3D_WRITE(V3D_BPOA, 0);
 	V3D_WRITE(V3D_BPOS, 0);
 
-	vc4_v3d_init_hw(drm);
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-	vc4->irq = ret;
-
 	ret = vc4_irq_install(drm, vc4->irq);
 	if (ret) {
 		DRM_ERROR("Failed to install IRQ handler\n");
-		return ret;
+		goto err_put_runtime_pm;
 	}
 
-	pm_runtime_set_active(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 40); /* a little over 2 frames. */
-	pm_runtime_enable(dev);
 
 	return 0;
+
+err_put_runtime_pm:
+	pm_runtime_put(dev);
+
+err_disable_runtime_pm:
+	pm_runtime_disable(dev);
+
+	return ret;
 }
 
 static void vc4_v3d_unbind(struct device *dev, struct device *master,
-- 
2.36.1

