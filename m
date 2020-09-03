Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8B25D1CC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1146EA83;
	Fri,  4 Sep 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4FE6E581
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7A7E8968;
 Thu,  3 Sep 2020 04:02:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FGoa7YQOBzh9N
 Dez6Zyjcu5HZi5XM7Ci8ZvFwVFFWB8=; b=RNrgLYBBzT9Bi50facdF3zpAwYjp7
 KFkh9N5S+xTdXy2uWQb9yZ2rUQDMmPUpFblIahiTY5jFKL8H8Jq6z/ZArlxjfDdw
 CG6/DL9HrVY/FHotaUOluo7CwHpvzya9inM1ABkai34GOaUFGTYnIY0yaaDt+87K
 wFMB/osqCClUC/kx9ajTw6IN3J07CkJbVoGsa7Zzl9UrBFFNNGrb//RTH4u3tY8T
 LyJxDIbRRvRvbzw4Sr8xRd0nqBteeHv8+lUHgtbHcBAgrbxfmgUb3QX1PTEZrDV3
 fcIgAy24Jj9DQ/G9Vpg+uDVu6U3cltFei48QYYkONsvdgGheU5c5Uut7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FGoa7YQOBzh9NDez6Zyjcu5HZi5XM7Ci8ZvFwVFFWB8=; b=mAbNb1RV
 nf1/gwZgtWXtnAgh6EUW9u2qTmg4dimygNLlaC+X/4lyNAFTGGhpWoOU5c6juUWb
 ATCkeBUQqWc5ShEwQU1IIfRqA2rk4Z9b7QSIwSmb1G2uHdDszLtwcGP4rSWE+6pC
 GnNxZG+Ns058H9ItZn2XGe3xl/z+XwpW9PY7h7qv4M3mRYQivvGCDjPE7bAB6q12
 rjRddkf4hYOd/RLSuyiV8eVL4MAGgEA3DAltgvWCm/Yaffb2lAv/kyrCAmIGcvX7
 uYlbSzEaDzFmg85/M99bLVYIifEMRRXMJro7FClA9V0YDamVEcKODBFaxSUtlRbB
 ORWe/iz7IrfiJg==
X-ME-Sender: <xms:AaNQX720q3hWijIpAqFVb5c2Flt42UfB8NqcHFUKFNsNJ9bOdwt1vw>
 <xme:AaNQX6Her3HdPTPy5PghtiQwCJ8CJLOHq_PyBaJKezpswjQybPVM-tIhqYCIhUfXb
 sp2-sw-X51BdCp7VnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AqNQX77IsjvT8YZEx3VyD9BEeE-ttOHq0d1sTrdKEqfwnPtZKBLr8Q>
 <xmx:AqNQXw2ZhSMQ89K593J4w0hQ2IsmIW-f80ProwU0qVbuvEOn2D3CoA>
 <xmx:AqNQX-Gco8HnznZFdS13ANNeM-eJti45ZzsYaqFyeHNFGC4qeMpnVQ>
 <xmx:AqNQX59mUM1q1ZowDvlD2Se2iEwEBLBEOKtH_WdjeYml_HmgYCRFAlU8pqQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B2662306005B;
 Thu,  3 Sep 2020 04:02:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 11/80] drm/vc4: crtc: Use local chan variable
Date: Thu,  3 Sep 2020 10:00:43 +0200
Message-Id: <439c589baec72ddb89159857a2d078fdd77b02a2.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_crtc_handle_page_flip already has a local variable holding the
value of vc4_crtc->channel, so let's use it instead.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
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
