Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B85FD76E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593B510E7AC;
	Thu, 13 Oct 2022 09:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580EC10E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:57:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B4F525C00A6;
 Thu, 13 Oct 2022 05:57:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 05:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665655031; x=
 1665741431; bh=u1MKeK43KUVSNr+zlGBU1hNNtkwDdXrF2GqPW2EMI4Y=; b=D
 +zZ1Fc4ZBFSXef7tM+bIuF1Seiv0mr6zF4Vqwd243kEn5i/QHGrMLmko0N/1O81a
 qKpyywvkMls4P2sbY3XEIss+fpgk7mFrpR4lQ+aiwjQA5nzcHODog5S9HXQvTzdb
 WYFQjxeNT0/YKGYz2rqr8ap5zhDVHdW85IQHYzDt69ZBjbDDHRNI3jSIPTS+VkQq
 GuhQyd0Ux0pqUFUqHZ6e2+OJZdZ/XefBKs14IJ58l/UpsSnZKueftjyV02r/Qha1
 WtR3dz/EJCqFFDQVf5QFYJPchxG8fGsg85r2Xf5jGEq4hMGy8KT5lVls9LU96pph
 90titF7qZeGD+4Ki1SFtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665655031; x=
 1665741431; bh=u1MKeK43KUVSNr+zlGBU1hNNtkwDdXrF2GqPW2EMI4Y=; b=E
 MKMv+y19UkgmjQjJnz0/C0PQbdYCK3C+HlPyaVhiDPs08xmsw5waorM1KwnWd/LR
 e9jYpEyWlv/bPFixoX1woa/C4kTr0b4ju8HnqvFY50sNCdHodmquph8rS5afI1Tv
 9o6QpFY+05eoGJLzG5C7y+zJXIN4ZvdEmaOB1bkC1TV1PbI8dF5WIR/5U7nCBK3i
 rh53bQmXgw87eWFGPoOqgTKVXMSmLcyzAQ70HZt+Hcof45JBv+nVD9Pe3KIrZh0s
 mlLJuPGFERFpe8w4d5JRDoyEyTxnKCO/yePo1A6HOalLJw+vGe6S56vMk6StwdlF
 681aMbZ5r2C3h4hbQA7gw==
X-ME-Sender: <xms:9-BHY1UPp81QmRrplMVb-gWvwpETKbr2HhJZ4VWGVExymihrbfxrIg>
 <xme:9-BHY1kBOshsN1gdJGfozyxn-1lUfN-igZ07E3LuApDrJckk6XwbVZc_Vbl1sxB9K
 K9C37edCWqbqHbe-Ic>
X-ME-Received: <xmr:9-BHYxbhVMGqzRM_xl5Lh2idWwpw7M2aEG9I6miNvTOj46VtOzfgjyqIYqUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9-BHY4UGiWxJz7RKbx1xXdBsfDeIZQkPPTy9HQ9zrrW5W_ZEcor5Tg>
 <xmx:9-BHY_kIE-c69j0KDJ0Zuk3udCkpybSiWqKZeOjvWgT4KolOsqHQHg>
 <xmx:9-BHY1cknTENdylFQ2YnMPJZj5T8aNwrisA5rzA7A20ZPZ7qvwQtEQ>
 <xmx:9-BHY9f6MCm7ygMXHu4FDsoxrNaDzg3WVEflxpUDNdgKNlq6NkufNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:57:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:56:48 +0200
Subject: [PATCH 4/7] drm/vc4: dpi: Support RGB565 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v1-4-8a7a96949cb0@cerno.tech>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ZQPHjwQYtyeJjJI91c4T4N+E7FyRjwcxYJLQyKTsOPQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnuD976HfHdkCzeup1vaZ7V8SR1Sy/mDWblL7pW/ftcJBnx
 09+0o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMJTmH4H1lpb6z/XEcsaYrTxLrqPT
 t2bv3ys2/HlK5JBTJBqmz51gz/g/YYvBDJ2W93qfqS8dKFkyI7Z9eFGQc/qmJ3CuS78YORFQA=
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

From: Chris Morgan <macromorgan@hotmail.com>

The RGB565 format with padding over 24 bits
(MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI
controller as "mode 3".  This is what the Geekworm MZP280 DPI display
uses, so let's add support for it in the DPI controller driver.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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
b4 0.11.0-dev-7da52
