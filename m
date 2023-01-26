Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D567CC97
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564EA10E8F7;
	Thu, 26 Jan 2023 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2A10E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 052935C04A1;
 Thu, 26 Jan 2023 08:48:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 26 Jan 2023 08:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740889; x=
 1674827289; bh=XGrEKHTYz6nA9/VAaFVxHfP6prEhOr+ugwbRh3H9DB8=; b=q
 sRkxsVHnZQdJEPBCRV7BwtU3AHQaAxZN/7ExVxlCjtdRfqrPT7kIFHCqyY/D7E5r
 vmQfxaQwfB48skcMyi8OmkwqDX/eChaEBwl82Mc8/8U+x+9+nNiW0e9KL3+XYbI3
 IbIkQL5CGAVphwU0El+vR104QP3o7BaGRwuM2ofs1d5TF3Y50wU2Y0O7CbNem0Q7
 t6EJhikLCU7w6xRSglDDxbnZPp9qcPlfN/77FnGULIgQgkeSfuIYI0J+v7hN+LVZ
 n4yDWso63Mr9a8aIGMGoviYzdXc6Ea3X3qCm89C26SQlDp9hMGV30/06tfp+MjFS
 820KfRmWvJCYYx9IT1mzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740889; x=
 1674827289; bh=XGrEKHTYz6nA9/VAaFVxHfP6prEhOr+ugwbRh3H9DB8=; b=B
 1NoyuJSMcYNmNIw1+73Q8cKD1Uk8cQNU107nW6Ss0uaIWQBogLb4YUZ8JZhM26D/
 0Y9MgoKv5GqNz/ITNNtBaN/Vmhg5FcdYO0auzJvwStk4oH8zsfA31vII+LL3ogFh
 j0PZ0NTL0p2kHpRXcvnfXY20fwHbvZBlD1uMD2CpNCDewRoU/mSMcj0eptatMPk4
 L9bhr4shOlPStZFgo1hRhz0nsJAYMcpOefgZWmWIkqRWwleEiCxiWmjq1lh57Phk
 9pek6ThYosmPrqb5Dk70VrhlOSfOqkYRa1Ru3YiJl7zJpcKpjjksgjoIbbOLN+xa
 L8F3P6lLC1gaJbuB7cflw==
X-ME-Sender: <xms:mITSY9TeiVz8owwlsnHBl7HzFUrFZa8oeJGTTUiVaoIdxXM0_BYJzg>
 <xme:mITSY2x0TNDf3SUTYewVkeR8BW-9dSY3LmFbXbx5kA9_95LVOo7MsrFBbqapPz2Aw
 Qtgmlo77f814FzdJSU>
X-ME-Received: <xmr:mITSYy3yFlSryj5U7gAzRHUCb0gfQSB7y4J3vrLpNZ3efm2rO41uDlvpQ4a1U7tqBUOx-kicFwWaUKH1OfpbyFAoQU8GpDOUZzPSQa-5ylIaqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mITSY1D3uPfimnSaBO-Bn7btRk-qRI2v-hdV2dtZnpp73NLPpHuxVw>
 <xmx:mITSY2jx9kFPxsb0Uu6VWyXmfyw81Fm6Aa9IFnJ1ihHqdmZK-63O0Q>
 <xmx:mITSY5rVzi-gA3vNHbPP3BamHZuo2vvi1vfCjixPbEza9cujx6XgDA>
 <xmx:mYTSY9RTaw0KUX526RRtea1fFVTqiwfFsjcHS6MRfQY0WF7r_6WgeA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:38 +0100
Subject: [PATCH v2 4/9] drm/vc4: hdmi: Rename full range helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-4-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=d2aItoeUC/s/UiOJC9dEbNXl2/8BxfR9KuTFFgdahVI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlz26iXb7/d16MypUt6z/RvD2ZqMtq+X9H03a3xYtir9
 XfyXjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykL5OR4dnlqcXn38yMcpfXXmjtd2
 I2y7SeTNn7TNNi5VIXm4o2tTIyTJmY/eusoKRfEvuzbLes1Smhnx68ShFvWTi5UXBLQOg8RgA=
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
index 78749c6fa837..e5e7fe4c6a63 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -149,8 +149,8 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
-static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
-				       struct vc4_hdmi_connector_state *vc4_state)
+static bool vc4_hdmi_is_full_range(struct vc4_hdmi *vc4_hdmi,
+				   struct vc4_hdmi_connector_state *vc4_state)
 {
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -912,7 +912,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
+					   vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ?
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
@@ -1168,7 +1168,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
+	if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1321,7 +1321,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state))
+		if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state))
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
 		else
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);

-- 
2.39.1
