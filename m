Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8191E5994
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52566E438;
	Thu, 28 May 2020 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938346E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 08300582057;
 Wed, 27 May 2020 11:50:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=paZ0RrmilrGG7
 YJ5JlbhmJJvPjMtrxilkOsZzdPjgeQ=; b=kU53pVLDVbRXSBOmIpvll7/uZ1CuX
 xOA8EfJyzJy58Bza36fy3hQbZza45vTqS0y/bwwiVUz6xVgjxRP2OxizIXr/2cES
 lpJuaFjG9605jGUCr+PkatjuxcJ9Y1hIGO/WDd0sNGed4VstGvu9vswyKjHhH/lz
 kNUqJjMON3pK9bOuxeMS37ZhZG8HxQi0nbYJ03JgxVRcmKipHPLvZQqPgumKJaxY
 hrk+RrMI4nPH65UlIIoVVEEfLhn28kiYmCmI6eOciixe/XSzT7AvzjqR2h5VNuLp
 N/Tjqv1/ocYpMtxa66IPOw3uQBqP19I4k4M0QuUYaIMO8Ca1l63dSjSjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=paZ0RrmilrGG7YJ5JlbhmJJvPjMtrxilkOsZzdPjgeQ=; b=gIeMrltU
 Bar33w0GjeLohFIGazwEQnhrF16Ll+Jdh5tkGfrtcPFOPp8712+gpDzotnFmqPEf
 cJ1VWEbk/cB72SnN+ehbBazRyYNuNAbqaJDJDE17E7Ah4JlEBzlKcLK7jXrp3LkH
 MQ2txVqjAEQP8/y6VkfdkkxWTh8v09U7Cp39zjgVCzHY+sPnyw4FS3gbGFPK1NrT
 b5tvL3F4ReHijvw79A72nOVVhJMJdAmzj3VG1v3pKMzEcty3+/LTS+F/rFJPGxMM
 fA4FU5UohOLmpsy0s0hsYcG3MYClw783z79jLNLoxGBlrA94XW9ZudEBgMMfrcZY
 XmjUtwfTdG5/kw==
X-ME-Sender: <xms:LozOXuaQmhi5rpslCkWyB0KCzn8Riwxn8rtdpJX_fy0ox74Z85Bb4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepuddune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LozOXhZy_KewNMpe1KRxmxWl0kwp2Rt9fa2_0sYCNQVsF5eqI95rLg>
 <xmx:LozOXo-vpIyh9-yN3lmyh6iohyy-i6epB_n7YTldEx5QJgrB40_kpw>
 <xmx:LozOXgqmkPYQPDWEeicWIkK8Baib3fLpcaR9sSS7V9UcCZ1B2jF7PQ>
 <xmx:L4zOXtKtXoQVojan8JBWtPmM7udX9k1eHXT2QZaUkb9J7SxO-wDfkg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DD713061856;
 Wed, 27 May 2020 11:50:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 031/105] drm/vc4: crtc: Use local chan variable
Date: Wed, 27 May 2020 17:48:01 +0200
Message-Id: <e899798e17c22cad7358178f5129d4ffef7cbb41.1590594512.git-series.maxime@cerno.tech>
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

The vc4_crtc_handle_page_flip already has a local variable holding the
value of vc4_crtc->channel, so let's use it instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 14e3a962d8a7..15c72afb226f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -813,7 +813,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
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
