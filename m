Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D05546235
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED50A11B31A;
	Fri, 10 Jun 2022 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BB111B280
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AF4F65C01C0;
 Fri, 10 Jun 2022 05:30:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853414; x=1654939814; bh=Ae
 cD8/M9MRxOJgAzUW3cq6H5rVrme+/a4dPnA/GjLUg=; b=FU2gqhW/AYy19Y5UQ2
 KtCbHho5B+yCXHdqI1qc+eEHjWKKeP0O3Pb+nCcp95fmn7U+GTl3JJrYJwkITG1B
 5RXTEvu6/YQN0ZpG6My+/MZ44LvHZB45iD5HTXO5zygMh8Cgz+lfrdqlW1nJK0fZ
 aR6l5WBdgU94XzrBhOloZCoOtdRzZ7GpFDszDlmfMrv25iHjIPthA7sgnSlT8Oy9
 UdtDg4Qc3mdSeCUBZIjSymTIoOSkT94gUBsEGB/bOFGdVExXXqgbcNR3lu++i7OT
 x8/9eBWzdEuvFYRwh2YMoDhopt+7eF9vrY6YRgt6FjzaLm/A52c5NIhqSZX00dsk
 31jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853414; x=1654939814; bh=AecD8/M9MRxOJ
 gAzUW3cq6H5rVrme+/a4dPnA/GjLUg=; b=GYzutzZIBzXPxt3t70hJLXGug/5Dh
 IUWaELMwDjGpFu0c5gJPIGtsOTlMXTHj1AHzEKuAjnRmYcNrN95An8gUq8n6AJ27
 dmTKS/T5jfuuoGT3h9sMFWvNJiYHKQvzWD5suqYfqSZwfO1sOiehq3bp8171/q/a
 ec9askleNCwQ0gPR6FRolm8fatoFARFTLhH8KdvAUR8wg/4d3TD+kBPXDHdGl5LD
 5Y7Jh3b0/WVSf5jX32H4fpZzsZbKoUfXRLo/6T1Em5Eq0jwn4b0lOTh1bJOyuXry
 wRf778OBGFIZHhDLAFeJjncqt5PiqjInyQf4R02yO0kwKTIugFuHTxPyA==
X-ME-Sender: <xms:Jg-jYmlOKMmgv6v_UMVo9kVb83tY-W2jgBirGlW1gxHqM2EWJ46weA>
 <xme:Jg-jYt3UXXsqKcrZH82VEM3BBHdsip7xYVv-vU6INUjlCUgi76BUAuivJqUu0C8pj
 ks6_5lLbXaoLeRfZbc>
X-ME-Received: <xmr:Jg-jYkqITq1PfoqO8OAxcLFHCAdpLEz485uhjNWF3s0bRbIygUYDZ-2szQHBATApylura4sNbYnM9-VeGh5ktFc3VlceLrbyUUZqJAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jg-jYqnv_W0MAr74EhacrQDyccS-ojVfepmUbEqnRc9N_ONTMo_QEg>
 <xmx:Jg-jYk2lgLTS8CdkShHgykvIKi_UjS4LuZqdqEvb0n1E8ppRjD1ikw>
 <xmx:Jg-jYhssLBkCB56NlAzP7NXQlrnJTKL_PsLfLz20wOvP4aoFNgCzuQ>
 <xmx:Jg-jYnSl9tKSGxcK0q8DTaxG9E1hERvKPoX_g9CF-Y78f-hLTKiTPw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 26/64] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
Date: Fri, 10 Jun 2022 11:28:46 +0200
Message-Id: <20220610092924.754942-27-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 4e24dbad77f2..8a50de2c40d9 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -296,35 +296,25 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	ret = drmm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
-		goto err_destroy_encoder;
+		return ret;
 
 	dev_set_drvdata(dev, dpi);
 
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
-
-err_destroy_encoder:
-	drm_encoder_cleanup(&dpi->encoder.base);
-	return ret;
-}
-
-static void vc4_dpi_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct vc4_dpi *dpi = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&dpi->encoder.base);
 }
 
 static const struct component_ops vc4_dpi_ops = {
 	.bind   = vc4_dpi_bind,
-	.unbind = vc4_dpi_unbind,
 };
 
 static int vc4_dpi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

