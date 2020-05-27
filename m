Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FFB1E5949
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FAB6E486;
	Thu, 28 May 2020 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131226E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7C75958206F;
 Wed, 27 May 2020 11:50:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=84iVjZEVQJdxU
 ub2RqdoiAca3IQhRqY+Zryl/iBO7LM=; b=aIQNde5AckuCt3Hui7I4pRqEy3l5V
 J0h1tbjbDzXbOD/nRZy5IueBPtl7ump3pxopfEKK8LYqkHsRWLnqCGAyMbq3cFzJ
 O4xY+sw9TWWnm46GcNa0iNJ/GIK492oXV/9nJNpNX49tejKq/ZtnBWVhFvgITrn2
 ggDEMO9jnJSuKG6ISJouYZrVWX8EI7MNBfsz5xZnnm82JrptV69LJaU7AvlaKnVB
 ZGjlhTvXkKD7+Hg1RmZ687d5GZ2S2TrMiteifzFmXS+U6B3rJvSbO/MW0RJgcYBC
 56NMteCKgcRm9J99kNZZgS/utQrTsu2S2zcbTAETSkjJw3RHcD00Wjksw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=84iVjZEVQJdxUub2RqdoiAca3IQhRqY+Zryl/iBO7LM=; b=2/J0b4qf
 MT7M5Zdxkn9Othpn8jgwdJuMFQshdII71CyzdxHztsnMbNWDfKy3X2FwKpzilVN7
 ueUY9CgEMJ0uNpHYrF43OvhjqzQSkDMYX7agVoIBqKcmL4Kmla4HUgi9fEo5xZNr
 TY3vIvhXZSaebFAMVzo/llco70e0UQ2yZDVoTHTIx3+GeQEhQ95B6uhkyZGfTKOk
 Eq2v5690/s5lTzqUHMiPBoEcKeuEHnz/Neqg8GD9ytyiSAUqyKjxvvs8uKts93Uz
 IGw6G5uOmBxJlf+kn6beMxDv0n0I/DBRU19IdmWl6iOW4z7h0kXGc0qyP4r+Y8vc
 vLzch9Bx3fm+BQ==
X-ME-Sender: <xms:OIzOXqyRAND6Nnp9Wv8QYqbqenPs9WcUabo57MfsEKh98xu8G7gBzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OIzOXmSqpM3M_jL8U0mI57vamMWWmUgoyCrQ04yV_4w6VEC-EOWifw>
 <xmx:OIzOXsW8wkMH2nHkWjYyi_AQXkH6uvbJi6zWDCwhWvHSLXU_rfq0cg>
 <xmx:OIzOXgjKAvBv5k_HZHqY0tWmL_sjj9TQidoFbWoEvc47BxqkhR6UQw>
 <xmx:OIzOXqCV3Sd724CtH92CfnW84S3Q-j762vGAhDj-WphHL6rkDpEjWQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D5A83061CCB;
 Wed, 27 May 2020 11:50:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 037/105] drm/vc4: crtc: Add HDMI1 encoder type
Date: Wed, 27 May 2020 17:48:07 +0200
Message-Id: <5ddada6589946b06858ed78b1f6e27abc611f19d.1590594512.git-series.maxime@cerno.tech>
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

The BCM2711 sports a second HDMI controller, so let's add that second HDMI
encoder type.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index cc30e54d75ab..974cda3c5292 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -430,6 +430,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
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
