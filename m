Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D3C2312A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530A86E35D;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA096E2DE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:48:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E74E5C00E5;
 Tue, 28 Jul 2020 09:48:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Jul 2020 09:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=LVHDbGRG+YUn9GBTFPve9rqJ/z
 exe2Mb5eR3Ba0GAiY=; b=YuQIekqnXmm/bHrvgZiFXXm59r1tC3iA4rgAXX8eUu
 3LsAFaPFGJ0MWghilABI5xer6zspFgjLTkdj2BGyTiaynBh65HZFqQxz5/ikNXcT
 LnYe4Cv/AkVnWW9aYNeTDqmXTC2DjMPmU25j5tS92vcRltwfYL0FJzT4FUkUtKQW
 hm3eQi9xE5U7/KQPhVo58ysIiuIrW9hEDehWWyeuqSHa4A2xnHEzWc7SAAL6bZ5P
 sHYkcxDhFMkmNPvfGx//cf0i+AdJvqwXKldyGokHpAe4kL0mWS2qCs70VnOofo/k
 D2esWQKvrmGx9myORWasKoag+42KAWFvM9dLwOd6Y7xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LVHDbGRG+YUn9GBTF
 Pve9rqJ/zexe2Mb5eR3Ba0GAiY=; b=fIowZ4I0wCqMJMMFy58mVXI/wgFZ600US
 Evv3wXcLcEOAnK1fR5H4G92J98FUzaWmpF8m7Gv6RjczKmNwACHNawBSXlsF8WGN
 I9W00krECGfFC/Mp+QYNYXx9tevd2PVivlW2P323pibO1EEa6r8cmqH5eJNfJBH4
 3/pEReejyMMHqMXqb5nBXW5zXcA9cK9GuSh4zMM30vhAYIYK+QP23II4ugXAbVw6
 kgHDXfa1YqfarAr3d9IpX+aGxqw1Ab6aP8Ra7nLcTKA5jl4ZLBd+ijEQ3RNrn+cz
 fc3EgyF789J+KOefgdPz9cfFe0E7Z9YEF0CbeDxcvZGS+XW3a4xww==
X-ME-Sender: <xms:nSwgXx1FSuEIgL7xY5lDhIcjxkC2Jy8HvHATVlgol3Tbo6xD74nlmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nSwgX4GXacsa73gzvBYeG2rXWKnB8xmN_0tzz2Agkqmsnyt-uHEh1g>
 <xmx:nSwgXx7AX_pcvddLWoPjw77pB7c6BJejsdizK9eUZxUcfrLyzOanzg>
 <xmx:nSwgX-0s6wXdUjlNQaGbezc0V3fZnXutvZxkXUqgtLrQTwA5c9IxWw>
 <xmx:niwgX-MI0KCmPrj_c4Kev0iJeeBsg01oyZZwV6zhSOuzrD4GCb57Gg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC1493280065;
 Tue, 28 Jul 2020 09:48:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/sun4i: backend: Support alpha property on lowest plane
Date: Tue, 28 Jul 2020 15:48:09 +0200
Message-Id: <20200728134810.883457-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike what we previously thought, only the per-pixel alpha is broken on
the lowest plane and the per-plane alpha isn't. Remove the check on the
alpha property being set on the lowest plane to reject a mode.

Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Fixes: dcf496a6a608 ("drm/sun4i: sun4i: Introduce a quirk for lowest plane alpha support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 072ea113e6be..6d0f0526515f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -589,7 +589,6 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 
 	/* We can't have an alpha plane at the lowest position */
 	if (!backend->quirks->supports_lowest_plane_alpha &&
-	    (plane_states[0]->fb->format->has_alpha ||
 	    (plane_states[0]->alpha != DRM_BLEND_ALPHA_OPAQUE)))
 		return -EINVAL;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
