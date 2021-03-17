Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7833F41B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6676E811;
	Wed, 17 Mar 2021 15:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0B6E811
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2C18B580E66;
 Wed, 17 Mar 2021 11:44:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Mar 2021 11:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+1k/8p4x5hs7Z
 hZT4g0GsTgyJkL0lg89hWiffGF5Zzg=; b=PHpPSj30yEPaOFKfAKvRh2I946iWz
 oCm3Jdk5hqQn4Wub1QdRzdfj6cd/TWkJqJm4XnXIt7tE5748nHTEFFmOpsjTv500
 cSj4/BimzaXq/nEmlN2qoC5HcAWM9/U9WCbouAGo5fK4IWx8uwfzo5IoWW/dHjU0
 uqU+10kLYHrOkYgk26bJSuu3RlZRmhVGF4G8g3t81o0YKo9CEjZktPi2V8TXyDHb
 xADQbo4NYKOY3EzuGXbAJxQo8ZNwl9cm0Fe+xEwoQ0g4TD6yB7nOySyPfAvcSUc5
 e0/8tnAPM6gN2qxauyJDwILj9qd9bKHk8tULRupCXtf/t3mwXYukUKe0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+1k/8p4x5hs7ZhZT4g0GsTgyJkL0lg89hWiffGF5Zzg=; b=fZnVuNxc
 gwsuOLZwTHQr9XzCggRAaMFp6lmxxo3cjEGmlmnRyAz8pTozros3cBeViW4ZnnHt
 eBhMr0u97nOmhurew0XhHLCMraxbwMqNsfj1oGNel1jPEZBMTjp1HM6DkWv7Xj8z
 BkEPInhPna5rOiEu2st6HnqwC5d24TVaznEw4eRGaLljghp9IJW5+Au7iKoQeqJi
 R4YpL/HF9+Xh2rjuA8Eh8TcP9yujm2dHd53Fmrpj/IOU1YY8AuZSSP00SoXgKdPQ
 e+MJZMguQo6zsI9f4ZOck1k17BReBekMCrhc0PMo6PSEB+FNBjdOm+Kf0ZdK6Tvp
 mbq++EF/TSTE8g==
X-ME-Sender: <xms:zSNSYHWCUTzRpY0gsubQLI_Q2OsCIiXW6AjScAnvYD2KSZMUDbli_A>
 <xme:zSNSYEhfUrHpXSgIEc96evI8yHJjPggZuzElhUzvMW8nUZ0nku46OQRKIKxVQIQUK
 hbUyRbEBGNnRU8Slvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zSNSYHpxjUk3fJOz82HQWCLq-sHKgN344w4OiY2GkalYNj_jVp2-Gw>
 <xmx:zSNSYCGjRt_Vkzj6tmahklvjAV3BAgyOxHDX_1JNz5PbT5_Ekeqa_A>
 <xmx:zSNSYE4XFlEObMPvw3ylQVr0EcERpODFDGHEBYac0p85QhOy7zEPIw>
 <xmx:zSNSYC_6VLZv1eumPibZqJrhDsa8-iN347j_8crnBfebA8VcprM-eQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1BCD24005D;
 Wed, 17 Mar 2021 11:44:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 11/18] drm/vc4: hdmi: Move XBAR setup to csc_setup
Date: Wed, 17 Mar 2021 16:43:45 +0100
Message-Id: <20210317154352.732095-12-maxime@cerno.tech>
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

On the BCM2711, the HDMI_VEC_INTERFACE_XBAR register configuration
depends on whether we're using an RGB or YUV output. Let's move that
configuration to the CSC setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4ce0aea6ba17..9ba555d24187 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -530,6 +530,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 {
 	u32 csc_ctl;
 
+	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
+
 	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
 
 	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
@@ -636,7 +638,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	bool gcp_en;
 	u32 reg;
 
-	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
 		   (vsync_pos ? VC5_HDMI_HORZA_VPOS : 0) |
 		   (hsync_pos ? VC5_HDMI_HORZA_HPOS : 0) |
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
