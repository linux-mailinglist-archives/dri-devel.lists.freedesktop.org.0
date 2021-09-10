Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72940698F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370076E9BB;
	Fri, 10 Sep 2021 10:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2976E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:12:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 103372B00938;
 Fri, 10 Sep 2021 06:12:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Sep 2021 06:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bC6Qg+WSUjJuy
 8/H41PXAgS7iT5lIcAqR3nnFPZQTjU=; b=A0jde9XNNQM6+JV5JRvXJ+djXGhLu
 n6Kav7Tksk8vlm7ZkrQiboBGg56Jz+mwTpHV6Xi2s6wkq0tS7PJtZxefeFpitXvb
 2FhLx50EEoDvrqkSdzC8eANCbJJGPaS/ki1uQFnP4RhZQYiMaD6DU4ndyWgQsmbj
 K/ogPtpU7hwgflVFsA/BfSSxGv/0PHheOIA5YxdCX1RGeXiPZaOH2rUh5yQ7x5ks
 Ps64kUpYlOSktFTG4e/1E4UGZcaZdxAGdllGhGIUgljXPGSmokKDOvIVosekUbvR
 cUSw79/Uj2nY26cf/Vfrn5J1cIMZy3F9uuCZgjNFja+Vl2oJai4EdLAtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bC6Qg+WSUjJuy8/H41PXAgS7iT5lIcAqR3nnFPZQTjU=; b=XdIeHopA
 K5yvJ9Nnt7og/15uywzWq1AJzkzerNxMQ01HRBJVKqqvNPZV0IeKglCToAP6GjDj
 4rpDHRTmDWePu0Ex/Ou054Nhurb9W3iP/OGON9h7cn751nvTTqCyicpncXKZlMzG
 F9N04TgqHkp8gUI26/lE9WWampqwCLVuQfPXlGWs39TvSMg3KZUl7ecKoZRy7gS/
 It2Vnkv59sLoU3zhpvcbGQJGCDP0Fxn3A2t9hXaoTa7q64TB/WYaFKMDg5YhOR1+
 Yhrv1q31TOq08bEpIbln8iFjop7J6tTxRjL/8Ri/eza8oqTlYc72ExHC2Bb2QKpW
 A6dJESrX5hygug==
X-ME-Sender: <xms:ki87YVHRC3yXf-N5bR_bjvn9s8oSl35xoSKc2qnwTxetlHGguMkGxQ>
 <xme:ki87YaUBueuMDzN1n6va424Xgitn0hckWPxMmDjzPIbUqagw_nIbownEaC79mgC9w
 ua1RWBM9tKED_JztOI>
X-ME-Received: <xmr:ki87YXJJvCYUZgp--o6OjogUMgTKwxjjsscxqTz4t4WJw63I54gMafbvylwagPh_zJw5L1p5hzdapd1GTOU9rI2CnRNluEIPVQd4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ki87YbEdI34NBqg7QQzLgN1hCB7h2ov1HVA75_C7Iz8DEyYJIiOjXQ>
 <xmx:ki87YbVuEFtVrdexrdd0upi9SUCn3vqTUykrHU3d_ik7wMWiS4aHIg>
 <xmx:ki87YWNdOA-3RdkFDvOt_pVKGHyvXosFQwZfA1QZFXFZU2jB6TyZ0A>
 <xmx:lC87Yan3G3gEyA1pN2ABBqgpnXMYnFN4BkgFJv0bJdP9pQWIQjtJXqCs5HU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 02/24] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Date: Fri, 10 Sep 2021 12:11:56 +0200
Message-Id: <20210910101218.1632297-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_bridge.c          | 57 +++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

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
index baff74ea4a33..7cc2d2f94ae3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -96,6 +96,63 @@
  * documentation of bridge operations for more details).
  */
 
+/**
+ * DOC: special care dsi
+ *
+ * The interaction between the bridges and other frameworks involved in
+ * the probing of the upstream driver and the bridge driver can be
+ * challenging. Indeed, there's multiple cases that needs to be
+ * considered:
+ *
+ * - The upstream driver doesn't use the component framework and isn't a
+ *   MIPI-DSI host. In this case, the bridge driver will probe at some
+ *   point and the upstream driver should try to probe again by returning
+ *   EPROBE_DEFER as long as the bridge driver hasn't probed.
+ *
+ * - The upstream driver doesn't use the component framework, but is a
+ *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
+ *   controlled. In this case, the bridge device is a child of the
+ *   display device and when it will probe it's assured that the display
+ *   device (and MIPI-DSI host) is present. The upstream driver will be
+ *   assured that the bridge driver is connected between the
+ *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
+ *   Therefore, it must run mipi_dsi_host_register() in its probe
+ *   function, and then run drm_bridge_attach() in its
+ *   &mipi_dsi_host_ops.attach hook.
+ *
+ * - The upstream driver uses the component framework and is a MIPI-DSI
+ *   host. The bridge device uses the MIPI-DCS commands to be
+ *   controlled. This is the same situation than above, and can run
+ *   mipi_dsi_host_register() in either its probe or bind hooks.
+ *
+ * - The upstream driver uses the component framework and is a MIPI-DSI
+ *   host. The bridge device uses a separate bus (such as I2C) to be
+ *   controlled. In this case, there's no correlation between the probe
+ *   of the bridge and upstream drivers, so care must be taken to avoid
+ *   an endless EPROBE_DEFER loop, with each driver waiting for the
+ *   other to probe.
+ *
+ * The ideal pattern to cover the last item (and all the others in the
+ * MIPI-DSI host driver case) is to split the operations like this:
+ *
+ * - The MIPI-DSI host driver must run mipi_dsi_host_register() in its
+ *   probe hook. It will make sure that the MIPI-DSI host sticks around,
+ *   and that the driver's bind can be called.
+ *
+ * - In its probe hook, the bridge driver must try to find its MIPI-DSI
+ *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
+ *   to its host. The bridge driver is now functional.
+ *
+ * - In its &struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host can
+ *   now add its component. Its bind hook will now be called and since
+ *   the bridge driver is attached and registered, we can now look for
+ *   and attach it.
+ *
+ * At this point, we're now certain that both the upstream driver and
+ * the bridge driver are functional and we can't have a deadlock-like
+ * situation when probing.
+ */
+
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
-- 
2.31.1

