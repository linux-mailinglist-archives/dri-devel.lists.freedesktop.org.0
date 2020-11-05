Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635C2A918C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54BD6EE22;
	Fri,  6 Nov 2020 08:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427896ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AC89E580350;
 Thu,  5 Nov 2020 08:57:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cOWmP9FJWkEOA
 dco93J1f7n9mzcuemZoO8pu8QY6wdg=; b=rL/LG7tUMk1VvkAdXHq+93pkAiXjX
 rvTLlk+dD0nfJRFrONhJCMA17I2mFSYPPNBaKL2ymNnU27OKuN3IhUJu4mjR083l
 XJwnw7xRRxhHQHY8AMCjOHCdSb5AqnVcU1UH3hMZLXiutQ3Os85wEvs9ISm9b8rG
 +sJsTczbC0iuZs5TbXAi51gvqGRXuI/NsVv7cbE+Na/1a6fSJBVwLqFz7AvyQv6p
 DYF9VmbR68Ql/NzVPPD+ADbdPQyuxGeKfC2uVG4nllJGTwDrTq3dgJhoDicSGZle
 HAaZB+frt5wmH9YjpjmZPoFSelowEtGwon4jzcgdHML2hRsDA3her1G+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cOWmP9FJWkEOAdco93J1f7n9mzcuemZoO8pu8QY6wdg=; b=D8DZKsCQ
 xbT458BDDSwfGmaCA/4uZsNW1rch6PdjXhzdv+xyHDM7GdSqZZswOvVBidtLJLHy
 ZMGQC7Sfa1zyKuvzwkOeXQNwbH4Juw1LBpyKolD+6fnqIDuCBkMCDW/M+ToCpkIl
 3JFJ2XYrRiTORPIlyNXzZh4KhkHjuCgmD0FSvDAVSwhOP3szoc6HrygZhbdVx2hA
 GYjWjdnyxxnnlrle9B/TLAjDfweI3G79ZIvun3tVPA6PfPqppQYViDOIoWQKoFfS
 NDqBorYgGsqujU72G4d7Diib5Y58ZZekdDyqrRHfK9ZYFlHnO8AbX58uZyNLRs/Q
 JkzeVpEWeKpU2g==
X-ME-Sender: <xms:rwSkX2fmi0uT3-ZfHsikAElYkQ2AfuLfi5IKXMtsNVYWXOIfEfMkZw>
 <xme:rwSkXwPAe9xIv-iaF-D2g11Qpbnvzhx8FTrFFmjrnF1lAf_yRpr3rtN-NqWj95704
 NmMZBXRVjy4UVBvsT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rwSkX3jLV6OtF7uL_Vs5-pYukPv41bNEW9TK8meU2uwRb6BzNLYCjA>
 <xmx:rwSkXz_eslTHJ5BqL0ciWv65w5CEdL8keLePn9yc6HYc-cxpdyh66A>
 <xmx:rwSkXyv_LITqtcGzG_2Sk3Sz2yZRNq_k7rKLZblSgVQHYhXgsA95NA>
 <xmx:rwSkX-Pd4hs3WIwTmbhoF0UeMg649YSk3IFmZy0kO-N6Us3XDSkeZw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26DF33060065;
 Thu,  5 Nov 2020 08:57:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 3/7] drm/vc4: kms: Rename NUM_CHANNELS
Date: Thu,  5 Nov 2020 14:56:52 +0100
Message-Id: <20201105135656.383350-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105135656.383350-1-maxime@cerno.tech>
References: <20201105135656.383350-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NUM_CHANNELS define has a pretty generic name and was right before the
function using it. Let's move to something that makes the hardware-specific
nature more obvious, and to a more appropriate place.

Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 4b558ccb18fe..ad69c70f66a2 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -24,6 +24,8 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
+#define HVS_NUM_CHANNELS 3
+
 struct vc4_ctm_state {
 	struct drm_private_state base;
 	struct drm_color_ctm *ctm;
@@ -660,12 +662,10 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
-#define NUM_CHANNELS 3
-
 static int
 vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
+	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i, ret;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
