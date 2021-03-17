Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DA33F41D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9066E821;
	Wed, 17 Mar 2021 15:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698996E834
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D297A580E69;
 Wed, 17 Mar 2021 11:44:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Mar 2021 11:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bCylkNKOjAzb9
 7fhw/unbg3MER6CJwnpXmsxKs5uWqk=; b=UreooG42uZyuke626zsCqRw9XGEOq
 Zcl77nbbIY6tDzqpiugCYAYcIP29ohBkRrmsXffsOsAY7JfvM2JDBKnRz6fphVUx
 tz04pblodnJw8QVylxhc71WnZj5OE7ddLGvX5AsPgcsLFBVNmb/xuCsRwf+8Aaje
 nEphbHsJgs7Bd1v2MOHVsWSxRnI14aLKwp/8ZJz501iiWbHNgBRP0NG50yvq7SQR
 IjKFiUefzfFwYK2VC0WMJ0iCzSdghZ+Sqmoglq3T50r71ZP2XKt7W46ZSXMpRClN
 HBIZDtSmgMUV9+0frLaxvPfdej5qBFX5H3DK8zJhpL5fP1AuOenZXVKYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bCylkNKOjAzb97fhw/unbg3MER6CJwnpXmsxKs5uWqk=; b=bgBqwO47
 b0oa1kX6ySPwe9xyByb/YO/V3rvEu8kEPfykjB7U7KpzNNX6ssTNKpij5czM+kyY
 cKX3BMQfPS57QAWKuGA8Ut8zenlql8x5MyufycGykS+1IzJD9LHpYK29iM2JISiR
 YnC6EoLnXwYYI+9iCs99ezJBd5xJb37DhOOHYLmHclJryGrd0kPQ19sA7+QDfyoU
 TTKtT26Ma1RO6DFv8wv3PEJG2dA7uR8X8yW5hdHQvdEkxoNbFdcQNVWPKRK/cOcQ
 SXxm1I+8XdZScdBBhzi4bqmPuK5HGbz+HulzmrCe+ioijKD7d+ArqmV3CJ4D77qg
 v56AEl7O8JvtCA==
X-ME-Sender: <xms:ziNSYLwGaWuv6TiIaVwYAh8KW2r1jSDWvdV1Y0DwH-H5vydN6f_SUQ>
 <xme:ziNSYM54qTDJ64rWKiJvbIXQt5ahHMsTIvCsxm2sBUo2RaqJlLkKC633DpnhIGngz
 9kU6EynGZGtnc0bbe0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ziNSYFV7a66jSrVw8R7wBBPwa6_H7_9PLXGZsu3QHBaMu7oMckvmoA>
 <xmx:ziNSYI3pa3HCAzVC8zPcvuxlVQJXSjOfPbotYv5lY9uoOKQdcfwmAg>
 <xmx:ziNSYK2ijbul6DNL8SQgBqwBzQoxif79smeDJ25vC65VjVAOwVbtTA>
 <xmx:ziNSYHbqUPBRi-D3NQFvchNIDU_ojY8OjStpQz5B8h03T712uIAUAA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 86E7724005E;
 Wed, 17 Mar 2021 11:44:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 12/18] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
Date: Wed, 17 Mar 2021 16:43:46 +0100
Message-Id: <20210317154352.732095-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On BCM2711, the HDMI_CSC_CTL register value has been hardcoded to an
opaque value. Let's replace it with properly defined values.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9ba555d24187..b0e0cb533944 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -528,12 +528,11 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
-	u32 csc_ctl;
+	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
+							       VC5_MT_CP_CSC_CTL_MODE);
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 
-	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
-
 	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index be2c32a519b3..9d7c034c8b4f 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -744,6 +744,9 @@
 # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
 # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
 
+# define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
+# define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
+
 # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
 
 /* HVS display list information. */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
