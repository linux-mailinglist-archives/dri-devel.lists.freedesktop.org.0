Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8815485C7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAEB8991D;
	Mon, 13 Jun 2022 14:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF710E830
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 43359320091E;
 Mon, 13 Jun 2022 10:48:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131708; x=1655218108; bh=IQ
 eRizbQivrvykbSvaM8WIuHQlumxBdDy3RcrSBdTW8=; b=s8b2axLu2CawOiSfU6
 Lh+UHjQkYWmflEeeS+r7NoRAnvBAHlbkGmZ5Lb3jYZ02GZ8vej5flSTs2J2DGXt1
 qGfrJzSfBRk29UT66N9NNcNvohxOvavGir2g3J1B1ZcDwgNIZhLPQrAtQQAKQR1t
 ENHgrOpQ8F8tfOTW57+ysW5io/66FuywAREfWKV7f6mLORloRtyu6jeaJH408VkO
 KI1fruCalbDpEULWE3rmGtNlewOyBnSPkaU+MKoZTUfgr4Ns+HeFopv0h09BqVbg
 eYxROFM76MsVGVKPkQi7SGmzMKK2CTI7VlVqyul+Wx3Q76lsjwto5WhniNJqbDBw
 IfmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131708; x=1655218108; bh=IQeRizbQivrvy
 kbSvaM8WIuHQlumxBdDy3RcrSBdTW8=; b=ChIl4QQVXBbjNlQDVHYGeHJKmpDPm
 YjJ8D7jXXpvJ/nsgpemhwn05F36Ul24Pk5aPVjGUaKL8QZu1k8K7lnuLb4/EI0NG
 w2V8neAEV7e+bPyh09uSbVP1bk1drAaQHtm5tOgt3iZyxHCUuFkh+zhLG2UZP8pc
 FM9XRsH7W5ilDbu+uKsR27KF640ymle0W1/cRgdVp5D0FzAVd4BxCqRqFQNZ5FvZ
 j+NsDH0uCqPrAlLT+a6L2pMCeh9+rnVlAnAZrx+uI4uzM3haG7x/33ALdkql8IqT
 8ttelTcUr2GvSsYQWEY1C/BbCxxK9woD2pQVOlNGDLpBI1VWfZ/E42lBQ==
X-ME-Sender: <xms:PE6nYmhBjZCZFPF5v0H5NAD2ir2DQfZWDpUqO185PAFfEpxF6RV66A>
 <xme:PE6nYnBlvji4DBTgA00Yw1V20WZREwo74v1tw9b1aqF4M8sgN8iKEPC-fWH-rt3m-
 O510HnHdiYJKr8KyVE>
X-ME-Received: <xmr:PE6nYuEo1NIH55m2vW4yH5y9e0Md2poiYbrnbXLxRd_kmpDUSkowP3Pd8zV8iIgKMmSlQUEj4hqG5P19sbQv-QENV9zwEzG1BrwEh4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PE6nYvT5XnPyzmNsP8jza-qh4Aqz-Q2RThl-UDJvr5kWRLERKncVYg>
 <xmx:PE6nYjxpNbWfFrgd6t1z5k6-UoVpauTcYSvHjRzmBP6Rg0BUnEKogA>
 <xmx:PE6nYt5SgLC7LDjvE_avrxU1Zey_GmlK3JfwkubOOUTOZWRWyNO6LQ>
 <xmx:PE6nYuqIO0dNjoD5nE7jheY6BUG3CqMzgYnGPD-bc6WMpEykPu4zHw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/33] drm/vc4: dpi: Add support for composite syncs to vc4_dpi
Date: Mon, 13 Jun 2022 16:47:35 +0200
Message-Id: <20220613144800.326124-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The hardware can combine H&V syncs onto the output enable line
as composite syncs, so add the relevant configuration to do that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..ffa55952c773 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -131,7 +131,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	struct vc4_dpi *dpi = vc4_encoder->dpi;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
-	u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
+	u32 dpi_c = DPI_ENABLE;
 	int ret;
 
 	/* Look up the connector attached to DPI so we can get the
@@ -182,15 +182,22 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 		dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
 	}
 
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		dpi_c |= DPI_HSYNC_INVERT;
-	else if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
-		dpi_c |= DPI_HSYNC_DISABLE;
+	if (mode->flags & DRM_MODE_FLAG_CSYNC) {
+		if (mode->flags & DRM_MODE_FLAG_NCSYNC)
+			dpi_c |= DPI_OUTPUT_ENABLE_INVERT;
+	} else {
+		dpi_c |= DPI_OUTPUT_ENABLE_MODE;
 
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		dpi_c |= DPI_VSYNC_INVERT;
-	else if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
-		dpi_c |= DPI_VSYNC_DISABLE;
+		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+			dpi_c |= DPI_HSYNC_INVERT;
+		else if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
+			dpi_c |= DPI_HSYNC_DISABLE;
+
+		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+			dpi_c |= DPI_VSYNC_INVERT;
+		else if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
+			dpi_c |= DPI_VSYNC_DISABLE;
+	}
 
 	DPI_WRITE(DPI_C, dpi_c);
 
-- 
2.36.1

