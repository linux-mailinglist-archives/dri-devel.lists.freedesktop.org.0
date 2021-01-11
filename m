Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302B2F2983
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276656E098;
	Tue, 12 Jan 2021 07:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77A06E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C1B0580672;
 Mon, 11 Jan 2021 09:23:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=MVW46ptQtxJas
 yB/IqBe+aAprx8OKwk5DHwQk11fjH8=; b=QJ3JpCgUiHC5Gr2hwNBvbQsmlesoW
 An73yeZ7n9Kr1Hb8Dm7AN7h2aOQyZyYEqHPyC5axBRY6ajUiCtTq3/+or8rthk6v
 QuCqqHylQIq67ySMfD4wTpHEErDN+F+CcXFvKwtlYMKKxjXKmsofLl/BP3hFehWv
 OPaAGrZ8vYHB2recViyQUMChVPLcpQL4d7FYUgTLHfYeBNXZf4XdKDb0mJk2Onyp
 KWWDnE+KOCk9GlnH7CF3OaxaikvDP82k0KOD18VQ/fjLTqhKqe7UcrHuBcltKRYY
 NN2a8Vs/lTYFBx274XBONC0d6/hk/+GaVFbILVNn5G7XUt41SIqaW9wbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=MVW46ptQtxJasyB/IqBe+aAprx8OKwk5DHwQk11fjH8=; b=VL/7Bq3k
 K/sxVpQyazOrzzqThEDBPdwgfRFWZJQGcwBJbLhWGufoTMUQYqhpQvF7r7Kbx4HS
 eYq9RrcHhg8M29QC+6Hjv98ZFCKS1L4Ln2kw5Zn1DqjU23sNIdEVu8SJ7m9+b2QX
 jGdbsUdPFvEr6J7yLgjqlV7OTiQdCX9W+kOiTGSlChCx0EcsQpGer9Bgx1m9lUvh
 87xGowZI2HbVFLET8cK6I2KyURbYKf0rA6mM50d1+7tFeoHgcdwr5nnoF/y2BGpF
 euX2nrGn9DPwGq3nQ1y64JQVYii7zusXoazfDZpNezwLvbXijPqNDAD0/sO0o+xp
 oYJXuMtFyBamEA==
X-ME-Sender: <xms:VV_8X0Fx4y6ZJjvttfF67VClDMEEGyFToojnVva_uY7RR9RmRMc-4w>
 <xme:VV_8X9W6eVwMrHJH65O2iFRjgli94GZ5rj6XP_4A2IBTc_co5Bo3b_AmD5OIHXUin
 dPXOIJL2VfI5blWcuo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VV_8X-JCbKdMW04PDn6hOrtcuClyN3VOGJig3WoTGTD9Q3LWNEBeRw>
 <xmx:VV_8X2HyanaYvJuS668srybrqtzVp2--BAKnH9Qr8hHbORU7V_Jqkg>
 <xmx:VV_8X6Ud_EwfW4LGhwO9cQZcqk_SFoy0ffuTnTfCHuBO2-zFyd5g0g>
 <xmx:VV_8XzUVCtVF_6E5B02Z3ciqnSVPq1CZA3PewQ20DjUH9YvdTCWvpg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB40C24005A;
 Mon, 11 Jan 2021 09:23:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/15] drm/vc4: hdmi: Fix up CEC registers
Date: Mon, 11 Jan 2021 15:22:58 +0100
Message-Id: <20210111142309.193441-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

The commit 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout
abstraction") forgot one CEC register, and made a copy and paste mistake
for another one. Fix those mistakes.

Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 401863cb8c98..e1b58eac766f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -29,6 +29,7 @@ enum vc4_hdmi_field {
 	HDMI_CEC_CPU_MASK_SET,
 	HDMI_CEC_CPU_MASK_STATUS,
 	HDMI_CEC_CPU_STATUS,
+	HDMI_CEC_CPU_SET,
 
 	/*
 	 * Transmit data, first byte is low byte of the 32-bit reg.
@@ -199,9 +200,10 @@ static const struct vc4_hdmi_register __maybe_unused vc4_hdmi_fields[] = {
 	VC4_HDMI_REG(HDMI_TX_PHY_RESET_CTL, 0x02c0),
 	VC4_HDMI_REG(HDMI_TX_PHY_CTL_0, 0x02c4),
 	VC4_HDMI_REG(HDMI_CEC_CPU_STATUS, 0x0340),
+	VC4_HDMI_REG(HDMI_CEC_CPU_SET, 0x0344),
 	VC4_HDMI_REG(HDMI_CEC_CPU_CLEAR, 0x0348),
 	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_STATUS, 0x034c),
-	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x034c),
+	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x0350),
 	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_CLEAR, 0x0354),
 	VC4_HDMI_REG(HDMI_RAM_PACKET_START, 0x0400),
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
