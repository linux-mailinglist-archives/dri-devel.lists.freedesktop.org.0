Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD625D1E3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746306EAA2;
	Fri,  4 Sep 2020 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8ED6E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BC536C41;
 Thu,  3 Sep 2020 04:02:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qaa0v/8YrRUgG
 WrZD1j/XryU+Asyskx6+1ELGSSqF5w=; b=JAhw5BLlEmqhvGmUdtzz2X6WakvRo
 /rW5XqqSxtBqOXlER/VHwkIsvjVJDuMWZt9RnadLSTsHsi/x6kVNtNHOEsp9Y3Eg
 DLqASZEtRsgb3b/0H4/CUsRkaruy+WLZLEmm6fHnwuJAfSEyNmsa+Xcoo7be7ayh
 EEDvS6NntM9G0wC03kMZl3X9lThGzC4yglmNedTSNgDNKaL7kKDIDAkdrrMq/jxn
 qmncHRjbVn9ft9uhgxpduiBInNm4mn73FQs292WCTPJ1jyZC43VikntGJWvYlHqR
 3GY+Vt3xHe7OOYy7oaEOqQBRu7lI+lB1FeAGiyZt95+aVPK1G08XYH8Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qaa0v/8YrRUgGWrZD1j/XryU+Asyskx6+1ELGSSqF5w=; b=jcvk7P0E
 LKkgdYU5romkgGG9U5G+IyMLjzLrgf74J5b0zyvRn3C+FJjyZSBPovahsvnwpVZL
 DrndfaRjMKuMw7nIjhVlgNPeIkTLHEzFIEnCnL0x0QLcvclFt8ZurbMM2n+uFCha
 INTdvCg/0hQmpc+Sm1y6WP4R3xZGn3gxdu5n4mFym+AaXNSLqF2ls4ccmPqouYxX
 JjTTjk/wlK3iMR/Q7dA3uk54utROCB1N9ilqIvrqZLWMZoZN4OzAR2Poe1apT3EM
 OEyqNqN8hDnb8SyteCpDy2GvbN1HZjTqgLGy8dBr80MxKF6nxtH3hE4YztfA5SXb
 AAqadAAunFzsdw==
X-ME-Sender: <xms:FqNQXyhX3hr_5_A3VnQbeA9pGU6OeYIKxkvuzi75l7hwnISNKoag0Q>
 <xme:FqNQXzAoz4MScSBaAy72a8Sif56iYEuzwPmu5qO1z_QFQualAaoyV_WMyG7A65PEv
 3T2OJAWzRp0lrUePMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FqNQX6GU7-BDx6JdaCdcW80hRa6Iu411EcFrnH0oLNsuvwiZaJyDhw>
 <xmx:FqNQX7Ra2uwQ5_Pea782_zErlnOLY5RDpcQeu4a3pSfZ-FH1NpkDPg>
 <xmx:FqNQX_waqvhSmbGpYg1NYwRmtu26Os4BnDXWLOiNw94dmxfKC-nHbQ>
 <xmx:FqNQX943tBWelUwvRW_XibzZcqsGYj1f-fWyUQwzV5OJWkA7Gm30LDFSUnQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 162AC328005E;
 Thu,  3 Sep 2020 04:02:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 26/80] drm/vc4: crtc: Remove redundant pixelvalve reset
Date: Thu,  3 Sep 2020 10:00:58 +0200
Message-Id: <a0a31af0d4a7a070de979f0e5b618d9e2c730e7f.1599120059.git-series.maxime@cerno.tech>
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

Since we moved the pixelvalve configuration to atomic_enable, we're now
first calling the function that resets the pixelvalve and then the one that
configures it.

However, the first thing the latter is doing is calling the reset function,
meaning that we reset twice our pixelvalve. Let's remove the first call.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2eda2e6429ec..2c5ff45dc315 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -427,7 +427,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
-	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
