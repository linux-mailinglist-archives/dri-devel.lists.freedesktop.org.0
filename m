Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ADF4675AF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F34F7337F;
	Fri,  3 Dec 2021 10:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBD773385
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E5EC858019A;
 Fri,  3 Dec 2021 05:54:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 03 Dec 2021 05:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eofzFVhjLGPKI
 lBpxuss7ejLHBp/T+YzglhuAb0FeCE=; b=Z04BUr41c+odIMKqgFjuYh+3HPZsw
 AntWBOTg2DpHnvcKB9I+aG7fRotPcOkHFpa9P0HcdYG7AFK0nvIrYnse46OGW+KD
 ipYSYyUjCiX1zTJtjiayYufLFJZChKSLtDw9AiW9PjCrxBc0zjdeMti/eiH+OOK1
 Hp+2tIBGO/tamIsGM20G/Lwhm8A9dU4pnGfe915yCCvjPocds2iZ5HYt7Fpx1/Ay
 WG6mz67A9RZ8sp5HaIxKEQnFlR7A56Mc5jLHA9MZuXyfgyYFON9LQyer+/AMX+V2
 QLlMExdUI55m8cx3CZ8Z5NihJ1t9hd/weBWbBePfR7B8gt4QXQDiE5ERQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=eofzFVhjLGPKIlBpxuss7ejLHBp/T+YzglhuAb0FeCE=; b=fzSoHfYC
 rrByvkclYifJiWycJE4BhBY625GHy6DIl9KYouQ6/Jk2yrshTGqyddEoOY3/WDsF
 LKR3itiWDDs3XKU4qObp05CTC1WHNvOi5vVu3LJsjx7e+K6NTES3vWGTN86qpxoW
 7S4E0o87o+TuDBB3nZrVy12cr5CIfaUL1eNja77sT+V32elshXpDBTSEKtiev242
 Hcaiue8YGZ9V7Oft/9ZC2+OsWl6pw1EjiClJFhWsoABITrEHnSS6L8TxGgM72kWU
 afjKao6zmVmQsmi/Tcz98nxkgbneMfwTge6dtQ85a2T6gVfJvg8x00BkroBDM9He
 i5SMXHGNOcBJJg==
X-ME-Sender: <xms:afepYV8fmKtMDLE_i8F_VUuO_JXLhvBH7OqVEd1zFhTr7uMseDw-1w>
 <xme:afepYZvRflHoW8Y4DcPlCIY_sEDdQk6ckwCr2QbRjPOgrU4Yu0t7Ik6a1CowgMgXC
 HvH4_dG7ZSiEeOTJd8>
X-ME-Received: <xmr:afepYTDZlD9YRVJwD2e0WThevo9H0QbmrcmH7jgdg8T0COb7XTjEcAccqXsPiAvg_EWY7pBOdD0QG6fntEJU9a2lrRweWrsBRrWhhLJXIxCn4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:afepYZcFperCxYb1Xx9kjcqxdMwjyHR3QXG3OlucxOt6u_uga0uO8Q>
 <xmx:afepYaPPwIC6WogIxOilM1DFy-9cR5eMEZajAN2YGfvLJZWYCE3HXA>
 <xmx:afepYbl2z1HHNXohRC5UkXgfGMeBBwfV9dd7Xv3cQKiM5og1lI-Q8Q>
 <xmx:afepYRq6ciOYTxlPPZoB5f4xjrzNWns_9QnAMIsF_gYgaD2-zIQrsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/11] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
Date: Fri,  3 Dec 2021 11:54:14 +0100
Message-Id: <20211203105420.573494-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On BCM2711, the HDMI_CSC_CTL register value has been hardcoded to an
opaque value. Let's replace it with properly defined values.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0f8b1e907fae..682c3c907cbe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -779,9 +779,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
-	u32 csc_ctl;
-
-	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
+	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
+							       VC5_MT_CP_CSC_CTL_MODE);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 489f921ef44d..952f2aad0785 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -774,6 +774,9 @@ enum {
 # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
 # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
 
+# define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
+# define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
+
 # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
 
 /* HVS display list information. */
-- 
2.33.1

