Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A231B8003
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BAC6EB65;
	Fri, 24 Apr 2020 20:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBFB89823
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7160B8D8;
 Fri, 24 Apr 2020 11:36:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=NfU04ZbWTlRaU
 OfAgYIn+seJnzzhfTfT5EWXdLphHik=; b=CPPbPzjQY+xKqYh8Hb/CNnJ8gY3v1
 1x6mmJTUiTpEZTRj6ZP+amERYWIYR1fBxTtx9QAz3fKVXKgbMoB9kZWonigSPHFo
 Y7a6cyEFpPDT49urQLb+Od0HUaNdfp/xpTxlOIDK3Z469uV6LKZkE4XgveGKljoP
 qtTH4ZZ17qOWREfou7KE5j1BbX9i1dmlyeSUCUDvGDAzpJy0gCQQEseiVrOXSOV+
 hYxD8dmrCzyacia+/pTd/YcC2uhVKyotL1NC3VlhZL5RCDDBDp/Zj+Yl7JUvK8yZ
 6E1SmCKdti1aicqT/4iW7gJY88NIsYbQQO90KAHZ0CuXNMJHXXw+wQATA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=NfU04ZbWTlRaUOfAgYIn+seJnzzhfTfT5EWXdLphHik=; b=kpEUqXiT
 llb5bmmpmqOa5S3fIQFCCwfD7JApwWNfCJkQx+SlMvn9YZww+3nbTrWDg8NxgmKR
 SZ+LuQXPO5+1mUQa95+Q1uCu36XsuUdb2cbXugTkBZCx3CJ5L3/QG5GhNzrtEvgE
 9R2azls6/2NEZVwrlgy9d3V6vqADHgwUh3nDnjtLhuLr0rxYsmiTNPDGnE1a6YXX
 EP7HEmcDmajTSOykEUTLeF2FqX3q4gd510ibVCuxbI/Wqa/TvexRlFJaLJKvoFFd
 cIoVdgyAVcxPbdTvQdikSFb04/eAKmOm/d1t4ah6T1nUVSEfpZhEqQ5hh/R1SKEF
 1FoXFS2kfS5Y9Q==
X-ME-Sender: <xms:iQejXuzeu8-6-WltR7qp8MxJ7h-BJPWdc0_duCLOq_oEVpu2dmKG4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iQejXh51oAjDtI_PPuj2SuOnj6YB3qABKacueTNpjA9jgSBbFviSZQ>
 <xmx:iQejXrgdzw2vwUdFRqBF3kejkpOBVlkuS0n_KLgig9drpioan-J5tA>
 <xmx:iQejXu1co4-2L6Gro16ZHbFSfF8p_eE2vBp0t3OYyDngwZJSAzgQpA>
 <xmx:igejXvD68BhhqhLpDsHEwanQ5PzgRXqpfKb2AkUwK9QcXBxm9-yOXbAp52A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B16E03065D93;
 Fri, 24 Apr 2020 11:36:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 57/91] drm/vc4: crtc: Remove redundant call to
 drm_crtc_enable_color_mgmt
Date: Fri, 24 Apr 2020 17:34:38 +0200
Message-Id: <66c5257c74f8b625ce2716df135a7778326efab1.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

The driver calls the helper to add the color management properties twice,
which is redundant. Remove the first one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 22c0cd0dfc46..5bd01c16ea45 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1201,7 +1201,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 				  &vc4_crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
-	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
 	/* We support CTM, but only for one CRTC at a time. It's therefore
 	 * implemented as private driver state in vc4_kms, not here.
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
