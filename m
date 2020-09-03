Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC825D21A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F009E6EA9B;
	Fri,  4 Sep 2020 07:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B716E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 24896C8A;
 Thu,  3 Sep 2020 04:02:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gP87m5QHi9h/a
 j7ke3NYI2AEcpZKyyD6FEbAXMGF73E=; b=n30S4/FGkQzRnjODTw9vXcT+L0Wq9
 rAT3OytHdrKLft8wYjeKUmX00IBqSxeqsdLrLj9SOxYXL0pEPxXMClc1979dwOVU
 gl8jUGzLgfjc/WNSFJ+af9aiXx0hW6f0xM8B8byIecPwRR27p8+UGMlcrQapw6OV
 YCz9y7Rief+vO/O4IW5G3oOmUEE35wgfPLEWUkz8snmDCInnrcCfKL6yFXF4dP2M
 m2A2d200DunkvZzPeid1lRXHhXI9rfdVnFIaxOxTpNuCihhWsbwbTb8wPYpjRkyf
 LGMIOW1oMaw+6jI3zBe/IIfbwBz/LmBm/7+lSf2MIgqDKIKpzlOQwUO1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gP87m5QHi9h/aj7ke3NYI2AEcpZKyyD6FEbAXMGF73E=; b=i31G1BLy
 QmNGr1+4bP4fyEGD+mjfZRiUaPDa1Dl80/fBr03doq6SBJerQ1XoTljN1E0J/fA9
 l7RyzK807nH8OtmjptYw5cJmIUF/NiTq6rspvPiHAJ5Vx6cqJ/+O15mkjiWBjFtG
 meYyjAh98Zatnh+Ed30vAz0h04EAEnasy9z+6FNNPbCT2DSRhAU4A6tJ+/9YzHT/
 FQX74fNaLnhK7IFa8CRm1HiENFE0OSveweAyiiWHGTCe2CIG/OK4gsmA4hp3Q91D
 0SbN5olNVi07OmdQmivicMaU4ew5rel6c/Vaar2uJzNkjTf3sXWoPRphf9E8uI+O
 HFMmLNF4LPgzTQ==
X-ME-Sender: <xms:E6NQX9OywUs20xrM0209LcWsmQPJAItt5xwihDoV1kASnpKaefCXTQ>
 <xme:E6NQX__RnGTJOeS_5zyViXxphoqXs73BECKbLy12uud7SE1VmaC4D5H14uLQ42WQq
 zyxSNlesY3S6EGg62M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E6NQX8Tb5GuWM6sKpc2E8SHmLDcwx2uH4My66V1ewmyvYG28FITQvw>
 <xmx:E6NQX5sWd2Oj6W3T2Pw5dgQWP2bHxarsqEMnDCd7IR1CPFussGZfHQ>
 <xmx:E6NQX1emK9V4kVCRncmOzMmfwhHa-hSDhaDN6P_dIXp74gOXuVRFUA>
 <xmx:E6NQX129tbALPpA7rDAOV1LKMZTb9o-12_eWFN4Vjk2lLGc0lVAxeHmZO30>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D355328005D;
 Thu,  3 Sep 2020 04:02:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 24/80] drm/vc4: hvs: Make sure our channel is reset
Date: Thu,  3 Sep 2020 10:00:56 +0200
Message-Id: <b34c562b36177c758dd2e9d84bceb07689bfbe05.1599120059.git-series.maxime@cerno.tech>
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

In order to clear our intermediate FIFOs that might end up with a stale
pixel, let's make sure our FIFO channel is reset every time our channel is
setup.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index efaae60bb323..0f56a7b57916 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -205,6 +205,10 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 	u32 dispbkgndx;
 	u32 dispctrl;
 
+	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
+
 	/* Turn on the scaler, which will wait for vstart to start
 	 * compositing.
 	 * When feeding the transposer, we should operate in oneshot
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
