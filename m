Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138B3D8F26
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437E6EA6B;
	Wed, 28 Jul 2021 13:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0476EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C5F51580B89;
 Wed, 28 Jul 2021 09:32:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 09:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=n2kX7j4p1fO2w
 1C+PjBmTewZIHMsxhZO45DlOqT2O4Y=; b=FDX+ngQH8N4rCBmz4gqGHwPV4SW//
 9cXnitKdLnWUNjUANU/0DFSffUvHxRQpu8LPIzVWZEV4Hc5xaTgy80S3t+aW6OVy
 CX06IMDzhJt7QYCpMAopYm+oa0SfXDWWgw6hPYQL2cyCzB6sOxPSllqrLnBDCSNV
 yh0vlo/20ovtbzWJOojlhADKHYEcPNbSr5FJIWR6wd6Xr86iu182mkosLnFnwPIe
 BIOP2WGc7y+tKpH3b7r9qBtNcU7Mjw7xHn37Uqb2k/hOoRWnhFD9tChSFCxOUNUQ
 ujsfL5L9UJ0tQQbzI1eJ5hT5txpOu4YM9iWB+ud+JNsH1+wvu7+g8Qtrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=n2kX7j4p1fO2w1C+PjBmTewZIHMsxhZO45DlOqT2O4Y=; b=UrZohK23
 +Xzrh+zEk6e7cAJkwoDMY02R9L7aLmdkjcpfnHAgyElkn3FmDwNCr/R3p5V0JMWD
 6JwG0zGsa93g2CD/ZWpZcwIBB5zwGVbuEYaA/9ZZ34lG80WGdKgAmaysJ3UvQZ4n
 86gYyRAoPSHDuJwP7x7bfT/bLD0+rvFZVwSceucQQIeGVdTQNvspJ0Qx3rf3Jyc7
 ax/UNi48c7uvJTc4OfSTtA3APmg/Ot6CBE8W9S4QMQmdNoTyPI+9tVHJGD3VeNW/
 YUjbCZcOyiZdibbVdaER1yxgCtqdZW/+CmMmTYpzbT1ENwXBbaM+6OWmraQdCwdS
 wCF8P+NCpzahZQ==
X-ME-Sender: <xms:f1wBYedaNc1tr3JhtuA9cQd1O6dU1VNsWB1MOQpjf08BGg1kMLhCZw>
 <xme:f1wBYYNaTbaZyHhpef4XlGfHJYB8ijGnCwC6Eql4sdogLaIPZzEfdnnO8VJFMn9JZ
 IH43oenA-iQdrmIa9w>
X-ME-Received: <xmr:f1wBYfiTZSD6pIPy1LXu26wa3C2mpmWHay7sRqx3QmSEOcmwXXmCOt9hPPz10_DlxGsNwaGgYWqSZ3M9zsg1nfo5Z4EquMwWOL00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:f1wBYb88tMvujKTZ6Jt78M-m80KSgBMNnX4KARNOltZXpTmfO_LMTQ>
 <xmx:f1wBYas7qYi6e9xJYRSN8mWZJtbGxFiRL2qqpvsbaC4NvFxOlRPLZg>
 <xmx:f1wBYSGmNAgSI180mRY4lPKA13mqBXLqSfXCB-GPxvvMiCtu44MzwQ>
 <xmx:f1wBYfPyGZWhP3rY9xBswWamdwIBtjaPhLrTbCZ3D3wjZ6mYtELLYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 4/8] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Date: Wed, 28 Jul 2021 15:32:25 +0200
Message-Id: <20210728133229.2247965-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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
index 71d3370ce209..fd01f1ce7976 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -94,6 +94,66 @@
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

