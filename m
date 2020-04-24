Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F051B801E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79616EB4E;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D1896C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 34747143F;
 Fri, 24 Apr 2020 11:36:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=chTEdfP/TGVQC
 B89hyBYCnukgHUPmk0+Fjf1O1Hfcig=; b=wfmZEBx8vrwcs/BGGRHW2Wa8fFn7Q
 u9nR5EOL8JWpIBypP0t3Kqzr2jj4d3LynyrESahg7u2x9fn3/LtTQdudkk+JSTCk
 kD3RWKjCYW/aZG8hvN7z3/t0DhPpP91NkN1h1oA8ziVv3Np7/8hblc0eo0mAqmd2
 A7X/w5PlV8QPqZLLAPpdQVVdeNdEiUw3w6eSmaQ6aqjiKtphhvahFWzcoxmcAUxW
 3ImkemQ+IZTooPOSjCjjadll94RF7PpoSSReP4Gs2LPHTfq8q9WtevCA3FRTSoPC
 oxNMLsPlPqY4a3RBz34fzKV6/VpiZDwuOQTYzYjUxXoVpUO/9pIAQx9IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=chTEdfP/TGVQCB89hyBYCnukgHUPmk0+Fjf1O1Hfcig=; b=0xGpL6Dq
 4PfZ/F+hBdLcEbO7CAUveW8KzMsRRcICDhSO6qMMaG8tk7oElMeV/H6KD9E9Qn2M
 LwtVvjsgp1RhTfSv5gsd5OMMn1g1VKwch1m3RmuADDaehC932+4j7SAHK/18apCK
 BnvDLU+ymw3lQ8IdIv1iA4tSIsKkqvxXQvX0ctuYWthlPgYgS/dZV07L20yXfG1P
 +Z9lxnT8inLP2Gw16l+g4cTOq/DWGe7lEgl7dJesYw8hkBdNv/JLnCujANRwxUSB
 vx9pnkcvvyvqglTvWP3mfQR6NC5lwFsQPsbSfbg9PZ6dd4auWIpgGLax4uun9nMA
 2n2VAjC+LG+lcw==
X-ME-Sender: <xms:egejXtkkYhbb1LlfqJNeVB2269X8vSG--b6pX_UdSCE2rbPEmICn1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefkeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:egejXgAWrRFnCfGyE0oaohVPqsJMQUVTlA-dPu-1Wp0lvONlECYMAg>
 <xmx:egejXi2-wjLbLXoXTtxGU6U42cHTbQC_F5Jfk8ym1n4KJtHLXLd0Xw>
 <xmx:egejXvCHD9WZhCfjFodjYrcSZlR96peVILVdQW-onlv6ntsyYbrp5w>
 <xmx:egejXqOHaw1NfuNaZzHo5zPjQlL7dh9rVQ6E1VmbnEsLwUAXiDo_pKyeh7Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7171E328005A;
 Fri, 24 Apr 2020 11:36:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 46/91] drm/vc4: crtc: Use a shared interrupt
Date: Fri, 24 Apr 2020 17:34:27 +0200
Message-Id: <941aa091135806b802969346125faa449fb281d2.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some pixelvalves in vc5 use the same interrupt line so let's register our
interrupt handler as a shared one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index be264da1a13f..5d713fbae139 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1179,7 +1179,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
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
