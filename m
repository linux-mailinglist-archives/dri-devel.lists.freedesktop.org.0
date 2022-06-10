Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C254626B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201B512B69C;
	Fri, 10 Jun 2022 09:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A912912B57E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AD5C5C00C4;
 Fri, 10 Jun 2022 05:31:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853478; x=1654939878; bh=zz
 WcTXWo7BsJSwd507NJxBpt8HHFzMJ+E3pFabnqL/4=; b=PrHdEsYToF7ZUtUiuZ
 TVMZtd4AFlQsE4aKlfQwmWZw4EXMjXxDK+IxF6uTg399lzAVFGcER0uvAZajjCCp
 LD1PhV2OH1zfip2TdKNYKOgZO0cktbbly2xY2QGYeBRno3wzhP3edfs8ifbRva8R
 4NJYvtiSWWmW5TCgh10Kt7Y3L2DzwJruUuK5c2swBtKDfXi9V5tFQoYARPLJtSTj
 ZAL8hOLbLCmHURp4ilEaIuivSnu9+LPRHytP23UWUldh7jYEyBuDDxj7L031/mGI
 EptilGECskoeo3gGEwIuM3kqbsfzYNr+GhkR7sGDu1zPeWELsounHskDZ1eQn0V9
 3xBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853478; x=1654939878; bh=zzWcTXWo7BsJS
 wd507NJxBpt8HHFzMJ+E3pFabnqL/4=; b=Wp/d1/Pc41F/Mt6tKlt7Satw5wn04
 BjE7K99Z0kQJaJI+i/czBBsgWB4hetSWUGUoWgellEubEGaETi6jbaqOLLpdU/PT
 YzarWvu98Q5qlyfNzaTc2+LC6dhdUfpku3/+t+GvltZ5wqnSkvU+I33exaOjuyGO
 OFo4RuAaJPnB+N/fko7CWayf+slLpjsqQWoqT2TphAhcKxocdqtbj+o+z4Hr+nbe
 IsyEsiy0alP+jYsDMs2gjRTnM2NTZwr8CMB28GnJ81ijzQUeE+YbMvbyGyz3vuBD
 noSHi4dBnKMWBCgZzwKkDYux6lC/6hKONduKWVujOIkwEms0VF3REdPoQ==
X-ME-Sender: <xms:ZQ-jYoeRzvvgU2Q5c2CcczRrjmqw02atX1YT2-f9oYmC5g71ZDM0sw>
 <xme:ZQ-jYqNcHVDRpD9ooNfYjhp-pjknHav9EcKGzFL85PRIIS4Ahq9wgiYtluSQ4cQpE
 edqZ8WOEeGTckBDEfs>
X-ME-Received: <xmr:ZQ-jYpg7XzUTcsFFhpF1mE0ojVgLe1L_O1x7Q4m-4x6OLLjBaPdvuTR6RhiDb0L-OOSLNqyn8W2TtZLdpB2rUWEzEZskcYoTiNBXcpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZQ-jYt9bGk65ziXLTclh0y19VBNWTLEajeUPG7-jDeE0mtCRffKurg>
 <xmx:ZQ-jYks8mz85ONNu_0BgHElM4cXTZrqF_ubV5q1rhphlO_A8GcqheA>
 <xmx:ZQ-jYkGqTq35un1l0U2XTQlfH5pfSpS5AsuMBU2BvOnH-09GF3XXfA>
 <xmx:Zg-jYmJX6LigEO3IXB8e1qasQsEmjvvgt6_0KJgsnbELFMhJDygaNw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 63/64] drm/vc4: v3d: Rework the runtime_pm setup
Date: Fri, 10 Jun 2022 11:29:23 +0200
Message-Id: <20220610092924.754942-64-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 37 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index ad0dac62deb2..a3fcabf5e6ab 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -448,41 +448,48 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
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

