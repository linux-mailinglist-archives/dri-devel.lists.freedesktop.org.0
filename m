Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D5219937
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE4D6E9EF;
	Thu,  9 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4E6E905
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B874D102B;
 Wed,  8 Jul 2020 13:42:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=BENe0sOigToWR
 deeCSYjBzSkm3mke3+hggwOrL63usQ=; b=H1YszzNHwtU32uPHzw3qOY6+v+2PU
 LEqFN5R5TOmGlsrjk2YhOy4BiW8oeCVLmHg1zVa7bdsTT7b2ckIUku9Bj/juTM+f
 ixo1krHh6sPoQqxjRgnC9xLKRkuS563XVp8hpQVItApKXtjR4YQ75vh04GzvhZtK
 1vwwX+GwHLlvxMoXfXxBXnlTt+Uu/8BOcNbfwWnbZ5/2DYjHS4tVoMANsxwTlNcu
 Agcueja8N87m2YbS9RxIM5N9mQXyArymp8R+1yi88yecNyu8ISn7YxbFjFHuyOsV
 cIpQQiI6vRC67DkuE/3U/taBuQk1OEkylcM+f016/LGhVeMQXqihmQstw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BENe0sOigToWRdeeCSYjBzSkm3mke3+hggwOrL63usQ=; b=kJ/bE42S
 tROZPNRrpDTFMNL6dQVbTTgGTL5HllU7Q0gf8KH6w1t3rx5h2SrfRRQkZSsXLCJW
 uDKsQ3TBagKmaqBZLcF2PEWDs4ELEgq0w8uvg+Cs2di+pVAA+e2d+iRxSmBo7b4k
 gFT5MLHYyFOyjm8d5YqDJk9SwSfF8v+Lzkji8kHDE6rXPIv/pVmzz/MLOWsKGRNL
 l5d5UdDhqRjFgG9g8YQtJ05/dEMTJ5jESYWp6CQQtg3L8a0pBq7VZpAA3aOAlhmX
 Nl7TEqkRcqSk+lVZpADNtFOI+sOc1+uqIGDnrdhcLnPrk7mK9thZIsz7UtqrxiE0
 EDNCZKm+CkpSDQ==
X-ME-Sender: <xms:lwUGXxP5WzRVgOR-_SU5FCCBXCzXorKrS_J9UwGzDwkkOMIDZALCZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lwUGXz87akxKEj7RjrRpjo269sZAX0MAzGvab1hywXOHT85XlIIwSw>
 <xmx:lwUGXwQs6jFnuxscErsuRw13GVq_NAKEM0T9fq4CNONe_pTutN12GQ>
 <xmx:lwUGX9vB0_TBuJIQGHDknai1wg8BV0dHs-PQsGUQh8QoO3UtYLMIiw>
 <xmx:lwUGXzsTZaYfRkVi_jP_q4myxMMpQ9HqrMOwphpID8mb4FxfFsYT01iTUKY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 017FC30600A9;
 Wed,  8 Jul 2020 13:42:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 11/78] drm/vc4: crtc: Use local chan variable
Date: Wed,  8 Jul 2020 19:41:19 +0200
Message-Id: <0f6b7375a07b70353336dd7c9420138186d62936.1594230107.git-series.maxime@cerno.tech>
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

The vc4_crtc_handle_page_flip already has a local variable holding the
value of vc4_crtc->channel, so let's use it instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d3126fe04d9a..cdeaa0cd981f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -533,7 +533,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
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
