Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4E605A36
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB99510E557;
	Thu, 20 Oct 2022 08:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A210E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:51:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 467B832003D3;
 Thu, 20 Oct 2022 04:51:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 20 Oct 2022 04:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255869; x=
 1666342269; bh=yGORwJBsPkh/b0PObL5kDZslL3mkGzpnk9pANWLtbFs=; b=R
 F/e6nG1oGtWtLKwmv1Hp22kktKRLUsE7aSbDaNaQr16hto4FkwVnx8KfnmY/I3mF
 A8fKilcRPBH9qaZIBZtLzwIW4yzTujN2lmSbZchyal8Xpj77qC+rIfVsv6vcikEd
 eN7arcVaYrd8QF2A8CxZWOgAvfDuS/kbOmbaGdYxwDVk4Fxoi7+DfK7WsBWaURAT
 L5xRwllSWb3PbZK3nWC3L3k/H5ybqLrJCMB6uVVb8gK0WJnTBJGu4mdzrj2J4axo
 7NISld44ljdxO2E9kg/SMOtrnrXOsTzD2W/BbbLp7aMgbA/fHMDnRDM2huT3cj4b
 E0mX9qfh+8YCMN3KADgUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255869; x=
 1666342269; bh=yGORwJBsPkh/b0PObL5kDZslL3mkGzpnk9pANWLtbFs=; b=F
 LIQ4pRWVfCRPaYwqglWHkdxKORDesBGtz5XS4fL0F78BHpSZUHw2Fw7CDk+qBLYM
 Ne1ZzXXMGFxqZkB0AC0ikUCWfxfujicxCnr/vW8dZHU+OSt/1+wCCYjGeyny7Zw2
 W3sTRyKYfb7FI6/Nj8M/uI1cO9pCAr2V/AgvZyCmTB8e+KnkOUzFJLiHxEzcG8lv
 UkVKvHGcRVlrKnieDKoegyalzYL28oaiJAvpgdim9aG0/EU0OSN2l2EDXt6G3php
 sbWlHc7nYDZDYx7EZYrzXdlmiKz+KT+QQ6olULouN8hI+te7qry8c9u70PsVs0Pc
 h0bZE6eQ9s/gFrHOKfzCg==
X-ME-Sender: <xms:_QtRYy4OPJsBZi8V8qPiQkYVSp_NWyA4Tok9-CVwPZbeR_RgyY7n5A>
 <xme:_QtRY755rUvRooEQV41TxXuVEGGGXutLtKXtTvzRXNsbcB6OiqZ1VV0OBhNl-yHf2
 vFZA0NiYFU5squ3-4Y>
X-ME-Received: <xmr:_QtRYxfixQoTvHTIag_U7V33NI3NmAM3ATqJ7Qc5tMSi2G0QQg22uIY8tIQGJoKslRovqIkniEND1tCPFWx2QHJybWVhtpkKpjFH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_QtRY_JZeQMq9Bx4otnckmS45BDUTAr0cGa-OZ_6OvjJpquWbS9e4Q>
 <xmx:_QtRY2J81oTZjAvwz-LbFxE8gvxy_AwRG2qXRhSnvA5-NdUptRtCDA>
 <xmx:_QtRYwyeUWrSPmXqGdDmnFOmZXZpWRPqdZ1pmCNSJsY0lxMesIR8qg>
 <xmx:_QtRY76bkqAyyHBYSCWiWF1lR-U_9_NRZvgJ0n5kxPrwmut5asBagA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:51:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:49 +0200
Subject: [PATCH v2 5/7] drm/vc4: dpi: Support BGR666 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-5-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C2A769Ttl36FCHI2s5BdHwC3a6/7DNTBsfWdG3Cv96g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7BbBN0M3V35rW1HuL19zU2zu0bnLupbHxEeaTta7ISj5
 tiK+o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNRWcbIsPLk7IRtmgobuNW+1Gxw9d
 7y3GlhJdcMq8999cem/GwvXsPwP7jsuZTc6jk5i8S/2Vx1i7rsbHz3xVuuTWH/eXf8frx1ASsA
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
