Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444C25D1CA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5A6E02A;
	Fri,  4 Sep 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F39F6E4DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5C7A5C02;
 Thu,  3 Sep 2020 04:02:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=tbdfL9NcjyVQC
 Pzt3lMBWUV5KAA8n13YgBSTiiVmjF8=; b=LA/7fzSGs8xD6O2w1ZfRC3AvE3HcV
 TUdOO+VYs3bo4lBFlh2TLgEuFVijj1RQSd9CCqaBy+Hw7EQaf9zIHAXXDs6TyhRT
 V6pNBSiTtRuZyho8phWrsAMB3CWq+UN+0CnW3sgzs5hq4gIKrpPvhc7SsVuXLH26
 nLJs/72nDaIIb/KgAqDchzFgfrRuJ2iBlouPdQohPwsvgWanvWrzhD0PO0KBn8lk
 rry5a67JHLsqOIPMvavma2Sld1TA+WjC60cuYV280oH2bADlM8SrlsufYVg4btco
 HjcFtuAlqFMFKfbj0Oow6qPxXG2oQshuYDcn/n73MxaJkA6ln9pQm0nxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=tbdfL9NcjyVQCPzt3lMBWUV5KAA8n13YgBSTiiVmjF8=; b=Mlp+FK0V
 IMcn74sINPQrsKkb0miDQ7e5bku51H5Zifq/t7QB6yKwYS2enfqXDQGEQlhoWAsy
 l+Zlnfxv5lxYH4QumuZapUd1LDx5+TDOHzH9xM7FCVIxPwZsq6re6SAhmTMrWZU4
 vVUcp8ldPobeW0CilhS2Fx+AH/8/4zJ5bxL55KJjR6dky1j7/QNrmGcO/VFTi+QO
 dHELPdaShm1PAGBKLwkj/ny2GHXBwLZM+VQeaNJqNY1r7BptkHxQMD+qholxK35/
 CpxZ0xxD3vXkUFpUvKhNfV8ktnIRxFPR60OAyaouQBCWh+DKdIdP0RPgtICIeoXo
 9NepO3+hh7YnhQ==
X-ME-Sender: <xms:_aJQX1vDJ27HEQNfClToHShZiPDzXE8gXLgW2_RtGYBlT9vL2K06cA>
 <xme:_aJQX-cLTOplxYKjzhS4RR1bE54Wg7gPVWC5DYXDJV3UY_BPVXgMSNOvRUAdTckai
 uPra_edjBDtMq7Ji-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_aJQX4zzZlfRLjfK-qjjhLlBqzmy7cHcuyyxKfpQ946hzkIXvoChfg>
 <xmx:_aJQX8PmmOcQ0jd3xHUXdiS7YWgpgx-fOb9JliLnFGn8LlCTrnPSyQ>
 <xmx:_aJQX183dQ147yUdp8e62Kv2IBNLAoYMu97pbcO_lbskt628iVb6uA>
 <xmx:_qJQX8WXshJbCTIxGwrxRH8r26XG5D_Ete9h4l-j2igb8n1O_vfOJUECgs0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93F26328005A;
 Thu,  3 Sep 2020 04:02:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 08/80] drm/vc4: crtc: Use a shared interrupt
Date: Thu,  3 Sep 2020 10:00:40 +0200
Message-Id: <5a915d374357f41083ac71779fa9b2c35a339c2f.1599120059.git-series.maxime@cerno.tech>
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

Some pixelvalves in vc5 use the same interrupt line so let's register our
interrupt handler as a shared one.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e55b2208b4b7..9faae22cb0f8 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -919,7 +919,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	CRTC_WRITE(PV_INTEN, 0);
 	CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
 	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
-			       vc4_crtc_irq_handler, 0, "vc4 crtc", vc4_crtc);
+			       vc4_crtc_irq_handler,
+			       IRQF_SHARED,
+			       "vc4 crtc", vc4_crtc);
 	if (ret)
 		goto err_destroy_planes;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
