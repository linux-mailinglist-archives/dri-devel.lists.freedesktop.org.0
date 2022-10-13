Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09255FD770
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4111010E742;
	Thu, 13 Oct 2022 09:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5EF10E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:57:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EE865C015A;
 Thu, 13 Oct 2022 05:57:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665655033; x=
 1665741433; bh=c9JIB0N1ry3TbulJgGhW5FL0vfJVlWv5g9q7AUZjWIo=; b=a
 NN4L3WxEDdGU/FywYDQ1MClme1PcOXNzlN9aC5XJvCd2iPBt52WDRnmmea/Bw4tb
 Pjq+CPcIfsGZqQ04GRmTtdkLgKUxSOL2fsxwLqRk69mEE7WB5cSgR1N8ifVZA1dr
 VfeQ4VPHQmRG3y/ep4yOt1wA3d5PwY3phY0jtfSZd9ILFgHwxB7wf4kimQm/Wx84
 nTh0NW8SSrKtGc/vcoK9siOC2HTUkWA0nPWpqS6gtp77toeHOFbPIL8F4AySGQ/U
 n8GhbVf5DsjeAiO9u4BO8K/JiC2ds9e1ZOH/ungBoeg2oZdn3pq6nqJZLydQG/Nr
 rEigCVRTMOB/oJFvuts+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665655033; x=
 1665741433; bh=c9JIB0N1ry3TbulJgGhW5FL0vfJVlWv5g9q7AUZjWIo=; b=d
 /0OVpEDQ4TNzQNUgQnRMlEeaIoZztjGK5DkZLhsgRkdUrbHrQa6hwSWFiNeemjS7
 DICz4nAkECI8Xk8P+PxBoi3XLftlyoCXrxSdklqfr1aQEH8j0Xyd2Oj2ZGztQtk5
 wolFOxmuWig42x/+YE5L/1TeuO/zzVpiSq2UKf7ntl4JVIRAEU9cvyRL3jE0Albl
 VZHQU/txbAY3QuKGotCY8gQcy5LIYL18Tc1YKVfyoaa3heNPwtArFJY+IWiiocOi
 XaKkzZGpx0ntWjQ5MM4M17eDgArCnL4eSO/BRFa0/EXJ4Wq2MNA6Au23AN2fVEvC
 Txh61pU6ZsDT6q8/ggr5w==
X-ME-Sender: <xms:-eBHY2Plv6XMYZO9LP1oIim3BOAHwQU6ZntucSyABvl4M6jxSirBBw>
 <xme:-eBHY0-5BZRZxuWYiNqdFWphxUkvJM0w1WH89-a34oFq1GDA4hoFBJ77jzKBLvTgN
 nMXZZb-YOfO8d7sRpc>
X-ME-Received: <xmr:-eBHY9Q4IXmx3uM_b5Od6o_LNxWiVSH3CP8mEnfMnGN38lN3ozeiIyyh9TT_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-eBHY2sWh-wbTjwwImJnXfNxohWQrUY0XROoL2CgjvcdIXPxjkmNiw>
 <xmx:-eBHY-dxkMR9121oKf4ra-ybZfjMfgHQ-2plRZ4SGMbv1y-a5Qh5fA>
 <xmx:-eBHY62lsEvvnLB6AW-i3h-6_5n5FXZQO9kuQqK5nNGlbPFTmzBw_g>
 <xmx:-eBHY619H8rPo6gtapZ0DGlojQIWCI4K-C5j1oVG5LYMWa7pVIXY6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:57:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:56:49 +0200
Subject: [PATCH 5/7] drm/vc4: dpi: Support BGR666 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v1-5-8a7a96949cb0@cerno.tech>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=1jlV3cpohJvxfKQ50ZdTSBF7QOjvv8tfuT0cBwwSJJw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnuD97e+tB6zFene/7a3+cWRQkq6T7c8kj9jwbzsdgwpf2n
 F7Zmd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiW50Z/tnk37Q7ZPRmkYSr+MFADY
 viU1PWSG/iUrT3Zc+yeZErLsDI8Krnr5OYmNiuKdbuU2azRi988s3q28zfZuEmmZwu3lNs2QE=
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

From: Joerg Quinten <aBUGSworstnightmare@gmail.com>

The VC4 DPI output can support multiple BGR666 variants, but they were
never added to the driver. Let's add the the support for those formats.

Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
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
b4 0.11.0-dev-7da52
