Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6A419891
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3D589DBD;
	Mon, 27 Sep 2021 16:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1289DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:11:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E552B3201C6E;
 Mon, 27 Sep 2021 12:10:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 12:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=OtsVThTQiVGXdpFZSDZtAk8j24
 rGRsiJqNTfaB433c0=; b=Ju7UG7C4J6vhrcdKRCGwLKSssbKGbM+HCG668r0EE8
 FjNAI6kI0UZxfoBsSJodRJVKu9OXuzn1cL6icTfBzd389qgCiGrQA0T6C/IEA6Z3
 JqA54dpX1nYkhJg/6kinPHrIkMeHUFCphnwg8kATzI/gIWo+5xe/c1WCARwuaxnb
 gGzv0kW3czjtuS4gn1pr+GkJKQjAUsDWaHwDiFuI63ViyjyrBSlsHqZKixIH/DjA
 jbd3sItt0zSdcdN5fzPhO8EQHKy4grF6d43LSFbApanJkQnX5T1fY1f2qLVgUKCH
 gSmBfnSNMcZsWEYq5LMeJ6Gu4tbTwpVrXEEFFZkoljjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OtsVThTQiVGXdpFZS
 DZtAk8j24rGRsiJqNTfaB433c0=; b=iCFqD5eTwbx0LJgAk/IFz14My6bBDaz2w
 K7fs/Ryp8votpWutHpaP1mv/BAwuNYy7H9fPY2cN9gDjWw03W9XqTf4+saKUTpPw
 IdfKceW1Ok8Miw20x3Qfw7TZ8IQmK7b/2bHi6u8DG2d6Qc1LyJIK+IEt0r97A4Yh
 pNRMZJywhS0Nni/0XAErTK62ZbU38c7F+Yo0kJPYjy5GP7wbcSkc57e0cL6Gug+V
 rZFdNfJAb8dRhKdnGDIU/Ureu/yRO5AyFETeGOX8S5SsSlH0+uyxiBEk4fNbNyfH
 ux132/ZWOpvBxl3tsI5FeFoXwxwIksvdoPJI4n6wNYZixdlAy/yXQ==
X-ME-Sender: <xms:Eu1RYdcD_MrWrnPBiOWbZPn5pErhUf8e-TpzYndYPXCpm8r6G-Bwog>
 <xme:Eu1RYbPo6hy_ThHjDi86Mw3LPXmdCk9iexDRPbfhuimHzRL1PHN9ZoRvVGjw9iAur
 TMuaEda7836yFeKHMA>
X-ME-Received: <xmr:Eu1RYWg-ehMPCEQa0xsE7PFg5tgufTKRRJUv4XvKECMvV39sv4zQ8hPxqUJMzMFglKqbS_DEjqMPtucLPqgpcyJJfvTHLxwX7-7XDV8B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Eu1RYW9u4RuLZZUZTdb-2j4FoEHefWTGOOAUcB61XD3vcmzjwmfUAw>
 <xmx:Eu1RYZuDy7SFGuoSRW94Fk_hr6owtGmxHlcnZl4dEriC6WJQFusAOw>
 <xmx:Eu1RYVHnrhDy6VPV3c58EOjPdRwFFOan4W6aZOCSzW8idRs4XEQo3w>
 <xmx:E-1RYTLh3EvnNTcPlTEL1m4DMkfA13lCAnp1KRUAzHj6J2SECmr1pw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 12:10:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scdc: Document hotplug gotchas
Date: Mon, 27 Sep 2021 18:10:55 +0200
Message-Id: <20210927161055.529050-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

There's some interactions between the SCDC setup and the disconnection /
reconnection of displays. Let's document it and a solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_scdc_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/drm_scdc_helper.c
index 48a382464d54..12e09fe8c8df 100644
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
+ * restore the SCDC status. The typical place to restore that state is
+ * in drm_encoder_helper_funcs.detect() or
+ * drm_connector_helper_funcs.detect_ctx().
  */
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
-- 
2.31.1

