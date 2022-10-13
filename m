Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B65FD772
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C1210E7B5;
	Thu, 13 Oct 2022 09:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6868310E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:57:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CB8C45C00FC;
 Thu, 13 Oct 2022 05:57:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 05:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665655036; x=
 1665741436; bh=MQ066bDfliOyaWbJBRc3Sb4MdlZldWl5D7wyoX+CGZo=; b=x
 81AffMZCH+CvgwcgB4t5iYYaUopenUM7qCfoFaHlEyZlWqeObBhKMrzyZtd3pi6h
 /LBHzx4gDs6VRP44xtKrhelGrH35CGlmCWGWXE8yXZnH+aKqMMhX56bQPcHM+jNX
 gE/YFKyOsNMlP9XkvvR68z4yfLu2jdibvkSLv136GOFSq5o8JGtrJ3+8d5Jo4xVu
 k39UsJTrTbr1cgvKbNUMjqw6nZkOJPWzUmYiFDSsZVVT/Owz0Sk/r3tTLhk4Ba9U
 wW3uwmXS1mFOXeiLR77Nj1S5wbPEaRYrAIJBk37mX/qhawgjVmU3JE3djbAuelvP
 WVoX500KXMYxswItFd7XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665655036; x=
 1665741436; bh=MQ066bDfliOyaWbJBRc3Sb4MdlZldWl5D7wyoX+CGZo=; b=U
 KrmIqrHP2GXOaMsc5KVl3D/YTRp190ljJV6KkiAwhn77qMs+H5hep7EK2U9sUWWn
 qBS94O2LkLePEGPCFPOLfQEy7TfUwTgOcIAM3CMZ7MEPTCJHcS8IXIpYX8DYr6ZK
 rQ6EhnHMatr30ESN2m+g3FZ4hTgJEncb3y2Rg3KobZZA+Al3pjZpijFvIyPPPSEK
 Oil4L62avqqrBUnoVkUnFlZRdW1brRBVqdAG/TEBRNMgBTquLIplL1DRXMHNhDhk
 vQvE3x5ctjWYUBL8M93ndOeCrfWMdmKN+guxr46njwzbYQrdstfOthkC6IbIe8n+
 Q56JQoRzx2676gD3cebvw==
X-ME-Sender: <xms:_OBHYxscKkip3OQOCnNUAUX68xxo8SU4qy8g2dDuOcbBcyWAq62kgQ>
 <xme:_OBHY6dVCCqpiKQxPLY1FKiCzw62gIV6cFmsSB55VVv45fzxSsXW1vEKMez4aD2e-
 MiPsM9bRoYHVEMOMWw>
X-ME-Received: <xmr:_OBHY0za1CGPYzQr7fSQoBfW57p40zHwKmxn7AIw78zKHPewNxbWDrHX6kek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_OBHY4OmtA5ux_ZN8NVDkGN3txBeiZ0Gp9wskMSrl2iqhow5PkCZBg>
 <xmx:_OBHYx9cjOfXW4OL_GUw0NshC1ELewkhmes2IQioJF9rmg8DAEQqyg>
 <xmx:_OBHY4WvAQGB-rNhsZ83yKxc5SLs4zSnfq8CuTZPwqV2tNv6omfp2Q>
 <xmx:_OBHY4WtpuuMDMfvbV3qGxI7OmBsFLYA4KGz-JxLpPpfq7hrC7nFSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:57:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:56:51 +0200
Subject: [PATCH 7/7] drm/vc4: dpi: Fix format mapping for RGB565
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v1-7-8a7a96949cb0@cerno.tech>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Bfa8b+T0qwe2ry6WQDaIcHsRajSivGlVAl/5p4IUcxg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnuD96e/7H/+CrrHeVva3cZWF1YfCg5aYbU5YxDujWlSrLr
 mKpedZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiXucY/lkV6ZqeCg1OO/Lk4ILN97
 OmLitbkCjYk/yQo1639KGS6yZGhr65R1brnv661ffvY5Untyy//O1fMimxlJW582vQYd9VIiwA
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
 Maxime Ripard <maxime@cerno.tech>, Chris Morgan <macromorgan@hotmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The mapping is incorrect for RGB565_1X16 as it should be
DPI_FORMAT_18BIT_666_RGB_1 instead of DPI_FORMAT_18BIT_666_RGB_3.

Fixes: 08302c35b59d ("drm/vc4: Add DPI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index fdae02760b6d..a7bebfa5d5b0 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -185,7 +185,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 						       DPI_FORMAT);
 				break;
 			case MEDIA_BUS_FMT_RGB565_1X16:
-				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
+				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_1,
 						       DPI_FORMAT);
 				break;
 			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:

-- 
b4 0.11.0-dev-7da52
