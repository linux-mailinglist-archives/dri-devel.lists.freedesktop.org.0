Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF325D1E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26016EACB;
	Fri,  4 Sep 2020 07:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4EE6E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 83868A4E;
 Thu,  3 Sep 2020 04:03:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=V/7WR/jl0k5Gh
 uj94CWy7BuShBUkbxRE00j/Mfw+Hbs=; b=hhNNSinSioUV9NK1EKEdB1f30vkRZ
 A1Z35inVGxODZRWjMq5e06wZ4hz1OH4R66KKenH15Qs7t6dvGSD5yCN+Nlgvwz0x
 DAk8l69yyoRkziiGyQLl++H7tgXgA9deT4yGj6aihlTvqGE1B1/bNWhkOYJLqPwy
 btPo6EoSTVfDADHMO4c//G4oH2SVfR9GA45YfNnhoYJs+EaUqBwirttSyAlbeKrW
 UXY0UxjwrGVphhQ3chlPR+WZaJlBJM1hvXUINk+fcNHfjZ33aKtbV1Cl6LYd8MYC
 Kfwp1fYP5UoNfKKOSAgU/sDCzdKaUcfX4f3MzYej4fIpWjq8iy5DfIZGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=V/7WR/jl0k5Ghuj94CWy7BuShBUkbxRE00j/Mfw+Hbs=; b=uJHOluLs
 AcSq6cMrVk/+oIoDJ9dgKtw08ZHawPveZGH18neiJsthfLCFj/xFStsnNrkZO6pl
 1T+RfCIqZmC4pqNnnctq7D4VtjGo2eBBsLOBi5BEmQcSn85ZpE8bf98kDZ1vClRR
 obddb+1PQqqJQIGFVnpZWniwycDaL8Y5ja7t3PNva30zHTnVtPc5owBM9hfbFFyq
 gqj4KLYn54BkafSJX4tcpr1NRYr/OEpfSVUnwd1q+Acim/oJpf3p6ng897PpdJvd
 M43/3ZuD2bEEKu40mrxKGVFnmaYM/SGRgikUFLpTviCuPsMb+5iXidVIUN1JgSbQ
 ViMI0kb2U94T8w==
X-ME-Sender: <xms:SKNQX_BCgXokgC2kffQVs5XfcRcqwVbpE-0vV0g9jG-pvO9sc2aZ4w>
 <xme:SKNQX1g8Y2iXyCL_-Z4YaFiLzGG70JUrgQhYAgjaPWgjr_1eDSqVtPGLTY5wag6dv
 oOIZrs_hkfoZI94YwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehge
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SKNQX6kZ-IJNmh_mlZ5f-smgrWHAHFsq7xGpYLHMChktz1xQwaI-KA>
 <xmx:SKNQXxwvYCV9ifzya14kTSt47V-TnW-Yzw1Oex30nD3gio5Wz0Xr8w>
 <xmx:SKNQX0T7WkY8wmYCxhdFx_RicKHHdE6uvxkTqR5ZWYPpSa5fU9y-RQ>
 <xmx:SKNQX4ZgbdZZWxZRBpQUFuB8RkTcmh1jHRuurbBuf6tMv2S4b5AbIIXv2gI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF0E2306005B;
 Thu,  3 Sep 2020 04:03:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 61/80] drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
Date: Thu,  3 Sep 2020 10:01:33 +0200
Message-Id: <53805cc47e99a137e5f08c92fb781cc2e2134299.1599120059.git-series.maxime@cerno.tech>
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

The CEC_CLOCK_DIV define is not used anywhere in the driver, let's remove
it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a26b6bd61f74..e39c6fcf4c12 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -55,7 +55,6 @@
 
 #define HSM_CLOCK_FREQ 163682864
 #define CEC_CLOCK_FREQ 40000
-#define CEC_CLOCK_DIV  (HSM_CLOCK_FREQ / CEC_CLOCK_FREQ)
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
