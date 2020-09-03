Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B725D20A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B9B6EADD;
	Fri,  4 Sep 2020 07:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866C46E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 577BAB66;
 Thu,  3 Sep 2020 04:02:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=B+Ge3UYvmpsgg
 4Lbed0L2g+EdxKusrcCPYtOlov8z54=; b=T7GPIGUfFDk+0v3oMBjyVtl/gcGZf
 QUq68UyWPyPlx/V3O/ZRg2TvlhtJUca8B5aTz+ycNRW7wqCpvHr9jcsoi2whjBrT
 cPyYXp1NBEizvdfxtIDsw/Kt5SBzr8VQES9b8IaoNcDSZ66dPreF6Jm2kc46X9Z0
 C8DhU819OdY8mtUEGWrC8y0MxlnL7E37yIRaeEUYv4oR6p7PHmZVTxpbXd10noeW
 9+FhLwviQiT3hLx2WDFkfttwxQBqsF9NeiUV9qerQOfUY81R44rZ8mNsyuylN0Qg
 3eyggeZ+iHVtaHWvo2xMtOvvM112HHpeRsZC0GzrVMbxAvHbEh/s4l2OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=B+Ge3UYvmpsgg4Lbed0L2g+EdxKusrcCPYtOlov8z54=; b=qcjBjvT6
 ERsoj2oGo557QY7MOd6oi5/Y5pCkIvTW4/Xm+kZBBFeDLf6bkkxSReAcKXFaP+aE
 CjtP2OFEpK/dTFaZFvSd6DNJlsAwPmXQN5/RW/677t6jDfbkc86I+p+nY6RU+olk
 DJrkjs9hzx7zBqGllPJ3UafqUUTRBDCdCFAg9LpU7jWRGpE7DvhJCwzVr8cJmog4
 Ra5w02xNVyTHGq/DVlttiiitPn1JhvnVXxz+OJ+h5f+Q91KPSL6tlNgnBbhVJ7mP
 I+2Elm+OQfV8FbOm+kjYBkoMLjATq9rau05PIwdy1bOXrp1k/HJ4bplqimMlqjCi
 nmpM7cg2PXfVKA==
X-ME-Sender: <xms:G6NQXzSEjmMGgjwctS_Ch4KwCbtYLZtgxUSRH_PCKSmhLOaVIr8fAg>
 <xme:G6NQX0weW67paHWlgn1irxYSUrL5c-UZzYBNc34ZfNgckBBvN_opM6hSPL8KmJpnT
 CN-by-gtlHpb5RAQ4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G6NQX42GdOf8XaviViVK57c9mysbPNnxjn2Kx6Qqw1_AAgp-opnBbQ>
 <xmx:G6NQXzBkX9L8voe4gald0bXnBz5swNXztLGPz4wLyXascCadnvo8FA>
 <xmx:G6NQX8iMJH-hpCczxHKze8penxwhqVSCnSeikM1k0xzpquinX2UH9g>
 <xmx:G6NQX7qiOsVVWf4AoXZpXBc5pHZguMfqcWvNc9Q41ieU6IBJcZd8iFhlm7E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7944B3280064;
 Thu,  3 Sep 2020 04:02:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 30/80] drm/vc4: crtc: Clear the PixelValve FIFO on disable
Date: Thu,  3 Sep 2020 10:01:02 +0200
Message-Id: <26fe48b09d77088679ed0c8cb8cf0db2f108195e.1599120059.git-series.maxime@cerno.tech>
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

In order to avoid a stale pixel getting stuck on mode change or a disable
/ enable cycle, we need to make sure to flush the PV FIFO on disable.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 4c23cf8aefb9..73d918706f7e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -424,8 +424,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
-	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
-
+	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_hvs_atomic_disable(crtc, old_state);
 
 	if (vc4_encoder->post_crtc_powerdown)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
