Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58616A27E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FE36E2E4;
	Mon, 24 Feb 2020 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25D06E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C4C93616;
 Mon, 24 Feb 2020 04:10:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hKVRtL0uL3hgd
 oZOi9U39towoF/TFyELVBoPINOnrVA=; b=FFNwPKkvgAgjPLwGQ+wYtIkzQ1pNg
 GZawvETvOEJmuD3b7VcgmfrHPjhhcOYN0+Kv2rAWkjD1GzK/r+BhaDUYWJfoK9U2
 OOXV11lkX9S3rCIR+hBmu9Aw4bgq4jXb87UWt48t832NXRs66LtnPWI/HlRSSI6C
 +hkv8PXzn6FNCNOlhLiXW/4bUmsrT6lK5dQLKkp7wA03iMZV2X4DhR1CObZveCTl
 HSU8HTAwErumhejqVWtb5cY0Vx+Zif7eK1OxQGwFuoTmSe2dTvsCdlxuOCWyHixh
 /9twQzZUffdzcIov7MActMKkkNqFdEGJibeQjM6KNPu3XW2tA+DevY2FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hKVRtL0uL3hgdoZOi9U39towoF/TFyELVBoPINOnrVA=; b=AzL+CVwf
 a9N5IqzmiojHkdLjbTVE2a5K3IDHYJdo3dALD86IzDzfS1cu3cle/uitOEU0Iv2E
 7IkLiDDQlMc31kWkj8Tn11NCqPzP1S/4LV1j0sJjvvj/QevszbTGKgzjQIbbDwOW
 cyN7Kvr79p9paeAC6kDftvPhfOJXtDbQnNfQy9qwfl3JUzj9U7DunCS75CQ81hSx
 q4NiZPpkMCrLXV045zufySQy77VMyFHp1ynxlPgNrnoXRrdBJb77paRnGLOnCr0D
 uK2z6IfqvPWQWIdN6bc18RcmOJf/vJKvWjPvrxnOoc4E6uwNpwqm4Hencmi6E4lm
 EZETa6xWEaABWQ==
X-ME-Sender: <xms:6ZJTXsJ7N7nGkoGGvEFJ_CUykwxSE3FsLkMYx5H0Sjjkuw6Aebt6zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepgeegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6ZJTXoMG7TM335l_S7DotE5GFvIyNambRV6vWGbp9gJkv2-CnyCHOw>
 <xmx:6ZJTXioyKEHzS5On1Z2jizBJSvZkvpZiXrHv2jHV6s5tozdaoMeNUA>
 <xmx:6ZJTXqUlOXzTc57wUn6JkAPoffUfW16o1TFVssHSin_8Tuu2Bpqt3Q>
 <xmx:6ZJTXnhHQX3aDLOVxgdv0jHYEqdytoSOHJMgmkAquwime7payNem_hEYCfM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16FC53280066;
 Mon, 24 Feb 2020 04:10:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 50/89] drm/vc4: crtc: Use local chan variable
Date: Mon, 24 Feb 2020 10:06:52 +0100
Message-Id: <3e902ce1e4f07af302997f827fc736d951d752ad.1582533919.git-series.maxime@cerno.tech>
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

The vc4_crtc_handle_page_flip already has a local variable holding the
value of vc4_crtc->channel, so let's use it instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d03bd7946a84..d3ff32daf60a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -815,7 +815,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 		 * the CRTC and encoder already reconfigured, leading to
 		 * underruns. This can be seen when reconfiguring the CRTC.
 		 */
-		vc4_hvs_unmask_underrun(dev, vc4_crtc->channel);
+		vc4_hvs_unmask_underrun(dev, chan);
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
