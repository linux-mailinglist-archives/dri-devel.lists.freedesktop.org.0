Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41316A27F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115BC6E2E9;
	Mon, 24 Feb 2020 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B15D6E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 90566616;
 Mon, 24 Feb 2020 04:09:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3rltT13G+L+1c
 57hjhCuMYYG1tpoQkl5+Nulwk8ESAE=; b=iH5+T9kmTb1qcPe/I4o9A3KT1RSZF
 3rqgbO1TIsr+k5BMkcOc85XBAQ+eQ3sO46SRJY2TCN/36NTS7T7z9sddTyhbGc3r
 35+FcJp2Kr2Z8Imwc9p6trul17aIlTm7eEd0vEW6gy0CSvbvgKUKnJk0bAibSgM5
 E5TEi9t0d8syAAw7fTS5R+7QlTZ0ZJHvFhf3ogHibuG/CcsRcKeE8rnndI7tV5AW
 RBwNDCoQgL+1QnrPo8JXROkFi3q8bHdEphY+U4AQ+YCoIFd7hp2plB3+Kb9oBrCb
 K8OQKVobNmidy+X/KUc1JwoQ716D5pxEf2rX+FnjaOAdzn0adRLnmbcjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3rltT13G+L+1c57hjhCuMYYG1tpoQkl5+Nulwk8ESAE=; b=qt3Z8nS6
 nBgFfZZuTQVtchxhEjJ1Unu04oQqhZfNnegQOKP3c6/SoFan3cxrKPODh2x7RYmp
 xBJZfUjRILt7wywb0Ki6Sj0oPo+wr2IXrpzfUN5x4KfOveMDuWg4v+WP47dmQEaq
 NxbN31mmNbA5bqn7CVVqz7uscuu3lRj3KswMpr58gGGrfD7a9H/1hLeMy28O0n6M
 3/DgX5+R07oJBQjbv1WZxkpjnMxswn6DEaXf8hYm8qpu66zrAxgIo43zX3tBlIHX
 hBnxZ68pwjeEAmhYBHwb4dvwzMpiaJNjUsQgF18xbkcdL5lUrvZStks19axA64Cz
 dT5z1T0z7NM3Rw==
X-ME-Sender: <xms:5ZJTXo20TGsxtUHTVz6QBQfJAJ-7C9uNbfd9LXKG44Bv-bvAWbS-0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepfeelnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5ZJTXgk-q4FJPHHRPhkNHiCphejoaWLSs4-UsjWI-VkYYyEoWRJ5Dg>
 <xmx:5ZJTXs-VZhjsbkDgKtiOfyvUEt-rs7G6B76YjCJVIUjnJSFER7b7lg>
 <xmx:5ZJTXvGqislwdzjv-uqPfW2xF4l3Q-39gaCadxNBnzGhw7Wo86Thgg>
 <xmx:5ZJTXu7ySU6_HRwaHdTGm9imRBHMGVLhPGj-m5xLEnc-m4PD-QEAb-3RrvM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF6793060BD1;
 Mon, 24 Feb 2020 04:09:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 47/89] drm/vc4: crtc: Turn static const variable into a define
Date: Mon, 24 Feb 2020 10:06:49 +0100
Message-Id: <f509208841b8d5a4cbff3bacaee4ca7fedb13969.1582533919.git-series.maxime@cerno.tech>
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

The hvs_latency_pix variable doesn't need to be a variable and can just be
defined.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 4a2ea897eb48..53ce2bbb10b5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -44,6 +44,8 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
+#define HVS_FIFO_LATENCY_PIX	6
+
 #define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
 #define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
 
@@ -227,21 +229,21 @@ vc4_crtc_update_gamma_lut(struct drm_crtc *crtc)
 	vc4_crtc_lut_load(crtc);
 }
 
+
 static u32 vc4_get_fifo_full_level(u32 format)
 {
 	static const u32 fifo_len_bytes = 64;
-	static const u32 hvs_latency_pix = 6;
 
 	switch (format) {
 	case PV_CONTROL_FORMAT_DSIV_16:
 	case PV_CONTROL_FORMAT_DSIC_16:
-		return fifo_len_bytes - 2 * hvs_latency_pix;
+		return fifo_len_bytes - 2 * HVS_FIFO_LATENCY_PIX;
 	case PV_CONTROL_FORMAT_DSIV_18:
 		return fifo_len_bytes - 14;
 	case PV_CONTROL_FORMAT_24:
 	case PV_CONTROL_FORMAT_DSIV_24:
 	default:
-		return fifo_len_bytes - 3 * hvs_latency_pix;
+		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
 	}
 }
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
