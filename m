Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBC495135
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039310E468;
	Thu, 20 Jan 2022 15:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D4410E439
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 197042B00152;
 Thu, 20 Jan 2022 10:16:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=FWsfNkfi83qkxWGRhFTTtY49iqmvHH
 n4IVHepQVSQiw=; b=SKkfR8Ge+4lXxUHluuJcLfh6msoLR9eb8HCcErLnpFDoqI
 5nsyW89x2dieU8y9LVruckEt0P+gwnLp+/Mb5CSqppUTZIdy/Yx+nsrRs6f70UMQ
 KQBIZucAEgkbAMjfukAJ4O5Obc/fRaKOo6w+31g6IN0fZyC1Drt15n+z0hPk6474
 F5W2k5KXMxRKMtq5wPGBJXz5K4xMhTB64duBJJUrUSYLTVWh0UMa0rHnhUbaw1nz
 eiujmLsRxGRvb1agBQYFGBMvX73QIGlYoWKhg0zf8NTx1mPFnibhzjnI6/vgrtnh
 mnjA8A2Bl2iOB0DKPM3sKDQNY0lZ4gnm6++Xq8wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FWsfNk
 fi83qkxWGRhFTTtY49iqmvHHn4IVHepQVSQiw=; b=EdzkzQ9wgphI1ZYsHGoFFw
 iE6ViMG6augYZznBpZGlGG8vS+brbitPAN2yVzNs7jBNakx4wjxCj5hmJUKCT0bp
 7Qg579MghiH1hTSchJRVWS8lZ3HrV2piRjSifDEIIoOQda3JkcUl0yc0E6hv/mKw
 fR6OY5rK/6jdemaTsOgsc3E4qXKw0pltAG9p1nIxG+WcQXhFV7B7O6LMm4Q9X0Pp
 SEVOKeeUTSnGiToi0prhP/4KfGvZT2kfwc5h4nBbQQ3XRZlUpIAg6ikDwOe5ILsR
 iZOwePZFjDligiRqamMOqNgk4mjm42IFLseC7twPsPl5Rnhg1pFo96OgAAppgqHw
 ==
X-ME-Sender: <xms:6HzpYV_3EqF4oWo1uT1JA3xXyL1zYOyES0uzINjt6IIPrjIJ1MgqAg>
 <xme:6HzpYZvJ3FTZhjAEr0b_NQkIbokP9xtGS8S_p3lUiBZ8YeksgGzi5gBlRNW4elxnc
 YEJwLt4KvDj38RpF-I>
X-ME-Received: <xmr:6HzpYTBxZ7sH6A606kq4pxc0neK8HoeQooWviELFIpkFQhc73y8rIk4QwIl_43HkQpcu3s3yIg0hFF7UQ9U-WjrBeY9pCQk1MKYqVsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6HzpYZe93_fdweQVG5pBwGZ_L2-rS8GATs_OBTmD7j393uUR-cTW8A>
 <xmx:6HzpYaMnEYR_z3J-bFpAM0t5BqXhqSnlf1F2p8u-tUSRyrLD2gY5mA>
 <xmx:6HzpYbnuFAr7kh2RSk7Qkc1tM0LEy6ItOu3iBY8zOW1yIapA1zsBPQ>
 <xmx:6XzpYbHo7FBxySNxI8csR2lbmYuhz2xJiSn-_TZlzhcWmbWLAuC72h49lWY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 07/16] drm/vc4: hdmi: Move XBAR setup to csc_setup
Date: Thu, 20 Jan 2022 16:16:16 +0100
Message-Id: <20220120151625.594595-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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

On the BCM2711, the HDMI_VEC_INTERFACE_XBAR register configuration
depends on whether we're using an RGB or YUV output. Let's move that
configuration to the CSC setup.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47ff4507f017..0f8b1e907fae 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -785,6 +785,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
+	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
+
 	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
@@ -899,7 +901,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
 		   (vsync_pos ? VC5_HDMI_HORZA_VPOS : 0) |
 		   (hsync_pos ? VC5_HDMI_HORZA_HPOS : 0) |
-- 
2.34.1

