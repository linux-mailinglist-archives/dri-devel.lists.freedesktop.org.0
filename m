Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B484219940
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8716E9FE;
	Thu,  9 Jul 2020 07:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5BA6E906
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 533B72F3;
 Wed,  8 Jul 2020 13:44:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+opq7dviRqqbg
 95K03jNnT1NFi4cLJAuYRa2X/OWjDw=; b=bzzBa6oeQ1s03foJvkL4KPXNH/AKF
 Hy3fAoSm4sgNEsEA5dW0TPcWoEt2SP9eMOmXlNzTsnpz3Ht/bxqNOcyE2FSyiqzE
 bu/E/BFBAUvj9Tc9a4/kUzFZGqzSNvA/kOaeKPKCm3PVeKA58jadfas/lMDWucOx
 pYfOychY3yNGsAVf2N6Be72FofA8PcRfBO4kZ1VfQCH18PLQmH5X7L4OQWk4cBEF
 1JQtj6kbrVtPKbzReExm9QR5EBD/ii8f13vzLAYf4P2xTaIo8BpAk6GDAzKyOUEu
 uE76GhEiTYJktysZpaBrie0HtO8Rjyh5GrMJyj95WazeKcPHVL6WGdkgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+opq7dviRqqbg95K03jNnT1NFi4cLJAuYRa2X/OWjDw=; b=cRSrN+T+
 6K3ZWi+FKbka+D9Krde2hL9ZYbSuSAN7bP9sM7k4gajnWGPk5S//98Tx3895Fcme
 YTGAeO+QcVaS429EcZmlZaCTvgekOnM1aUiORTJIk3kzxNgfa52hBDwH/N8XUkzn
 BWQ14tPQQV9/MCk9qSUUuGHstKBQN6a3abVovFkWTd1t6CKJBXDFDDuAlE5el7t8
 PJjVphN+l5LTSXcn6q4LVJ03GaFHmDG1huvYpSgFW5Fp1A9W5OR3fhZVgo43hq1N
 SLn7bGl7bHmg7IdHhJI8vmIyniwsi93/R2y/UOXOr3eg3yMKj2MGv72RD+RDWwa4
 +pXYH1kyN77V+w==
X-ME-Sender: <xms:4QUGX43t3C9B9_AMjhwQzDvBHKQuTIzxYw6RUrn5zOdRWjxy1I8myg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4QUGXzHvb2q0UkhqmnpHdZbhtuI3O4lqAruvN1mtWh7R6o_FlGk7jA>
 <xmx:4QUGXw42G9lYSamrmiV6i6loS4BpRdd_JvsIlmZdz_T_A6JQvYiNeA>
 <xmx:4QUGXx0E8iCckRXN8hJQyB7aTl5K9Gc_TlAG3b8gg-Lrn-xN-icLKw>
 <xmx:4QUGX62n55rSCpBOo_aOFA3GfjPUoC6st34vKf4GkrIqh2dYwCxkyBwkYa8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D99130600A9;
 Wed,  8 Jul 2020 13:44:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 63/78] drm/vc4: hdmi: Use clk_set_min_rate instead
Date: Wed,  8 Jul 2020 19:42:11 +0200
Message-Id: <a47487bc8873abe33499e79d3c10d085e341614e.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The HSM clock needs to be running at 101% the pixel clock of the HDMI
controller, however it's shared between the two HDMI controllers, which
means that if the resolutions are different between the two HDMI
controllers, and the lowest resolution is on the second (in enable order)
controller, the first HDMI controller will end up with a smaller than
expected clock rate.

Since we don't really need an exact frequency there, we can simply change
the minimum rate we expect instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9f30fab744f2..d99188c90ff9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -462,7 +462,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
 	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
-	ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
+	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
 		return;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
