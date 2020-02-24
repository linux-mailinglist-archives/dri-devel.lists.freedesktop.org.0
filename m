Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A916A2BD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8AC6E391;
	Mon, 24 Feb 2020 09:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBA6E221
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 92A2064A;
 Mon, 24 Feb 2020 04:10:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dCChNX6FMZlCN
 ueoWIvqsRwLBjCvrd5jh3HlRZlOXsQ=; b=Rw4EK0w/cbVi4eTw2OZjPh/Tclk3v
 HCd3zmuFQoRMgTCbECzWoYvFkhawsaDpiM0P2/eAH9rkmcwGFN8daEpxtL5AiIge
 y9Sq+VQ8H6Vdsx+9x4L6u56RuHT3ctKKAkR28bUAF3DQdYYUpPTPZmNFmsBAai5V
 5wWSjf1qGJm5v80Qgz/kC0+NgJzLYRCSDMoqNmrPp3KdctjUsadNDEW3OvG2WlqD
 gGkAEbLz35SOuif5QFK03RM/7GKPzzRXa4h+1ShOye83zFn3DmLZvjZZ1GWAzUOK
 JD24tWbrSEm2SDeWVOpnYza4KCqsQ9RqTktfN9OCjbVQw1F4wlLIoU08g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dCChNX6FMZlCNueoWIvqsRwLBjCvrd5jh3HlRZlOXsQ=; b=RJhZlgvN
 3yfJQi8HUOrXPqRG4EsBgm1xLNp294flcOw63/ChP7VKkrCgwav6fxRbhU1Th27G
 I060P/UvGNSGYFRgDGBwfadKl9gtYKeL0yFVpfWuPz+ew38Xs/M5RvekWAATcRtj
 scTmVvsTS+7GvATCfpSlhkFNTPM8dFODortsOywWEewFt+wwfq8SIEbBWle2Biff
 CfU+bUnjutH7HlSS7NypgcW0cQS6DJTvk480ogmCfBpARmmNVGbCza6/vhqhLxQl
 7CaFctg/WR0LsmWzMn477O/2MaJ7sftOHVSeqxc6bQ5IvTP1bJuwQ9eLO2I2uE49
 Oj4Qab7v04TYPQ==
X-ME-Sender: <xms:8pJTXkeCB41ym8md0m3NjMjgy5JIQzSP06lZmtOJyw4koMSCj98q4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepgeeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8pJTXvCxxc2mayxuQyTRcJyJFbb1I8epe7kmRPXgKYaF1c_9Drwxkw>
 <xmx:8pJTXscdH2afqrIfdncj5DInIN9JoqhrKzCWtNcRRpf35YGNZNpi6g>
 <xmx:8pJTXjit5z8sEQg8vjMztB8ZeQJxkOnYPtyqpxi24AOLgpNyIp-WZA>
 <xmx:8pJTXqsOpzCeVTSqI1LQUHly2dY43rZ7Z8zcxHEr91V5tw7el9a-DxUlcrU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9196328005E;
 Mon, 24 Feb 2020 04:10:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 56/89] drm/vc4: crtc: Add HDMI1 encoder type
Date: Mon, 24 Feb 2020 10:06:58 +0100
Message-Id: <bca207588770faae4db427c729bae8da3fd6e849.1582533919.git-series.maxime@cerno.tech>
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

The BCM2711 sports a second HDMI controller, so let's add that second HDMI
encoder type.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c262c7a388a4..1e44a3a8c2b0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -428,6 +428,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
 	VC4_ENCODER_TYPE_HDMI0,
+	VC4_ENCODER_TYPE_HDMI1,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
 	VC4_ENCODER_TYPE_DSI1,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
