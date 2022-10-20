Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF5B605A37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853E110E55C;
	Thu, 20 Oct 2022 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54B10E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:51:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 131773200583;
 Thu, 20 Oct 2022 04:51:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 04:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255865; x=
 1666342265; bh=Wp89GBtaW7MK+d6la9pPlll3p7zimHiYkS2UgGO+ZZU=; b=l
 chM0eOx3Dw4kP0ES8W12SwG48TR/QoerJb08GDo6xtOFNEIWlWzHYt5+FBSGQFXa
 jzbM1/1UjqOEw/c3GgM4PnKzBwelSSqKka4QLesQyfTH3VaFeKWxtjOklGn0KnRJ
 5c4fnQ0O/OwurmaNt92FEO10YHAjis/FDROTb4RoPimtKIEYqpNJOJ4lk/xs2cUI
 ulswPthWwA5xtdHU78u69fsqcQMNbRZu8e1YiITmz6Uug7RKs8sy1nvRZ+YE5cEg
 JAifJZMjqlzXt40C3LTPUnGK3vcV3nLgrtwhUABvue8lML8Itvg2uquQjY/jApyB
 If6dysu0Cs94rx8yKCu5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255865; x=
 1666342265; bh=Wp89GBtaW7MK+d6la9pPlll3p7zimHiYkS2UgGO+ZZU=; b=g
 HzCu5KQFMzB+LY0FxHpyzzpecUYLUIqTKXUF3lWOdLS4kNOWo4SzJN7fJOlJIhyF
 oRk7W6kXPeeAUnJLPpe+tGhlhzaAPJXq0MMXqb5YMo7lUCYeCCZ/RwrGEo1RpI0Z
 gvqH+9LOsAiI1esWkxlq1v+c8nXemxsi0aYsL4SCekaMhUggAlOZwOquXGzbl+wv
 4nApoO6kX0h7SaTWBtarn/BZ/JaxzXyqDagQAO0mDj4qIpDJ15e7DmOJy4jlm5+o
 ak+QxXxDxwww8XsBSTD+9gPxYDRlEDOO9nzVDT3lZzECAB+7iaJHmi8ojE/OnihW
 R/2lgc6EN2oDtaSNJQ/3w==
X-ME-Sender: <xms:-QtRY1UdESggD0yUmq_Cs6cXt1HoJjEUAxepdOExWYTjRjH3j-5rnA>
 <xme:-QtRY1n39XcFxj3OgWZz4oBImj9TMCK609T9L5VHZt96Q5J16JhSo1ZLxyt4hWCD_
 ccks2W82KIHFggcQVk>
X-ME-Received: <xmr:-QtRYxafYDsJ33E-LswO5SJ4PO4bhmiCMZWcxxA4JYs4-EakSxZ_SPnNqcwLeV1du_y6xzwfeiGVu3TGbB3h7shBu9o8-4LH9Zmi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-QtRY4XsPBhksDGCr71PkT2JIIdFNNXg4_2g5exjmDh7o1X7ochjCQ>
 <xmx:-QtRY_n2T6sz8tl1ANhwAZoUOBb-BYv5p15gD2KvsTh8Zc05L2moeA>
 <xmx:-QtRY1d6YuUi5lKw8pxW_il-VSWpZUQr06k8IZ4RvFNygrQf0nOMLQ>
 <xmx:-QtRYz3EYmPZ8LOiUrG2EGpkXV7rvTsW4okGBY1lVhYHLg5H59pjhg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:51:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:48 +0200
Subject: [PATCH v2 4/7] drm/vc4: dpi: Support RGB565 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-4-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=frMUS74NDFOUKqROpfuyhXgF/ifuNk0VZpwfF7mFoNs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7Ba75V9qzzon6dGyNU19yR7dub8VA3+udztx2E9D1VhD
 eeeijlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExEK4KR4bJshJ+gbmtsw6YTy169Ch
 Crf9a7jaM7/+/tskDP1PKb2xgZ/rVFnLvtIHV787SliV1HvS7qHE+UmnBvr+mv6DT35L+PeQE=
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

From: Chris Morgan <macromorgan@hotmail.com>

The RGB565 format with padding over 24 bits
(MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI
controller. This is what the Geekworm MZP280 DPI display uses, so let's
add support for it in the DPI controller driver.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 1f8f44b7b5a5..7da3dd1db50e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -182,6 +182,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 						       DPI_FORMAT);
 				break;
+			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+						       DPI_FORMAT);
+				break;
 			default:
 				DRM_ERROR("Unknown media bus format %d\n",
 					  bus_format);

-- 
b4 0.10.1
