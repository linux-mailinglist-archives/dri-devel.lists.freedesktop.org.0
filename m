Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3A1E5981
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E726E45C;
	Thu, 28 May 2020 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F216F6E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 675A0582067;
 Wed, 27 May 2020 11:50:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=I0qBgYPifeB7J
 BxbmCk3SRyUi3j0HLjhg9JsadKswFE=; b=p60FZNXX6Ya1s1sXBGhl10XsjG0W+
 OL7+OQnhlDtyT465yXI9JvU8kMWGbiizre0ZfX9tpTEPIA+sWIz87Sv1kNxDNizM
 rQ2enb7HnQ48WdaVDgLmY0ygf4kqhmOlXWOILpo/JhGe9LuDLaQWtFtQrnBc9OHH
 UaCFHXYP7qE2BGPAAakXW9lTvSTd0hD0iqropgKBaBLsW3bF3SAF5G//EbeCQtRF
 PnNWq0dR6vTfX6zGzjvLFj3cXyXlFDG4SnqmA89s7hKrwjbpeW5HdlLkeqs09+vG
 XMCI1h85gFIh+kVyd76YbDoph4TxJZq1p2Aenr0rSoy1IC8paxs4pWaUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=I0qBgYPifeB7JBxbmCk3SRyUi3j0HLjhg9JsadKswFE=; b=ennjk80+
 PM+eUnsONYm4YPB8g/3hPG3V4q93O+wTAFaBFRsXuRv9PrH/Mz0rdhBX8YZJychP
 jKwJ8GPC9edagvaC4vCIRT0MD9JL1mO/Dgq/xN1uJ9llWEv3xFdtjicv5cdJ3LvS
 lIioka8J/L5gvEPtwFCkO2EO1e9ZFd7SrI9qP1yOxFFgtm3vo4mHCaaYinfhPa90
 YKSMgHkjLGq06t7gDoHLxlpT2wZUNDbMYnLLbJkeb246KOiJPTtZKj2RDK406jje
 U2A3NFIMONDRAuUtLUNnE0//zyvJvM72du+8urr1E5QJJnTM8B5CiE1qd8jOpF95
 AqinR3JGBOQh2A==
X-ME-Sender: <xms:NYzOXmzLkXdkE7-jBKHDzkXjsSmEIjOSx-qoxDkXvM0O16ZPDgm_1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NYzOXiTBXF2x1DISCtnp2rFv6P9sbZVNXUnhz0ifP8jBaA5LVb-YUw>
 <xmx:NYzOXoXslFI1lMrVcezG_7dV_rhsqYHZp-6Y-QKMWdyc5Kmvxku13w>
 <xmx:NYzOXsieZ5uyHbN4bPs2vNOmvoykivwpHqnArbr_3aAI2OZ1HiC2fw>
 <xmx:NYzOXmDcyGQz7ctU0yzQ-_zftkdlGE10FsqDpQGZCRzjPTpU56fKXQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 066AA3061856;
 Wed, 27 May 2020 11:50:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 035/105] drm/vc4: crtc: Add function to compute FIFO level
 bits
Date: Wed, 27 May 2020 17:48:05 +0200
Message-Id: <af7e711fb46f21015a4328dd7aea984e2a8dded6.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The longer FIFOs in vc5 pixelvalves means that the FIFO full level
doesn't fit in the original register field and that we also have a
secondary field. In order to prepare for this, let's move the registers
fill part to a helper function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e25e81bf64e7..12cfa0fb2e19 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -275,6 +275,15 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	}
 }
 
+static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
+					     u32 format)
+{
+	u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
+
+	return VC4_SET_FIELD(level & 0x3f,
+			     PV_CONTROL_FIFO_LEVEL);
+}
+
 /*
  * Returns the encoder attached to the CRTC.
  *
@@ -376,9 +385,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
 	CRTC_WRITE(PV_CONTROL,
+		   vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
-		   VC4_SET_FIELD(vc4_get_fifo_full_level(vc4_crtc, format),
-				 PV_CONTROL_FIFO_LEVEL) |
 		   VC4_SET_FIELD(pixel_rep - 1, PV_CONTROL_PIXEL_REP) |
 		   PV_CONTROL_CLR_AT_START |
 		   PV_CONTROL_TRIGGER_UNDERFLOW |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
