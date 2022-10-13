Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110725FD771
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECD310E7A1;
	Thu, 13 Oct 2022 09:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7210E505
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:57:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9130D5C0153;
 Thu, 13 Oct 2022 05:57:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 05:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665655026; x=
 1665741426; bh=62GXbMiFTt9uaw64RKnyb4grN73sPghENIMkyLwxD+g=; b=F
 wtIX81xMp6WHCqpoNNFqN/eMHR3eggHU/XoJWPo/HdG8a90TbH5Z+oaAdOZ45Qpe
 yoX7sjThT/XrAHYJVPHWb2BCXQ9gn+8VXyInPGlQ819wxP7DrZh4FB4GuDP3n5FE
 mUhvHhccgwYCq+Mklas9g0750rMvMRC+ZdHbqskEGE3nw9yLbVQPO5kuaVp3slJo
 fEjaJPfVGVBR5vIwrbpPjsbA0E2K54bUY+mb6d6zeoNIMmITMsjD3gupjtopTkcU
 2IRqe7PKcJBByBRfiBRRA4i1JvtOCsXTB0Iojwt5bl6xyU1XifTcrz2uiW9HQbQZ
 4mlzPpZhy6wVqFqX708NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665655026; x=
 1665741426; bh=62GXbMiFTt9uaw64RKnyb4grN73sPghENIMkyLwxD+g=; b=k
 ae4Wv4keAAVLuHfUSrV+HO8sMO5VVAnpbdMitqNbgM6OJSXWbxCaxGFEWp59RHhu
 mNCfrt9zAqYGpU+mQfAQqxwJT91lNJ8qx29/ero2kwxWwQ05bVb56/1IFTdEMgsv
 Ye5JqubX4+MjF8pg6f/mBdpWzCo8UnXEZOx+otoic7Qs7NG+ap5pCymy0W1bq8YY
 nxseS2KFDrpMY3LEJN3Z+coIA/QsBLHvDv2lYrEHFqvV/+k6Su/FGHzLLsukNT2q
 8rG1SNOnYG3fDaDh08DrnZDDTkjmLqT//4iVAL6Te3CSWaAj3Aq39RPkjtQDQdKF
 3Nc05Lx9+ZwGFvoYqa9vA==
X-ME-Sender: <xms:8uBHY-rqxwHvqaJmfObl0-pryxJoQIW9Nfys7eNglif2ypg7R4dRkQ>
 <xme:8uBHY8pd2yL69iRqA5qFclvoxtln59Q0R-NazvbPg4Caiqm92JXe1Y_Ie1h8ABWHn
 TjYfIV7ojjHlf9-kVU>
X-ME-Received: <xmr:8uBHYzPDQoeKgRzWCFhiW7QznHa_IEqEVlSr8DErhh7dG7XM4Tx9wfM5U4mi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8uBHY95atASrAzPkXLqDpOPriyRoqxaYbB0A7cTmtz4pe9a0PV33sQ>
 <xmx:8uBHY97oWY8ZDqJub2JHX9eLyfMTIIdUnS80WSEtBmtyBr5A_wJAVA>
 <xmx:8uBHY9g2DoLoDHc0fQ-aXTUS1xpGsEzqulIhpJ50noOAyEw5iKogLg>
 <xmx:8uBHY5ivfzrD2TSKKnwqnmWt5o4GIjXWGZLIf4XqjnXVZKGnjPUbDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:57:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:56:45 +0200
Subject: [PATCH 1/7] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v1-1-8a7a96949cb0@cerno.tech>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=AXDxrrKOwTJMNRx7phkeG0zUY8vfY+S2ctdZLJRv9aM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnuD95O5Xs+oWVNfcLMGSeXvZio5TD5woXsLOVlq2+3Ltvs
 3H4uoaOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATCdvHyLBx8TqxdQ9W24d8ZGz87H
 ryjP69delOy+/91b/mLjbb8l8Ew/+sHZ3tByRLN3SyvKw8yzDhHrvhvh9WnvtuzlCty/+nLcAMAA==
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

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ec3323dbb927..b0a945eb7040 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1022 */
+/* RGB - next is	0x1023 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x1022
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007

-- 
b4 0.11.0-dev-7da52
