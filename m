Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613225D1DA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCE56EA94;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022346E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C3862B0C;
 Thu,  3 Sep 2020 04:02:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2hvjXzd8CFbPx
 5ytRx4X/tmO5bn6lzgqZvU0U3Sznsg=; b=bd8CKEZXF3reaS1lv6djW9V8Zln1A
 oU5MjRr3h/p9owmjdmeoZuugfrntTGwPp3nCvW6g3pV3q3kRSHRJKxXQRaB6t3Ow
 XhVJIycm77F4hYLK7YkTO8XhAiTAu70SZ/MIqSisGI/z9Teei4Lbs0E1yew0ewMD
 RgV/vdXPi6Ai9DqN0ACo/JZB9MWVqRO1pHYRbnUGNzujuTP5X+Np2WCfyhDPUrlm
 F1j7Mh5/+zoYYTyBOdfunJTKGKM4b9GADNulZWKEwS9jpmxzCdJuZAJNfeB7eSx1
 ETK0rcodrBZpKCxDKKRJgh/FxXxgkBXKG6ngbYGaZCgniSqeXy8wW4itQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2hvjXzd8CFbPx5ytRx4X/tmO5bn6lzgqZvU0U3Sznsg=; b=Jw8L1QSY
 cv3UT+tsa5JQBblvFwO4c6dwAhNYGw2PR9hCR8REjGU0DPnu1oObDH+ho7QRT0WZ
 W3hDBibq/HpwTM8xPJ6Aebb5987rKEsEljLyCidCNIAyW5DgzUWmE3TcxXBM8Dub
 UnMoSTmztst5VN3dJllXSDPwSA8gXb10vmh2KYug66Q0sn7rkh5nDg19BedGBkvl
 3ycX0gJDaIAiHL3QIFFL43QdEMSnVi/zWsa2jUHnyfUgHeWs6Z6ftdp1BQ3sX5Lb
 jsZYZbSm8/RYufSmizkKVXx48ejeRbgNjUKigDinZ+QLEXNiChUZsRh1VXPJ3Gfv
 Znbe+mCUnKAK0w==
X-ME-Sender: <xms:A6NQX4fD2-vkL28QbqaakKXoV7aD89_AIy1w_lB540DdzW8GpqrwEw>
 <xme:A6NQX6Omp3jN_vpgmyb24PJyAd0IZ-0OZnZ1Zhxb4eXSUBzPwNsiovM61I5fAC4lf
 uz1HCOKfGBBp3xmiiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:A6NQX5i9vO5sTujzRv2Y5qzsInqkCvC-3iTXfCtmbDd_KazU1BVYlQ>
 <xmx:A6NQX9-1thUkDpID09sqPbh7TRYqOL1NJd0LALp-UA9oGjImxKWCFA>
 <xmx:A6NQX0uOCa4N9K634MM_3oj386Q6nfD7tDzwRllgWx7rRJJ1ntq_vA>
 <xmx:A6NQX0E5CxgqjP55COh7CcDZV2WtdsV19AcpS95qUYA72Ua2wGarTQEBdPM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B3DA328005A;
 Thu,  3 Sep 2020 04:02:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 12/80] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
Date: Thu,  3 Sep 2020 10:00:44 +0200
Message-Id: <e97596f62f4df83424d994a23465463ac60f986e.1599120059.git-series.maxime@cerno.tech>
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

The VIDEN bit in the pixelvalve currently being used to enable or disable
the pixelvalve seems to not be enough in some situations, which whill end
up with the pixelvalve stalling.

In such a case, even re-enabling VIDEN doesn't bring it back and we need to
clear the FIFO. This can only be done if the pixelvalve is disabled though.

In order to overcome this, we can configure the pixelvalve during
mode_set_no_fb by calling vc4_crtc_config_pv, but only enable it in
atomic_enable and flush the FIFO there, and in atomic_disable disable the
pixelvalve again.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cdeaa0cd981f..fe2e5675aed4 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -332,9 +332,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 		   PV_CONTROL_TRIGGER_UNDERFLOW |
 		   PV_CONTROL_WAIT_HSTART |
 		   VC4_SET_FIELD(vc4_encoder->clock_select,
-				 PV_CONTROL_CLK_SELECT) |
-		   PV_CONTROL_FIFO_CLR |
-		   PV_CONTROL_EN);
+				 PV_CONTROL_CLK_SELECT));
 }
 
 static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
@@ -386,6 +384,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
 	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
+
 	vc4_hvs_atomic_disable(crtc, old_state);
 
 	/*
@@ -410,6 +410,10 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
+	/* Reset the PV fifo. */
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) |
+		   PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
+
 	/* Enable vblank irq handling before crtc is started otherwise
 	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
 	 */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
