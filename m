Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9141C16A29D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE886E334;
	Mon, 24 Feb 2020 09:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF136E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C85E5616;
 Mon, 24 Feb 2020 04:10:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XOAXUK0oU5Tj1
 VxK6KFCC0Euff0pn2yyPW45oYg5juU=; b=JbXxNFzR0cX8JAduI70cg5P/TdR1V
 PmRF8u3/TIcv+RxtHgRAXCUUOs2LCGjHCU757uWuHRT6KhqgLf+dY3w69mKTfOBk
 4qZnXLqwPAMAOeMwUStqHMYuxre1coc27wLhLQlwHr19djp7gRwTYQm3iLIpu71Q
 awfS2liH3MeuJspbqe0YVa1XbbYI43uCc9iA1K2F5d4/lJ9lr2WrOfO/xImBpGRk
 Ake+IZ6TPhFM8VODoGAXJkIMfrC0w1fe5pjU6faUd6xlB+qO9AOE/rGM0yueQocX
 E18ExCe6jZlV9GWxKNW3ZwuzrojQyIXubkuSUV7JQtdRq9hcod1/YBY9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XOAXUK0oU5Tj1VxK6KFCC0Euff0pn2yyPW45oYg5juU=; b=WIOBX/YZ
 Vn7c0V7HcJto//EEM0TLH1rTOxi3rPD62SOGukA8OLF4x50jeNYu1CQNs2R9CsDj
 EEbBLr5VHV2fKNIZWOSLyqDIm+102021Wwp80fy29Bd4PZjqITyKEKPpCy6nmaYj
 /XGleVrI+7Gh8+wke+F10632dKjfr7f+Z0QH4WKkjeP4Dj1+UEZ9VXXVjIc9PrvH
 LXzNqG3XyKRx+pib9f30m7mKxRAfuPTAOc5j81GIN1UaOuocSrw2erACe+GoET4V
 EDe8wjQif1NWTs41nP98VlM/MKmnN2x/S6PWgezatKpv/dHqp7xjdentqX7eeSd6
 nUYc5LnRg1rvTg==
X-ME-Sender: <xms:75JTXr_qJQR79_WEBZnSjQjUW7nuB0W0Oxlz4WuLcJ72yR15tBWPEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepgeeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:75JTXkB6y6ABDZGJwo_YCKgVvwin_QEdR22VEWjoY5Xf6MdXrPIdmQ>
 <xmx:75JTXryWd4iWDNZD-n0g_cMml5tSad8wa8mFpMZsbGrYc6WOkoOdfA>
 <xmx:75JTXpS1O2I-yVWn95pwRgzBGYY3A9jbtxdOaMZ34fVkpUDquqnybA>
 <xmx:75JTXtsJ_HgmYdXetr7K_0djWDegNUPaP8CsdPdEAv8W_efA4Dfti3zpIP4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BD03328005A;
 Mon, 24 Feb 2020 04:10:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 54/89] drm/vc4: crtc: Add function to compute FIFO level bits
Date: Mon, 24 Feb 2020 10:06:56 +0100
Message-Id: <12f981ddc23c58ef9357d2a6eda6b7a237889b0c.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
 drivers/gpu/drm/vc4/vc4_crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 129131a07edd..1dd0a9fb1c02 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -277,6 +277,14 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	}
 }
 
+static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
+					     u32 format)
+{
+	u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
+	return VC4_SET_FIELD(level & 0x3f,
+			     PV_CONTROL_FIFO_LEVEL);
+}
+
 /*
  * Returns the encoder attached to the CRTC.
  *
@@ -377,9 +385,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
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
