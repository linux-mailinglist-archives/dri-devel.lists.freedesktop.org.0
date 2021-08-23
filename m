Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BD3F46CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6789CF2;
	Mon, 23 Aug 2021 08:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93589C56
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 15741580C67;
 Mon, 23 Aug 2021 04:47:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 23 Aug 2021 04:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=AAA162HvOKjss
 XLDsIaF5gFDavpFUxRYx2PLty6HBAo=; b=k8WfRqGCOYP1zoGF6B9uPl4bXnJyE
 gwLFHybQubwOCpHrgOvS/vG8yBpuUc9KV5NK8eMoOCh6eN8dIaovpToltv+Gx46t
 FT3GU9BUJqWoTzW7TaIqjMYY9awidgymAKw0hP48ZmO0LzhquYE80gqnKHGiPEi+
 TzMpZ7qsJpH/VmK2y8GTj8D5us1ONilw916kZLI+YxbcgO995N6xBkd9fO+xvrDn
 jbQeENukgi6+cZZjWum61F1rwj+FfnkXIAkTKCXvIrSHSuTrxWnLoDBwXfDlgEr+
 9ciZj/gsXk8GhMxpkGh49hcPrNyFO/Wq3d0791O1HPV9awmBec2L5UONQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=AAA162HvOKjssXLDsIaF5gFDavpFUxRYx2PLty6HBAo=; b=bINKokqf
 feK4LXTUdS34YYNSYXvye6yBBDBQukfXO2+spBvgOPrTNPOqifrNjmaigUWozyK7
 2zujyBRbYBtKrDZd0fLRNHD6QgubyfUzcW267qg59qQGA8heR8sdq3AncscsmrUE
 48+2JW9ab2Hn477x1iISq0+EZtlliIIau7oKKUZiuMTZKwFVNWDULAd2HCXEIP7z
 I3i29Y4gPfpZ+HnsKHVF4HKkghvvqP4lV4o0wx8WnY1jF7HrWV6ooedxCl0hY7TM
 s28lvdy3q+6zfDnLDLCG4zaI32pkY06eK+fQjBPjcdXU+fhMnGcc5J5zx2xjQ0nc
 wJnNGfZUnzak0w==
X-ME-Sender: <xms:qWAjYZCwoqMI7MMT4WnKRF6F-IhcVOWbOqgYmWF1WR08pSqBHBOIpg>
 <xme:qWAjYXipnMOLuRLQucyciCRZDdKK4CoFb44hol00ZslwiJYgsEMF7kC_YnqA8gK1U
 yLWvLe_NHmldo8-q-Y>
X-ME-Received: <xmr:qWAjYUlQ9ktprq0I2SCXh6AUGR1Wuf4intuebtOm74Kt1SzYwS4OuT7yZJrq4Sa6DSk4L7RFi3jvmRSoHFvXYg4DB2M5j2K3Z33m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qWAjYTwxMToEH2XeCV6svhwkMkSY6OaKO7UF3uXZLDuME6BBM23HuQ>
 <xmx:qWAjYeSiwaDhNQoCsuEfxazPkgOLDaa74IBJJWp-gsZO-1BY59R8UA>
 <xmx:qWAjYWbP4c0aWj6YAZIdefd1voqTmxTVmIjmvxBJSqh44aaLNNd7dA>
 <xmx:qmAjYYD_Zt8fUrU3Y6BnwcYWG4TWkoKvSjsYcrjAvUk3kJdLhFb4NA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/8] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Date: Mon, 23 Aug 2021 10:47:17 +0200
Message-Id: <20210823084723.1493908-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823084723.1493908-1-maxime@cerno.tech>
References: <20210823084723.1493908-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Interactions between bridges, panels, MIPI-DSI host and the component
framework are not trivial and can lead to probing issues when
implementing a display driver. Let's document the various cases we need
too consider, and the solution to support all the cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 +++
 drivers/gpu/drm/drm_bridge.c          | 58 +++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

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
index baff74ea4a33..794654233cf5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -96,6 +96,64 @@
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
+ * - In its probe hook, the bridge driver must try to find its MIPI-DSI
+ *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
+ *   to its host. The bridge driver is now functional.
+ *
+ * - In its &struct mipi_dsi_host_ops.attach hook, the display driver
+ *   can now add its component. Its bind hook will now be called and
+ *   since the bridge driver is attached and registered, we can now look
+ *   for and attach it.
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

