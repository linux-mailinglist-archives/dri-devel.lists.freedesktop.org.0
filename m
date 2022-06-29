Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E1560012
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056E014A619;
	Wed, 29 Jun 2022 12:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5326114A60F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 16D363200979;
 Wed, 29 Jun 2022 08:36:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506192; x=1656592592; bh=Lc
 k2LDxyMhX5UDnKyKN7M4MyT+ncIDxjwZpMtw8VU2g=; b=0Y0bN2/z/orRkfdlW7
 3SeI5pBUI44YVNG11i+vlGFFAJ19G1F9guv913y3m9sDC1VUbKRaAvlK7S8EOQWF
 yhDoyMMLiaiq7Zn9wKupDZDvngVA+NK4s+b49yPEclcGopEaBx8yPdEU0HKzhS2M
 ENMBuuCRyv6zeQJgOUWOZogtEpIFZvHD+q7/gHrbU4jHIsmDEGr05cH8fN6icLdp
 cGiai0+54VDjPxZT2AXYW3+Tl9c1akMhO5jPTP+15DNZK3bSzD0k2qkWmqxLX3FD
 h8zR18N/ObyH7XSm3Nj2Vw6uILV3mKGimGIhIBWxEmh3eD40oI49FWvU9mYvH5qH
 p9dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506192; x=1656592592; bh=Lck2LDxyMhX5U
 DnKyKN7M4MyT+ncIDxjwZpMtw8VU2g=; b=CzhxS+aE1cChHxYeQ3tMS1WTN7eVY
 6CojYEmhmEbFieod5YmIehedCRjTJ/Dm0yFr4f14gUabh7prjLWQ7SeMn9zkVLuu
 JuSuZb4VWucNuo3iDfjoHoNAGVUqKv+S60muCxJDrRS8KQRh3s1fB2TciKteSKu5
 lNJTy2RyVcOI18NpT2mfJBD8y8RXfSnTqWfH++lDeWV20BlgtsFsVFPUwInJWxFg
 95sOqo39QFu1lYJeIvoyUwuiVqDiG64EzDWzmRnCXiHinUwHVraACcYDh1WTvCia
 zMDMzbZ6mp12F652jMImirhdR/sTvYVBmckoYMKatvPhHwWQvzsdTmhBw==
X-ME-Sender: <xms:UEe8YhIWVv7HtEGnIsmntecyMVjYtI_XBaP3LTh6hz9-TeJmbGfcZQ>
 <xme:UEe8YtKtCd_w0VVfZt_8BXxIKty8CEj-KuI6jIZVIm6Dg71SmRAtOeZcMu6j2-hCG
 3W6Ihdnf-bclUlsYI4>
X-ME-Received: <xmr:UEe8YpsGQvr_jFEI5pxbcWgP3xbls5nMpjlgBPYgMeyvqeh47wZ-iqcyPB1XJ1wVDopUg4Xr2ovLoh0B4B7U6E8yubJCImv7Wixl5Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UEe8YiZ-06XwBeB-Fmmw7Sqb7pJL-skjp0qU86wnrnPMz0cD8QPSgA>
 <xmx:UEe8YoaerhmT-6p9PArbKVfzsDBZ5hS_REDlrq_mfAipJjMY3jhbYA>
 <xmx:UEe8YmB_NKrLqzW68TWX7es0g-Iy-rg62FCyUaS1ob_nZaB5h6Q-2A>
 <xmx:UEe8Ynx24XWcw6nRiOjQsk38aI1xHq3ETIIYakNxgjyCJjNfiKlTug>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 26/71] drm/vc4: dpi: Return an error if we can't enable our
 clock
Date: Wed, 29 Jun 2022 14:34:25 +0200
Message-Id: <20220629123510.1915022-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to enable the DPI clock, we just ignore the error and moves
forward. Let's return an error instead.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index cfd89fd0695c..2febfe3d854d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -289,6 +289,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get core clock: %d\n", ret);
 		return ret;
 	}
+
 	dpi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret = PTR_ERR(dpi->pixel_clock);
@@ -298,8 +299,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = clk_prepare_enable(dpi->core_clock);
-	if (ret)
+	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		return ret;
+	}
 
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
-- 
2.36.1

