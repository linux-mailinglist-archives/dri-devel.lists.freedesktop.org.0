Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB34BD8E1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD24010EF5A;
	Mon, 21 Feb 2022 10:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F1810E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1B26580263;
 Mon, 21 Feb 2022 05:00:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 05:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=wo7FPeVWcNwQpaAIKec1keSAY7TMIw
 rBbsYQO8S+w+A=; b=B8FgR3sCJLWpKMtN0zAS+wpJW16KR5RFXlIZF13uiyprbG
 gktvFBUgER6uhSV32IFptkArPlQQGCeZroHs7DWpZQwFp9b61ekxXY3AzvtXA/Vt
 S3qh50NfX0SagN+EoSrAnN8YLbphrkPalYQco8MTtojaUf8WAFLVLMBLTIvRnCQJ
 rZq6Evn3U1wj6oalunOXcnTFX2EeMVxNSdRDy2hkQxY9HW9zs/f4QwmEsV8BeEPZ
 uLEOoyaPuq06XQAEzISMNLlTbejilOFPc/i6faWnF5Vcu+jrd0Vz4y/O2SmZezH6
 6/ww7ra47rlQJRewPuh2yEpljX813gIgTC/tEB9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wo7FPe
 VWcNwQpaAIKec1keSAY7TMIwrBbsYQO8S+w+A=; b=CsnfciTxo0Le1GCB7XPs9d
 yX2Fs0vYWJc0yDjpcF4w76mbNUUydjqWmOgLRlqDTxBWNFOUaqPsbWPsWRQtZTGv
 5Utm6Bs/mdtC+3rQMkfxGJnMrXlARNUSoIMJCbI8IRM16FaZ2v248/ZXwkTnXzJi
 gU+8on1nCMEtR82FLrBjooHLE1KJI3psrQQ2owIyFtIF5y+cbuFcf5RbNiD9AFNQ
 vLRQ8wriKgELvaxpQrDnoTMJAXYG43WkkH4JMdexkusgQS93b8VRZ1sHSoJmhxqh
 2K+56acy5rfomJE8c2n5Sfx0hERsMaInI/sCvDpTZnzWFwAnd2zeyLNxV9P3YEaQ
 ==
X-ME-Sender: <xms:q2ITYhCB_RazPueYu_nom_CzrAfiDHWEvbZ_Zen1_zTwJI4RI-TMHw>
 <xme:q2ITYvhvmq7k-TF05d5oc2RIJyca7DfBZgmvdrtUTtiBvr7A_g0QN6BXBhqgLCGOL
 WYRFFZS6XEEz1tiVug>
X-ME-Received: <xmr:q2ITYsnUWljuu2bJHkHK9lWw-RiakSqp_JNmogFEhTKoP7fcU4ZZ_Zco8nS_ATNavsRPE2IZW6_D3nrkpRU6TcFfQLDj8j5L_eVOzWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q2ITYrybCPaWFnATVRWhiN2o9N_kkpY288rs7GiLu1f_bgvMyQbrVA>
 <xmx:q2ITYmT7KFNLLhdjCcvZErXZON2-n2R2C5ZduVNJ26VAmk_GzY_r7Q>
 <xmx:q2ITYuZ9ZTNDu8MB3MAH26dDuiel93Ejj-AdISvWsvEmVstu8Uj2EA>
 <xmx:q2ITYrhGd0ksawYEwoCM6RxP8KCjk8l8APtc2vbzW44fxGnEse_kbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:00:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 21/22] drm/imx: ipuv3-plane: Remove redundant color
 encoding and range initialisation
Date: Mon, 21 Feb 2022 10:59:17 +0100
Message-Id: <20220221095918.18763-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The imx KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in ipu_plane_state_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 414bdf08d0b0..36b32e8806e3 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -308,11 +308,8 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	ipu_state = kzalloc(sizeof(*ipu_state), GFP_KERNEL);
 
-	if (ipu_state) {
+	if (ipu_state)
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
-		ipu_state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
-		ipu_state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.35.1

