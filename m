Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1C5485D5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C310E83F;
	Mon, 13 Jun 2022 14:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9B10E83F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3E3BD320092F;
 Mon, 13 Jun 2022 10:49:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 13 Jun 2022 10:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131753; x=1655218153; bh=PZ
 041f6Oe3eTrYJo4j9ihcwFcYr131fl6+Kj+PbSOxw=; b=WGw8uQktDJVRNrVK2B
 UJmr4BWaJBZw29YB7sGa1UP1ws9yUh5IofsgKjbXPizezUw0KevcEXmVfIFNtj1o
 GT2UV/MzSt9ZIQAJmFuNuQoNq8CzwQQuEsGGmjKZ1mYySub5d6yJKjbVrBiysH12
 ipnzuBAHDHvvEluKkK33Ee3ulD2emghwhS4hMzEebbhYpCRApmRYUWGV6DvXgYTC
 6d+zDK9ZQ1EgAv31ldKp9Ey0J4pvbx8Dp92FSfGiLNLMFjY93NEq1rXAfyZ2RxW4
 Ct2PmAbdxN73qN5EmLDopbg4hOW9xyAppvVqcKdsB9VNsBQebwXn+O4oD0wK/PsY
 tdqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131753; x=1655218153; bh=PZ041f6Oe3eTr
 YJo4j9ihcwFcYr131fl6+Kj+PbSOxw=; b=WQ3azPQDRyusHOAs4WDLPXzENhOic
 46uG8aOYjAOBEpWlEMcz+t+h4cdxKT8cj1sTkMELg9c0T+wEh4k9qSZg/TaOU/dG
 snjz2cLU9C62Z8ZOWOvusx58BdDmk2JnFCXN4iinNNQNXOmX6AlejvbMG44B+1sc
 BhYVEByRfN630L4PctYtm6bYxKaS6JTEsraT+N0TsFBZiFMty/+Ubk/VRm8CcPZS
 SLCuVJay/SMWLoFMdknqBPFaLR/Ck9Qy6y1XRLtp+LnRn9+8lt04TU02LEuEBhix
 H7OjxKlLYkO3OeXmchxWbtFeBX1DdRLZBMVMGU5OmTUkpRIgEeH5TWl0A==
X-ME-Sender: <xms:aU6nYs2lIH6rJblh8WHIoV9oV01q-E-1PtH6iK8CfsCNx_gKOJTJxw>
 <xme:aU6nYnHizu_gt_pz8JRiXIDmLgTLOAqKNOIBsWRLza-yVA9_c2X96O5CKeG4A9I9e
 UkB31ClNeA04trY43c>
X-ME-Received: <xmr:aU6nYk5IFLC7drHX0wCP4P4nW50_OGBOpr4_5zBV-TE8KmCSRX7coLEUnvS9u1RpnJq6yOM47mAT__1va9JSCeanhtDgApCIVA7xHAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aU6nYl1JZMI6MWuWQj7Lt6rlxW-Ep0ndmowfFHnCefFp_uOUV_kp1w>
 <xmx:aU6nYvGOnGJCt9yCsRnH_DsmbBanYaCvNW2GLyBZuR7jlQsDB7KgUA>
 <xmx:aU6nYu_-J-oJZZB6YV-_o1Efewf_Cq6dS49k4pVEuQvFIuELjueQ1w>
 <xmx:aU6nYgMMvQ57WEsj5wlHE9FRTUQjBOSk5Rbtgmt__iJFNL0jY8-0Ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 22/33] drm/vc4: hdmi: Switch to pm_runtime_status_suspended
Date: Mon, 13 Jun 2022 16:47:49 +0200
Message-Id: <20220613144800.326124-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

If the controller isn't clocked or its domain powered up, the register
accesses will either stall the CPU or return garbage, respectively.

Thus, we had a warning in our register access function to complain when
that kind of risky accesses were performed.

In order to check the runtime_pm power state, we were using
pm_runtime_active(), but it turns out that it will become active only
once the runtime_resume hook has been executed.

This prevents us from doing any WARN-free register access in our
runtime_resume() implementation, while this is valid.

Let's switch to pm_runtime_status_suspended() instead.

Fixes: 14e193b95604 ("drm/vc4: hdmi: Warn if we access the controller while disabled")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 549cc63dab39..0198de96c7b2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -423,7 +423,7 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
-	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
 
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
@@ -453,7 +453,7 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 
 	lockdep_assert_held(&hdmi->hw_lock);
 
-	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
 
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
-- 
2.36.1

