Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF63645E6E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D74110E3E8;
	Wed,  7 Dec 2022 16:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53A210E3E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AB795C00D4;
 Wed,  7 Dec 2022 11:09:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 11:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429360; x=
 1670515760; bh=VANsvsLz3xnVIYxpgJjZLKq+5JcSs2mZ7cYzZ7vM/6c=; b=b
 H2bT59MZI6UEavku6zf6hrDgDiCyinlPOlRsZe4isagAWVAYOqMuVoA5trznEEfk
 Yv5YMmC7BxJq/PJ/8PHQ7CbNyktc3SXgcUmad+B+WO0ZFt9KwWy4eIA2ijObjQO3
 RN5wcwymOjc2pa9h96mktqAA+a5l8rVR9knwpCzE9lgyOV6QrodzzSbEgxXRHFqD
 POv3XE6c9K2dVZCo+GsPBEFLhHuWp1JEW1VgpYzS5O9zGPuRyXE2cFlZG1iq8p7W
 8tJD4VsJhr1vp/ZmBz/MI/yvw3JzzDSCFnG5jlxAMkuWKb9KA875BCju+lU+yqA1
 uSmYZKFm+ogNniC4c3nEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429360; x=
 1670515760; bh=VANsvsLz3xnVIYxpgJjZLKq+5JcSs2mZ7cYzZ7vM/6c=; b=O
 2ESWZHo5gccbRd1u91NFcyZrreNEK44zT4xL7c/vgtI3noUsGVh4FFrOqOK4iw4r
 7sMcHiLx19IFbUGGb12AQzzM1isX/jrJdf/zTs5By9dClA2WG6ulcR/lDO8BYhBX
 i2HMdsWPpulBs9M79XIZaVY2cC/XYwi7/SBEXUSHRcecxBKr0yC9jxRWL2RE8iaq
 WT7ux3SvSvzewG60o0ROFbATt2af1Tw3JmytnNXbrhvH/XKM2QyyPM7BdaFo0J1K
 C88+UfxNaySbBqR9J+LQL++5GH/pUWiI2IeBekQyP4wEnDJ56+30oRvfUubNyoco
 377qr94WVuTUdUQ0zb/tg==
X-ME-Sender: <xms:r7qQY2u9wqZD4MJWNX1B_LJy3zFiodWj7oQLu4eQPdtg9tVB6EtQ8g>
 <xme:r7qQY7fksqeAnM_QDBGAuUbVwH4sY_y1-CPJF8r8hoAS7jFePQJTaZBy2IqYyHAcK
 OaFy4IsLrM2b-GN7ZA>
X-ME-Received: <xmr:r7qQYxwkvKJUau5bqpsuUolzucn0t_kYSbBEf01GuCs9dMvO8pm4LLWRpbpOiLqGuM5Ej2FC8q0FLxFwgMIZfsbeEznnb8Yp0BfSO1GLFtbmag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:r7qQYxP0PymQmujeuYUph-x88hLr87jabusJvt7L1LNATIGtrG5QuQ>
 <xmx:r7qQY2_CS73_S4i2YiaNuu-GO-e3emePE2XwpcuVVWekFLxJ03ChnQ>
 <xmx:r7qQY5UfLKvBM05VTHMZ33HdctcEzQME3PxgQnPjiqmVYvJ7BB-X2g>
 <xmx:sLqQY6W8_4WgT9-Mr1gXqtkP2iNzDZU2e3b_uE-V-tLSAmV_ZRKGCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:51 +0100
Subject: [PATCH 7/9] drm/vc4: hdmi: Add a function to retrieve the CSC matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-7-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xAmnB0avYsRh5WF1+mP80EaoZr0FJhVVGPCw1ocrG8c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgWvVm95c+vmnI//4vpjc8xXb3r8+8PdA6d/q36Kd7+w
 a7qNfkcpC4MYF4OsmCJLjLD5krhTs153svHNg5nDygQyhIGLUwAmIhbA8N/9Udiz5eYmvtO2ybVPuv
 KJg9nr09F1EpPWL/DN//hrRf5jRoZ52x/cMt1+WniHlCxfb7rHnj/dT+7O+6q0dfHrwmPqX1lZAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The CSC matrix to use depends on the output format, its range and the
colorspace.

Since we're going to add more colorspaces, let's move the CSC matrix
retrieval to a function.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cb92d07680f0..cd6775429b5e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1273,6 +1273,20 @@ static void vc5_hdmi_set_csc_coeffs_swap(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[1][3] << 16) | coeffs[1][2]);
 }
 
+static const u16
+(*vc5_hdmi_get_yuv_csc_coeffs(struct vc4_hdmi *vc4_hdmi, u32 colorspace, bool limited))[4]
+{
+	switch (colorspace) {
+	default:
+	case DRM_MODE_COLORIMETRY_NO_DATA:
+	case DRM_MODE_COLORIMETRY_BT709_YCC:
+	case DRM_MODE_COLORIMETRY_XVYCC_709:
+	case DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
+	case DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
+		return vc5_hdmi_csc_full_rgb_to_yuv_bt709[limited];
+	}
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
@@ -1282,6 +1296,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		conn_state_to_vc4_hdmi_conn_state(state);
 	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, mode) ? 0 : 1;
 	unsigned long flags;
+	const u16 (*csc)[4];
 	u32 if_cfg = 0;
 	u32 if_xbar = 0x543210;
 	u32 csc_chan_ctl = 0;
@@ -1296,11 +1311,16 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
-					     vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
+		csc = vc5_hdmi_get_yuv_csc_coeffs(vc4_hdmi, state->colorspace,
+						  vc4_hdmi_is_full_range(vc4_hdmi, mode));
+
+		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi, csc);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
+		csc = vc5_hdmi_get_yuv_csc_coeffs(vc4_hdmi, state->colorspace,
+						  vc4_hdmi_is_full_range(vc4_hdmi, mode));
+
 		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
 					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
 			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
@@ -1312,7 +1332,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, csc);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:

-- 
2.38.1
