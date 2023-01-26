Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82267CC9E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8E10E8FA;
	Thu, 26 Jan 2023 13:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D7D10E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CD235C00DC;
 Thu, 26 Jan 2023 08:48:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Jan 2023 08:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740894; x=
 1674827294; bh=Yl2QMeY1R8uRwnchXZuSN5eN1rTw7te+NweGsXybA0g=; b=P
 wqCok4Dha8guYh4eIa2TrUT3AMqMXCY+5z02eJsBN1zKKAZYnzgJQDzjBfu8gTna
 Af+qg54TtyrHl3xOGsxuuyQop5jEjrTjqs1MSvt+ogNL0gc4+LmFMi7ApArhminA
 wLbKU+WUy+lHWni3VD5YteoPwn/25NHqMtH6sbCEqmakgYhUBNZfZ0H/pHojnk7k
 PBOhlAkg+goIVEmIfZHzG1e4U/0WANd8DAZDDMe6NJTRhDU3ZTtEwaL1rEzi6Ksk
 OgRNLKIB9f3cukZ31v60u+3cCmCw213VpIdh09bbv5ogm1phMObtzoly0tC/FXn6
 +pR+d5ujqaSxa0M3P84aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740894; x=
 1674827294; bh=Yl2QMeY1R8uRwnchXZuSN5eN1rTw7te+NweGsXybA0g=; b=q
 ZIHES3pXmDKIxROQAbveYBvbwr9zlrhUCcPAGN2zgT9Bqp3aO2iC63bIu+5gN7Q/
 /vU1J/guTIglLbqTQUouTskcKfbj3Ln/F3o2Pq4DTXybekZuJxIWzCsXx0QO83g2
 hs45q8poRqGmamh+oZjrwvsRbL3IX24YWeNSYu2BtUuRv1z7mwbsrDQ1eNTGnyQR
 T1Qehg5s+75kefWNQF+26xwHs7yQZHfKO9xy21OqZNRhriR/23SXVHJ9rPI4e0JV
 /Lw4x+xxciQ9dSL1QwNTvzxRaGLETKLcIBeEgi1Ok/F2t4MXcEWHdPrfUz8d84+O
 2TA4mnGBL1cO0A1UYnxcg==
X-ME-Sender: <xms:noTSYwguundPmypPlUgs_xt1lHoObz_znryt7HrSuyKTHqw1Nfz-tQ>
 <xme:noTSY5Dl9uYbIxlPWzNJcvO30an6FdckrPFO2gnqTPQ8tMWx1PJUw87LIQLTLdS1j
 rb4dqlc4btdvENQZWM>
X-ME-Received: <xmr:noTSY4F2f6HpVxMNQa9kguccyugXyr8Lj5sXPPRFBwv3guIyPKeOlzR5WwxYcxmtofDO_lKlvU0TsPoTGzSV34cqj5ht-rVCBuovHQFRW6KnlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:noTSYxTHjKlO3a1Z0c5oEU8yqYHXBZbXKUB7Dsz023jnjLBrgG83pw>
 <xmx:noTSY9x_gMaJUcDg_4U8IYjnUz3wpqitJMXeLOiDzp9UF_q7VU1mZQ>
 <xmx:noTSY_60TB8kSxmnqfuqFOJ2EZMGt1vp4T3Ziy6FhoIqyDn2W6zKvA>
 <xmx:noTSY6jrDDRY0QeaDDXOiPgSvOKPfKTe7YDERXtWpsCikT7ilgXD5w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:41 +0100
Subject: [PATCH v2 7/9] drm/vc4: hdmi: Add a function to retrieve the CSC
 matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-7-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=R4yRhw5Ff9H9FP1UiW4FWLDooLnHV7Z/0sgvtIA1QW0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlyKBEPMuNS52ZbZ9VYwMx2QLcvPuO6wd7nfdgtRoe+b
 N8/sKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwER2bGZkuLLsaqdDbeKmlJ83eeYsiW
 aZEjMv+n3+tHWzzp0ye67SNZWR4fri38etzk6b7sM9Z+LK0v/yn8oZTb7t2t3fbP77oargHl4A
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The CSC matrix to use depends on the output format, its range and the
colorspace.

Since we're going to add more colorspaces, let's move the CSC matrix
retrieval to a function.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 53e4afcacc6f..c74a01f97de5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1296,6 +1296,20 @@ static void vc5_hdmi_set_csc_coeffs_swap(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[0][3] << 16) | coeffs[0][2]);
 }
 
+static const u16
+(*vc5_hdmi_find_yuv_csc_coeffs(struct vc4_hdmi *vc4_hdmi, u32 colorspace, bool limited))[4]
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
@@ -1305,6 +1319,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		conn_state_to_vc4_hdmi_conn_state(state);
 	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
 	unsigned long flags;
+	const u16 (*csc)[4];
 	u32 if_cfg = 0;
 	u32 if_xbar = 0x543210;
 	u32 csc_chan_ctl = 0;
@@ -1319,11 +1334,14 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
-					     vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
+		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
+
+		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi, csc);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
+		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
+
 		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
 					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
 			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
@@ -1335,7 +1353,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, csc);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:

-- 
2.39.1
