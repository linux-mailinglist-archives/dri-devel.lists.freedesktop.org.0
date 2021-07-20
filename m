Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8383CFB04
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05A6E30F;
	Tue, 20 Jul 2021 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675436E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 338272B01189;
 Tue, 20 Jul 2021 09:45:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 20 Jul 2021 09:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+NaTdju2t0dD7
 WUYDPfRGagnPcPZI7VtK/pJug5xl9M=; b=Xm46C04+BUYYCyce90M/0U1C8NvwE
 zVy0EHDEWB48oHuqh4JRg+S7LY3IOqDn3XtfwLRv88LNG3l1CSNnHNRtNE6XWmg9
 vr9HJqQEOK5uYOJDMiOykCYma+uuUwfNUzt323K/LbSICv/4jEgpJbsgnRu3ivXC
 0dqH5t90XLHB31S6yaPgQ285Rixm50a5ecOWSmTZPJKfEv1JTClGKRheBdBtMOxm
 QTfL/WQ7yHdylURuP/QddzBnjMeXztRnar27Ma/F6Sm06QwuiH6Zks0PZ4QpxSGs
 IqEDbBBjQR46v6qbevISR0aRN4S/sbUYJBY/kuFmeoMRNhfn273XvQqNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+NaTdju2t0dD7WUYDPfRGagnPcPZI7VtK/pJug5xl9M=; b=YLGz+ta/
 s69237/770+28VoEKQMbVXJa+zpsroZAOs1HN88fqdjbSIXDPqM4Wv1/Z6BwmSaD
 Ls1DSjfK63FFRTOePqMJSRjU/QKlhAfq1ExMDs+UCgpbzDxTyl2WuF5/Anu81Ekq
 i5DVn7WM/pCEYQsCBkzVswVlvEUHFc3agsgf+a65cXA4+bTNMzB2IQ/Phr2RsJLZ
 pMh3o0l3sWcU3Iiv8utrRwNaO0C3wT1vLE2lEhNw+BGBcZu8+/JSjkF0+nXr9FIX
 lZ96iweWJ2Jd4Sm7vQhcUDtqwwPW5Dyh/PqJ9a8UHZdp8monb2ZQsV6CD5F0qcQZ
 /wglXPqsIGtOVA==
X-ME-Sender: <xms:itP2YKbI4caOM0PvgRfKYOD8KKRwrkECZr0S8X8kcwkRgRgofww0xQ>
 <xme:itP2YNauZb3UNHMXyxnsW8Fn4AmK-6h-PQzwbG-l_dB_QpM3u8rqnSH-uem3HCSJu
 6iuo4w2IF7qthKYjfw>
X-ME-Received: <xmr:itP2YE8NCLjleoixf6XIyRzNjjSse-3e47pZCNOCFvhoLfe0l3MxPPP47U9iasAKRLQlP_zFME8Ns2yyY1HTjTEKNsX-iDRr747->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:itP2YMoQGqNvuI7dzseWWvL_B4Toso0nhYlViQn42OUw_DwWazAeCA>
 <xmx:itP2YFpmqr-r0oae8ipCbRp6JbDIk9tm9q_Q6G1yn04DpjMXDxjUsg>
 <xmx:itP2YKQMYZtQl6--aT9pOt5pLfmDoiQva0dQwfBARqIqwinq2jwbpg>
 <xmx:jNP2YG4BS4gzrfStcquPpetFePTlwyLfpTEzNWbJ19iVV_NEeOAdcixHbag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Date: Tue, 20 Jul 2021 15:45:19 +0200
Message-Id: <20210720134525.563936-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Interactions between bridges, panels, MIPI-DSI host and the component
framework are not trivial and can lead to probing issues when
implementing a display driver. Let's document the various cases we need
too consider, and the solution to support all the cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 +++
 drivers/gpu/drm/drm_bridge.c          | 60 +++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 10f8df7aecc0..ec2f65b31930 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -157,6 +157,12 @@ Display Driver Integration
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: display driver integration
 
+Special Care with MIPI-DSI bridges
+----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: special care dsi
+
 Bridge Operations
 -----------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c9a950bfdfe5..81f8dac12367 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -95,6 +95,66 @@
  * documentation of bridge operations for more details).
  */
 
+/**
+ * DOC: special care dsi
+ *
+ * The interaction between the bridges and other frameworks involved in
+ * the probing of the display driver and the bridge driver can be
+ * challenging. Indeed, there's multiple cases that needs to be
+ * considered:
+ *
+ * - The display driver doesn't use the component framework and isn't a
+ *   MIPI-DSI host. In this case, the bridge driver will probe at some
+ *   point and the display driver should try to probe again by returning
+ *   EPROBE_DEFER as long as the bridge driver hasn't probed.
+ *
+ * - The display driver doesn't use the component framework, but is a
+ *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
+ *   controlled. In this case, the bridge device is a child of the
+ *   display device and when it will probe it's assured that the display
+ *   device (and MIPI-DSI host) is present. The display driver will be
+ *   assured that the bridge driver is connected between the
+ *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
+ *   Therefore, it must run mipi_dsi_host_register() in its probe
+ *   function, and then run drm_bridge_attach() in its
+ *   &mipi_dsi_host_ops.attach hook.
+ *
+ * - The display driver uses the component framework and is a MIPI-DSI
+ *   host. The bridge device uses the MIPI-DCS commands to be
+ *   controlled. This is the same situation than above, and can run
+ *   mipi_dsi_host_register() in either its probe or bind hooks.
+ *
+ * - The display driver uses the component framework and is a MIPI-DSI
+ *   host. The bridge device uses a separate bus (such as I2C) to be
+ *   controlled. In this case, there's no correlation between the probe
+ *   of the bridge and display drivers, so care must be taken to avoid
+ *   an endless EPROBE_DEFER loop, with each driver waiting for the
+ *   other to probe.
+ *
+ * The ideal pattern to cover the last item (and all the others in the
+ * display driver case) is to split the operations like this:
+ *
+ * - In the display driver must run mipi_dsi_host_register() and
+ *   component_add in its probe hook. It will make sure that the
+ *   MIPI-DSI host sticks around, and that the driver's bind can be
+ *   called.
+ *
+ * - In its probe hook, the bridge driver must not try to find its
+ *   MIPI-DSI host or register as a MIPI-DSI device. As far as the
+ *   framework is concerned, it must only call drm_bridge_add().
+ *
+ * - In its bind hook, the display driver must try to find the bridge
+ *   and return -EPROBE_DEFER if it doesn't find it. If it's there, it
+ *   must call drm_bridge_attach(). The MIPI-DSI host is now functional.
+ *
+ * - In its &drm_bridge_funcs.attach hook, the bridge driver can now try
+ *   to find its MIPI-DSI host and can register as a MIPI-DSI device.
+ *
+ * At this point, we're now certain that both the display driver and the
+ * bridge driver are functional and we can't have a deadlock-like
+ * situation when probing.
+ */
+
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
-- 
2.31.1

