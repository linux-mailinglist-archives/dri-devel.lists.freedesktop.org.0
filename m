Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4856B6C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05001138D7;
	Fri,  8 Jul 2022 10:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E116A1138D9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B913C32007E8;
 Fri,  8 Jul 2022 06:00:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 06:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274431; x=1657360831; bh=sX
 9Z46yjSu5ay/q9mdw+YWSoVYqXdtcXkB0jM8E/N6w=; b=prH42rONvaCyJusEj7
 Zcud2EpDs8Th4iIjm99PsMj35X9E8nX2k3WJKfdyA5N6vVGIeIF8qm8PFsSypOrY
 p6LnnLWFUup/RdXji1FncPRuCLj30nVeYpQ2/WWFA5KVWIw0bKDSlXjyWJp1Tz9r
 OFAR+exRZstahrXyL6rtr07R7RVd29co55C/nqjT8PL3TX0prYqs/oHHywCZUBpw
 iLKdsurcIBf7nNGG8mQzPbIndSmIABKJyT/JwSBJlRQ2YBtLPR3J+G/5Jx1kekE5
 R09G9xV98UH20PBgLVi6LoraJEIoX6317eAHtUWh63an4p1BFWAjY3D6UDc0RFJm
 tpUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274431; x=1657360831; bh=sX9Z46yjSu5ay
 /q9mdw+YWSoVYqXdtcXkB0jM8E/N6w=; b=B89iNZZoNnkoxW6SgQQz1WUf4BDbf
 RiDPYdY3B+T9DdmkEpAeDeRydOwikYVje/wR7njSOCC7l6T8J9twwFGktnqin7gE
 H83KgzWgHuflNgzgdJsHsmFIHyYXsj5/4VnX88wUFfbIMXSMlOVnsiY9qmdohifW
 8oDIHLa3gooW55PdvGArrSHUPoO3tBNnJI76/WV4HeKadY/ApxDRq52ztQnj67/M
 xQs5n0Ds55UpZNmN7xq51doDieuIGfLZVLLLi9zc2DlpuO03e3jFoh19Eq5DwiWv
 tF0jFM6uxzhVzEVRn12N/RzMgEexTbsrkrywACEWVbSm99Y9+zTBsOHvA==
X-ME-Sender: <xms:PwDIYoxS4ViHKxLA6A7N5ARWmC43gTwZhxbcfMDo52VDdh9RD9e52Q>
 <xme:PwDIYsQJIBG2QGiXAxvPlB84iXfIgyPH811KcnVrHEct70czzvQ0NXIzMUTTRtaGp
 1Ab034sX7gpYQb0Z5w>
X-ME-Received: <xmr:PwDIYqWYegPePR22B0qj_weIJjkPkIBfX0tlwqDVV9J67kTUrfRgFA6hA1074MtHOlRcntHItXsF6UJCCSKPWK1fIMnCQNr_d2s9HTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PwDIYmioVrM4_DIIOopsf8xtR51wpXOmtSiG9KkT1ZhcYXfpw1IQtw>
 <xmx:PwDIYqDoVuM3P7j74L97J-4jI2tMUbiGjkjRJcJeuj-GgXOz3swULA>
 <xmx:PwDIYnJoZ5VviUdGz3UpfcK8Av0RPP0BOLZgC7DdGPtbWf-BXydwWQ>
 <xmx:PwDIYt-2l5r3pMjSrp_UOWJtpd6U7iIyBKgn-ucr_ukKmXmUSH1_UA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 68/69] drm/vc4: v3d: Rework the runtime_pm setup
Date: Fri,  8 Jul 2022 11:57:06 +0200
Message-Id: <20220708095707.257937-69-maxime@cerno.tech>
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

