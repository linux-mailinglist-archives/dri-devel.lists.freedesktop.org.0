Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B55167D2B8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D7010E949;
	Thu, 26 Jan 2023 17:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07110E949
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:09:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AF9605C0446;
 Thu, 26 Jan 2023 12:09:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 26 Jan 2023 12:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674752990; x=
 1674839390; bh=8suY9sieWgtDXWyPn8u/nfHNi/hMsHiTv3FkopfWKNo=; b=d
 UKWNlAyDqdQbnSqiaN5A8uIwzd2zIm0QTtvJqrco8xWF6qB0tPZ0tQavtX9yH4WW
 KUmNdH74Xr7bvXrwD3wGvw8uSDPol3LFSgSTn6WitNVmPHzG19iL2RCuxgWxbzbD
 5LswMBlYXLUY+WmzixIjtlSSlQTKq7+ddD7wLbYylIyQ3waqvT11OCExe0q91lA+
 Hycm+haDk7yOTuUwEORP6QrZvVMnaAh+ZgrkCvggaLwQPW2l919B8DECmhMAYCi6
 jLsf4Qh//mmTO8+5yvWpzfXy5i94Za7OvegOwnInwXRR/hYE9x01sI//lOu7Ci2M
 MpOqJ15+loA44Zhk/xucA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674752990; x=
 1674839390; bh=8suY9sieWgtDXWyPn8u/nfHNi/hMsHiTv3FkopfWKNo=; b=h
 wYEt41yvJORumJL5Kp2VMSQLZqz7KDzKE8V2y8GBr2YC5SLvrZdeP9lRAAy5QcyB
 6yoj5Us121qX452KhmtuGxDLjIQsxhTKTou3gQpggl5wU0+M9ZL2cZmcQz2891Fq
 fWS+pZ0ueQ/b6p7mcD5gnfL1dbMTTSoBQi8T6bxSzMwghil5EkoyoDgg2a8O504g
 qLYwc983KuLum4YkS0BTFIhZHPnGbNKqR/fiHMU8F+41xr4SUTm9PcJVYTAKThnC
 f42/Ibe7vK1mRV9ZfYKQGUc/H8knRtLWLrxYJoHLfXYKGaBv46MhKjl6uANvPABd
 ScrnzOVRukjMFzPnahjQw==
X-ME-Sender: <xms:3bPSY3JYVZGfigVViYxWlGmXK1AmOHlYrzhoUyFn5jKvy-5a7ttDNQ>
 <xme:3bPSY7Iw2zvzG73kBUbzMwJPNOXN8gp2x_14hA4gZOvB2ZE6JZJiINj937cHQyl80
 2Pwp1UcEKPMXyBLvwo>
X-ME-Received: <xmr:3bPSY_v_i6Gq2jxJEfnnToMg0VUe3Jt9x7lb7Wt_ppnrS4iuHo22WaB2mHojyoqYJT-F1VAJyY9s0l1lP2yCNm2xLDupa93WYmEicyXUWRkLTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3rPSYwbs3np_WpIIfysSMArx8JUltGj2FG9G9TVHyiWsYy7A-0so7g>
 <xmx:3rPSY-amw57pbz38k6A-TkeG5nPiZGf7TO_Zy906iN2L2mAuWl5cRA>
 <xmx:3rPSY0BQLzIU2ta42ynoWneHjeuhc2WNHzRloyUMm1Oc3Sz5jq6JnQ>
 <xmx:3rPSY-KMlP34Jp8gtpyQ1Wm_IFv6NVj5YvM0LIenOxy3bFyNgRUFAw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 12:09:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 18:05:46 +0100
Subject: [PATCH 1/4] drm/vc4: hdmi: Replace hardcoded value by define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230126-rpi-display-fw-clk-cleanup-v1-1-d646ff6fb842@cerno.tech>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0qIZDkNiRrqLNfFTmO5XDGD2w7YMondxv9DscAkZRD4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXNn3cKH4+7eYavcXG15VEY+d2NH65fc/t7paYNSocv3O0
 I7VvdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiynYM/9Orfxn6M/0Ol0o5Xtuw6P
 CutK2b9PY6368riYuTjj+s+5PhnyWX/rPu97qF1rvEjJxyrxuKn35y8UGX54LwTVXZp3jFWAE=
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 120MHz value hardcoded in the call to max_t to compute the HSM rate
is defined in the driver as HSM_MIN_CLOCK_FREQ, let's switch to it so
that it's more readable.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 14628864487a..98fa306dbd24 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1482,7 +1482,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * Additionally, the AXI clock needs to be at least 25% of
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
-	hsm_rate = max_t(unsigned long, 120000000, (tmds_char_rate / 100) * 101);
+	hsm_rate = max_t(unsigned long,
+			 HSM_MIN_CLOCK_FREQ,
+			 (tmds_char_rate / 100) * 101);
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);

-- 
2.39.1
