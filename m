Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9785218074
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582A06E8A2;
	Wed,  8 Jul 2020 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A26E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 10:19:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9F308ACC;
 Tue,  7 Jul 2020 06:19:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 Jul 2020 06:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=4hTmYwJWs3UiuN5nnPv+gaN3eG
 DOSwKQFpI5Se/4Tg0=; b=S6qsvSa7vwbAhGWVbj2k/hnHW3c6IxoLUWewbt5Hkc
 jg9S+dgZVYYBNE9tvf8h0xpjeI/Cie0+Ejo7qhJzUEt07Rd5okcFHHgrZq/9Bs80
 14bM803jIhLnAlwZxzqVMHUUaKzZMrtNFiHqaUt26kW0C9lD8/8k3QMuCKl3yd1b
 lp1hYN4NV+fVL7XcPMKjzJshpgyxmB5OjMG0YnqZmeKLWwdzZcx1XPE5XzmqFsOJ
 dHWeUVT2gs7vEDqMzpVT9Wi7j1K8xtFrpF4dU9Lgv8DXvwzEHFi1Uslm8ww8OBeM
 Do1AsIOlRlQybLutZNc+FOZRg/T+Y/2aygb4IzcYbTNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4hTmYwJWs3UiuN5nn
 Pv+gaN3eGDOSwKQFpI5Se/4Tg0=; b=go7AXU4Rap0ZGn4ZsXOVv+GMktdWyS+uy
 MlsVSvtOaczJnPHdE+rq13MxJKMI2nmMluWLM8V39YKJaJZhOpSAVswA3nRtwW2j
 vxFLU/v7lTzCvVZeFc9WEtRKpeDezubZZ2W3fU2zsCrz97tmhePE3Ig1UuCwHOTj
 J95bvVqvddYfgYUfGLutnZwNoWuk2fKhr7lP6OZKCSOxltab5LnAeU0/Ju05HQfN
 u8K9nMSniP2+X9/PDmXdK0qYbaZLcv2m95R041F1mWvlaPPayzt/U7H/qTiY4nhc
 wduZHgkAnu3zCGjEXMV32GO7pHeUnZXMnoVkIqNhyNspVyVVo948w==
X-ME-Sender: <xms:JkwEX-ZTVMXnSASIHm0rU7JfceOYqC2_H9otGkzMIIhMtArfHaD7OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JkwEXxZ5Rtzbk20ijyipyvBGd8x3aK_QKdaSlnx3XzZ2ZB1XtjQgQQ>
 <xmx:JkwEX4-qc8bWTW6Dcv5ilYOeqZNTM94FL1tF3YptJeAYsTsJQHMqtg>
 <xmx:JkwEXwqFM-2QiKVCh2JIUvq6lHtXTRxX7ZGA9vX1We74PwKYw-riLA>
 <xmx:J0wEX9dULmsWjLRV1GkF8IcR0A-T7K4jGKOfDgKHmG_5DH9VJxVoJbVGplM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B595328005E;
 Tue,  7 Jul 2020 06:19:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: dsi: Only register our component once a DSI device
 is attached
Date: Tue,  7 Jul 2020 12:19:12 +0200
Message-Id: <20200707101912.571531-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the DSI driver is the last to probe, component_add will try to run all
the bind callbacks straight away and return the error code.

However, since we depend on a power domain, we're pretty much guaranteed to
be in that case on the BCM2711, and are just lucky on the previous SoCs
since the v3d also depends on that power domain and is further in the probe
order.

In that case, the DSI host will not stick around in the system: the DSI
bind callback will be executed, will not find any DSI device attached and
will return EPROBE_DEFER, and we will then remove the DSI host and ask to
be probed later on.

But since that host doesn't stick around, DSI devices like the RaspberryPi
touchscreen whose probe is not linked to the DSI host (unlike the usual DSI
devices that will be probed through the call to mipi_dsi_host_register)
cannot attach to the DSI host, and we thus end up in a situation where the
DSI host cannot probe because the panel hasn't probed yet, and the panel
cannot probe because the DSI host hasn't yet.

In order to break this cycle, let's wait until there's a DSI device that
attaches to the DSI host to register the component and allow to progress
further.

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index eaf276978ee7..19aab4e7e209 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1246,10 +1246,12 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
+static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
 	struct vc4_dsi *dsi = host_to_dsi(host);
+	int ret;
 
 	dsi->lanes = device->lanes;
 	dsi->channel = device->channel;
@@ -1284,6 +1286,12 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 		return 0;
 	}
 
+	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
+	if (ret) {
+		mipi_dsi_host_unregister(&dsi->dsi_host);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1662,7 +1670,6 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
-	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1670,26 +1677,10 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	dsi->pdev = pdev;
-
-	/* Note, the initialization sequence for DSI and panels is
-	 * tricky.  The component bind above won't get past its
-	 * -EPROBE_DEFER until the panel/bridge probes.  The
-	 * panel/bridge will return -EPROBE_DEFER until it has a
-	 * mipi_dsi_host to register its device to.  So, we register
-	 * the host during pdev probe time, so vc4 as a whole can then
-	 * -EPROBE_DEFER its component bind process until the panel
-	 * successfully attaches.
-	 */
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
 	mipi_dsi_host_register(&dsi->dsi_host);
 
-	ret = component_add(&pdev->dev, &vc4_dsi_ops);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->dsi_host);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
