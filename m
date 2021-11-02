Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2544311B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B84772E73;
	Tue,  2 Nov 2021 15:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1A72E73
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD48458073F;
 Tue,  2 Nov 2021 11:00:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 02 Nov 2021 11:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OU2HD3rgFjPFq
 FMFWQFE8De0dM5d23O32iZXA/DHX5A=; b=Wc1jMORhtveulRCnB2X4/L4YpfVc0
 UcwtzSeRJ+ekutCmPJrdn8yPj/iBOr1yqpUML/Y7hns+UcXGSgeYYMj5H4Zy+gAr
 UM6UISYB+k/oUAD3k4HLEhEiKaOhawrAGumwjdVzVNk9Za93f6tgMGfrN9XqTdNg
 /uuM+ejSDuyeUiRE1HiuTlrw4uiGQ+M6B8Z8gVwZdWkNILmfisW3uegrup4ONsP7
 /dE+KHTLKfTq91iwpGmrCgGlX82PQoDxm6jiRRgzgh3bOf1rUu++Xg23WgDsaaps
 UXkdtsEGe85M+S4uqK+4issbdzx6UvgXKIiMpgHoMmVl821eyvHLJgTGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OU2HD3rgFjPFqFMFWQFE8De0dM5d23O32iZXA/DHX5A=; b=OjLsTFjS
 ChbTsK8OFxcRA3R81xWZjvEmbsWSuFVL2TdHvnAiM2ShoJVdA9zS83zm0DTR6m1Q
 4YZyxjrolZfTDTH7N3H9vCmxrZ6UedeDuQF5vddG/3ZhaYag8gmbCLHFd5uYVYU/
 UfRtCndy2ptiEVS466614rTRxO590cXwrZJuJSvceHZ88SfvBzLV54iZlOrO0ul4
 zgBy+yTCg/K5hq6CMie1UzIy5AqUwNizStiXMPyIU1Xs26SRmZ8NUOu76KGmZlny
 4rP7IMobPh7Y2nwAqXSsY4Oim3Bj4on0qrDhiN9Re1TFzsPTNx1SjMwamqtrsSu4
 MhtMKgaQtkEJqw==
X-ME-Sender: <xms:cVKBYZ0_Sx0PeUC5n3zYvpdJHSuqZrbQALd-8WfZFRtqO4Gs1Lt0Bg>
 <xme:cVKBYQFA4yYjOE01LplvHkEUfnk4advRzcBJJ3gGyLg8322jxcfX22eKMdkNFzGNb
 yw12Ek5pVJCW8PpJLc>
X-ME-Received: <xmr:cVKBYZ5-j5Cl5A5Lzf9wI1SkHFZQezT6Cdql-EVYM5RLK_VHKZRzd-BxRdrwyaYXhOWjOxzPLLyME2auMKS8zurSBSalXAM5DJG3GQ5z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cVKBYW1JZnssF6padfGQrblt7OLUAnrNBdz8gvAM1oDBA4r2_AVaUA>
 <xmx:cVKBYcH1ROMSeFg6q0wjgiwnFNR-Z6mRvfRZGlqLORJ_9HwQGxahUg>
 <xmx:cVKBYX-l-iV_P86frNLePkLqcvHrGIUi5EHshFY9piaM-9tDvZ3Bsw>
 <xmx:cVKBYXCfBGQO4HWG4nnSAfL3Um5WUzDJvVrOBoJt9io5PSrLIRu9eA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/13] drm/scdc: Document hotplug gotchas
Date: Tue,  2 Nov 2021 15:59:36 +0100
Message-Id: <20211102145944.259181-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's some interactions between the SCDC setup and the disconnection /
reconnection of displays. Let's document it and a solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_scdc_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/drm_scdc_helper.c
index 48a382464d54..033a9e407acb 100644
--- a/drivers/gpu/drm/drm_scdc_helper.c
+++ b/drivers/gpu/drm/drm_scdc_helper.c
@@ -34,6 +34,19 @@
  * HDMI 2.0 specification. It is a point-to-point protocol that allows the
  * HDMI source and HDMI sink to exchange data. The same I2C interface that
  * is used to access EDID serves as the transport mechanism for SCDC.
+ *
+ * Note: The SCDC status is going to be lost when the display is
+ * disconnected. This can happen physically when the user disconnects
+ * the cable, but also when a display is switched on (such as waking up
+ * a TV).
+ *
+ * This is further complicated by the fact that, upon a disconnection /
+ * reconnection, KMS won't change the mode on its own. This means that
+ * one can't just rely on setting the SCDC status on enable, but also
+ * has to track the connector status changes using interrupts and
+ * restore the SCDC status. The typical solution for this is to call
+ * drm_atomic_helper_connector_hdmi_reset_link() in
+ * drm_connector_helper_funcs.detect_ctx().
  */
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
-- 
2.32.0

