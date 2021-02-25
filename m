Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437833252DA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFAB6ECC8;
	Thu, 25 Feb 2021 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9A06ECBE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id A21B2435;
 Thu, 25 Feb 2021 10:59:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Feb 2021 10:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=npF0HKx+aZLDo
 9f7QIlgBlgphFmkdTwImcODy0DtSGA=; b=PVCSyL8riY8xeuY02g6/LZUUTHYR0
 WV0lboQgHgzVJDPnN8UIsvA22EexWzX+N/oZwbpuqxj+EokFXmh4P1BEspLYd/in
 la1Ir22fAN3wlh1+G3J6uGSXycSzy33yIXpjR3aeanFXd5ewbxLQEzK9LjqT34eN
 OF8hyf9EpAAn57KnjoEiTDL59fHzE77CKDwiGZkEX5+YiBWyjlINqZ8wXu+poGYW
 IDmFEbc9YYQJAi0VThnlkAPC9nVPe/x5R2IpiV/XOGqdz7WJP2nTC6kATTIHHyiH
 p275tJ23IflS//JIdknt/tEIK5XWH4jokjZxLH9zIvibWdwPAF+BynpKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=npF0HKx+aZLDo9f7QIlgBlgphFmkdTwImcODy0DtSGA=; b=rz9Gdq5T
 ThXpLjA24Ht3IP7MYMi44beACZ+vgBfRF7fXyC857SKNww4eaXHQet1PdU9xyrfv
 H7I3lQQwJLPr2ActrYts9p9loycGekTLckDgP8GKjmQmpFuIBYuqcJzSDKEgDaUs
 rTzPGt5VdUsm5RRuidGYgFiSsWv6Gvb5JW9A05kod7KB9zwEi7kfYmU7Fpx2Ia4s
 cPMWnRaSDNAjnzFeSECpmGnKvXHpuA24Cfh7eU7h5vQpMf8zXbTMiqO6CRlkz/3Z
 yQp8ymmXkChuK+dFS9I8UZAtPqSOQdo771IKzoCwf5xIQnxV/b7/cALhY7U48LPh
 MAbzAtg4jK98VA==
X-ME-Sender: <xms:Xsk3YEhYvP06oTy5bYGub9uvY1Spl0WXJgx_JmW_4QGWRss9-zdQPg>
 <xme:Xsk3YI4Zxwm0lwVA3iFsLruCt15ZXz-UhN3TYs1FkG39eotvZ91w2LHg43Ldyu10r
 6l_IE_Gp29NZKooo9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Xsk3YJGQbo1N3VdtcyH1dwrdPhNSO3cyF1iXhHqWZEFX6pE80qwKDg>
 <xmx:Xsk3YKI-004GNCzgF2vslqVU_R-5aajd6_xS09_qnzcXs63iNC-v9g>
 <xmx:Xsk3YGhw4FtH7fg6n8tWnZMUdaGCmHbZti5NBum_4ec_7Gkqav2EHA>
 <xmx:Xsk3YDsppxyPOm4iBUivH8_j75PXT5gXrPlegTx1cKxe2_Uuz3HgSKEvDpU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EAC361080064;
 Thu, 25 Feb 2021 10:59:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/vc4: plane: Remove redundant assignment
Date: Thu, 25 Feb 2021 16:59:09 +0100
Message-Id: <20210225155909.1853812-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5e8b7f72dc05..201831e924d9 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1131,7 +1131,6 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_y = state->src_y;
 	plane->state->src_w = state->src_w;
 	plane->state->src_h = state->src_h;
-	plane->state->src_h = state->src_h;
 	plane->state->alpha = state->alpha;
 	plane->state->pixel_blend_mode = state->pixel_blend_mode;
 	plane->state->rotation = state->rotation;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
