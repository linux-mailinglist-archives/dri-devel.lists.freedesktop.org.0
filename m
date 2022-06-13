Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA065485D2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4E310E83C;
	Mon, 13 Jun 2022 14:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FDB10E83C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DBAD53200958;
 Mon, 13 Jun 2022 10:49:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131744; x=1655218144; bh=JG
 Ub0H1Rvgc5JH+tDA8fJg09a0a7JduOEsQ4jxaIf68=; b=jeEck/lLkETn2KbYD9
 co+EwjcvUvVL/cet9koOWMT4+OpsV7nIEKV/8tRZ5O5dovnfv4qpgK+qTXZ6eo9h
 6x4ouzg9DCy9mE5o/fOMl7StB/5uwxdYMKuFdl2SwdYIRBF5doOqyg2B0877gSCl
 WO+csABmRQBhuNfeIEXWI8y/7zfERr87F+gzlb0ffEuqUkZOT0nkXWPekk5UkXxU
 HJuKqe+XHnilWow8DFmFBCBMJFNHIo57r79cSnLYiMNx+X6dLxc4JeXTMfWMIMiL
 MWHXlXR5DEOxnuh8BKGYyXoQPC/Az/lsWLpZP/rfk1wN33TWzPuVhVx83qKE7q4p
 Gm2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131744; x=1655218144; bh=JGUb0H1Rvgc5J
 H+tDA8fJg09a0a7JduOEsQ4jxaIf68=; b=CC4z3dyZfBOcWhCJXu/ew98u4rtEM
 bg0kISeDU1sd/aihMwK4SuN2AcDiMN4+GMWl6U67UzmD3BorWfYWjFt8SLkR2A3e
 Xb9aH2xxrQ6qSTprQY42dspZNAZ+0uVt/osJzpzbju+7ow1yXAzCjmh17neRX6+n
 fOHwdF4JmVcgZ+ABGtXNDy037OdkdoRV726VOyQju84CGLZDLMTFj1ZAjmTBOxs/
 ME7dNaPEKElDnTXbIjUFnnsOtcfS+sjNeRIEdqmHYo65CNa4Kcs3f7Wq5aZom1n+
 T+n+Hc8xBE/9++xlymq+BUaYYMj9McJLjbyfJMJ+CbJ+2lHzK1tB8fUgw==
X-ME-Sender: <xms:YE6nYqnxSxlxi_chAeY5d_eUhNKfrMM51FIFnK1YnlXFjTfsZt-bHw>
 <xme:YE6nYh3XNZ4MUIu11-19YVgqgTMVNqOzXCDhPYogKVJWtzz20EZFx2Raxvw25CYfu
 peJbDlAZZd3w2qsync>
X-ME-Received: <xmr:YE6nYor9TChHV_fjrwcK0MfP3l7zR72qj10T4y0gafIQ8qH83efYjmXDfV53gGixxG1o_RUoTfrDqcl_4CMh0KioeSXXk7B8LFF-mQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YE6nYulbrQC-CQprfY01Pb5uRMH73EFcRPUYzG3zUbFDzLp3JRb1XQ>
 <xmx:YE6nYo08cw-UEQkvCuijpr5bWJ-9BNLqzllqZ5XbsjoP9qvE5tjlZA>
 <xmx:YE6nYlsSWrX5Ebh842nzc362X4z9tIAqn4TncySbwqdQSCHxt14wow>
 <xmx:YE6nYs9YawhI-077HdM4W3Jzi8rSpWAGIUxycINxYn6dYzUosCfgFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 19/33] drm/vc4: hdmi: Clear unused infoframe packet RAM
 registers
Date: Mon, 13 Jun 2022 16:47:46 +0200
Message-Id: <20220613144800.326124-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Using a hdmi analyser the bytes in packet ram
registers beyond the length were visible in the
infoframes and it flagged the checksum as invalid.

Zeroing unused words of packet RAM avoids this

Fixes: 21317b3fba54 ("drm/vc4: Set up the AVI and SPD infoframes.")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d23ed6e5bd65..4b73b4fea7ec 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -460,9 +460,11 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
 	u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
+	u32 packet_reg_next = ram_packet_start->offset +
+		VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
 	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
 						       ram_packet_start->reg);
-	uint8_t buffer[VC4_HDMI_PACKET_STRIDE];
+	uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
 	unsigned long flags;
 	ssize_t len, i;
 	int ret;
@@ -498,6 +500,13 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		packet_reg += 4;
 	}
 
+	/*
+	 * clear remainder of packet ram as it's included in the
+	 * infoframe and triggers a checksum error on hdmi analyser
+	 */
+	for (; packet_reg < packet_reg_next; packet_reg += 4)
+		writel(0, base + packet_reg);
+
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) | BIT(packet_id));
 
-- 
2.36.1

