Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFC48D970
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81210E3B6;
	Thu, 13 Jan 2022 14:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDFE10E445
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E248D5807FC;
 Thu, 13 Jan 2022 09:07:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Jan 2022 09:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4s8GiS9ekkyxs
 tdX+49TQvYtxHUu1Vc7OsYplQb9SPE=; b=RapJ9qNWDw7EgSZptnCsMaXiLaFbX
 3M6WspseKjOcZeNxh39pJFKmI3dneyHZdMckcSjdUHWG6LU3AHGptzy+OnT8PB0T
 rb6GZ70mzmquTUpAj6/eaRUSivmVwm0ZY1mD5nCf/FtgrJ0J0r+UPY9b0ke7gNUw
 st3SgkplQMR++WfOxun/NCDpeb+QxevHfgChd7e5PbQH5d7DD7acUfMMJV4ZeTAG
 lBZ1kBY6dvLGe/B/gLLIydOtOiRf2YMUpzQZS4v4lffPTouaetKdONjp1RYMoTBI
 dAvFIAnXJ6SnPsw7RP0Rf2ZbG2p/wl7b8dR9Lto84g0e65kjPuwlu3Zhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4s8GiS9ekkyxstdX+49TQvYtxHUu1Vc7OsYplQb9SPE=; b=WyINfeSU
 bnYzVP6ojjj4RuqZyrm8fQg9CbB3AzN25oUSiSoDAzS6GX91J7iUNIKGQwNn1X5U
 +LLtLekYzkQkYBpRKvGpsM63xpZrhTtZBMQU9W7qAU5H8oXNc90Gg6xOwF998T7A
 q3vkv66Z5rvOF21GXqEzsA5ebSq7W/8k9qjJeMXI5oEBl5M1Omu0cWvR9gDRxU0u
 9hs+raLRVGYR249s6/F9+Oa2q4zHEveSkJZKeTPXaKqXl4z7iWvoDks5tZw8Bun3
 OAhW7jboVNbF/2MJq4IJs1tVkJrXrBxDAB7dwmyosPQlJoj8jI4MdXt3oaGG0snn
 LSZAC7TFHgNzDw==
X-ME-Sender: <xms:LjLgYQpucpq1ctKTMbR9qmmybDIO8xubDqW781uDh0C2AKgOcMm66Q>
 <xme:LjLgYWryw_YrhuxpwVqvIauBC7kT75hjJ1OELrQGqrebOHkZzvXmGobtG579z3wND
 dXL1mgpqBRueLgkPeY>
X-ME-Received: <xmr:LjLgYVPLUXrVSdhkU0cDIq5qxcQmBHSV6X4npmOhjUj39fgXId6Xy8TglR7am6s-UhvJx1xDKqtSsiwFLKr-zf0_yIdHyLZjIy24TAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LjLgYX6Q50AM3QcxobZl8U3M-ZFoN25I6B8zg7jgvvM2Q6TVmgLFlA>
 <xmx:LjLgYf591WL9vvlWdWj5bJ3gRg7SW0kpdNlqXbqNynovM5hymG0W7Q>
 <xmx:LjLgYXh1J8_s3bXgCYhVChS-sr-eh0i11jXjIcP-WuiG8UbeX4uBDw>
 <xmx:LjLgYcyLr6qWMnQ1WJFWnwT80LqlyNbSEnpAvGZLsWU3cwiWhgdUsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 08/16] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
Date: Thu, 13 Jan 2022 15:07:12 +0100
Message-Id: <20220113140720.1678907-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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
index 7538b84a6dca..33410718089e 100644
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
2.34.1

