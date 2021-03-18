Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C561234020B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684926E8B3;
	Thu, 18 Mar 2021 09:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8936E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id ACC33580F01;
 Thu, 18 Mar 2021 05:29:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pCNkZNgDE99UU
 qNQjGPkLdbzsDAfDQ3EdZgkBo5vLAs=; b=TXVYcdLrnbK5jc//ILJKA+zSskL/0
 JWJT05nYEWRRDV7IfwtyD6aqw1odVRrF0Od873Tp9OBETj2FY8MYiYGuFW8EvAxY
 jyJfZUVsRIDda4+2Jun/CKPM4+PrfW9g+xXH9Z/9RoTzpsyNj+ZRltzxFqpkxr2O
 pV1+BHOH2RTRcQqBx5oDpQundEsfFunnIeka0/KWEgEbhMf6R4RmdWCTiibwXZmd
 +j0lMCH2/w93+qsTLM/IaQ3o9oC9Imb0o4bYqoqlaFZE6k+XiVkoGAAr98S3RYzE
 b82hWL1fhVU5IIM8Tqfa/SIOURh5LHYgsaCncipgqTemgsO5+n3ZLMHHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pCNkZNgDE99UUqNQjGPkLdbzsDAfDQ3EdZgkBo5vLAs=; b=LuqZKlWS
 w/makAKt7hEkoZlsu/1/y+g19Qj7jTxE09iH1TlX+fRzC9UaiRPQfMVcb8/VCDL/
 8T0BngZR3dKttKq83NsnfelvX4vyyOjOiP/UqVyhk2Sg9/i6fuW49kRjH6l8vawK
 STiUQ12sYUAm+pRCnbXYD5ADx6ddF3TbwFGyH6JXbAL/LXhNGYPnVlKZwPamN+rh
 BQPWQQHRwMx1hZ3FJtBm5DD2kvXvO7nod9+ViW1qZvS5HrQERmbX0kMhJ0uTYfW7
 sWhG9zg3aSZkLMDibzTANjaZ9lPxqvAXDlbufR+qDsBaycsIeYtJ5/wSEu2ZCOVn
 vCm/THONjEyzPw==
X-ME-Sender: <xms:ch1TYI2GCfY4U2XWPqdy6l3Te_aEWOuTuAQCkDSKCFnkSkhMGIJLIg>
 <xme:ch1TYDEU4-it6h9y6A3KlLPAcqfA-QVVB3g6aT8yizv9T1wnIqjIMBxwkiHqq6ogN
 YGp81CPB9I3u4kz3rc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ch1TYA73Xz871DGH31E0e7hyM5X_52wA3TO54iB5URxdIQHNC05sgQ>
 <xmx:ch1TYB0xnl2B6jFPEf_RV_bg9HBtvFDu8EAzdfFyp8AyJK3n9-pFPA>
 <xmx:ch1TYLG7eqXucRt3BFWs429Nbrxid2RoJxv5t_Jtj0_YhHJ1EF3iwA>
 <xmx:ch1TYCDTxT_MgLv1sClgmeOUE9wKYxABJeksIY1ZqsL7kr7959Rhww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3EB231080054;
 Thu, 18 Mar 2021 05:29:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/5] drm/vc4: hvs: Make the HVS bind first
Date: Thu, 18 Mar 2021 10:29:13 +0100
Message-Id: <20210318092917.831995-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>
References: <20210318092917.831995-1-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to have the HVS binding before the HDMI controllers so that
we can check whether the firmware allows to run in 4kp60. Reorder a bit
the component list, and document the current constraints we're aware of.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 556ad0f02a0d..0310590ee66e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -303,12 +303,21 @@ static const struct component_master_ops vc4_drm_ops = {
 	.unbind = vc4_drm_unbind,
 };
 
+/*
+ * This list determines the binding order of our components, and we have
+ * a few constraints:
+ *   - The TXP driver needs to be bound before the PixelValves (CRTC)
+ *     but after the HVS to set the possible_crtc field properly
+ *   - The HDMI driver needs to be bound after the HVS so that we can
+ *     lookup the HVS maximum core clock rate and figure out if we
+ *     support 4kp60 or not.
+ */
 static struct platform_driver *const component_drivers[] = {
+	&vc4_hvs_driver,
 	&vc4_hdmi_driver,
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
-	&vc4_hvs_driver,
 	&vc4_txp_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
