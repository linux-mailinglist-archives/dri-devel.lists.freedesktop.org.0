Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510031E5995
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50896E437;
	Thu, 28 May 2020 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AC46E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AD8A582086;
 Wed, 27 May 2020 11:50:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nG/RYo7tmKxJf
 6kRryI78rAS9caRthvRwWfJX3SbsG0=; b=A5CdNSbzLgWsDFPRyDGr7S6i2Qp6J
 vgfku64SpbbqX1swjGP4Im9bmXzaraxHGW+KHX2EOPNHDfZcxTmnRaU1vbl+9bLS
 ZRJEfcwoFdN5LbbSsGqd8ywC9dAY8Qp8F8LIRTZHH0PQScEZZcLTss0H2wDxYFeN
 n5/Vaz1eV3NHGr8Q9hAkDtzgP2P/3zIjyL1TbTB/aULwNTi8Jr3nDPlrumDkTmIo
 Y6I1oBAPiOJn64U1BU7LDhC9bIgIyFOAqAxfCtPOqFDHyg6ER+1UYOU3B/CUba0G
 ChRxxPKpajCBqC0lE28jtAOFLrsOEEs0aWZyKuvmjWRreqULCHPgiH0xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nG/RYo7tmKxJf6kRryI78rAS9caRthvRwWfJX3SbsG0=; b=1Fp/wADc
 U9CoB8+Xb/cAepV5LsvhZE5Ybj7f3c4OX2rHQyLcWZ2XbbORDmY39LaWY53JYyUu
 qd7qhVu3LFi+lFsbEaDYmnPgF3640mj7rya8im20njaCYB3LNyDPqcmMWtBwdTue
 03dDIU2yvmlpdHkqTebyeiUk/cuX4phcz9kkyHHF00LoSSbE3/DcQUEOI9IT3Rri
 6QPkXya+7at64Q69oO9G/FY+QR0MjJUnnXvbKTcee4o/9I7y5PkTAn2CHHpVqyRl
 e7ix3nZaY5qw64x1swnuPMWHQRbu/F8Prx+RlCnkT/5OVE8UZ2hkKj1V15e70gG4
 HjiZ4tWzuXEVFg==
X-ME-Sender: <xms:RYzOXu39WoUbQEbRgsOLV35Yfy_8hMu55Unxy0A0yEWaG_lMy9ALVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RYzOXhEoU2zzLKEzZoaPyG5uMLEcxpZmJcjyVfHvjK6x-lwksZp7sQ>
 <xmx:RYzOXm6tc3rkK2f05zF3f2CO28fhhrgFKmyf7ooU0eyHR_b6UY2Edg>
 <xmx:RYzOXv0XXZvz_mGcy7MCNvksUEk9Xi8anuFRCeMFaY_J2onO8DufPg>
 <xmx:RYzOXo3YiqEi58qDNsOLf2piHcaszUUnKVyvxxTCUXSCvfobXzrscA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98E263061CCB;
 Wed, 27 May 2020 11:50:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 045/105] drm/vc4: hvs: Make sure our channel is reset
Date: Wed, 27 May 2020 17:48:15 +0200
Message-Id: <c1c69d2d2d909822300dca1ddc0bb5b5896a5107.1590594512.git-series.maxime@cerno.tech>
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

In order to clear our intermediate FIFOs that might end up with a stale
pixel, let's make sure our FIFO channel is reset everytime our channel is
setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 87bbd68d44db..754aff3966bd 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -205,6 +205,10 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 	u32 dispbkgndx;
 	u32 dispctrl;
 
+	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
+	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
+
 	/* Turn on the scaler, which will wait for vstart to start
 	 * compositing.
 	 * When feeding the transposer, we should operate in oneshot
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
