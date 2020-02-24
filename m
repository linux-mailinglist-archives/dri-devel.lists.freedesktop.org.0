Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B116B16A294
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FCD6E2FF;
	Mon, 24 Feb 2020 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437EA6E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 43F0B616;
 Mon, 24 Feb 2020 04:10:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FZIMsSvqEu67K
 Z2BsdsliCRua/N9ZIceMURgJL9sc78=; b=Wl6g0hPj02F+KFlO5VPffhNTAbt/o
 2aEcf7NCi4+xgqAJzlECkDvHa1mNYWHfYnqPTegQ4QsSV+DtO+1KbOFerakwbfZ/
 3cGwK7P+XCt/zbWoc0bBxKsu8bRgi6y/Kl9MmwRxaUl36nEEe1lqhvQA4na3Wge5
 65HKzcvhDsk5NuV1FPHoqgP6+7T6GTexhmBdw7cWAzDju4N/sM9KLg3r8qqlqDnl
 3PrwJFhExdp7+AEgY+Sbkr6N44r309p90ao9x4KZQxT258NFwSXglelIQDU2iV36
 gENIdvapg6U2iHoVkc/EoAU6AC7PuSp1HKD3sPOyVuicLRYptgaNnhMZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FZIMsSvqEu67KZ2BsdsliCRua/N9ZIceMURgJL9sc78=; b=cREm2nLi
 hoVl2rKYolRCAC8AWNpfxns77gVg8P3ySbHXkVnGCMdHJjMSwtnAAUSmVX/jhb5P
 e8Chl+gqvdc9HTpNPUFxpgsEuhFQ27J1ZCoxIH4mxlbxA4nFA/VraAJLG4MebBAK
 GrtFsBDTrxVai05QzQkkOZyLRnK85gsSzdvc7YQUb4wtxDq1G2FDaGkBGdSUr5tU
 mqrGQqhU3P7zD/iphIxR3ld0C4zUk88AKyKCH9NLNQ0UK/xrzpnIUmGNfEPcwdCS
 TDWHcpQJH54v8syc0m942QGq4VDCr1og8QKlrGNFAVlRXv0/YMAUpGNluli2YuXa
 gSMun76sHmwd8w==
X-ME-Sender: <xms:G5NTXjkUg2B4CrGoyZVTxW9Vmwck3HO9dKi3jbkdg1krcKD9J9cpPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdefnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G5NTXuEf_rWneznc-9HOuVZbPWG_PYGSw-KHfEIp522W--XfrTwTEQ>
 <xmx:G5NTXkgAxH990l8Q_C2RzbpAeNEE_iXQEYSv2HgMcytUx7KJwJutjw>
 <xmx:G5NTXrhWf1C3lX4dOPo0UJCJzHYJx5QI49kTfLou0y3KQ46tsW-aVA>
 <xmx:G5NTXs3PZxPJPPE5wSFI4XBYXOdcfzZg2xIiRhnKqv20SG_6Qs7r2zVggUY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 860FE3060F09;
 Mon, 24 Feb 2020 04:10:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 85/89] drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
Date: Mon, 24 Feb 2020 10:07:27 +0100
Message-Id: <025236a9624dcebf44521e22f002597bb1feabc8.1582533919.git-series.maxime@cerno.tech>
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

The mode_valid hook on the encoder uses a pointer to a drm_encoder called
crtc, which is pretty confusing. Let's rename it to encoder to make it
clear what it is.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9b06352da377..2cbb950f5d5a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -558,7 +558,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 }
 
 static enum drm_mode_status
-vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
+vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	/* HSM clock must be 108% of the pixel clock.  Additionally,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
