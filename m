Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60C25D214
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BF66EAD0;
	Fri,  4 Sep 2020 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129406E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DE047C57;
 Thu,  3 Sep 2020 04:03:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7vN83IkzKqKuL
 B+UmBGANLgXHhL4NTtq4vWWcUUXPgo=; b=Zw1k70G9XzUYpg+iqo6gYGpjwnXfb
 DY3USD/PifaNXn5q1BTTqGZNXL42K67poI8y3m9/Axu0RyxYSkwiWXw/QZSu+8qH
 rStMJGI3kGUbLppOpzCobuLKuI7G/oNjJQ2u5PeG391WrE4W6YUOlH1NTnF/XWdG
 EqIA4JXeApb/h4Vg6w8mO1zQsofa+8HS0g3aNb3hPcVq48fVedVUEDziRgvwNTlX
 8UYAoXyjVnvDCYK+Vap9NiYfTqRpyFW1+0yIE59MTmfBYB8xNOo+n6o98JtZVtym
 FcnaBeLnWZLBwuuSAOVrbwbp2Gu2iCKw79HP8P7G8nyjZaoMuCLFyf53w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7vN83IkzKqKuLB+UmBGANLgXHhL4NTtq4vWWcUUXPgo=; b=rMpV/l23
 5HkhX3X66xP7YhKVVozsvetPz61hGZnaTr5kr8u+YvV40ianuqECodvFnyk7ngbN
 fXHfp6klN81GlXV0OR9sZXB/ICOYDhpH7p7CgvFxo7m/JXI/UZrbHxhs047moxco
 PckCKBkwhr5t4d51O1w/I55PDRRvBWxswszcNbmhfkHHKtem5DdPPYu50Ej+yEse
 FEd3/wmIkONSZ6Lg4OaxClvHI8iwTqDHbxFmyYSITPPdEw/UCtjjQYZZwLDCI1H3
 H6WvHaMC3g9mlxuHKE6xxmCt3piXYi/XllGtvwtCMQSzOFUvZ9R9QZWy9YVj6ka6
 D5OBh2X3nwAQKw==
X-ME-Sender: <xms:SaNQX02IDKASEPvfaTBM-HlZ2UZZf1RT2u27ua8KTwdoPKCQnP7gSw>
 <xme:SaNQX_FSvRytXLPaPl2xFIJz75NE1sBXXWSGYsBSGkJ7yvd0_yMSIsmPfUas0sXea
 MK7p_2mYHaI7a039xM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehke
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SaNQX84urcDBKPboIkr4FNJhlOE8ukyNrSw2PZn65ZA_FQK2_9CU-Q>
 <xmx:SaNQX91tlbCHX6AACYS8DHyKbQhKy_GDY6eXYfe7LD3L8_GmBTemwA>
 <xmx:SaNQX3EZVJrmW7QNQqOzhI5A-E-NvS8ao4peqwaQp-08fLMarigfiQ>
 <xmx:SaNQX-_Dy53nL2ds9gKiGaIFFgKe78lW59t6giAKxEfgJaWRbGbjOf9Ktcw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 171CA328005A;
 Thu,  3 Sep 2020 04:03:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 62/80] drm/vc4: hdmi: Rename drm_encoder pointer in
 mode_valid
Date: Thu,  3 Sep 2020 10:01:34 +0200
Message-Id: <7fbabab03992efe4a3a3640ac5ee2bb49b1c7338.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid hook on the encoder uses a pointer to a drm_encoder called
crtc, which is pretty confusing. Let's rename it to encoder to make it
clear what it is.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e39c6fcf4c12..1e6c0e26d186 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -556,7 +556,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 }
 
 static enum drm_mode_status
-vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
+vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	/*
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
