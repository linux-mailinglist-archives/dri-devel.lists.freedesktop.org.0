Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79C605A3A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A510E556;
	Thu, 20 Oct 2022 08:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEE310E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:51:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6252232000D7;
 Thu, 20 Oct 2022 04:51:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 04:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255873; x=
 1666342273; bh=1vlWw3HWcseVhvxGIduvYvORASnSFa/0anA5xMkzYTs=; b=g
 QElMFuJcDsgncugOjpbYGI1H9ih9YvRSBLbN3k5TIgGyuVRoy2mi456VQ7FNC8UR
 GO0b78y1FoXrQI2Jjm7jhMYonJ0iM6IR2rPKIHaFEZN6+ho89RAT7rj16+yOJiQq
 sJOg1+PQCH6uY/jdddErH2ZUiuUcGSfIO67KzVAZcfVOj3LeMmDydHy5/TWKC1n8
 wqlx/BWw74vY38QOChFlhc8zalGvc7RFhfiJ7j9Odv/5Y/G8gwXA/gqhUdeCVb2d
 2kjejGC0ZLg+nSecnWKrshQ5XXndF97CvgEXXcGXjLTObypxCd5rrdRgW2sg6lso
 pVySV5jV+IGWJO003Yxjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255873; x=
 1666342273; bh=1vlWw3HWcseVhvxGIduvYvORASnSFa/0anA5xMkzYTs=; b=s
 lJTVlCthi+dMq65myMAszoI5FjYJIVPe1qSwkyCsKrCUILT+NoR+8JIlcWErSNs3
 m6Sgjzjy7uMOPNq2SombqDABPUD/yBn3OoSD5fsGnlEIrznAgijrpcarlxqvkuKT
 UJ8zHf/RDclQVRGTpxSoz5rt2Hiyz0y+dPeeVQxeMYHvnevJQhfCrD+N6l/vUAL4
 KN7stVXpm96mqvKEH2PY8M0BZc53djxCbVmqvnswn2Hck3rIYtkhzX5OwWxMfu+/
 rhitaV7G1XpG3XfXfb6r7HZXAtMkC53jvME+pCHqkblC3deBEIdHsIE+Vncixbfu
 H6/WBZo8lxH0KWfoCQauQ==
X-ME-Sender: <xms:AQxRY24J2w7H7usl5zFEgH0qcUA0rpmLuNfXljGMNy6TYIdnTkgWMw>
 <xme:AQxRY_7zGXuAt67Wqwgap8yqsKkPq7b392RfmRO_2U7RgbQ6sY0JdXfdWV-gAp2QO
 79kh4aTbB05aEglJ8Y>
X-ME-Received: <xmr:AQxRY1dvy-Tto0TZDC5p4CE0V4XSyvvvJjA-p-8SGdEyiNhA1mq3GjQTw3d2Q0wiGfljrO4BaJeM-NSUunqXllb9_xD2MJtlwx3P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AQxRYzL-vYtI1oHHBsGCJP8AzOFLtiqZHLEn92VANR-nysi82mtoWQ>
 <xmx:AQxRY6LroSBQjOSGqChifsl2ATJ6x3Hw-nxugxod8oSYzoMRQHdSMg>
 <xmx:AQxRY0x845SqaSWMZYuFsY1giMt1yebxQchSta0ZIR93SduqIqCg9w>
 <xmx:AQxRY_7IpzA4pju8-f8Y26Xin5KReK3EgAYpxTFnlTvMjD8Q5-eprg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:51:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:50 +0200
Subject: [PATCH v2 6/7] drm/vc4: dpi: Change the default DPI format to being
 18bpp, not 24.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-6-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Cj2SqCiv0e+hjTKV6Xz2WDeMWOb4ZCwlvcwXbXBSakE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7BZPrb6beAiELopZJFi288SeAy/UTnglpW9cUPDMuLVI
 UeBMRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayUIeR4ZHri38VJRdLzsifNmN0X2
 NYtZRty77Vt/xsv65qVlfIW8Pwz6T9WnyjeWjenk3PYr9IWglfNi/37Ep66pqn8elxz1cNVgA=
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
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

DPI hasn't really been used up until now, so the default has
been meaningless.
In theory we should be able to pass the desired format for the
adjacent bridge chip through, but framework seems to be missing
for that.

As the main device to use DPI is the VGA666 or Adafruit Kippah,
both of which use RGB666, change the default to being RGB666 instead
of RGB888.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ecbe4cd87036..fdae02760b6d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -150,8 +150,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	/* Default to 24bit if no connector or format found. */
-	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
+	/* Default to 18bit if no connector or format found. */
+	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1, DPI_FORMAT);
 
 	if (connector) {
 		if (connector->display_info.num_bus_formats) {

-- 
b4 0.10.1
