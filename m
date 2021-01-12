Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE02F4639
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28FF6E10E;
	Wed, 13 Jan 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26AF89C96
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:47:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AB9C5C02C0;
 Tue, 12 Jan 2021 08:47:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 08:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nHKJhAipcPcZZ
 jFS4tN5lm6Z7iQDixhwhAAHaeH1rh4=; b=Y4xmuVB2FYdQYTI2/wF4EFWno+va/
 EMAUpxSE1CZVNGt4/QELl5Po1Ab3OTAgQ6cwjd04/Ouoi2flpgRfEuQBZ89xSVj/
 dkBbx6WqrxkadyZwQ3cqJ73Rc0gCZprYxNgR1GflRMuGWtcjwJ/6G8dShu8aphHJ
 QRQPSzAWmxmiNYiimNoM9GEGg4GkGJnitu29RJ89X5ihrJMquk0WIlJkg/vmodDy
 y56TytqhCvQi8a53lfcLUI25SZKM5lViiwYim5SwfkQG2WuLJe36t0ZNoufP0ZcU
 547zSvK9NkJrrmr7cXCUdVhah5vx6AjEZ6cfvt5ULrt3/oz5eYDfBiCRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=nHKJhAipcPcZZjFS4tN5lm6Z7iQDixhwhAAHaeH1rh4=; b=epB8ZMVt
 +QWRL6+gTx58fCqKsy4Tmfm+Morqg/EEdFOEp6BR4VHTtHFtfNSS7F2YpYJ0rqtC
 /z6sZnJ3qQuJNtj6ujpRnqHPOAnmSNM/gPLmHSrH+Q3/BSbV/HJaeOID2gjIlmeI
 4ltC/+UIIMyde+nurhSY5WT7ZJvAtWPDePRsWjU8qPvHmZcNdr2ZSTzSDZR56NgV
 Kd20Vkag4L8Jo1Y6lCPxu5LV+gGYus3M8tb74EgVnmqMBFvYeBlfYIL8G3zhwwNn
 IXe6Xtw3tMJhVAzSxQ5PF6oO4DCpPHwTuOE/MS9sSecjT+18ltVrO53p3lyK6Szk
 PxNRUPsGMWMc3Q==
X-ME-Sender: <xms:eaj9X4LiANDakHlEpD5ES6WmFbBJW7tSZldGaSObEffnUdcdm9o53A>
 <xme:eaj9X4JZry9eRPG7sHTRyxzmd6mxF3qM4rR8KEl6q3OyYdZ7hfwQLxIRbskYG1_i_
 2BQaBJ5Wi1PY19Mmws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eaj9X4tATA-MNZBHtKoIFuhLmauKPhJzWcBCZLWBIEG-0TTiu4V5CQ>
 <xmx:eaj9X1bJe1SV206Qk4BrMZF1_xLZ71bT0HQPUIcX7GYeN-HYS5b-6A>
 <xmx:eaj9X_bBI5u2yzCEvumS6kOXQIfXOjRlcrtNsarTIojocCg1Vq1rvw>
 <xmx:eaj9X2xpxmTNf0Hfq9rTVoAKmuI45q_eNRvV-YFyDlHv2pP_l8lJgg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 01604240057;
 Tue, 12 Jan 2021 08:47:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Nussbaum <lucas@debian.org>
Subject: [PATCH RFT 2/2] drm/vc4: hvs: Clear the HVS list at boot
Date: Tue, 12 Jan 2021 14:47:30 +0100
Message-Id: <20210112134730.810697-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112134730.810697-1-maxime@cerno.tech>
References: <20210112134730.810697-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel boots with the display running and we make sure to shut down
the scan out engines properly but we keep the display list for now.
Let's make sure we start from a clean state.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 12 ++++++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 2cd97a39c286..9fbf03872b24 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -289,6 +289,7 @@ static int vc4_drm_bind(struct device *dev)
 
 	drm_for_each_crtc(crtc, drm)
 		vc4_crtc_disable_at_boot(crtc);
+	vc4_hvs_clear_dlist(drm);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 051ad4e31e52..493a85c4d11a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -911,6 +911,7 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
+void vc4_hvs_clear_dlist(struct drm_device *dev);
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2b3a597fa65f..1fe40f3cbcfb 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -326,6 +326,18 @@ void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
 		     SCALER_DISPSTATX_EMPTY);
 }
 
+void vc4_hvs_clear_dlist(struct drm_device *dev)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	void __iomem *dlist_start = vc4->hvs->dlist;
+	unsigned int i;
+
+	for (i = 0; i < 0x4000; i += 4)
+		writel(SCALER_CTL0_END, dlist_start + i);
+
+	vc4_hvs_dump_state(dev);
+}
+
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
