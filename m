Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2763EB6F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A16510E571;
	Thu,  1 Dec 2022 08:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272710E56B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E6845C01A9;
 Thu,  1 Dec 2022 03:44:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 03:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669884253; x=
 1669970653; bh=yGORwJBsPkh/b0PObL5kDZslL3mkGzpnk9pANWLtbFs=; b=H
 NHJAo8ZRRAMl/h55bdIkyWSHbo8nzWSfnWX8lv0XA0qYK4msLbcoDUIlmy3LdLcc
 7saFz50qkP7V9nQOZmMGWof33GlRwJ4wQKmV9SVHhwITLarUFYEC3s7BhD5fz5b3
 Qwm4+Ud1w+b1Q3VApTK2IfmvEvZFDaPEc8EFgCDmpDRDjdxiyx1nwyGT9q1o8I5U
 UGPZo+w8hM7+u/twQ2XEXD8wuEzc6bW8haoE6aV12sxB2U9B4j4qYbTSgxwZIyqA
 dy3TA0e3yLZeyNfGwLSGAxef8fln83vQ3nFyU+HhTPjmOitM5i7dtThImnj4Zooo
 9E4zfBABUL7fGhVFIqtmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669884253; x=
 1669970653; bh=yGORwJBsPkh/b0PObL5kDZslL3mkGzpnk9pANWLtbFs=; b=b
 5wcgZZa17fb7DzCrPh+Y7kCHjyLsb7wXAxYNeAoNfNZgfpC4AgviGD7Ollo2MW+4
 mpcsKLEk8X8lVILLtG7tZ7/CYyGOKUWfApSX5LGyfGlvemXCUpUijNzVkNwrjw3c
 GAIfTHMYbmZu3SGxltT1Xe49F0d/qOZdCiWGHfcd4cjgPCe3gqugP6+JgGzbK+FV
 Yz4MC95obHatEMM83I+OVOIR0n9xIxcgYnZC6PdaSTmDDEg6P5uefoKnV3yWNnWG
 YfWm66vb15K9gio5GOArzxjHUIEIOptvz5N/EipKfMBBrcV45AlPQwcYUUJRRO0r
 ePDKgLev3AqgqMMpn913Q==
X-ME-Sender: <xms:XWmIY6Z2cunoh3wVmcEM2U_92clydKyDJBj0GdWSMQ7zvoi0elt7xg>
 <xme:XWmIY9bEU9ly5FLIaswpgEQYa0bTqRSmfziakb33ywIsyGwVJW7DgKPQfLqXZ-JHf
 hRydpF1VcCYxns4YJ0>
X-ME-Received: <xmr:XWmIY09rK8wvvm8jMQq0anqjHP2_GPAfjkx16AsL-9r3LIAwU0FE8np9n2CXohxqXmjfl0uPFqML3jhuuzEJM5TqT0jq9WYuLYa-w-TKQioRtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XWmIY8oWnaTwMWr8cbRJeGaQOQrBsP-ii5d_fKs9BjKSve7wGO6dVw>
 <xmx:XWmIY1r016NDVpITC855Pkai29HtmznMaa92eKmLEiBhxERPzZHQaQ>
 <xmx:XWmIY6SCWpjM0h0NeXqfWj2F6eopy5bXE8QeDmt4Aa5wpwWg-KLmVA>
 <xmx:XWmIYw-NqjuWZ5hfCVWuiyPGp-HRSNMU6LB7XWAvl2Ero5KIhVXncA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:50 +0100
Subject: [PATCH v3 5/7] drm/vc4: dpi: Support BGR666 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v3-5-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C2A769Ttl36FCHI2s5BdHwC3a6/7DNTBsfWdG3Cv96g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmexqvho3Ky3/6niwrL+w8ui5o1a3XlY77J+39tMyeZan
 piFGHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIlCTDP9151ZMrfp5rZaxqWM+TVf
 Ly11S1lZ0h7utL3GZeXZkQP5Xhf7GWs/rzu3s5xIUWa5n3uzdlTf46521jf+tCl7+6dzUZOAA=
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joerg Quinten <aBUGSworstnightmare@gmail.com>

The VC4 DPI output can support multiple BGR666 variants, but they were
never added to the driver. Let's add the the support for those formats.

Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7da3dd1db50e..ecbe4cd87036 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -170,10 +170,16 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR,
 						       DPI_ORDER);
 				break;
+			case MEDIA_BUS_FMT_BGR666_1X24_CPADHI:
+				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR, DPI_ORDER);
+				fallthrough;
 			case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
 				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_2,
 						       DPI_FORMAT);
 				break;
+			case MEDIA_BUS_FMT_BGR666_1X18:
+				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR, DPI_ORDER);
+				fallthrough;
 			case MEDIA_BUS_FMT_RGB666_1X18:
 				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1,
 						       DPI_FORMAT);

-- 
b4 0.10.1
