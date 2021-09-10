Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5940698B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A96E9B8;
	Fri, 10 Sep 2021 10:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D255D6E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:12:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 367F62B0093C;
 Fri, 10 Sep 2021 06:12:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+C7OJe5sNIMZw
 mEGQnOoCPrkx3fLlGr9milBM2XXFQc=; b=xILZADf3Uvaen6TUX4iMahD2o8qPo
 QJYM6q6Y9BU2bIA3Swb3DMEVfGCK5Up1Vmch450y/cdgmUdhF2TW0pKxJDQitfjH
 o/yYafvAKLLmrQp1Y6sM7t9XctlSbViIAyJuqqXXU+06v9FFn6Degw08zYpu1H20
 PHXvsyjRyL376F1xlmZAtcmpY1QStxYkXfpUkVQDGLK0DVxNPeColj9rts+qASlj
 WYQaZyDSZGrCzcUZJiHraVR3On6g/iPBE+krWjXKwfew4/TovaGN1c9KQy4Ux9tx
 rJJ+qukX6OnhQ6ADQApCRsC9XrJBefnDeM5uao1OVwjdd/pyADgQX+Zxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+C7OJe5sNIMZwmEGQnOoCPrkx3fLlGr9milBM2XXFQc=; b=O72zPaDm
 nXVCboODbUw0RAvxMvJOjlzcnS5qF58LRU27dxd91zz3jooSLj+Len1Ld+OdTDNt
 9tS3JF1UhpIdH/y8hvPGCRU/QcIRAaViuAwlmYa6Rh4K/9NcDuBC9ADlUSEDdkir
 xJbjj6uFEcVZr21ORmKz0p6Nkb/ByVchlKyxqmJWrYjh6lzxYl6wUS4Q+TOXNV1d
 qZXed2km8gmdIJiEA79IP9kmrfDAcDC5zVQY6OWwaysX1JMmO9q4BTJKdZVeGO+a
 kQJW2bMD2WlLDakvoWYiFHrapMK7ZLeX24LZSOCzjndXlqXcxBfYWwrYqjThSVLN
 ZTJkc4PPydxnoA==
X-ME-Sender: <xms:jS87Yc4m1Cl-F4fl_HYeYxFCLcv_NBMQkJlfWN1zXpjPdun74Xf02g>
 <xme:jS87Yd61DxxZ38dT9P95KOcn8Ot35E-8SNXkJh6DKBi3TJTGrqSCfDskVEYbyP-jQ
 vidM3E41qeO-PIucmk>
X-ME-Received: <xmr:jS87Ybc7HjSfNDXX_EkmooEaTAEpuuSqr_d5dBpZXm5n1aRJbC316iPavVffP-miM6VZodHJbtCrPvCq520mRK2LVGVZ2Hcp5ZHC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jS87YRJDHV7JPNfV_0KI-0XwsnP8hMpfSWfMZeklkD8Cs0LvTySGAA>
 <xmx:jS87YQJ_kwnN1Ualjjbd5Vtnu6b7ctDlcLduzJ4ROqot4AAJehqYcA>
 <xmx:jS87YSx8p-qKQbzOVV1qlY-aZ9fxTR0RqhRQJAV6UAlf5edKAO_Elw>
 <xmx:jS87YfIul9MeNv-e-FKnE480dmVFqY7jKOBpfeKHlbCyGixEncKj75sc2HQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:29 -0400 (EDT)
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
Subject: [PATCH v4 01/24] drm/bridge: Add documentation sections
Date: Fri, 10 Sep 2021 12:11:55 +0200
Message-Id: <20210910101218.1632297-2-maxime@cerno.tech>
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

The bridge documentation overview is quite packed already, and we'll add
some more documentation that isn't part of an overview at all.

Let's add some sections to the documentation to separate each bits.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
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

