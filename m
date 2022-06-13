Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E25485DB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F910E85D;
	Mon, 13 Jun 2022 14:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D094710E84F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8EFDD320090B;
 Mon, 13 Jun 2022 10:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131772; x=1655218172; bh=iO
 t3Oa3UXrMZz0PJIIBRXAPnmhF0MgeLZwnDxUdg0ak=; b=ZOTonDkoyD7rTX7D4F
 kvc3angI0xc+wafi6yZ+1XJdZIZxD1wRcH6k0vxV0BTPmTvjtBXDxk+GEQqK7mqp
 SEmTxLGTRd0KNQC+qEG5lC7+nTJLE+5LLJY28E/+5EJ3ayOZ49yAcpoAaFwmbi3f
 LHP3aGdjTowRTwbTjHoHYSdyViUbDlGOdA034uG5ThV9z4WD31+iukrfnohhTdoC
 81WZ69bEKtUQTFGKjfi+r+STchpTtNLb8GGQMrjLdL4L0Jz+qRdYhm0tt/0xpslZ
 1he+3XFQWQ0Fe4AGeKubeHABTgdAg7zSUKoTa5uGwGluGNJJwYQqnAf20IXF3tTN
 tucg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131772; x=1655218172; bh=iOt3Oa3UXrMZz
 0PJIIBRXAPnmhF0MgeLZwnDxUdg0ak=; b=HgrsLw4KhIssP21BVQ4cHz6KrAKmO
 UzeZIyHO2Yh1GZFVDdV4x3mPxpnhKLNtoJM0kfkkHTAr2f4jszkzjO/Uy2YZ4Qpe
 R5qZeF1cC3Did7Y3TrVN+gGQHJ5OQMnbANcisjlFM/fyq53Oeya9bftU1z4bi0PU
 UvVcsLhH/bjx5hOP4XtGgMyQYS/cTA8/6vBDvNpTx/kSke+DFq2aPgjcqPK6Omsa
 2L/fXkD6MP7+ReuS/USV/k2NJ/BJXxs7eHjKNsh3cqp1+uwgMvZNDJUHySnv3+QQ
 fpd5FbQp/Pkbrd1Fzk1Hw1aMmThXBlAWZMx/MXc8Qofg2l0vIAnB9rvdw==
X-ME-Sender: <xms:e06nYmwOD0Y41FQxgFd0N_1Es858SRnmGo945tgeM50Em1xIR_riRg>
 <xme:e06nYiRI5JZdNyuO7fXUSD-7Pya9YFgU9aqs9pI3bhMEwbCj6ezEn1Gj5I_vpHS3_
 BvX2p-FVSTwtw5jrd4>
X-ME-Received: <xmr:e06nYoVnkwj2lI4U9BFBzCTxyvzXJNh00txG2pw8pVH_LBn7JZ8RaaBTRgBC5XvZaL1D_zJ_qhETTeHoJl9MZBQhpPrKrP5Qu_SefKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e06nYsj9Qx9j_mzUK0JJXSUwCfKh5yuqPtkmhvdiKUh7xPE1MPPMcA>
 <xmx:e06nYoCCmAbQVQ7tpYsWGuJRZrtKHkUEvmCOAnbjhfo9ihEMmzlhoQ>
 <xmx:e06nYtIsFaOCqm0O7M0ZscnqtNr-NvEyzUnBEdfSyb1Y8pSKeOwXeA>
 <xmx:fE6nYn6EjXdmn6TakDMt4CQe5yydg-I-fLIdYGei1RGdyZGDOnI-FQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 28/33] drm/vc4: hdmi: Add MISC_CONTROL register for vc4
Date: Mon, 13 Jun 2022 16:47:55 +0200
Message-Id: <20220613144800.326124-29-maxime@cerno.tech>
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

The MISC_CONTROL register allows configuration of pixel repetition
for pixel doubling in the HDMI block instead of PixelValve.
It was already defined for vc5, so add it for vc4.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 5a56761e75af..48db438550b1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -200,6 +200,7 @@ static const struct vc4_hdmi_register __maybe_unused vc4_hdmi_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB0, 0x00d0),
 	VC4_HDMI_REG(HDMI_VERTA1, 0x00d4),
 	VC4_HDMI_REG(HDMI_VERTB1, 0x00d8),
+	VC4_HDMI_REG(HDMI_MISC_CONTROL, 0x00e4),
 	VC4_HDMI_REG(HDMI_CEC_CNTRL_1, 0x00e8),
 	VC4_HDMI_REG(HDMI_CEC_CNTRL_2, 0x00ec),
 	VC4_HDMI_REG(HDMI_CEC_CNTRL_3, 0x00f0),
-- 
2.36.1

