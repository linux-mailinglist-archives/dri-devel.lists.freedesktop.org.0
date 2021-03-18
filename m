Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710743409C7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F26E8B2;
	Thu, 18 Mar 2021 16:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C69D6E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:13:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 144C7163E;
 Thu, 18 Mar 2021 12:13:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 12:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=f77bYtXtR1JAq
 Gy9vKp+1f5NYtzy9q+DPTKS7F2HKaU=; b=ClXW8SolVFvAiOAVu5f0AKLVtrbNM
 GWv3mgSoix5P6v4T/ybbVbnxdEJDxR+oOOwUUma4zSLzoN9tHV+QuoSe5zwoT53h
 MI+JnedwuXwBc3zeNYwWBV/M2/AuqiWuW1G1MG80mfmY13BnkG0uwp50XPrModHp
 VzzCXZirQsLCiokNT0ukVh7QTSmjzpS0OJTVaRtUI9BWHH5ygwFxTVqYSFbAEP0/
 M8rduqMYG8aV6874e3octF8tL+6ERX4YsdFytzPB1Xmr0jPwZ9D05a04YDVwRdDr
 8auek3IZecN5DBuNkbDcUns27avghFfMQ/QpeOf2idvXTYezVb0bLcYbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f77bYtXtR1JAqGy9vKp+1f5NYtzy9q+DPTKS7F2HKaU=; b=nGK04mpe
 WLgoMO6y3/jxoTn0e7bWnrso4MB9PmQN5xtfZGTpfnu2svGcnwOGaU772FYcR7/M
 Czi//YNQo9uDzxmHx3KkbwYcdC7zwQa0tylQ8rxJBe9iyFVHJthvrPW9CVYyYk+w
 3ecd4+KknLoOoA4Jgme2X57waS4meVNT93aOsgP/DK4cHBYO/vJse0IC3g+4VdC3
 47J98j2Es0+0rVYoPayiYddQDb/fr7DlRXG47uRbxNMupwvEkkfqW1gUkyyqoT5o
 vh2FuFchJwIDDXDRHG8ZX5f3PkyL6g0Ji8VOtbp5BvE9/BrhXoBmFMcEgMCPhL93
 VP4WskRbAoIIFA==
X-ME-Sender: <xms:LXxTYMwSMRxImkqP_t6_otp6WDBYXWIse9q8WKei5RPPzQ-d8S5MSg>
 <xme:LXxTYARlzpuVKYTmXDaokJC_VHjMlppJcRCbYPQXnVpeAhvX2ahvei7JmomunkQhB
 2dvK1fZZJVqJQ6yN1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LXxTYOXyslSTShowkW1SJ4-pPQfCyPGDJmB0hI3RTuc4DUURAnxd-Q>
 <xmx:LXxTYKiVapy1-HAtm5EwvHX9kG9qUr7aYIr401579RHDzKkduNUuzQ>
 <xmx:LXxTYOBs-j5qWADCYaTEV9VYVrC-8ZhpgewFndqCSJ3I3KPHGWXehw>
 <xmx:LXxTYJMh2XMxS4NPQD121hwzLGiikLVEWWRaI0cjeLVKwYilbfA7YQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 443FB1080054;
 Thu, 18 Mar 2021 12:13:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vc4: plane: Remove redundant assignment
Date: Thu, 18 Mar 2021 17:13:27 +0100
Message-Id: <20210318161328.1471556-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318161328.1471556-1-maxime@cerno.tech>
References: <20210318161328.1471556-1-maxime@cerno.tech>
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
Cc: Maxime Ripard <maxime@cerno.tech>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_plane_atomic_async_update function assigns twice in a row the
src_h field in the drm_plane_state structure to the same value. Remove
the second one.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 3fdc32244b59..0ad1862c5ad8 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1135,7 +1135,6 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_y = new_plane_state->src_y;
 	plane->state->src_w = new_plane_state->src_w;
 	plane->state->src_h = new_plane_state->src_h;
-	plane->state->src_h = new_plane_state->src_h;
 	plane->state->alpha = new_plane_state->alpha;
 	plane->state->pixel_blend_mode = new_plane_state->pixel_blend_mode;
 	plane->state->rotation = new_plane_state->rotation;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
