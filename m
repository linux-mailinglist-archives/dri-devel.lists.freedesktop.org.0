Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4D546606
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D85410EC72;
	Fri, 10 Jun 2022 11:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D8D10EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF14D5C0166;
 Fri, 10 Jun 2022 07:52:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 07:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861920; x=1654948320; bh=XN
 KQXEuhXdObeq9vFnTEN4yp4QUlhxHH1BBo2JXvKrw=; b=xIpcS6vUECvrzAC0H+
 7bsYaXFk0V6gbov7Lb1nq4ve85PlobZKm2HZbszeBzB6W2sd4U1GftuZsfONWK4E
 X1nLnmpHM5ztItC+lO0F8WofZXFuP1RPprsBflF5L2REmhz9gOXJZU9gG97pA6+A
 Ck/RLqvM3u7F7/nMeQmzeg6gei5RutLVM419YZ6D9xZUbWV/5ZB1diQbFp1ovUgg
 A/P7FwmO02Vm0lcFBpdY8LplpVOnlACwlPYoqlzQWxfZqQdW8uV0tGJi0qBrpREs
 lECqgY+fEK76bvM382mX8K6bKQdkF2hcTLY1BoHUIx64VZjaTBE3U0gym3MRo0hE
 +49Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861920; x=1654948320; bh=XNKQXEuhXdObe
 q9vFnTEN4yp4QUlhxHH1BBo2JXvKrw=; b=hkgCXyXT/2wDYFEYaRYfUuz34hFO0
 8pcZ7f6VJBziVsS2Zwt3sZJOFrxnxCcJ8n1ErUy0CIfWvqTEuupuMbJ5d6JPOq3b
 kC48Ez0sfVwTo72zGVh4qsPNuYev1kKU85CtInl9awsoIzQhaQhx6qL+qfelqonV
 OZf5tpv6XIxP/McobEYbFYDsTp3KQUO2I/Hzlg9dtx/2w3qEfcOsEK206K9T8VAZ
 bOGawhw9xiSM5VJE9LyQ6WJM45DSQ5SMHEZme55p9R8SKWLjTmfS1CCP4SZMvSe7
 cYqbWijLgYVzBveaTTjMIPDFK+bAHswxq+qYGEVyN/tCNOD+at063Ibzw==
X-ME-Sender: <xms:YDCjYsKPXsOltJaXx4cydcG9Qm-a_zmvEI-UU44cyRjmt2Nl9Um0vA>
 <xme:YDCjYsKdOS9nkCtR6rWUR75WjAWtzAiOep9ZJcf-PpZrMwuGcvaba81vRCUArqhup
 BTOFyFhynD_CI1Sdoc>
X-ME-Received: <xmr:YDCjYsvPfIEcjboeNsiOuiSdx89Pe_7nCUVC-vqFoj84lvFb2A_ApXth5ab99-lBctzPukA3MKpPdcAgVPnxs9gKKJ_e_hLutlrKuEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YDCjYpZH3CLudBWi-FsUdyQT2Jxp31wxtnNRlc5Dt_wplQahK4elfw>
 <xmx:YDCjYjYDpw634p7uM1K1MozEzuV9vuqmARKuwaFUkTO9wY-HR_JtyQ>
 <xmx:YDCjYlB-rZThIZztJHedVdo6TcYVz4K6828sPwoFdB3PCwVUFJmQWw>
 <xmx:YDCjYuwEuxhKPLqFpxqmo79pz9-J24m2-HebuD2C_C_U_26uOv6jJA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 04/14] drm/vc4: bo: Split out Dumb buffers fixup
Date: Fri, 10 Jun 2022 13:51:39 +0200
Message-Id: <20220610115149.964394-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_bo_dumb_create() both fixes up the allocation arguments to match
the hardware constraints and actually performs the allocation.

Since we're going to introduce a new function that uses a different
allocator, let's split the arguments fixup to a separate function we
will be able to reuse.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c  |  9 +++------
 drivers/gpu/drm/vc4/vc4_drv.c | 13 +++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 6d505da6b6cf..3ca16d682fc0 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -475,15 +475,12 @@ int vc4_bo_dumb_create(struct drm_file *file_priv,
 		       struct drm_device *dev,
 		       struct drm_mode_create_dumb *args)
 {
-	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (args->pitch < min_pitch)
-		args->pitch = min_pitch;
-
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	ret = vc4_dumb_fixup_args(args);
+	if (ret)
+		return ret;
 
 	bo = vc4_bo_create(dev, args->size, false, VC4_BO_TYPE_DUMB);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 5f39e40ef238..eb08940028d3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -63,6 +63,19 @@ void __iomem *vc4_ioremap_regs(struct platform_device *pdev, int index)
 	return map;
 }
 
+int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
+{
+	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+
+	if (args->pitch < min_pitch)
+		args->pitch = min_pitch;
+
+	if (args->size < args->pitch * args->height)
+		args->size = args->pitch * args->height;
+
+	return 0;
+}
+
 static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 37c93654480f..9c324c12c410 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -885,6 +885,7 @@ static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
 
 /* vc4_drv.c */
 void __iomem *vc4_ioremap_regs(struct platform_device *dev, int index);
+int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args);
 
 /* vc4_dpi.c */
 extern struct platform_driver vc4_dpi_driver;
-- 
2.36.1

