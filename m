Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585DC3252DC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3476ECCA;
	Thu, 25 Feb 2021 15:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6016ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 745C7245;
 Thu, 25 Feb 2021 10:59:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Feb 2021 10:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vNuKIbp7BuPiX
 nLOOr76B0JicBZXr4Pja2u8aj47hkU=; b=H/aY/ihbkXT8PD4DPlkWIaxEtc5R2
 Gq7VWUzah0AcUuq8KUoq8SL47RxY4p9p4LgGKhMJQb7Bz8KbgLeZjVdBrVRMUcMM
 iPcbzz30F5IaQgTZFl+QOua+IfVpaqIaAgaXv0QxsoEruetiM8GurM559VYMcxdw
 Jycy73hGwJRyIu+h1hdWSajcuTv0vsjhd1O+QYdSTWGgYtaoUHkXzLSBhjY0FvDr
 9xEcRRS+dyRZz4ao4Jag2QsizyQrhcgea4c2JtjE8U96r6+nJQyeMI7cBuasJZWj
 snGqne1aeuuhwJpD8JW1+csA2j6Ya3mQP34gKZH8rTnu/QryTRrlFGQGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vNuKIbp7BuPiXnLOOr76B0JicBZXr4Pja2u8aj47hkU=; b=XrQz4Kt/
 Pdg/2o0qh4QC7qkYqjMTBncO6vaqtJKVsQ4M6wyk8qmvcenFST9kbMJE+C8LrtXz
 KMUjJoni4hK7WM/uLm4Vas6V/M4nuTOjsm1/lh1kWJ1rH5jQcFdG9if3ODkWTJB4
 W+cu+mGRlViXCx/pPst46XKOFcSI6XZZY1j7NR0BjWzLLdoGpN+/dU+iyKWPgvhc
 VXNKhPWiuQRerGzoJfvqMI4M00VbtTgcUWXBLyDOU9G8b/d061v2bjl6+JZkAMeF
 VMkXHMvOcE5KO6fCAjcigNWCOmzxiautJQuTyXqYyklzYXdeyhBfb7kT3c5WWZ5m
 UkwMsr0ir/M8Lw==
X-ME-Sender: <xms:W8k3YA9T7G-BUdpCoGDpvRljE_6PHwEZkZh7jZiQPuQDAflvbFO9Uw>
 <xme:W8k3YLzYh75f0HL5-J1AKJY9NmT9Yb_A1HwB-YCnrxOT713lyBkFhalYCk7iDwAog
 Afk3B1_uxHQ3NDsy5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W8k3YAoI_l35jwTIOAwW_RcxP_r-Ts_C1ghpZS4YS7cp68zDfnbTIQ>
 <xmx:W8k3YMrfnC7a1wiDFRm8-5hfJI2A-f6MADPjQGCyecQE-2qwExjU4w>
 <xmx:W8k3YAAu09fzW49ClMqUA0660Y_6hXPecYVS3hxclSm6E086EAEYPg>
 <xmx:W8k3YCvPVAWmRo92tYnWgy3K88GeS11mgYqlb9H-YrJkcKQVTiQkW-mnj3g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D48D81080066;
 Thu, 25 Feb 2021 10:59:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vc4: hdmi: Raise the maximum clock rate
Date: Thu, 25 Feb 2021 16:59:07 +0100
Message-Id: <20210225155909.1853812-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
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

Now that we have the infrastructure in place, we can raise the maximum
pixel rate we can reach for HDMI0 on the BCM2711.

HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
would need a clock faster than what we can provide to support the same
modes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1a6babb53cf4..27464add6468 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2177,7 +2177,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= 600000000,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
