Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F294625D218
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17E26EA8E;
	Fri,  4 Sep 2020 07:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AAC6E5AE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E3841773;
 Thu,  3 Sep 2020 04:02:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=duNhF2Nx3MRwQ
 EHgb22EplTMve51MHVBzNHoNv4llic=; b=H4fPFrGrTlG33nPaFMNzsnaAJcMie
 ifIgBa+XciGBKoQFOQtre3divkrRonhAKSwYpv1RKJC5zewEzyxwqaQeKfWT0fGi
 FtIQepMpxwHes6xPyOqf7ZGaVxzLhqCROeAl7D65udeEYGlWMDKPOaeNjFM719+M
 U26GVrwcGmdM2uVrJRA1D44A0kCfa7w3SoDwOuZxwYqyHbjcT7uP6OCdPXkPFFS3
 8nRRk+nocPzIzrCQQi11ZM/HDcPXDU8xrwhIdjS83h6XzDNnP1y9yJe0lrFy4Ft9
 MI1snQQ66IxWc8hp9UNNjveqwYPIaupBdyMPiGEMvl+RAvcMcavWhWDEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=duNhF2Nx3MRwQEHgb22EplTMve51MHVBzNHoNv4llic=; b=U0f0Y/Eg
 LdTDDDOAvNAMKUpBLIdIaoE7sspChJ2ZGrU7W0LfTrkfJOfg2cQ78I2JVpjt6iXw
 C+bNJBTL7NdAa5Ioov3Qq1GF5CYYyt+cbZEV500y6jwZsbFh9CWmJUhOa05zrzxw
 mvqXFRpdH/Jo3/wkyDl1S1/1OGPHGGQ9D6LtkshtbrtXwQUFEmVtPyoy8sNOBATG
 vu5dXXlPvoGCyuvEBNgyWINYnwd2hy/t7r7H2LAk/jhbIocI3pgyf0H64j7OlvcN
 aGavLaSHa8gwvf/8xsyqZfox4Kx33lW3P3DcZeE9xf0c6DyVB0mjHfqyltQ1GiGy
 WrT/K34kSj3BzA==
X-ME-Sender: <xms:C6NQX7iOVYFyXZ_vJ27ms03zYmJf_PUcr-VFyAK5Z2WmMxUSssTxVQ>
 <xme:C6NQX4AwPVl4qrGyqC98flk-50QLmPhsqzDOsQnow3pifgPRUPVRIvBkaNAv_NeMX
 Ut2NsZfFbgB_sgCVtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeduge
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C6NQX7H-AKaUagpflYGUN9k6qqvo03FWjZcwxEFzdmNAsb2YEun8kQ>
 <xmx:C6NQX4TjTiG_m_Nth-woUU1IRPcMymzCBvqBeEZEGxEfN1vCzN3AVw>
 <xmx:C6NQX4w784DfSTJuAUjUibHUCu3w50k0uewfMPiBK9vxnt4no6sFGg>
 <xmx:C6NQXy5poo7TckukTDraYeQc9fyGeGwS7Y0ZbxVljIX3afyqRAWvBuQPlvU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40644328005D;
 Thu,  3 Sep 2020 04:02:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 18/80] drm/vc4: crtc: Add HDMI1 encoder type
Date: Thu,  3 Sep 2020 10:00:50 +0200
Message-Id: <6ba56d2421a4ad59ce72178e8f37eacfbd72cb33.1599120059.git-series.maxime@cerno.tech>
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

The BCM2711 sports a second HDMI controller, so let's add that second HDMI
encoder type.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5781773aec4b..4126506b3a69 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -427,6 +427,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
 	VC4_ENCODER_TYPE_HDMI0,
+	VC4_ENCODER_TYPE_HDMI1,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
 	VC4_ENCODER_TYPE_DSI1,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
