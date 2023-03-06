Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0B6ABD4B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCCE10E221;
	Mon,  6 Mar 2023 10:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872BB10E21E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E04F45C0085;
 Mon,  6 Mar 2023 05:49:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 06 Mar 2023 05:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099788; x=1678186188; bh=JfNzjXLO1YdKUgsAWm6X1NZ1YOgQ0xHf45V
 sHbsYWqQ=; b=H5r9NvJLWWQ5bGSZc+d85NschPha9CzrGYnwcRSyqoTkHCo2na3
 Ebk2wk/9qk6/+2vsgHYg4+spSNfIM6WS6Sb7ok2IMVuBmhWIhF+MfJj54uOcHCTU
 Pia5KK/orT+gtBXY/haztGeoyVO1clFXSwcjr/FsCvx0rgORUYfwUYkjPsTk8MwV
 1SGY25s/joyt/VlRchNEp083Toh8dLvKyhSyW189URGlFBvGFFbbZJs1vw+Y6yyE
 tRD5wtPGM9U249sa7ZuaxgRvDnAs/dZfWxDYrQbBwO6b8tpuMnpgBJsOmlAqvz5u
 gLevttPJKo4+xZ8Oy9JJt5jD1CLcsAzNzgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099788; x=1678186188; bh=JfNzjXLO1YdKUgsAWm6X1NZ1YOgQ0xHf45V
 sHbsYWqQ=; b=l0JOWEdouAA082Zqeh/2/d3wENTLIQBoWw57mjjtdt6wJJ2UOAA
 0xaFoeHjRyu9O6Vct2o8KJhcpKKgo/QbrEJjr8p11CYPAjQACa1YP+SQpT03ZNjk
 Farsda4SFPfHgZ5X+kRbNhoscidcf4045OnSwvWwOIrGXqmtdDEMm63c0tZdfrfE
 gbGlth+RdRObhIPg0IxTvHtJJJipzls08ENqQWzzIaAhJqiciTxEjkmBZJyoFNZM
 x4MtvGkMvKHHI7yMX4lSKEhR3PWq/NqdbeA1ww3ByQ3nUmInLffGZjzcW0+tQgMn
 qo5U9D5LmLLlqgb2MMgfhPuiD8hSdbmEHkA==
X-ME-Sender: <xms:TMUFZIR0xxjI4ONCFFvR9OGfIwC7U6Y3JA5Y4wmjStjRTuKvVlJ-TQ>
 <xme:TMUFZFxQQel1ROCIe1y5JV9NqdSUMKKOPS8RWZX1M0wE1Kju8smEZPoo3ZsQ9P0G7
 BF9JbB6NGt1duvgUbc>
X-ME-Received: <xmr:TMUFZF03MtPGT47VehbY4nlpfPtJTW4bCAFRwQnvoSH0RVQo9QOO6Lub0eyA8cY1YxLBl7RR_Gc008vTKzgdKjlGCuaBGag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TMUFZMCMvv6dkk2rn6yU4_ik-EPnBf2i6w7nu83cvWNudqhosvJC3w>
 <xmx:TMUFZBgy2iYZMBzsPxGGJ83hhskCRcpNKNvwHENSvsb8EpYpBLjwQA>
 <xmx:TMUFZIqA7xIVlLEcJxgeBZin41ISB0D4eHV-8NqBc88JYCvsocP3OA>
 <xmx:TMUFZKYSyb258wafLFIS4UyxLltJxXZMBenqaY2M09-D7yyWB4m5pg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:45 +0100
Subject: [PATCH v3 4/9] drm/vc4: hdmi: Rename full range helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-4-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LSMVyKlq7BMbrNWJnYkmXQAzNzyhLN8BWiELqi29aPQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6YXmvn2lZhdLo1yEa3e8b136b/JBadmPBV0ea4XE973
 MDq1o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNpWsbw3016UdTP7mXbJPs5z/0M3P
 d19V31EiP3b0eYZuw2LLyU1cvIcPKF4jHO14vaL9XNOFv4TmJp53s/K4HT5+apmiVf1KlPZAEA
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The VC4 HDMI driver has a helper function to figure out whether full
range or limited range RGB is being used called
vc4_hdmi_is_full_range_rgb().

We'll need it to support other colorspaces, so let's rename it to
vc4_hdmi_is_full_range().

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d23c0c3df2ee..f0d8da241f24 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -153,8 +153,8 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
-static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
-				       struct vc4_hdmi_connector_state *vc4_state)
+static bool vc4_hdmi_is_full_range(struct vc4_hdmi *vc4_hdmi,
+				   struct vc4_hdmi_connector_state *vc4_state)
 {
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -916,7 +916,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
+					   vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ?
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
@@ -1171,7 +1171,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
+	if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1324,7 +1324,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state))
+		if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state))
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
 		else
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);

-- 
2.39.2

