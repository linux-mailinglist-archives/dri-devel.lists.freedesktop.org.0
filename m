Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC497605A40
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1E10E588;
	Thu, 20 Oct 2022 08:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B04910E556
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:51:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6F4C6320091A;
 Thu, 20 Oct 2022 04:51:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 04:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255878; x=
 1666342278; bh=xhtPz8Dqfioscgg3yoemS47J761NmMtmupbcefOZt74=; b=p
 IVewE0Z001+xXD14v17px7/vL/VxtVJrbQt+NJ6J9T8W/JvZY0/LJ6bkUmDm6fQw
 QoQvlOtwBp8Wa1wAuf1PRQK4Z8Zp29IQIZB0mSL7Cp7I05vGgLvFNY6gM64dWcQC
 ngCxUgzgTA8G5i4wmUP9xT4M+5QoERh+3tM4kOe4B0ynR+ZU+AZ4ZzCEU36bgYGW
 bzlcrKflb9qW41WBomCSmi/vV6lN15P4q1R5rWIWHT2Su8Maw1gUQpbjrmB1wExd
 7mN6PhxI2fEGXrNrvlHXn+DJRLjk0u9F/vtiNMF1OBVngXkVvSimJE/cptsALTQR
 n1cc3r6b85CeX8OeaHnCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255878; x=
 1666342278; bh=xhtPz8Dqfioscgg3yoemS47J761NmMtmupbcefOZt74=; b=C
 YXW505xbvqJ2G9zUNNnOvQMxGHFv/58s3C41nZicrHh0R89cuLhDmM3wtW6XplC1
 Zt0Er0ad66JMQN6UcG2uB4KaaSCpo1KTE1J8AZuJB5RlJ5eulFmaOKwdgFfhTQLm
 PTemKkm88XPxWlbkAu8KDRNv00ZYkwLjV5diX1YOeWjhhyGkuIeMomzIhmUD91BF
 KH/RMl90dh1L2nYyT9szLoHDXQOs/Tw/lo4gRlf0iNW9KHJF5RXlE/N9aI6s5By7
 dH+WPRjIgVe2+MPgGqsZYtXd/V6NMpsH5FWAtOeayZ7U1TDRYC1pilO6xXBhcEtL
 08tne4wslk6/9tzqyokeg==
X-ME-Sender: <xms:BQxRYzsUh28oJRqvodjeeceY4EYL170KmPkUeVRLCM3fEK_iqGPdtw>
 <xme:BQxRY0e7CvH8PEiFvjKX_N4cbyeHNA-bqmDIDj8LGY3Z8jSrsMyH-oA_kDpblbPNH
 MCO9pmmAYDS2KmLRa8>
X-ME-Received: <xmr:BQxRY2zfp3RiFlTHCKBH6VI9FGx2UwJqIyAV3e0__pS8ZGEZB68mhPfA2z14fcp8gGoy5jmtlky-XWtFz1OHvuGrTvJUTPlDFTg3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BQxRYyOVqGLLEnyNxVR2uOLKcI2Tzm5jpJ6LVgHJ4NSOd_2ZQBP9Fw>
 <xmx:BQxRYz-2TIojs7NlQUWhSld5QTXle2lfGX62sUrvD6_pD6OP12R02Q>
 <xmx:BQxRYyXPYPOSFpZ3P9ikI7D_eTZw_Hn6GbLaH3TnfXCFEFvWxN3hiQ>
 <xmx:BgxRY5Pn7jwOyu0br5JIGV5gXJI01s-U10Qriip07_T-3Lfh1gDwRA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:51:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:51 +0200
Subject: [PATCH v2 7/7] drm/vc4: dpi: Fix format mapping for RGB565
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-7-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=43Ff0zFIOvU8ONzBI2sMboXcyvjpYfdtbjUUqEZ+IMo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7BZun+9cOHhhZkG26VLBhMoqro9zxHQ+PCx667xsuZma
 k/aijlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkNyfDH44Js/RL30h/b5r/keNHVN
 69AHY+vat1EfyvqnU+Tz7wroCRYe/BjROqBet2JGWJf3k4TzZpjwfzZlad31VF87ebilinsQIA
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

The mapping is incorrect for RGB565_1X16 as it should be
DPI_FORMAT_18BIT_666_RGB_1 instead of DPI_FORMAT_18BIT_666_RGB_3.

Fixes: 08302c35b59d ("drm/vc4: Add DPI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
b4 0.10.1
