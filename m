Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180D448D96E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4704510E302;
	Thu, 13 Jan 2022 14:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889A10E3B6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6F675807FA;
 Thu, 13 Jan 2022 09:07:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 Jan 2022 09:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FWsfNkfi83qkx
 WGRhFTTtY49iqmvHHn4IVHepQVSQiw=; b=TFw8q6gwKmWhARlOs4h5eU+0aRVjj
 RQT2pQlWRBu9b4lHN/4hbZDMRbdgtUlmFds890UdmusB62Ukb4Qmjdgf2mork49r
 RuahuP5ihG3EyjQjeQMpcgSGTOMHV3KQ/7IXmVrnXKE+Dz8txEWiItnu+xVWdCv1
 E1zVlgCDb67El8wFyE8vkjXYgkJzRBnbF0p2LBidBLuTb5BrEImc2Q6uCK1qQlWa
 mmxDO+oc2TUE3rL9BaZzIYDSeeu/4bEZsqN2jlGbJekNztSrndly2JV3v5VXjJvl
 r5qsi7orDt3q8XyJhlX1pJy4M2ymRgrwkkd8uEnLCf1FdTXSQYMPTLY8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FWsfNkfi83qkxWGRhFTTtY49iqmvHHn4IVHepQVSQiw=; b=nLkISyFz
 wnQk4IMcGuhao+AcSHd0S4Vbztbl8Iqs/7Mxy2ah0SdC4sdz55T7C6y/j1peU7Wy
 zFjbH9BU39Du2ncPup1hNiZ5KHH+1DUTtewUp+Kn2JW749wcoXkRAJWv5nmQ+z34
 UToK2nlkGZPp/nWfG2calaUZEA0JSZ/7ciGFFZICEXX+2/ZdPASjiRz+iv7B00vC
 X5q6nBUGEn3fQ8PuLZ+e0gjRUzaF1hJ3nEbwHnw9vS6zR6WTMyaDXhmPPcce4Jmg
 AcYs9JYv3BE9GKmV1mOBbkDzh6zhKr8NXAXCA2uvsialGR+2Nq2L755gDKweVzNW
 Pm9gWMf/tB+xPw==
X-ME-Sender: <xms:LDLgYQPCXrZVQ801k9NZVEmviEHHDoIX4jm6WV9rs2r14hHDi8KkUQ>
 <xme:LDLgYW9pYYV1japR4LBxZNYzBaTit4NMG9-GBAH5Qvi5dV8ht6EOyjIVOn53508mr
 ySuzb04ushoC2ZXRGA>
X-ME-Received: <xmr:LDLgYXT257oml45Gr1BU7unO3uKy1u8gSAI01TIwMFiXhYUfEFlTlUHIsMA8ZrSIiMNYne2pJaGnCNw3wlCn4YWPxE4u1vW2kqYD5u4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LDLgYYuTAwx-rpCzzGVCzdjepKMkja2pB6yR_LlNsAQiYfqDKxmiIQ>
 <xmx:LDLgYYd4fB7XaQ5DLBoZSvjIpJmdDb7bcth1o-NJMsdY3P8kMiMeSQ>
 <xmx:LDLgYc03o364HnkgTZo2xn8RKVLvxK1I33glr4daokpYntqkAKWe3w>
 <xmx:LDLgYZU6HoQE61CYwWPOO1E8eI2Cq7dT3RyqXEp4fAzwcNrhpkPeAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 07/16] drm/vc4: hdmi: Move XBAR setup to csc_setup
Date: Thu, 13 Jan 2022 15:07:11 +0100
Message-Id: <20220113140720.1678907-8-maxime@cerno.tech>
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

