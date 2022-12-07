Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF1645E68
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CE910E3E3;
	Wed,  7 Dec 2022 16:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD10F10E3E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 326A15C0154;
 Wed,  7 Dec 2022 11:09:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 11:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429358; x=
 1670515758; bh=aU3+SAGNsaXTIACYBbikYt5EqyP0a5oCez925jVkFE4=; b=J
 2ChyCnA2225kuUEj6xBgak1VxM4FF3b3EAwTiuRS9A6ffLxm2Jg8o//EDv+/dExx
 579xkMQVm5XtCZgZqCXAteYeKtFJ7Q2WQQOhg+QISpWo9KNNEk4+7Ksq/1oCfgOq
 5BHQi7L1iF2s9Bd0GM7cAEBSVGAp9jyzWKGNq2vMWRD8P/bukehW7z/6AGLP12dw
 bMAQ3y58vJ85ier0RMKuewR+IgpJvlsg3fN3ZpQMpMc3pHtFdOD/t+kT7Hq3vO0y
 qfU71BSNDerBcAHMHUrL05wDemPAReHG6wUE6jOH/pkUmNoDI9qH0Vee/xmTGfPV
 AmfXBAdr7U+sr8Su22UGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429358; x=
 1670515758; bh=aU3+SAGNsaXTIACYBbikYt5EqyP0a5oCez925jVkFE4=; b=d
 VCvYLmSr9I+7Mk70730rJXmpEHXudXrNEFo35GtIxKnxJVob4qO3uoO3JZUmSAc3
 hPGfwvBXEJDlLyZ5x+Xvr/QfUnQGnM6xxcRPT1WE2bHn4/itfbNNENAr1YwV7WxK
 MhIoLBhWES1j3cOOjZzCTzrczBF4ou88B6plZNA0b42o2s5N7c/bXpPY3DLkxaGv
 VMtcNkS23a9mkLdvlIMSWn30FUCPrUCm11DTGtqLbjWzqDRQB+BTyolRAmIXEoh5
 o9XKm9sKYCdQKGTqhPbT+45Vf3x9i3CJd4XqKloC2t8fpYhBdGBoconDChWLUynE
 3Cmiefqccfn47qou4zD5w==
X-ME-Sender: <xms:rrqQY3Ww61bHgvxxTDRXGl_MZEK7HGDCU1jhUlhJ9-GtRIvgT_obUg>
 <xme:rrqQY_lbtSwce4_A6g7FAjV8k4JGHDANRbF4zKSn0ZarJ7zGZs4AlKCKsU2HkeAf1
 lNKXWA4u9glplQ1o44>
X-ME-Received: <xmr:rrqQYzY3xqhtm04ySli702ksyyftLqmq28RoNtMFwqQGLbSefYwxSu31zmuGdUNab0ME3Pt0selkL5LbdVhxd2tRardosk4XFeHtBlWn5piaww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rrqQYyVyq_CIvm_8FTe4m5PIU7vYeO5KfIbAI1kN2nYaGuM4G8ZHJw>
 <xmx:rrqQYxmc7A3rkH-C4wOttZiVtsvOJO2cSMBLzVgtz2UHnjq59TqKgA>
 <xmx:rrqQY_eI75cAplb13LRi-hVcqSXsuDAzZOlhEPQdeG1bNZPJacLFIA>
 <xmx:rrqQY29ta275hHytQOdQpEDpRGjn-YS6shx_eBE9LMs7TVGY9cEJUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:50 +0100
Subject: [PATCH 6/9] drm/vc4: hdmi: Swap CSC matrix channels for YUV444
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-6-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PjOw181ve0z7NoRfNls2DdNyUoLxdXweXksOmPbbBG8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgWp3Z8faOn3KUxnnUda5jPha3pPXx+9HHJ8Q8y0+Wtl
 exfv6yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEZvUz/C8rkLhZxr6mOu+K9gXF5x
 Gh7rf/zBfe4H7IqfDwh3k+dtsY/teWXvksp3W3O/eVrrJ6wvvWGpbDLPNcnywq/iTGUmC/ghkA
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

YUV444 requires the matrix coefficients to be programmed in a different
way than the other formats. Let's add a function to program it properly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 299a8fe7a2ae..cb92d07680f0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1259,6 +1259,20 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
 }
 
+static void vc5_hdmi_set_csc_coeffs_swap(struct vc4_hdmi *vc4_hdmi,
+					 const u16 coeffs[3][4])
+{
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
+	/* YUV444 needs the CSC matrices using the channels in a different order */
+	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[2][1] << 16) | coeffs[2][0]);
+	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[2][3] << 16) | coeffs[2][2]);
+	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[0][1] << 16) | coeffs[0][0]);
+	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[0][3] << 16) | coeffs[0][2]);
+	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[1][1] << 16) | coeffs[1][0]);
+	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[1][3] << 16) | coeffs[1][2]);
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
@@ -1282,7 +1296,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
+		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
+					     vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:

-- 
2.38.1
