Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060593F46CF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3A989C56;
	Mon, 23 Aug 2021 08:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907589C56
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 62CEA580C64;
 Mon, 23 Aug 2021 04:47:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Aug 2021 04:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=KsKBUO3lG+FM3
 9yfINbe2iUPMwOnbC++07AQ9VdZ274=; b=ey7F0dMdpZGDzHneJ1709hr5yM+H5
 YLnryZ8mUNxiqijNUepgJis45g/hK6hHciNoPoI7Bwkdht5k/WdqY+meIf7VDxE5
 VmqiCXkjaL4P9Nl8s4iehiEtFbTara6kb0PEnxDm7pKv1U3abfkfKS5S+DAAwBH+
 jENmdlk2GdZJpltMaFCWeR4v2pDtweh8yqXKAw4R6/kaNSIOnKuvLPXkGvIYuiD9
 ZYNjcIrSGSKV4BmAzkO83swjLzhZ+/UVzAYdzMH/OWWdn/+PJVAbYyxUIANMGZP6
 itkvln67SQ/CsV39mlz/r6eokKaIAfbxEfxvcH9DhZuERMRil9rl/jGJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KsKBUO3lG+FM39yfINbe2iUPMwOnbC++07AQ9VdZ274=; b=jAheWGWJ
 7mdKgE+L+D5fTb5EXFYTqUPQWKL+6oUlrzsyKqqUk6M3C+DA1xpi74H8MrqMKYRs
 VmSsdLzB7yZw16TFVrZEVpxeStQuPjdgzRUosfMLcAbuOEqmHTjQn7xfZ6DpV0Xj
 hsuuUGC/aZ5t8rLcssdmzjZGjNc/0Ix+khdJ1+MJnEclRn5r4C93mmBKl057Wllr
 gCwvf18YqNb2cs90z3F//PtuHAI9nWcW9d2IbK1Pjdd+KDByXvnvIWtrP4Mio740
 IiDhhl4Yo1vrMrRanpOBACUoXvtdga+mdGuSyD+18Kjkv/mxYC85f0IPWWst2cxM
 95Qa+4mwAZ5S2Q==
X-ME-Sender: <xms:pWAjYcu2yV9Q6vNmleGqS7o0EwhWAzgjdXqslsR481yGPDGTR6YpGg>
 <xme:pWAjYZdSN9iF_0GkfMXyeswTRhFTPuBj1N25KiBavspiEZHv1_mK74bOPcQ4kvMmv
 ztxi-UN-vN7H7z42_I>
X-ME-Received: <xmr:pWAjYXwsVtDaZdmrX2umAPYiLwwT6P2XzGanz5v3cBhxJJVzzliUMxdplRl2l97JVGbstFz-iShJnMsllwamZo3qm0AyVOPljqc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pWAjYfPE2-_Tlq_ol7IvoF9GyjdAVyJwmud25-OnYoqx6VSSiBqMjw>
 <xmx:pWAjYc_xzBldbWevV8sUVAyF0IN8xhPP0dDxzHB-755fxpyzA7iUNg>
 <xmx:pWAjYXWLPQtRaJIBeOFcXKGi2vBMTU0HE0vmexSJgObsVZvW_D7Lkg>
 <xmx:p2AjYWcPSlrJqMJgElhzKNjSrfU4N20itw_5cbUJIJgSVMi04UbgWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:33 -0400 (EDT)
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
Subject: [PATCH v3 1/8] drm/bridge: Add documentation sections
Date: Mon, 23 Aug 2021 10:47:16 +0200
Message-Id: <20210823084723.1493908-2-maxime@cerno.tech>
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

The bridge documentation overview is quite packed already, and we'll add
some more documentation that isn't part of an overview at all.

Let's add some sections to the documentation to separate each bits.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
 drivers/gpu/drm/drm_bridge.c          | 14 +++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 389892f36185..10f8df7aecc0 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Display Driver Integration
+--------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: display driver integration
+
 Bridge Operations
 -----------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a8ed66751c2d..baff74ea4a33 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -49,6 +49,15 @@
  * Chaining multiple bridges to the output of a bridge, or the same bridge to
  * the output of different bridges, is not supported.
  *
+ * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
+ * CRTCs, encoders or connectors and hence are not visible to userspace. They
+ * just provide additional hooks to get the desired output at the end of the
+ * encoder chain.
+ */
+
+/**
+ * DOC:	display driver integration
+ *
  * Display drivers are responsible for linking encoders with the first bridge
  * in the chains. This is done by acquiring the appropriate bridge with
  * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
@@ -85,11 +94,6 @@
  * helper to create the &drm_connector, or implement it manually on top of the
  * connector-related operations exposed by the bridge (see the overview
  * documentation of bridge operations for more details).
- *
- * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
- * CRTCs, encoders or connectors and hence are not visible to userspace. They
- * just provide additional hooks to get the desired output at the end of the
- * encoder chain.
  */
 
 static DEFINE_MUTEX(bridge_lock);
-- 
2.31.1

